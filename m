Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9665A546DAA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 21:53:58 +0200 (CEST)
Received: from localhost ([::1]:37120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzkhh-00030w-KN
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 15:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkf2-0000EZ-OF
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:12 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:3660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkf0-0000SM-PM
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:12 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJhws4021178;
 Fri, 10 Jun 2022 19:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=yfvTV6vlX9EDqMW8rNGhZe3NOqy+Kyc+RI+1Wm67LXs=;
 b=aQWeqzL/FY+W8gli+5+OqS4Fsv/EedLbBPmffTG1RBTIWoNp4+V+m2uqZv4qBUddervT
 0HJP6jtAD84JBihkIzkutCHxqfIZQQoFoyPsXkNYteCt/a3q/f/dK9Y5c8g2WVbHz6PL
 1ay0zhN4KfSnqVJNDOnmxm9taSkEtXEMcHYQJrj14591cu6RKSPHBXEmvTPyre3x0WSk
 Ehlmyh4SkbdjSANDkH8o84Pj3Nu9oaDpROwF1W3q0/jhznVuY8boGxJgjSLiNQjapjJd
 GQbGnzpMGkarue1iUlaNtHfhzhswpWbLgHX0W+9U0DoAQqjW8jjm7rWaOsDMiFQkDUyS Gg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfyxsprda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:05 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJjxAa004500; Fri, 10 Jun 2022 19:51:04 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gfwuccjdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOGHAcWQLMEdjfUz4UYwUMQQqgFGX+eZIyQSYGSFzBAgP3tdnx6NPfYXK7qsxm4EjH3/2Ug+tVWvhpa23a0VTg/TK9IM4HfxjxZh571aRwqjXrMxkExufGN82hmNbvQXhx7FliMwsFGSwlMNfhVLdYaqeX69U2W8DN/3k5eqOAt31sMEnxHO57+WfqdnZRQg88ZybXOb4ZiHgcUWL6kPlf0OWPlIru5kMUtYCN+9Lz9Y3fMxWMbs+Vd7p/nLqKGwX+MavUmB5htsjvHS/O+FMkMpcdZFu4GZuSivSLScLK+1vAwiMrsw/Aqa84JXpRBt+GZmrk6H4fL89cnRuzgQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfvTV6vlX9EDqMW8rNGhZe3NOqy+Kyc+RI+1Wm67LXs=;
 b=BOq/moN0ObwYHpOaR8D+uP75wE61buBxVagmXAk7JrxMD/aUBVRi0uESLIfYkSB3tOzJEg8R+XgrLYqM4yDjEEsIKej4twwWwdSvO1pyl4R4YW/p9Gt54tlpQX+DD8G9HD/Tl3qBQyjkBBDq9IisDw7fhbnyWb9faqqZVnXBcNEX2RiEO5AzEf81VWx0kA0sLZRfERHvPo0hijsVGLvMSX1+EyEXEwy43AyJaPQ9BSLRMbl+2fYlLnLn8Q+/X4/Sb3jqw89HxDaSRdec8mxArCAXj+SBqzvtlWl0yq/UevHno3APGRc2UybithI/XQj7A4vp9EGGWUihNPL9oNHxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfvTV6vlX9EDqMW8rNGhZe3NOqy+Kyc+RI+1Wm67LXs=;
 b=nvnLgNYTuTldvNbIRyHox2nSTmcTgNGiUE2TxJ9thurWKslnJWEUj37hwQjcUALMcr2AlSUxCeotcOuLgIP8e7xK4ibRHm+6VnWm1azgamqMwnkkat+jcunhjtg4tmE2OIZ43UfyqIoB0KhaVSOZ6iQOyC91sGgWezjFIiDd+/8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1915.namprd10.prod.outlook.com (2603:10b6:3:107::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 19:51:01 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:51:01 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v11 06/14] vfio-user: instantiate vfio-user context
Date: Fri, 10 Jun 2022 15:50:33 -0400
Message-Id: <1e6e6d54e8f84144da6f02497f9e6d3b30c3488a.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654889541.git.jag.raman@oracle.com>
References: <cover.1654889541.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75c5148b-cf4b-4d9a-f96b-08da4b1a8bf7
X-MS-TrafficTypeDiagnostic: DM5PR10MB1915:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB19152F65890E29214E5A70BD90A69@DM5PR10MB1915.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xC9XQDiBkgBc3vYAigqvNreDEx5eXJ1DjXlFOJUkA/2OGk94sIIuvc/bkkiETw5U7Qh1aDN1eLxVclA3iX7OqKOfNCvChWfoQtWb+Xzokcwiby0rmXKi6XSR0+NH9psJULGh2mBm4lUg4NGHrRa/SIZuRrX8NH6gFhw179cVVubc/E/bWA4a4n+W84Ygh8SkQd+TvWoDyvU8H+0P/hpwH0s+UelVEPvR2wE07qIQ/pwQHw2YH7RqmnOdQCLqIwdbgZjFOMnmHm+SRO/rHdWPlxaUZ7itIYK60yD7Uyv56eKHLYgj1vDRQt0F+56xRkME7IwV4rnsLIqXi9gUix+0sOWUMFNdpTsTYfOgmgOQA4VEgOmGnT+v3P55aDcBfs0XIdicUyRa+EPSd5ut/Wi0YGChNRfgGQh+Wa7IIitZ2ktsY7T6ZD4/IEy0iX0N0CD4BGZsY5yG+rnxOfO8gwENJwvl+kf5TobTWoYlMdAnWzjVGNNLULkpXoy+iNz6z/0wB5ctPoUFXr610zxE8YW3RqbYCVm53oD6V3CRNbKk2qZJREqxvVplwyxdsoBj2X7iGqDwgghdu9d/+Sb6SLhwaUKuUFpdh4s+KarEn+hqa9ahGJjabMpUF+89bs3HN/JpgFheWbF4O/DVwxnNQcmTh1Gz8Brh593XOgUBrs939bqtARJYnoc+b9skFbXNg2Bx2tAin8wYyvjncFV1v49TsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6506007)(6916009)(2906002)(107886003)(38100700002)(38350700002)(6512007)(26005)(8936002)(2616005)(86362001)(52116002)(186003)(36756003)(66556008)(66476007)(7416002)(6666004)(8676002)(508600001)(6486002)(316002)(83380400001)(66946007)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NEYKsWwwoWsIKAC26bx+lC0Ua1Vow5T/qZsnwDuRDczIxI8OGaeRG3v8S8G4?=
 =?us-ascii?Q?UHx/JAj3B5HRlJQzXKjHq3IFQKIaR7stNcYLwFSZXFw/aDtC+si/dryJztec?=
 =?us-ascii?Q?G8Vdzr/1s9qEN+8f4qwLsgxj9YZ13dZ5LVhh+FC+OHBAbhNyPwClrWILL6uN?=
 =?us-ascii?Q?rAXgFsqC1+ifZvaKd94djEiP0XO1cPufc/LBixm/pVcmLfQAhUFd6gYD2/rB?=
 =?us-ascii?Q?dM0MOyb+U+LMB7gIfZDIwwR6zL13SN08HEjDxfOFYxVS5zk2K+MDlCmq8/St?=
 =?us-ascii?Q?MaAs1EKv12aU6oPzae1mGq1Nafk0+RpA02nuD/E7hcy0UU75jzlOiDSNRI/q?=
 =?us-ascii?Q?JVneIoD+beCuNeYiRGtO7AKEieqDbFnwmLtpmQtHICaVC2eqtrJMLDjtbnvV?=
 =?us-ascii?Q?o6QE1DyyqbZWDcEj3V3hAl/V3xtSP1iUIz+yyYZi96LvQaLGOJDdrNdQqexF?=
 =?us-ascii?Q?QUxxQ40Z4Uc7YtLCE0tPdRoOe0MaCLJUI7G7cFY0OPAGOBsnllZwzg4AEBzd?=
 =?us-ascii?Q?tbEPjq/CwaomMEhZVubcXeXI29Hn2aaa+RRl70yikCbtBY3OMKdn+woU+29A?=
 =?us-ascii?Q?Uu1muIkLwCyCedRC6l+NjQj5HUWAAh5sRcOVeoowWgyk6vd9TX/HQy/D/8S5?=
 =?us-ascii?Q?Owtwp2LbuH5Qb8yvDZsfnaIJDj03dlYAXzWbVDbQeJCVYm/zAjQUfJCYAbkP?=
 =?us-ascii?Q?pB/Eb7FcPuvFmchTpM+/VCnRC2OxZXpO2+Cxg5wrzP6R3/LdgSVD2W6QPxPB?=
 =?us-ascii?Q?FSEt1VgevRsRV3Ws0sdMGzXZMaKXLhcEpFXqQj7uNebmSofFlm4Ueqkqd/ZZ?=
 =?us-ascii?Q?h6b7/LNhfgXnUv+WATBA4LsO4FyraFQ8fz8oLBAGwp+Sb7klsxx5xCD9qgGs?=
 =?us-ascii?Q?Qkpl8L8SrS+i7IPqMfWM5GJj7GRrEbhu4d+buJOOX1xfQztIgrtVQufOslZo?=
 =?us-ascii?Q?k78iiiL440CyFinPdtILbkar683r5MOpez7F8n8KCcG9m7Mk9zLkJ76M9kk3?=
 =?us-ascii?Q?lXSWnBz6U2QKlq15dGV+XaFLf2XNkex55+WCRo0GvlLvtO7HXCNZHITcvNy2?=
 =?us-ascii?Q?4bAaPuLRyMOIglgA0gHI8m8QhfArzbTKLBv61A+4qOtYJo9KsQkern+ziFPd?=
 =?us-ascii?Q?C6145SP5cDtgEX9rh6DSsrYhnUdSPYVTt0scIoUYDO+axdcgalIbUo4aWYIo?=
 =?us-ascii?Q?/RIW7A8+/BdJ65wnSOGoglS5qcGU77O7Rca20w7OG5NS9srYGC7pIV0KM8ls?=
 =?us-ascii?Q?Ls8HjnEVrc47Fxe7FRSshcq/gktRJvLQyiqRxPmhULyAdgpVwkpY7kT4qvQe?=
 =?us-ascii?Q?jkigf+oYl2jeOr/ksvCCc07N1WrDzUtoHJCtxmUbUY6kGoJ0ARJ0qj6AR9PM?=
 =?us-ascii?Q?uiAzx8T7tGn43ylP9jq7lhY98oazxgh947FwMtd2RpjnZtivMkCJhXCplrDy?=
 =?us-ascii?Q?vRG4jed2R6FOzQanYjCUMPuABqv1l5AMfK8z2ZJtCEqrhr0jbaK7/IK4FxI/?=
 =?us-ascii?Q?QhJh4UemtuUxpOkHZ7TLEz9lw1f0myH6nVyvUeYffXkI+SNU3taKY/mJtQqI?=
 =?us-ascii?Q?fA9IdZNGor5wLS3Ioszy115qUqolif1tDE3VSMuAz9w28et6JWzI5vKmqA6y?=
 =?us-ascii?Q?5fBsZ2Hd7z7nc2daruTcsQypgWAekDFUmWaFe8NTKQqe7JW6uC/eVnVZCnR3?=
 =?us-ascii?Q?VI45a8fRO6I0ilo3eaYb+W+xT+zT8eDIKl5X2lO9MCrcnH4K+SrwLQi7sEZ7?=
 =?us-ascii?Q?Gd/qOA1GMw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c5148b-cf4b-4d9a-f96b-08da4b1a8bf7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:51:01.7269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRMESVXJfTFHt9jPkHCeiyICPPEtRwtIeKRNklwXdoeCyRX6999uWb7KRw8LeO2DzJjPgh0YTU409s3DuO2R6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1915
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100076
X-Proofpoint-ORIG-GUID: oLerfarVDDi7alnBP5tE-Qy-kER6Iunm
X-Proofpoint-GUID: oLerfarVDDi7alnBP5tE-Qy-kER6Iunm
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

create a context with the vfio-user library to run a PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 82 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index bc49adcc27..68f8a9dfa9 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -40,6 +40,9 @@
 #include "hw/remote/machine.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qemu/notify.h"
+#include "sysemu/sysemu.h"
+#include "libvfio-user.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -73,8 +76,14 @@ struct VfuObject {
     char *device;
 
     Error *err;
+
+    Notifier machine_done;
+
+    vfu_ctx_t *vfu_ctx;
 };
 
+static void vfu_object_init_ctx(VfuObject *o, Error **errp);
+
 static bool vfu_object_auto_shutdown(void)
 {
     bool auto_shutdown = true;
@@ -107,6 +116,11 @@ static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
 {
     VfuObject *o = VFU_OBJECT(obj);
 
+    if (o->vfu_ctx) {
+        error_setg(errp, "vfu: Unable to set socket property - server busy");
+        return;
+    }
+
     qapi_free_SocketAddress(o->socket);
 
     o->socket = NULL;
@@ -122,17 +136,69 @@ static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
     }
 
     trace_vfu_prop("socket", o->socket->u.q_unix.path);
+
+    vfu_object_init_ctx(o, errp);
 }
 
 static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
 {
     VfuObject *o = VFU_OBJECT(obj);
 
+    if (o->vfu_ctx) {
+        error_setg(errp, "vfu: Unable to set device property - server busy");
+        return;
+    }
+
     g_free(o->device);
 
     o->device = g_strdup(str);
 
     trace_vfu_prop("device", str);
+
+    vfu_object_init_ctx(o, errp);
+}
+
+/*
+ * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
+ * properties. It also depends on devices instantiated in QEMU. These
+ * dependencies are not available during the instance_init phase of this
+ * object's life-cycle. As such, the server is initialized after the
+ * machine is setup. machine_init_done_notifier notifies TYPE_VFU_OBJECT
+ * when the machine is setup, and the dependencies are available.
+ */
+static void vfu_object_machine_done(Notifier *notifier, void *data)
+{
+    VfuObject *o = container_of(notifier, VfuObject, machine_done);
+    Error *err = NULL;
+
+    vfu_object_init_ctx(o, &err);
+
+    if (err) {
+        error_propagate(&error_abort, err);
+    }
+}
+
+static void vfu_object_init_ctx(VfuObject *o, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (o->vfu_ctx || !o->socket || !o->device ||
+            !phase_check(PHASE_MACHINE_READY)) {
+        return;
+    }
+
+    if (o->err) {
+        error_propagate(errp, o->err);
+        o->err = NULL;
+        return;
+    }
+
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+                                o, VFU_DEV_TYPE_PCI);
+    if (o->vfu_ctx == NULL) {
+        error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
+        return;
+    }
 }
 
 static void vfu_object_init(Object *obj)
@@ -147,6 +213,12 @@ static void vfu_object_init(Object *obj)
                    TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
         return;
     }
+
+    if (!phase_check(PHASE_MACHINE_READY)) {
+        o->machine_done.notify = vfu_object_machine_done;
+        qemu_add_machine_init_done_notifier(&o->machine_done);
+    }
+
 }
 
 static void vfu_object_finalize(Object *obj)
@@ -160,6 +232,11 @@ static void vfu_object_finalize(Object *obj)
 
     o->socket = NULL;
 
+    if (o->vfu_ctx) {
+        vfu_destroy_ctx(o->vfu_ctx);
+        o->vfu_ctx = NULL;
+    }
+
     g_free(o->device);
 
     o->device = NULL;
@@ -167,6 +244,11 @@ static void vfu_object_finalize(Object *obj)
     if (!k->nr_devs && vfu_object_auto_shutdown()) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
+
+    if (o->machine_done.notify) {
+        qemu_remove_machine_init_done_notifier(&o->machine_done);
+        o->machine_done.notify = NULL;
+    }
 }
 
 static void vfu_object_class_init(ObjectClass *klass, void *data)
-- 
2.20.1


