//01查询一个用户的关系图
match p = (:User{user_id:'27271538'})-[*]-(n) return p limit 50

//02发现两个用户的最短路径
match p = shortestPath((:User{user_id:'27271538'})-[*]-(:User{user_id:'25951007'})) return p

//03发现两个用户的所有最短路径
match p = allShortestPaths((:User{user_id:'27271538'})-[*]-(:User{user_id:'25951007'})) return p

//04查找用户基于设备的关联用户
MATCH p=(:User{user_id:'25359721'})--(:Device)--(:User) RETURN p

//05查找基于设备的关联用户及深度关联用户
MATCH p=(:User{user_id:'7946891'})--(:Device)--(:User)-[*1..2]-(:User) RETURN p limit 200

//06查找用户注册手机的关联用户
MATCH p=(:User{user_id:'11911068'})-[:IS_REGISTER]-(:Mobile)-[:IS_CONTACT|:IS_FRIEND]-(:User) RETURN p

//07查找用户基于联系人的关联用户
MATCH p=(:User{user_id:'11911068'})-[:IS_CONTACT]-(:Mobile)-[:IS_CONTACT|:IS_REGISTER|:IS_FRIEND]-(:User) RETURN p

//08查找用户通讯录的关联用户
MATCH p=(:User{user_id:'11911068'})-[:IS_FRIEND]-(:Mobile)-[:IS_CONTACT|:IS_REGISTER|:IS_FRIEND]-(:User) RETURN p

//09基于手机查询两个用户的所有最短关联路径
match p = allShortestPaths((:User{mobile_num:'15990306515'})-[*]-(:User{mobile_num:'15689012782'})) return p
