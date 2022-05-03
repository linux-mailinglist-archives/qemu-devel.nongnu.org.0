Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EF75186BF
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:34:14 +0200 (CEST)
Received: from localhost ([::1]:47104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltbR-0006sF-Rp
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLP-0008Nk-6A
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:39 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:57284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLN-0001Pp-1r
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:38 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243DAHbx019339;
 Tue, 3 May 2022 14:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=yfvTV6vlX9EDqMW8rNGhZe3NOqy+Kyc+RI+1Wm67LXs=;
 b=xnB+AvqBNhF8TzrG5Kv5da0R1liwDMiDrkymTAawt+7CugE0otsotyZ4zXQ4nrJm/03u
 a1yymKiHn6UnIPodAwcxeglxdRqtN39Kyx9fSklStF7M8SNGkWuZwoa/nz88YXUhofDI
 LJCHe76Wj+D4nvnHwR1jpH51KZj+KisOCgktd5Bg4nvvENCHMYMIdR1PKakrIlRmtYEm
 u8n1wuAUgsJMhElA2iFMSb5YgnHKAngVOGnhit8xVDQjM1hlD1Fol9lSMztV7VZXJQWu
 xhi546rVbnBSW3pBQWntF0QHku4rAvtAWVVg/obJtfDKnwhPVI0hTWWvcve6xmwrBz6Y 2g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwnt5rwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:30 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EG2ek032474; Tue, 3 May 2022 14:17:26 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fsvbmd2xa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLggwZ9ptDC6llM18Ile+R4sgj4qAZBBMaonHu4H4zblMGEniot6Bwl02mvKCyn3PPtzKOd6IXBJ+0wtIfFhLO3jiVbjXvuSo9lqwsJJuJxgkBQGjKzvxLHf4QT9Bc4r25fkpNPz83W7qm6Y8801m64e5Be/GqhEoNsUGn9emtKdCkszmRLYsVCLQlR6mTogWAHpHsc4EXnWLN1Dg6LgBaB1LfXvgoPBq/bKfHeHMNgAvlAkl5KBH+I5vWh1FaUPz5q2ciOViRFhzGR4vIjzYN58S6T+T8l99athMo/7+afJDTK9fRSQjFc2D+zseFU1o4xWZUL4FpJv4HnZWFM6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfvTV6vlX9EDqMW8rNGhZe3NOqy+Kyc+RI+1Wm67LXs=;
 b=TAypylcH3DIUw7Tt+mxJ2yQtIhByLQt+OT4WMnWFPl06ZcKNpEKP37EyWX54IxYby6I8l7Bzopn5Tvf6gbynMxQkOFPnAGMydkjdCv9pdG/rKPoBCNxs7Tbr4YaRwYTHsSqrakUSBLsuehnz5jQQ1HzsFMLEMwDAYKBBr8s5hc6R3sKAI+Ti7ssDXpClpxWR3QNSqm0fo50IJzvSbZ87Y7dOo+rzn14LmqF3pF8wXCE7uQWsQ1l8JkWBrzcCqsJQ+BR6Z6TN8ktIZv8Yc8ORNhpz9+2hHsD3e0uHs+c6JocGH25q8gsdy7ohCDA39nSaOfo7EnSCY/Eigp4TyGt7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfvTV6vlX9EDqMW8rNGhZe3NOqy+Kyc+RI+1Wm67LXs=;
 b=kCUxZzwH/e0i5WRc6YVYWfolchFhFSEWPOmjovLR2h8og4JdOm9NBjef8Kix1Ht2z/wgm2DI0Dxt/dqo6i9m2gf7vdl2eSUYeeaEX7apt7l7L/65F7Cn5WZtVVAm4+oDqqv2LRNTyvQdK0aErpI/5gEwHIU7OVQL941tmvkPevI=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:24 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:24 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 08/17] vfio-user: instantiate vfio-user context
Date: Tue,  3 May 2022 10:16:49 -0400
Message-Id: <8efa05487b7a2f9c2cb512245f21a5a0db837d3b.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c034eda1-434a-4abb-058f-08da2d0fa4e3
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3358D3DB925F0969113E7DC890C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mXXwXRt+/r/qfuxDYqlEkGYJLCAQ+zRQdoV8AF4NfBa+kRSUMNCzLJa5RLsk+Bylzo76i6MFDEpF0HDlZZ5W2h3hTrCF+UqoK/aRF4rEK0aSkKwoacdrhatGV9xVTslb+Pw5E61zlcwkuyoFzzV5NuLK2ZFk+CYNdPEQGjJAz/zYhW8feOlHtfVydC+xTn1O4K4IZ6F9MpPjE6Oz0Ncaw2gizTew6Cf76t38so6we3bHvA51xS20/efG7Bjf9p+YuTTXdj9i5UTbaAnqrzAB1FUdeVOb3cfxlSJsEJO4aGLS5hjdZdixQdg/HOvjUuBcw0K5LYHasIxbpoCQx36ilWaD5OE/rmXB5RBEkGZ589J2HXrQH4Q9w4Ld6owwm51yxU0HqEPYV+1pe+MYL3pQ2h/+p2utXPz6S+tqv0ZUka6uCHIkvyLpnKhdcoZTysH+Np8rd3sUZAhChEE/sVhOKM7Yc5qu8S3MO0vuYwqa2E28FQCR26XHRteznaEkd7ohq6F9sdZE0p4Jo1yN6oo1kTC8sjM0rM2P/0R9UwY4FL7IzgNEhtqRDrfP7RGR1ssVJF3S7Yz/DIevD+fiDNWQh2/sAKOszoGUeLw3tkkFUmmFMB2yYTV1uHPdlFvzz4O+c6ECkAqQlu9sQMvmRkg//N3CMg7EILPkP4U08YIo1WMpf8X1g0i50WmQirSGFx1kqLprxNSLvu4CnWjmaAoG8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(83380400001)(66946007)(2616005)(6506007)(186003)(107886003)(2906002)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JBs7wV1GDP4BwDbVzAu20hM7dvIVr/hajsorbYXcNsQj01JCS23bxJ1zxP+4?=
 =?us-ascii?Q?PlDECFc4yfCr16c3Gm6fpI+D6yy+CJqbXF0JKpQfspp1M0Y23UAMFfSMK3Mc?=
 =?us-ascii?Q?YAnqcNWYVtVCVW3iKxvg0Wc++TIblQRZ8aLWoKrsWjqF4Hzbn4AfpMJQ8hK2?=
 =?us-ascii?Q?Eupa/T6WQQAlxnXOC+9qxgnhUH2Is1AsS1zngh1cIiW6kodDWREDn3DA1yqb?=
 =?us-ascii?Q?D56EJWvZ6GtbvMn+cO634mVmiqf+AIxnTBhz927rnZJX4jsHlw4zMriFUYBs?=
 =?us-ascii?Q?bRFXC9XCmTaYVOjA/Fj0SJXjwOR9ULPkQVYMS7Nt9BGDfpH9TDZzChxIPGKl?=
 =?us-ascii?Q?JG0aBg8942gCApH+SjcYaOaiOF7e1sI3cnuF+eQCANQg8Q1f5GlBp2sBawNJ?=
 =?us-ascii?Q?dA2TpCLqXtbDGbTcN9GO6CqMbbjWOs2myxcrcG+T/+DwflcNfhVqSFo4waAZ?=
 =?us-ascii?Q?SpILUJN0ZaQuUZ4Ec4ZNTNU7k0U1q3aP+Nzqid+0eVlpB39HfYSjnUlUwpig?=
 =?us-ascii?Q?CakzihkUxRdNupu7Q9AZ7xG0Gfpcf3QFRt8nlobbgcUQPCbuItwJo3DeVGbU?=
 =?us-ascii?Q?YWTxjkV3MHEiUPw2fektG4qizTXfDu08IukNJbuSx2U9D1ZJHsV3ofYXwJa7?=
 =?us-ascii?Q?zKSpXKUrNebBvAMhQCNkxdcYCwZA3W4o3MSD82ajv/tnRYmkfoA/HTsG2Brf?=
 =?us-ascii?Q?avTl45R96jGD9Ax8Nsggo/sOWF9iev3xPSCoezo65/dBfYwliYswywAtWb2M?=
 =?us-ascii?Q?Btig9sYuvL//EtneM0O0AjiAvpQ6E+74N81zsizYfQ2AIIXrStxSJPx6dyXD?=
 =?us-ascii?Q?MDwqsDXnjObN2QKamuCnWDPlwvaz6LadAU7pgfcj66vaikoZPXEQBnboTGJH?=
 =?us-ascii?Q?04AvCyZKchYpf9wzm0xHAfs+t/nQDOiQChN/uMoF/R8KazoM3w6jMEc1wjML?=
 =?us-ascii?Q?H/v4HMFD0wT23499z4zMGkg3zK9DW0SA1jBRz/3ZflgQMKxldmoXC2dojALT?=
 =?us-ascii?Q?Ee8hFNOKAqWOHj4wmxrkHkyMoj3h3+O1RIIFS1FQq9I9yQ5e/VV4L3lWxSiA?=
 =?us-ascii?Q?LadWAk8O5ZZSJ/lmAySktHhDwrsZyW7yNqdDPr59gzWvUHJ4T6ibv99qQJY7?=
 =?us-ascii?Q?npT1lAFRQPylDppI6TKm9VN1bq8NoDbfsKUTAw0+K2gzgvkQygUV5F0KLUvP?=
 =?us-ascii?Q?8npCfdVZlhXSiUiy/btpTV+O/O2eNGBI0M8rfFpPAqFverMaXptB/0pGxYiR?=
 =?us-ascii?Q?3nq5quEHLYsim1ewGvlw5TJzyZW1Ya1N0kBigcsa3UDwor8zR/GDGCcR0h3o?=
 =?us-ascii?Q?hmwWpvOzdHuILFj7wSZ/w9+XCP6rGY3dVk9PClC282ux19X83Vx+CBBdmirc?=
 =?us-ascii?Q?cdaeIIv2LrKroaN6N2xOW/ULCH4+VHWjW7MQvXrhxsoQkNPOT/d/PV6QCYkT?=
 =?us-ascii?Q?dhYliJpUU/0X0e+PZsu9EwxH/2+auLR1a99Cr43JAEf7Lasv6J28CAFgf5gO?=
 =?us-ascii?Q?aMtcXScaq6vC3Y1CwJO5Uv5tKMia8S7im8+OlSkMjw6Z/ZIt/HE2hNxSSVEo?=
 =?us-ascii?Q?kLxMGwsWLH1p9P1weluHns38qJr630c1nhBsGRbYS++9rUOEbeL9FUMUxNKs?=
 =?us-ascii?Q?e5FfKDB5zq9QxmhtaXQiKt1Joh1T4rUSS8x5Nnt8238adM6oJr2eiJf467DC?=
 =?us-ascii?Q?Zok92wOvj8Hl7ISQMa9ln0w/A9ven2QgzacDNC1ApPVrjZivALP1YXpF7ajb?=
 =?us-ascii?Q?oZLOSBn9+g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c034eda1-434a-4abb-058f-08da2d0fa4e3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:24.2790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MH4WFaBYaOuPLgxn//LcT6bkXhP/4hF4wyKQaK1ipDHTp1BHfTkr+wpSSNe0D078HW0YS0AR8tBViuo201AEkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205030103
X-Proofpoint-ORIG-GUID: 8L8A6RvuBJb-FkKtLE7OC8CZBfFYjqv0
X-Proofpoint-GUID: 8L8A6RvuBJb-FkKtLE7OC8CZBfFYjqv0
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


