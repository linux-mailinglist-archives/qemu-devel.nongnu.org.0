Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3B6549FA3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:43:18 +0200 (CEST)
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qu5-00040P-72
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfb-0008P9-SV
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:20 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfa-0001up-0z
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:19 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJdW62004207;
 Mon, 13 Jun 2022 20:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=og3us9aVU7yjthCZgrvB6Da6iAnNXBLh7W3BZoEvEMY=;
 b=hYefvBJoTS81DDG7Czqr7Z+IYuWtQOSwS5biBLdwOp4k9T42QW9gJsnMMZZzqicvs02Q
 rycIwjhb4A9PHjcUipbP+KxqQXO3no9pdkmWcxZgv0A7zhw8ja0R7DnBEJYfruA19Kxw
 pI62isoKzlDUE3KMkcnBYcaJhK84gA+PzFbtQlurUCw2Fmdsroj6Fm0dsapErjLJrkmm
 hIg9IYAKqYtznwfti3isy9f0c8rNHH55LCS6gSeDDv2clRVU+vx9E1udmljNOnN7ST3P
 MMuPqrfIAGywJk27lizfaf/Sas4CeZfT1GQpaTNlUku/Os2OQMxTnziYpvO+XxyIkOqL cA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2m57f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:15 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DKGGHk040826; Mon, 13 Jun 2022 20:28:14 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpc4hr9tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ad/EfOXmas3N73Rlh85ccG0zQm6K+CQ5Rmtc7FEHOgkJcmy5DE38o2kW8EpQdNt/okor8iHth0MXjzOi9zJ0aaS1Z2BNYL0V6LhV5eME4zmm4RRNZ6kQShJRfDKNqz81niYZzVXj+Lw1XqXmWaTBrJgd3dM3umgZrzCaaf77xs/M6S58U4A0d0zgVFQzPuKwC298R+fYoDP6P+a9QWVr/F4v3zrDxY1RxKaCc92UsUnpA6aCik369WTisGErQi90UNpcjeCDmEHEqRGFS9BsdGh50Rnc6YDs61Y6a7rZo0ZmVtZF6t89gzKw0eCTHLteQ4vxSfxuS5Q95m5+vP7cpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=og3us9aVU7yjthCZgrvB6Da6iAnNXBLh7W3BZoEvEMY=;
 b=k13YlRd1XAVhCzzveRmPZmGMrqA0FrUCRzRRLqNvle9LeNRek8pggVA9yA1L9VAoc5EXSeZzLMu2GDc3kb0zj2D+kK8Q0xN+FwQgpCHm7f5Qb95ZNhQODOGeuKW2F3euVb6dHFPtGlTTiDbk65sdR38aCzAeqZ36zQMvrFoUC6ZVQMl5pPo7upkWidCOHC+xYT1Mg/RoCaHNqC3gPC3D5+6Qx2GyME2oHvs6LP2EBn3wsNXb54I1N2aQl4mW7QhfOzmT8vHcYh+l24UaYs/LYWWNdKlIi3ZfLTaN8jQGmuLYMkMVjefXvJIZYUcCvsTq7bkKGylPaGWoN4ajjx2GAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=og3us9aVU7yjthCZgrvB6Da6iAnNXBLh7W3BZoEvEMY=;
 b=TE44VV4kYc4cV1utchfEzDGV2cCTvdTY8TZZZYxRvyWzTingFLyoit5TIy1UaBP0B4c3QMYXNv0YMXMow5OmL9hQ3svoF7BgPwrV0GltrYiP5gYGzPFyLBJ+TO9v4191LYRMliedU0SjUgodZMsXa3SsqFSU+giFYI+JEtIZKCA=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN6PR10MB1585.namprd10.prod.outlook.com (2603:10b6:404:49::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 20:27:23 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:27:23 +0000
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
Subject: [PATCH v12 07/14] vfio-user: find and init PCI device
Date: Mon, 13 Jun 2022 16:26:27 -0400
Message-Id: <7798dbd730099b33fdd00c4c202cfe79e5c5c151.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da98f986-84ed-429d-786e-08da4d7b1fbf
X-MS-TrafficTypeDiagnostic: BN6PR10MB1585:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1585ADC1250773609D5BC3B490AB9@BN6PR10MB1585.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b8D20+R2jP7hNTCEvgUuA/fQGScGyQDF7cyiv8Qmd/6789F2sKzitKeJynEjLcQ9bLVAgTYMxJr0X5SSsN9kPJZ0U4OpVDT4pnKb0M2ZKdkpVUsxnPiLZIrNKd+6PM3Saoiv1qhuDsPO64R6YTn9Ll7vb9u+JKYYSFkZXrJcg0es8i32E9eFWWDDCHxB5ntiruRfm6xVawbVE82rV+a8Quli3Z841fkcgK/v/k7kfEZK6noOxAeaBhVdP1+rBrOc716SuO7nNDov/+hgkC3lpSd5PdzXitxD0PC4cOLHW4J7GPi0Ixzvu28Wz+CiLTUuTgrVTvtpcpREbacmw0ksm6w6X7gbSWm9TRcKUAN8uKXyleiC2NmNh/2xHBq4jXqPg+4HK0q9w2abATHQS+NHt9FVdP7U6JzEZhU1ZsbtQ7KnI63z7WwjsUbUufK4Rw2+mz0zDBNmqGFWRyhMcf2uiw+LpJjivvDVAXoh9E64842sbi84jFxZTIstccjfzGiE0T3i8dCo76wUAnXZBrjFWunodHFNlwT8Fb+BCLGd8qjBDE8s1e8ZRHfaI3SN46lxUA6q6bsPPmrPMG5O3Cop6bPaCuTT2O0U2GchPZR3qcwP+F2uHA9Cxi+RFI5RoxsKmp1W18yJkag9LG1xsV2jwOL8L7xrWLCYnXl1vALgyoSfPdqn+eTqUPxIcN4o12d8Pwzbc5rufpQ4xZ/80J2bdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(38350700002)(38100700002)(6916009)(316002)(36756003)(6506007)(52116002)(86362001)(26005)(66476007)(66556008)(5660300002)(66946007)(107886003)(2906002)(2616005)(8936002)(508600001)(6512007)(6486002)(83380400001)(8676002)(4326008)(7416002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s8hVgnqOhUKN4l00V/0WLxZjGXfMYvV5ohiGwKuWyN3SP6byOtnybsyaq2Wa?=
 =?us-ascii?Q?uPkBYHU6eXqwZrIq/yI8A9C5IcBGhL6jN/0hyfeQ8UIdWBtK/1KaA++P4294?=
 =?us-ascii?Q?PiLXSsYY/SlRFon8jzW512C2Uy0pUOwBXK42UmqSLgZiv7/zvTS6mMCXEuG6?=
 =?us-ascii?Q?WJxNmCl7TSCU8fbFWkOEfnvxaypm5Kq5xSYtDIdCF+Yf11Od1ymImi1zCt3t?=
 =?us-ascii?Q?v8JLsviqRytBZfczA5A+fPnqNx/r0MvCctje8x/x/PUQ+BCua740D8rorMzm?=
 =?us-ascii?Q?kk+3nqB7xApzO5j95JqdXl/w0T1okKoAbGqReElg5pl2+1WiAiYdRW8eN0Yx?=
 =?us-ascii?Q?MRo6hgzFGM1/Yfbmp5BnDldN9uhD2bI7HIje+KwVyq3dDgFmlUMCIXVdQcee?=
 =?us-ascii?Q?KHT70D9+w9yfuUOh6aqo978WwfW2YYw/tBS8BXHpE61Or2UVQ8RlmEmvXvBu?=
 =?us-ascii?Q?EuXz9lkIOmc4D5YsDtlXYZmJwYP9Zerkx65ACszh84M1iRo+OSDDZq3jzuHM?=
 =?us-ascii?Q?sCRtRJP1U9Cj6wMcCVYecPdwRdpOY/ZS/OEA05XdFio1V+DZZGbsOtRPetqb?=
 =?us-ascii?Q?/Rs6xK8vzfTc+hrvvzpUH6dlac5/JNjvmvnyUpUcOpn+WPxVH5X48ASkfzLD?=
 =?us-ascii?Q?bGngq3tCk6aFqNt0MmSzD/H965j8zQWtEw9Fy+ZLkFD7tkZxwE1hgPs5TUSZ?=
 =?us-ascii?Q?L38oB5U/YuB+5XngObuOfVfJxRZ8ektPd2SP9Twg73vKGmGQ+/zmxPJ/yE7N?=
 =?us-ascii?Q?r26r1necx+NVLFWDUw7z299pDmp5dpUX65sC2+Uh+A1AIgEa0bIJwLklRAqL?=
 =?us-ascii?Q?SquZKwwc7MIzgXO66eXnLtg1lxCpkI9iNdgn6KwELmWmuQN0YjKvpzJIdVpj?=
 =?us-ascii?Q?vB+TgOw5dupQ6LTtieLbGNKphgEf5kPznGrmSD54f2pcFRthuNARn7yRz/Uw?=
 =?us-ascii?Q?S/9KvaNIheyakvbh9DKmgW0JOSCzTVQ6OLeL8R+dUVUOq9TRKnV4/1jYEaXX?=
 =?us-ascii?Q?6E5RTxTw3//9ZBSKZ4zWtR0R9O6TuURq91f7W6cbrpJv9bWuFXZwus8Gbny1?=
 =?us-ascii?Q?6HOxV8BaBO2XUHfN+DfcRI3oyyLFz6Od2xmVlA8DS4BU9qVRtNlMDMWeNd34?=
 =?us-ascii?Q?5siGWR3cTk7HV6GDXRn1QsCOB9v6lupxlKFwW5FRKznFQ4GMCf0SFqFnFqTQ?=
 =?us-ascii?Q?KpfoEWA3cC4MhupDG/NQdzqZo8VsT9VFtIGqj9VKYc/6lv8VHcoUUUMnWQav?=
 =?us-ascii?Q?a0KYz8Fm7JXVT1xN39DSDiMkgsFPIoQaXGUcBDmURvtEr9ayuvRPPzuDs4nE?=
 =?us-ascii?Q?uHGLybZHC9I11oGmfYLMJEw5KXyZiELwNlcOD/AdMJEJ63viqJm7NLHxh892?=
 =?us-ascii?Q?d1Db1vWq633ctwWcGqWb9Se4fJynq1Ky/9cWe/TtQF/aP4vYjff3oENfPDKO?=
 =?us-ascii?Q?WCqwQFzbnEM7vVbjkPMbzu6zbCFyVTZHFf6EwnoJrttuLDMxJEWv/flZ+x/9?=
 =?us-ascii?Q?bJsc2NTLf2uapzJrlsOaXqARvjpgQj/qAJKhwqZcW8F07MJ/g1Mj7Hgye7jl?=
 =?us-ascii?Q?E1sg/NOzhxGUPH7W7FYoOsSxPZdICdNTJmGUwSaO4fmRzUZ57X1uCwJEe+TO?=
 =?us-ascii?Q?WBfTOPjosmAF5YF6i4lq4yRkH6aJpmTdwQc6HEyZgqVaktFmGkZlWJCijpG8?=
 =?us-ascii?Q?6/Hi8P+tOofeoMV2VuFNuImOl6mocj0aV+SYlUvk783VkDAF9JPR/1VwoIW6?=
 =?us-ascii?Q?srsRTw/veA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da98f986-84ed-429d-786e-08da4d7b1fbf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:27:23.7648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwxbrBysinx49yJvttNh8PYdkiCNuimxI6QmPWdhMwK1KM8oQRYkixWcsoHATSXCmijAwPVgXVhBlkzFf9Vv9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1585
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-GUID: M1jI47RjUIo1vtVADM9qGhTLmU3hnc1Y
X-Proofpoint-ORIG-GUID: M1jI47RjUIo1vtVADM9qGhTLmU3hnc1Y
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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

Find the PCI device with specified id. Initialize the device context
with the QEMU PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 67 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 68f8a9dfa9..3ca6aa2b45 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -43,6 +43,8 @@
 #include "qemu/notify.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
+#include "hw/qdev-core.h"
+#include "hw/pci/pci.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -80,6 +82,10 @@ struct VfuObject {
     Notifier machine_done;
 
     vfu_ctx_t *vfu_ctx;
+
+    PCIDevice *pci_dev;
+
+    Error *unplug_blocker;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -181,6 +187,9 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 {
     ERRP_GUARD();
+    DeviceState *dev = NULL;
+    vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
+    int ret;
 
     if (o->vfu_ctx || !o->socket || !o->device ||
             !phase_check(PHASE_MACHINE_READY)) {
@@ -199,6 +208,53 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
         return;
     }
+
+    dev = qdev_find_recursive(sysbus_get_default(), o->device);
+    if (dev == NULL) {
+        error_setg(errp, "vfu: Device %s not found", o->device);
+        goto fail;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(errp, "vfu: %s not a PCI device", o->device);
+        goto fail;
+    }
+
+    o->pci_dev = PCI_DEVICE(dev);
+
+    object_ref(OBJECT(o->pci_dev));
+
+    if (pci_is_express(o->pci_dev)) {
+        pci_type = VFU_PCI_TYPE_EXPRESS;
+    }
+
+    ret = vfu_pci_init(o->vfu_ctx, pci_type, PCI_HEADER_TYPE_NORMAL, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to attach PCI device %s to context - %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    error_setg(&o->unplug_blocker,
+               "vfu: %s for %s must be deleted before unplugging",
+               TYPE_VFU_OBJECT, o->device);
+    qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+
+    return;
+
+fail:
+    vfu_destroy_ctx(o->vfu_ctx);
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+    if (o->pci_dev) {
+        object_unref(OBJECT(o->pci_dev));
+        o->pci_dev = NULL;
+    }
+    o->vfu_ctx = NULL;
 }
 
 static void vfu_object_init(Object *obj)
@@ -241,6 +297,17 @@ static void vfu_object_finalize(Object *obj)
 
     o->device = NULL;
 
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+
+    if (o->pci_dev) {
+        object_unref(OBJECT(o->pci_dev));
+        o->pci_dev = NULL;
+    }
+
     if (!k->nr_devs && vfu_object_auto_shutdown()) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
-- 
2.20.1


