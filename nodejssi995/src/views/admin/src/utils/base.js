const base = {
    get() {
                return {
            url : "http://localhost:8080/nodejssi995/",
            name: "nodejssi995",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/nodejssi995/front/index.html'
        };
            },
    getProjectName(){
        return {
            projectName: "在线教育"
        } 
    }
}
export default base
