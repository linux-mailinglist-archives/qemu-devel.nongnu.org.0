Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E5B376858
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 17:54:52 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf2oV-0003nR-4H
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 11:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lf2nJ-0003NO-JY
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:53:37 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:45146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lf2nG-0002Kl-3D
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:53:37 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147FeutF154391;
 Fri, 7 May 2021 15:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=0Jj+31KMdTtEwKDsab1YnCccQj2GGlHepGqejGgPsPA=;
 b=GcdEkMsIqNcdexZEsGB6Pl2GvXQOWLsg1sjg1QzfpmwtZ0ryfiPQ80KAvOgYOz3I3H5E
 G8wGcinNX/VteLuL4rrAVWS4Pge/id20XZ+woCucSK8xZurgoOTZ4v4t0SGo8Q1Tf1DQ
 7nzdhdaRuk5/AkqfeDDXeXafBIg9ed64bM/26aM/0vniRg/2M87CUYPirRH+/qsZsiQA
 4DAklXtHM8jlQLBu2SrTPJzDgfprdLCwPcD3Vfhch5DU59DYxfsSleyw9A/+TKpSC/dz
 8ehbuRVq4+gb7E45Xu5TCUuuCTN+aBSYPDi38tuoVAk8y9C4mckz273p69B38MocH/YA GA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 38csqvj362-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 15:53:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147FZa5o161118;
 Fri, 7 May 2021 15:53:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3030.oracle.com with ESMTP id 38csrf82g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 15:53:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cubjUot0xurvBQ3DGVUkMw+w3TMjiu+VAI8V8qX4P+OkZirFyQKBlzkRNR61CJfkA1DzBYblQ44aXJTlXVKvDAcOzk0XI0inT6IChlo4ty9AEezsOrAKIdPLsXpnx/lbhoX8JKBOd2ubQMM1DC83KM8xCQA7pdk58GHg1ieQYMWGM/m1ZCyTlPfeLGzq6T9xTk+8AfAT1DGyfJXVvvTeOQvmXN1TOf7KFze8WF1WrckUvFpvF3/O0XV15nR7zv+FSgLemA51XR03mMSmCru7oWkBWLdTizfd7E8ADEAEhzMZQ3c9YCDgvjbBgjcrRXUBZcv93gUHr0Vr7ki9KJ2F1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Jj+31KMdTtEwKDsab1YnCccQj2GGlHepGqejGgPsPA=;
 b=bLtkd5uq526n3Ngy8/Xf6572knVZTwXxmmy4vtkYn0XXVGaxdUthDwJ76XlyKHXAP0Tc/AK6yHMKftEr0poTnOuA+6tqwWx3Y+6Srb2wwrAxKGJGPzoJocBXiFUg2yTQOzkd/bOjxaYdKA23hZIECxSwepJ4PEllU/wCGvMf+RA/oZuYKRtfbAEPp14Hdsru0fPwAmhYzHWXy449kedd6qKtOtDU4qNytm+OBVHopVgukha8G7qy77MfFGqe3hbSx4hX7MP4WSbOo/ZuuOF311/cgbY4jErjOt60OWrrCMjlnrBzKxxJufTtBgdf5heyxdzPpz5N6kHOEDEeUBpjIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Jj+31KMdTtEwKDsab1YnCccQj2GGlHepGqejGgPsPA=;
 b=tJ+igjZTBu5xgZ2OF3QYLllbZVbK7NebwmBsu7EjgvLfTeMbvBbAo58TnVCMseDm7YlMXQ9WMWiOV1Wig9N71Zpb5Q10UM41uZ/7nrfNRDjk4ToERLFr1vtdKnKbthaXIMem173VCZMpHhyqnSlF5/688HtAsbtWeZRgYfZxQOo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4367.namprd10.prod.outlook.com (2603:10b6:208:1d3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 15:53:28 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508:17b9:6da6:5246]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508:17b9:6da6:5246%6]) with mapi id 15.20.4108.030; Fri, 7 May 2021
 15:53:27 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] multi-process: Avoid logical AND of mutually exclusive tests
Date: Fri,  7 May 2021 11:53:23 -0400
Message-Id: <1620402803-9237-1-git-send-email-jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [209.17.40.43]
X-ClientProxiedBy: BYAPR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::14) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.43) by
 BYAPR07CA0001.namprd07.prod.outlook.com (2603:10b6:a02:bc::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Fri, 7 May 2021 15:53:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 247c4094-680f-4ab1-1af2-08d9117040ec
X-MS-TrafficTypeDiagnostic: MN2PR10MB4367:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB4367E96D89922D662035BFC690579@MN2PR10MB4367.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JY2TEn0Cr5epuyY/RybMiPEKNyWsYe7VRJk70n3A6uRoNm3nVOyVK7JKRSL3oTVnMG+VOpjlHxqFanuX1UbnOI6RHti/k0Apkcj0gtw47Ma1/CMfJkBXDZ3+O4/xLQ4okyp5Jvizb7XVnUk350iAvhtBuBDkqve2lNUCzmL8DGAk9Q/cpuhvwSRO8xtOai8Nqm0jFDtO7PzHfixnOAEYC/hWBGO4bhv+TUF6VJ+ZPLrUzRurGf29rZ6MNgYjZZZHBOJZv9rRGNGhBEILZ6+zIkAAqJCPk9q0WnAqXRmnqHu5v82JByoAYxNORjmJ+h4J/vPp08h1XEl5hhO2C6UGn+nposAFcDHhFmoNGNVN90VC/tnaWMgXpbDQUPhMBZyKXS5D14lexKvaA1AkruS5DDy7vBOrzA7ODMmn7tMYsDiW66dYwQX6Nb7Qt9hw0eeloFuRZV8+FOucgjo93zApuWJWyuMM/C1WoNptk1gs7dCL97IJsF7LEO0Zvhqhxf9kpMKKGS9PyrfI4v003btg5YGdHx+MmGfNpE2URRKMj8wa23LV/QO4FqWaG0Q1FkwxcLZsSivr2dvUdq4nDKNe9loY6E0EnWiXIxmdPaBMS7wz+m2InlPs4DRusVWsFfhTLZzGlMdvIyom7bXNfSSP3fNANSxuqUAvySiqDM9eIeI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(376002)(366004)(136003)(2616005)(26005)(7696005)(4744005)(956004)(83380400001)(86362001)(186003)(8676002)(66556008)(6916009)(8936002)(52116002)(107886003)(66476007)(5660300002)(16526019)(2906002)(38100700002)(316002)(38350700002)(4326008)(36756003)(66946007)(478600001)(6666004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4u8WN6u6Z0efz/FiccMtsvjVol4RrchHqf5GeamW/EXC/ZoO0fQTTpr2qgf7?=
 =?us-ascii?Q?xhY/KLXbh4ILQZs2IAMrhEr7JdIim6z3OTZCktUr30v6osT1WDP/6U/57zNu?=
 =?us-ascii?Q?poW6Pn6qCCGf09t7FJWERHQmr0B0+uQZ8yk3WcAKSRyArgOyaMFZAdHJg3Mz?=
 =?us-ascii?Q?p1SAuYpPb4a3cevAQqouSNS9N1Q8bCMb73/3ro8XYpdQv7Iq9l7Ul2xR0BEB?=
 =?us-ascii?Q?jP6Fb2Tqgf+uwkWoa5cEUo4v7WQ9XvW5Av9mgFNNyVJwbWcG0wbxodd67IMh?=
 =?us-ascii?Q?SADUxvM22T14L4YYNsbUWbsQUy4Sgl9G6hWWcZ5/p13woNpqMuwQI5ryDRU9?=
 =?us-ascii?Q?n6Fdzh+Oe6CHNazm7gn2avwMb/xEyx3lAuCieqBCgakPPhV+kffQHMQobp6x?=
 =?us-ascii?Q?1sZWBX56udLS7GabcY9CHW9XqnXGsHHTRdhq2vUIJ/Ts9ZclDAFFU6cFlKon?=
 =?us-ascii?Q?qcQ+BrUa7FX0LtlPnJmyErB9MiaW9jWPgxRylJi5ThWFXwDND3XSqfQToHMA?=
 =?us-ascii?Q?pGblMQ0P8Dyjc3ciYkxMiBu6QdQfNOUHjOMwTRLeJCq3OY+YE8wWcQnJbxLj?=
 =?us-ascii?Q?V3BVy5S30YuYcNHtRFqrcp8lkX5uGfyl6EcUbF1Pb7awziXukp/0QVYee07D?=
 =?us-ascii?Q?UBKYuUPjOKgljzMT/ZJRFVqvVT3UPUbpLz60insFJFLWlzwpJdnxoO8OVd8y?=
 =?us-ascii?Q?5ImrfO2/Nj84oy7wFJQjjnz8KZUNXntcaWbddHx+LrmY7Bw5iUPbVcg64uXs?=
 =?us-ascii?Q?osdmFp9WLQglS7CKmAfVGsHsMqAzB1qYQQrXTnKBzyxgmpTBzRZDJxCkKVol?=
 =?us-ascii?Q?ZjIoYvRVVzlibP5p3oibftg/nL8X0aCv74BBPgRgB3Pw4IhBWFqFS0opmoIJ?=
 =?us-ascii?Q?ENQp+27uTTMi2msu4B/fbZwUmPXuDK/+sj6PimcYDv//48KrHyHxR3sqrVQN?=
 =?us-ascii?Q?XRXVwImBm5g6RPTo7MMO9LmZY3Js2tXzfHbYn4j1MTOkqLKijvaRzI0E2/1b?=
 =?us-ascii?Q?jy+ybizpsit5viqok73l6iSRAQ3goG1TbdpmgiZ2d8AN3bbZa77rhSSoLQbM?=
 =?us-ascii?Q?s1oFtBOhrfj38Tx7g6AGaXvgTheTqPxgXHCDdCPfk/coYZGexSfqPnoCLPTB?=
 =?us-ascii?Q?ig9VOkkLJg261mYujyt5bl9b4xinrH7MjPHZU8f/lLJHQe65SCNwwO5oVKzr?=
 =?us-ascii?Q?fT2d7corwnTVzc0QpIAbBxmDjNd+zarmN4yaFmdWYj+F5op/9H45KhpN/iIL?=
 =?us-ascii?Q?AI3pakBcADtrb15pSYv6y1MHnRdaShIxy8YSI4XlDsfDuNEPDOBykjaRr+Hv?=
 =?us-ascii?Q?fnPdHxFjsbmBhuqnWs1UwRTN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247c4094-680f-4ab1-1af2-08d9117040ec
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 15:53:27.6968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6+mmFjfgW2Oxqf9gIHVbHaAgkORYZFwSDAubqTTtAUGM6GemC5n052RWgbbGcUL3HPlOcPALsezF3ahlKBMxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4367
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9977
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070107
X-Proofpoint-ORIG-GUID: BjEYbe35nwdG8LNJW4Dw28QnLy0RSF4i
X-Proofpoint-GUID: BjEYbe35nwdG8LNJW4Dw28QnLy0RSF4i
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9977
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070107
Received-SPF: pass client-ip=156.151.31.85; envelope-from=jag.raman@oracle.com;
 helo=userp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, stefanha@redhat.com, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes an if statement that performs a logical AND of mutually exclusive
tests

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/mpqemu-link.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 9ce3152..e67a5de 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -218,7 +218,7 @@ uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
 
 bool mpqemu_msg_valid(MPQemuMsg *msg)
 {
-    if (msg->cmd >= MPQEMU_CMD_MAX && msg->cmd < 0) {
+    if (msg->cmd >= MPQEMU_CMD_MAX || msg->cmd < 0) {
         return false;
     }
 
-- 
1.8.3.1


