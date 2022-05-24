Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809A2532DB9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:42:47 +0200 (CEST)
Received: from localhost ([::1]:41950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWgI-0004Cq-9u
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWV4-0007wY-Jk
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:10 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:12430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWV2-0003PN-Ap
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:10 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFETSj009629;
 Tue, 24 May 2022 15:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=PEYd92Oj4S4zXZHW4xEXu9y46a7Vp5wnXLld9qaD9Ys=;
 b=IdFAbH93PmRiCbpyTq5R0UwRSe8f18zWoPloE0ypbWy72Gj0zJ/K6gP4MGSpwU8moQAb
 C/Ac73ZQo7+LRAYCCX9Xo0apEiwzISNhhV6JoDTbnrYSboZtfGgWp7UbY77+XG6RY8s7
 XWcWopFFrChWgcR2FsrKhQl3Apb2kp0ajs4n1ge+tw6NZ8innOW23xQvtbPfzLt3AlAB
 JnEh2C0dClb4b8p1XZZ90opcSljhPw8T+zBzJnpPtObWhpGaDCt8rsQvMxSl84iK370Q
 eD2qaf1RXAmHwJw/Un7fvv25Fsnbd+i8J3CINf5Lr3o0KNzcCMqqDwpfV1EFJdHn6+JX aA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6rmtxrh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:30:53 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFGKdw040364; Tue, 24 May 2022 15:30:52 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g6ph2h27f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:30:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lI+qCPRmtwpnlEoyDAYQ1eUJaNKPq9ZDKAV0f6iqkv7buC8l6Ve1Op+DOL7eYS/U/h2CjDLLal1fFSLOMhXtr2Tt9exFXVH8EEnavfscF4D8fhODXGtgo3e09n4oh4jzAwc3xp0GX1Pha0vEAr0lggWdS6V+OFwyK6D94uB3thVnnUCczF/OVIk+JzQq3cye+Llj6gi5ivgHPGtf6Tt/7/1zK8jPwjYlhzWKeALdX6VqiXz7JaYwUUmZhwOlOky7z7j5YTcPq17LfB9RXca1Uh9g6JS5tmgttbpSZUxMMoz1TXM+Qdxdv736QbkvjRWniThtulGD+ncUMre5RNRrAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEYd92Oj4S4zXZHW4xEXu9y46a7Vp5wnXLld9qaD9Ys=;
 b=icx/2JpG6EF6bTCLbCz8g2reKLy0rhhUxbDmKTkxMUC6u8QtPONUgrIu7jrUFZrgZfw9N8ofNFOv2AiULMJpENTpUQq4mKMnd/BUa8ovJ0idHTAfakJdqN4zzAed4RJbzmllvCk/loPy3d7sZNTMmrI0Wd7yiuUkvAIvQn4tlgRxQCpYHoJXqgwgW3PjqYCEcjBhWUTohw/SahCiBCO/+oQCT883WMJ+8+Z88WOQMbKTEFz4jaotXUvaofq4gkuyjFjOUMOKDBLQth8s/DQE9utWmbQ+GWMFOk1bLZ+qhF3XM0bgI7sUTQV5ysEyFO90My4SbxrhG7fAGENMHD7iYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEYd92Oj4S4zXZHW4xEXu9y46a7Vp5wnXLld9qaD9Ys=;
 b=rCEctZ6aqC8EmS1UilIzxch/t9zLG9peq45HSv35o1Qh/0yPcfG9Q1O+9TLOmyMt8DPWaLl4wXIBGvS6TbbVpKvqNIyI4OUF3ciwt/qaBIThnXzIddAXyE4A5quo16nrqL/zw1R0y28KOF9rNFjG8gJbpNDIdfBHCGSSznFcIGY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:30:49 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:30:49 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v10 03/14] remote/machine: add vfio-user property
Date: Tue, 24 May 2022 11:30:22 -0400
Message-Id: <3743013d991f74576e4b114f3839cc858408fa91.1653404595.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1653404595.git.jag.raman@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dd424a3-5d65-40cb-92c1-08da3d9a616e
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3117B4339DEBA3DE5219EA1290D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /BItTB7cxrbYnuR2gMIvGkgh9D8mNwGAPzp70UYwYhJJHPZ2gwRI4o+6kZYm94yAsTgytGCJLDCQefDkg53Nm1FRw89DG601V99Cze6FrSDAFdMV4Lnimrw4Afbg+qxIIbRrYvzfRNGQEPpUpD8N+ersqN5F3c4DnfT5v8q1ukUVwPAtyUm7Qxj3viPED0W2WoaOmbCUr0j67hoSHdu9jWlT2LrcHFqJavBi0zgzOd8twlgn990Kd7EhbTzZ8DQRbwCjxpou34IuPfz0R2lYDKAXhvTGire7rL0xPpCapGSqHxVNjHMFJyk56sx+B74qxPldDFESswziQ5uBXG0jDa9ZoEbRkgf9lsFBACGl7o5KFhTGU/5nJdSgmu2Zafj0zV2OXD2X9tWz43rJ1VJa2MdP+qcvYA70OWLNSa00Qraw7rdM2Lf2RNA7ivcWh0n91kYpQAPH6cubZdJ9Fm88mKiiv4mjmOxMHkUUUxiJ79Ghyet6sXDF0It5EuJmWvfjC9YPLszvrazJqERTKPiPJhSgVC5UP076De6wRJMJFgFosfl0/0xnwKD1SijAa8LcK64sheSVFFbPw9bLn4dBo07ddkRJ4IxtYwt1i8QsyuvrhY2bcXv15YWe2dH0lNy1XuzwpucLbrztuVkBi1Cm84EcGU6hQVfGsx+04BD/LsuUSCIOeLhudgMagopYHAd08VX8MQvAXtVKzrlA1xuM1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OlRcuciIKZHwyCBnjnEiGysL+SojYvUbVBpJKREw6iQC/fTt5QNH//01kJrg?=
 =?us-ascii?Q?6Bo++hzSz/0XabJiDU5C8x9jc58x+6HZwyMwMJZmX6MVSnfKVCnec6lT0xJ1?=
 =?us-ascii?Q?WRJSgGYwtw1z8Vh7TuMrau1SUF8i4Nkji6KSXbzppQdjwUJxpyPA5a1O+GPo?=
 =?us-ascii?Q?ekdm3rO2tPuBPrJwN5Ne+50MOtZW7/twZBHo4wz+eohSI3RJUjnImgEjUZEH?=
 =?us-ascii?Q?zC+vpiVc95aijTjMKtHckBckp+OQfjIaVfv/q21nuO4kexYcfAlwV7LJSYze?=
 =?us-ascii?Q?ykXP0+fyzaxO5S5eQAi9sbG9kurOegIwrEWFLT/OlSDHZEMftX3ZSIL993lH?=
 =?us-ascii?Q?zGRdj7NecganKlpijQJnt6rnkKKMv3+nCLKjQFlg82jatYEW5GYbi7LUJRkP?=
 =?us-ascii?Q?13v+11+5EDMQRY8/HuMnGH8QKuqtHNTCaVOoDJ0Mx88QalvqkeIuWH9+/rgJ?=
 =?us-ascii?Q?lQvGNWUnrabhFJkSRxSFwwJdevSRJsqdcliFEXgqFJmN6oTWpI76J1Djc88w?=
 =?us-ascii?Q?W/k3ElDNniNY90uwYZ4zIl3JtnL0YaWV+n7KcxINh5JjDebtfCGOsS3HHQwC?=
 =?us-ascii?Q?CNEPu8Z2wJKyFovW3T7DRnlj7a+l2x2jErtzIxVC1TYj/DLERHO0rLWlRmI+?=
 =?us-ascii?Q?P4R78JWoxtJrvdHN8bdA7ieUDNGYlAygoT9z24B4qsnT4Xw9MPnCdO+ub94/?=
 =?us-ascii?Q?I0kqFAWVrqLzXNmQjCTfyuVRgy0m+7GNWs8b7T4M//aEk//6vLoPVBozPUIN?=
 =?us-ascii?Q?yZV16Oj/l0fkRKY9yBRz5fV/euZCxvRyNCZXMfTfdeQyWvfwENgnWNoqURvz?=
 =?us-ascii?Q?vAGHGMnuiCyaJXZ64ADSS/q5wCcbpFvu22lvPqjPEAzba30uP8/EIxzvnmGq?=
 =?us-ascii?Q?y9+WQarmtaM4wvl9kB4xW0LAoHg3JjCvDEwQ9rdKzLSkBgwrvNmhH70elgry?=
 =?us-ascii?Q?rJJ3MhA4k7Ef2m7BMnz/4Bs+Ty4vF7k/25yCA44mD8hph8WbqxKPp4hzHtS4?=
 =?us-ascii?Q?5HC/M5SxFbynMnPGzCP7UhEA8WI3QVnnt+c3zSL2NnzSCCYa4pcoR3Jhlw1V?=
 =?us-ascii?Q?0VJfuIud47XeSPsyEpaDuIO8Ogg65fk1IkzFqiNQRzwyu3+24h7VNESkVU1P?=
 =?us-ascii?Q?UUhVNX9Joeoi264EgIdWhdrI7ynsI/4qjwFZnX7azQXgKfX4j1uzHY59Lj7x?=
 =?us-ascii?Q?GDWNRzMr9dwMWlh1l71pxVJfRsB654ojGn06ccjyjHUK7YPAxIy18IdXAHjF?=
 =?us-ascii?Q?rScgll6QOeGKCylMFt0cvL4bXyc5LMoZUmytt4nGt4fG7R2KUKCCdsFj45vl?=
 =?us-ascii?Q?Rubayu+zB31JV7cJPOSZVslOL2zOxtBOuaX6wcOdn8uR1Jcrgzyk5MH5LYS7?=
 =?us-ascii?Q?lnn44vaFKpvfhzhrYaW4D+sbzfyjYzJEedt2TRun7XKVnnGE8YMsGJs/9Q/3?=
 =?us-ascii?Q?Rm2+7Var9Xl0VfLqHqcuxjgCE3T14i6ZdHn9tWw9yK2reYpLt1jsihKccvj1?=
 =?us-ascii?Q?U2/vfyRZXCwmoqEWM2xD9tLbllRAwa2q6+kqeXsN0B37hnO7DGDaT31mBibv?=
 =?us-ascii?Q?al9ddMXPWP+PXf5E0M9d2lvGFQTliKgPil0HuTAHGfSRxxVTcowQTJUcd7DF?=
 =?us-ascii?Q?nqqKFM88769QvY+9Tjitr/Xvj48rQUN2DfHSZ0EH5qXfy/oOL9Ssp3J9qZ2u?=
 =?us-ascii?Q?KnsXImOgmD8AerxpAFpHDUNpQEn7ICATaPhJLb9k8OOlmyl66Bnyh1ICOV0L?=
 =?us-ascii?Q?5opcWfC+0A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd424a3-5d65-40cb-92c1-08da3d9a616e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:30:49.7428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lghO2KMPEsmozKgBCJORo7u5v4x3r0t2aKCZisDh/AZD5oQdTI6nJguAhGgrOYG55KmlV1z3qV/eO++TshdUHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240079
X-Proofpoint-GUID: LSPaUW0vE5vYLethJoL-mpta8rj03NDh
X-Proofpoint-ORIG-GUID: LSPaUW0vE5vYLethJoL-mpta8rj03NDh
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

Add vfio-user to x-remote machine. It is a boolean, which indicates if
the machine supports vfio-user protocol. The machine configures the bus
differently vfio-user and multiprocess protocols, so this property
informs it on how to configure the bus.

This property should be short lived. Once vfio-user fully replaces
multiprocess, this property could be removed.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/machine.h |  2 ++
 hw/remote/machine.c         | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index 2a2a33c4b2..8d0fa98d33 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -22,6 +22,8 @@ struct RemoteMachineState {
 
     RemotePCIHost *host;
     RemoteIOHubState iohub;
+
+    bool vfio_user;
 };
 
 /* Used to pass to co-routine device and ioc. */
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index a97e53e250..9f3cdc55c3 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -58,6 +58,25 @@ static void remote_machine_init(MachineState *machine)
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
 
+static bool remote_machine_get_vfio_user(Object *obj, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    return s->vfio_user;
+}
+
+static void remote_machine_set_vfio_user(Object *obj, bool value, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    if (phase_check(PHASE_MACHINE_CREATED)) {
+        error_setg(errp, "Error enabling vfio-user - machine already created");
+        return;
+    }
+
+    s->vfio_user = value;
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -67,6 +86,10 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "Experimental remote machine";
 
     hc->unplug = qdev_simple_device_unplug_cb;
+
+    object_class_property_add_bool(oc, "vfio-user",
+                                   remote_machine_get_vfio_user,
+                                   remote_machine_set_vfio_user);
 }
 
 static const TypeInfo remote_machine = {
-- 
2.20.1


