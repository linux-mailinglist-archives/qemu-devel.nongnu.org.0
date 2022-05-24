Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC32532DAB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:37:59 +0200 (CEST)
Received: from localhost ([::1]:33936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWbe-0006p2-WF
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWUt-0007i9-7s
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:00 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWUo-0003IY-AW
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:30:58 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFSBd8001529;
 Tue, 24 May 2022 15:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=0uRayL5z567S29gFcHMdZGvSeJLG07vFw920SLWsmfk=;
 b=uBtrBTVaHzUOv8XWb8Hnib4ZKz+JDsU6mQBTcCJBgt4FdAqEjzlSZq6aU5ah4EZUoM3v
 euo4p2/K8lVRzxnaDGuZPVVG9uRbmpbA5+oSTkFQVLUK/AGiOGR4Yit/J/863ktpfrQE
 3KQqLx8K8GhjtqR1/faCVMKBHiVtSGr7O1JKpGHEKXnFR5EHwkwa+J+zV0I7NfE3NELq
 7IhkEA0+8IKGK5Lunuyri3vhekWG1g6sQkvZgQm4GfCobWds3PwU3xJqGNIvpTZGlo1p
 MvpLFRoBsItIhJtrtNpWPZJQNqWqlPYTHSbB9gjE76rlV9aKbAb7G0RJYI2C+jIK7sg7 KA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6pgbpq8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:30:45 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFSHaY013144; Tue, 24 May 2022 15:30:44 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g6ph8x0pw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:30:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jo71oPyTIomTwfsL+pSTpR4DZfCzMA0vEGB0g/KE4aACFOtoYi3ys89c4VyZTf3l/d+XOvT5AtsEQCEaB1rgFZ0OnEcDP68AgFbClWKgo1HPqUCsqWJSQ/UM8KiVuZojg474xQ9d76uQnl49a4i0wJdbmXXc+VIkuW9MEO9oufuLUU9V58h/jGO17ixmypG1U+YDsa/n26l/Hyg3BNCB2eKSTKXpnBIH3EDKBCTKi43D+ybakRZxuo+MiYdvj/L7kDGVWg/2EcBughfnrF2jcp6f/wJdYA19biTLIVG6e4IJgr1X5LIFSRDOAbfMfDd6Hxm4s6VnCcv9qoDPf4+cuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uRayL5z567S29gFcHMdZGvSeJLG07vFw920SLWsmfk=;
 b=IBcMhGvrGearud73vw8almwVYSvNYFBc8OlZX7e7uni4c9XbTalUF+fEVcNExn9uAv3TN6FsycftvrUclOF5JqFMLJlJvwz3RaCIMmduAEqm9DSf90HLj6WabaoXFLWntkd9MuEmw6u2MU5k4peJtEjA7UIF9EOPwFc4J/idNBjsc2zgQf0ELjGLHmzrIyidGnWq6cgxi+zDxaYR4hUWU88mHEh6soI6xyBtQF2VEmMDdN46zCgBI74BLAFth9FxaDg4LhtnAd9rLdsrIsq/YH7qOYh2UA21u1nCITYbnwcnDz9DSksOvDeNL2At0PUFqz5FRpdrbbU7pHEx9D/EoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uRayL5z567S29gFcHMdZGvSeJLG07vFw920SLWsmfk=;
 b=JKsIBza0hePK77u8hwClfpnjp5jCwa9N3JxuH+mg6+lvnpJ781QyjhwqB0P5NqE3E9AMvj3noqzNM4hVzuYqnVpsLJyw8NIUAOTY5duMgrV0fDkRGDW258tPSlBSuDplDh804uEoFDddzkE9x9FwXd9dc2bTUBLfmOUFGl2Zuic=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:30:42 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:30:42 +0000
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
Subject: [PATCH v10 01/14] qdev: unplug blocker for devices
Date: Tue, 24 May 2022 11:30:20 -0400
Message-Id: <55ce4f2ff38a5c38b81ceef0eb175a40ccc9ef6f.1653404595.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: a0ba6173-f1eb-46bf-4d6a-08da3d9a5d47
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3117A40BFBD83EAC6D8765EF90D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcTpX0ZD0v7z4xkYJnaq9p/P8Llb3SDXZvdtSzQXV7otNDQpQDzgDdIZmtpWjG0WjDC3AEHWTIcY1hswKCHtCl8nVbl3sh0xrM6nyFWkKbo6YEfQOdp9kVRvApFw/h40holQnOml0wvkc6tv/ydzwHG/87gzPwnZZmmjWQUmG3GsDotuQIJAyDQUK9AB3KWoDJ1CcNE0DZCZW2cGk+Oo+md+VS1jLGi1PnCbkNx+dmsKX29WLNIwj1bT2j28WiSSkbvIIgF78Pkq+qmdvqxmgp9gUb6wmr7z6ypStECxAI0ve+SGxBYkZ0WNx7RaxGCkczU16FxGlphL1KLz6NwHQQkxqwLnhXxdJ4C2ZBThfuAtQVADE7YqOaNefqBZ6Nf69/mjfDFxVQpgvY++e/RE6kFRwcDzxj1tlX2r16TQs4QjJ+0dgeq5ZJntnqVky2yWpoXseFaMIxS+sYWaexutyXw1rwiUEFJ/0QLjfembK7nh24fjgE61zFmwJNN4D2uQ+zNbRMiZPjDT5zNoMS1QxIbv5r50zFjP3N7/jctDN+Scr4ODY77k+u1zM7e67FsLPgrcwX+ITbZV2dnVtki9gBjW3qr6PK+8gv5BnPTYuBrpkpNfFGMk3zlkmMlbe3gewyreJON7DT9WIB0ucjpE2BX7YLawWxNp2eDbrLadAkD5MHW6w+8mGuFc6JXGNM1op3ohKsezyvQMS6z9zmgYdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(83380400001)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2lJGOKy2KGHJeajGuI923DKfMsMZqNm8ENH+DhhwbFglMrDPiLI9/5fIc4q0?=
 =?us-ascii?Q?jakDI7tjOMEKJnggCxwbQEsQsqPBJRWmopMVpCJohIOX9NC/QNmNZsEekpd9?=
 =?us-ascii?Q?fMlfpxhdUQfLukx0HYpWsRG1HpojlfpTJEnm2ggqHcu5XU3F5/YUnUDoU+v7?=
 =?us-ascii?Q?aJcE6jchgnpCOEaWXuVbsdCm7sl0wByh6KRsvc0fUpKohFiNuu0uH0S+JTsC?=
 =?us-ascii?Q?FxI75QAcrJwU2yNtjhva0SaWkMwILzDLXevR7RC25rK3RLTQVPZovJTFN05A?=
 =?us-ascii?Q?T1zs1lBs72gCEDn/4PN/z4bkqs80v/bn3ezhOT8D+Ma2U/tBgHA2mz8rK+v6?=
 =?us-ascii?Q?J16iCtnD42N2yyifeuWO8oamw3Kos3j3pnVKmUMwWgxo3/aOkuBUBM6tY/bn?=
 =?us-ascii?Q?j5Shxs/5W+gtC7ARYfH1ILIiHx4EefW/dCHsM/HzmRsLjsfgt3q3lA0ZbQMV?=
 =?us-ascii?Q?VPZhQe0lTuZNwaeOhqGsOpXRzSK4BaBos0EnGtoKWXKQ26FJBnZ8LGPGu5Fd?=
 =?us-ascii?Q?k/Rnl9asStnvPxusYdei1bkXMJ5Sq1PXz3bEhy1v3vX0dtuwpiUzsYDDILB+?=
 =?us-ascii?Q?fXtCUI2I1ztYf0jqwfLTJ/qOdLwAwD/bYd/Ihia5glyngcTz8O9Kyys1nBRv?=
 =?us-ascii?Q?iR5dVIFJjYui13Bsu83LIZbTJYoMyTOjuzxr+V6RElfkwhSfCPj+SW45tL3G?=
 =?us-ascii?Q?mjUzNrWuqEm8PSvu6wiGN32zIaiuQfjZEpGPcois4y05S5lSpWj7L2jrC/sb?=
 =?us-ascii?Q?7NJqBrr9S3nGXu9tUTjAW9MM3B3BUi34I8chmZyevrHyqH7LBW00dW7tfykk?=
 =?us-ascii?Q?wc9n36LUVHQNr6s2a2NZxn0XV1wi1HC8+gTLAcU9c7Z6WVqSDd87jNi3jWki?=
 =?us-ascii?Q?ssSw2ACfCJKW4EnsdumWFJKq83DByzQJe5t1uYQNTTq3BDKxMgH0CVE2NbHL?=
 =?us-ascii?Q?BKn6r6onqUt8v8gGSthrBagBCNUnE1FYUlqzMezuDmRrmq4Gigrg0RGLN1FD?=
 =?us-ascii?Q?YfZT+PSVxqXpWVuOYyxhgPYXj8YmaV07O03ephFhjgbUeHdEAZnUhocXmruC?=
 =?us-ascii?Q?H3m+xFPwYUDQ/qkaZCKVNbT2I0DFmBGqkzvAxoB1IZagT5OgBnOZrqVVo6yV?=
 =?us-ascii?Q?YtB2RiQfaOMFc/oiQtUnTDwfgz1Cvk+C3gW6tJXcm0Ncfn/Et5ALXNb0a1ht?=
 =?us-ascii?Q?Vwmqy6AuaH06gc901SgAz7YiiJchnamv6fnvHs2Xqm5xhq5uysYQBELUihtw?=
 =?us-ascii?Q?5BINfxdGaTZJUQmf5hKp1Mu8YLNDO3k9KesIryfXqDRrY6cPoW8r429pBPf8?=
 =?us-ascii?Q?BiCvhMKHeGNwgOFXI7JKJxv+sEVL6eeZLmeDlKe4uzA5NvoOEWOKn/s6npNl?=
 =?us-ascii?Q?4fkChjXGlkJ1xbc5yrqgNU8JME8vKyRWb2aDsR31yTdvVVvbZ6Ik4Omj/u6r?=
 =?us-ascii?Q?f9sQM+ooueJ7SZMW15bwBUuWbpeb4JYm4gJNxy6qDheb6Fy4FGEn/ejDeGEV?=
 =?us-ascii?Q?Q40CXIAd3r9X9/qyuNN6Zjd8jL/X/2cGPf6Kb3xKR0SkCJPXjVxiCWQJncYu?=
 =?us-ascii?Q?zzmt5YszVq44V8MxUkgMmDbwHXS2u1nH/9bmDpYGkCjT2UL8UEn87FGW/Sik?=
 =?us-ascii?Q?6KZ40qS0I+eVUfaaVFYwww6KvUeDdiNgWVDyXPtEiuZXhJVr4wPVLZ4d6EXz?=
 =?us-ascii?Q?mNEnpFmqaP0pkK0cmUfeAkF2Z4Ks1vNg1UhxwdZgkUkRS/CGyhygjcvFtQgm?=
 =?us-ascii?Q?deAHSLQQyw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ba6173-f1eb-46bf-4d6a-08da3d9a5d47
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:30:42.8058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzrdFioKKUDb8t0CwIjm0mRYBP+AvRCYlOQGYGV1bzqPWx/HqPiln6twwdqF49UOrsUpL1a1lTQ3FjclnHQzbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240079
X-Proofpoint-ORIG-GUID: -qz-Q-EvC5xdzEGtY_Y4ztUI7sQSQo2g
X-Proofpoint-GUID: -qz-Q-EvC5xdzEGtY_Y4ztUI7sQSQo2g
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

Add blocker to prevent hot-unplug of devices

TYPE_VFIO_USER_SERVER, which is introduced shortly, attaches itself to a
PCIDevice on which it depends. If the attached PCIDevice gets removed
while the server in use, it could cause it crash. To prevent this,
TYPE_VFIO_USER_SERVER adds an unplug blocker for the PCIDevice.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/qdev-core.h | 29 +++++++++++++++++++++++++++++
 hw/core/qdev.c         | 24 ++++++++++++++++++++++++
 softmmu/qdev-monitor.c |  4 ++++
 3 files changed, 57 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 92c3d65208..98774e2835 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -193,6 +193,7 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+    GSList *unplug_blockers;
 };
 
 struct DeviceListener {
@@ -419,6 +420,34 @@ void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
 void qdev_machine_creation_done(void);
 bool qdev_machine_modified(void);
 
+/**
+ * qdev_add_unplug_blocker: Add an unplug blocker to a device
+ *
+ * @dev: Device to be blocked from unplug
+ * @reason: Reason for blocking
+ */
+void qdev_add_unplug_blocker(DeviceState *dev, Error *reason);
+
+/**
+ * qdev_del_unplug_blocker: Remove an unplug blocker from a device
+ *
+ * @dev: Device to be unblocked
+ * @reason: Pointer to the Error used with qdev_add_unplug_blocker.
+ *          Used as a handle to lookup the blocker for deletion.
+ */
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason);
+
+/**
+ * qdev_unplug_blocked: Confirm if a device is blocked from unplug
+ *
+ * @dev: Device to be tested
+ * @reason: Returns one of the reasons why the device is blocked,
+ *          if any
+ *
+ * Returns: true if device is blocked from unplug, false otherwise
+ */
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp);
+
 /**
  * GpioPolarity: Polarity of a GPIO line
  *
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 84f3019440..0806d8fcaa 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -468,6 +468,28 @@ char *qdev_get_dev_path(DeviceState *dev)
     return NULL;
 }
 
+void qdev_add_unplug_blocker(DeviceState *dev, Error *reason)
+{
+    dev->unplug_blockers = g_slist_prepend(dev->unplug_blockers, reason);
+}
+
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason)
+{
+    dev->unplug_blockers = g_slist_remove(dev->unplug_blockers, reason);
+}
+
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (dev->unplug_blockers) {
+        error_propagate(errp, error_copy(dev->unplug_blockers->data));
+        return true;
+    }
+
+    return false;
+}
+
 static bool device_get_realized(Object *obj, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
@@ -704,6 +726,8 @@ static void device_finalize(Object *obj)
 
     DeviceState *dev = DEVICE(obj);
 
+    g_assert(!dev->unplug_blockers);
+
     QLIST_FOREACH_SAFE(ngl, &dev->gpios, node, next) {
         QLIST_REMOVE(ngl, node);
         qemu_free_irqs(ngl->in, ngl->num_in);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 12fe60c467..9cfd59d17c 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -898,6 +898,10 @@ void qdev_unplug(DeviceState *dev, Error **errp)
     HotplugHandlerClass *hdc;
     Error *local_err = NULL;
 
+    if (qdev_unplug_blocked(dev, errp)) {
+        return;
+    }
+
     if (dev->parent_bus && !qbus_is_hotpluggable(dev->parent_bus)) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, dev->parent_bus->name);
         return;
-- 
2.20.1


