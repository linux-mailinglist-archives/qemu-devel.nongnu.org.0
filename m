Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B383CCE08
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:39:08 +0200 (CEST)
Received: from localhost ([::1]:57744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Mvj-0000ip-EZ
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlT-0004UY-G9
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:31 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlQ-0002MO-OL
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:31 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GPpp021851; Mon, 19 Jul 2021 06:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=AkAaN0Qv6D/iLNNVB+WB4JFriA2FY/v21hNPm4hasW8=;
 b=VRIGF281rBoohh8b3bT32kLkWJwgNVdO/UOGEhAsff99tBHAFalksZ/rfYrorFsfM+9o
 kqtwyCxE9Ve3i5npRDwSjVBDzgQHKBx+xBrFHP2QVSRM8ePL4JZJQX2IBAGNxWld3KYM
 /oQtUG2NrJ3uy6bJdyRDlo/aCSF/fAIW4hzQXbZ8cl8Sd5bQBXsFLQNLvmCkl4/A2GqQ
 O80Rrvq8iLTVQ5ZqaQHDWjBY4HflHXH2igh4NAaUNZiG6Gm07eW28EH7BEedJ2FBnwoD
 NeF5aX+t4S1hzD8S9hTJKM8TRfQnZlLeFv4aEaSGCqxiKaxcdCMfibWHhP5VnK8QbeRL wg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=AkAaN0Qv6D/iLNNVB+WB4JFriA2FY/v21hNPm4hasW8=;
 b=riNQgXaBrQnfnLatWVI2xVwQL30+TxD8iNPZSBHhL5ciR8hwsNNwrZRjuheXkRbHJOPV
 AZWxI3ISG4K9CRwW52eJuroiZ2A//kifR+GcCcX4hyjJFshf2qLqex93FQ36ZnN2MqFY
 zYCrNtbjB/AbS1VicSunZvRkoPwAJlkCUGJDXhtfxOo02iMql2t4/YxmkDqXJjW+8NtI
 NcYTonpTHBT7WCDw8WgJhFi5s2TvenCLuPSrmxptX0gWmuTbAFnqc6H4I5DRjk/e7c6C
 7QYHk04JY6B0huGjwmTnkgWRaWAKMj7G58wJ8SjbNfMPobe6vdWuvlJlhR2qs/A/syO4 GQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39uptrt6ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6GMKT099799;
 Mon, 19 Jul 2021 06:28:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by userp3030.oracle.com with ESMTP id 39umawam46-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0OoioCrXyCHbO+GsJukcrPBKLrKAf4cj0s+KkEBhSjjmIjz25U8DqfLyCV2RhHZWdDUDGZmXUXeww5sTCaYu9zEw2n2olMrkg0iJ4NBhkN0WoEA1f52295ttB5ibf2oxrs3jpf3G36vX3fgZpgx/GqlV/xNWzx5sX66ne8hb67rctWGz//lf16efC6R9zACh2Z4SwqHEWrg83VZ+/R8Ymf08fejpJzYo5It2RbukNdjVdcLzLp2nFkRTvfIBJj+NkEUQzFPEPw6wYSafIHbANEr8GUek+WRiKrIJnJ0MgzasTy/6RNNSBWZOVBV/W4OY1yfwJIuD2u4ZGKxT3ApHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkAaN0Qv6D/iLNNVB+WB4JFriA2FY/v21hNPm4hasW8=;
 b=BjCwIAhurtC7yTpUI68gttUEvdpkwThBweg7hQSiF7SEJRy5hbI0fahK0AuQ54pBiYW6Cxu6D77sEmEZX2yvN3H0jKjY1jeh4cj+QITm1EuWHdFWKAXqv+QuQAikWXBGBsboU+3wAvL1JJ8Vv26F7ha4AR/1/Hkg0xHGWWTVhybi8t124GfjhmbiO89+IL2W8wE7tXKLVoXYOvVZh7+Pk2z3OvsKAUVsuTvE1HwTYmMhAUhfYETm/7nYmL26F+KaJuvX2X8vawL6Yjx1vKANv8v8atTSZiiBfue8x+ctyqarwAMNvddWZhU88ofbvfrm/v9uavh1MaXsqN/WGqSGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkAaN0Qv6D/iLNNVB+WB4JFriA2FY/v21hNPm4hasW8=;
 b=E9bjRA3X5i5uPO5ivA6ZGKgG3ObFec9HGYD4D3ucxRyUHi2ICMN9ZlvSkEnGARQR7pGpQZkcV6GXnXoV+YjpvzhH1uLFblITDkwNxmPyUpVkY8XZFbJJBoqa/kWIMF6XrHQOVwNGwiozYub78S/VXM9Ui9rHVcoX+sbVkSO7fU8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:13 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:13 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 17/19] vfio-user: probe remote device ROM BAR
Date: Sun, 18 Jul 2021 23:27:56 -0700
Message-Id: <c9f6bdccf6fb1d2aa7594f08231254058d43efc0.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff1f3c9f-9f7d-45fe-e974-08d94a7e6270
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB48148CF59F8069292FCDEDED8CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ihDirogRrBALtOZN/4IusoAOWGXIAdCHLViuPccx60DbgrBYhP0qn/OBM7jUMI2IhwGpe8ySfSvXXgfT9c+PGoxO8Kkq19R36DtTqJXLwfxPPeu02pFFPLBQXpkSwrPT5GvipfuX7ab4+6obyfDLpC9KLqujKjoAFVLoyV4U2efavSSv52JPCcZrbcA9Ta2qucRJMNPlmy7TfFWZm+ZEDrn3m9SRza1EtuSX5sVOF0NyAs+Jp949EEsNfv1U0C/vN5ocySabu9Nm3xc8u/D3F2DgVJLIC6NddFgnhlmstxagcVRH4Q1mdq9gZtiO5DfmpdQdPvY99OsGz8xUnmRpvJUhIc+GCW2JoCJh8ojAg1t+07vHMKw1AP7Eb7szb+VI73ijZAsAIBLsfdexf62XPw6JHg7wGAr9hGgDfDfN7dotAuFjTvVJO1gF9MzMEhrLl4gjhwVhz07y/+gk/uCDFx7qgtehILZdWxfwZ6z8YcI1e/QDB5DeUcuUh23a/EMYCzdiyIFGaOXu3yqhfVrMdHsf03jqq3FA9eKO4XGdt6Y50DgHsIM2BrAWPdFeZTXco8TLloBPXVGP81e5n0rnhO1FFaWKTxrsmKrV2s4F4DCg8t+Tf8hZC+q8bQCSnaiE79Wl1vHtmY9W5IKkqn+dZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+9q1J36TiD+GnzhTBeJT3SSPto5J76SDLo52LdsGZVg+S4TmzNMPsZheEt3A?=
 =?us-ascii?Q?9N6qIVW8kK5KAADDpnV5AFgAPlOJ68wKSpZ2wvh8Mckn0CuE2FASsw9oUPey?=
 =?us-ascii?Q?3XlxnwYsZls0DflsGZ+nFwOWnxKu+UBA5sAl3UM8ciqqU/nAiuQ60E9+3IoI?=
 =?us-ascii?Q?4rYq9v1Y+9KoJQbta7kZ3hGptKZkckGiEAFE1KhRyYX0dsWAUahKnbAL3d7n?=
 =?us-ascii?Q?GPEtHZ7NLOPaXFAhVTZ00kDX45ujO60j881WYKLQZTZyqyhokUKBmsa59cFK?=
 =?us-ascii?Q?lj5lEF3awT6JvfkkqKUSTc9q66dim3a1Kw6POkd5PE/viCSjB+FuRLmRH2FF?=
 =?us-ascii?Q?gut9yIfU57KjOuvGwLBe/i1sausUN9nEvZSM9Ko5HdsThk3Ik3SkiA0asYwP?=
 =?us-ascii?Q?yatqvtBiIX/Pd37IWZbihv2hLfa55s1/2sKTaEZl4JSSS8KGavYnFASlW8uk?=
 =?us-ascii?Q?T4/gwQilmp14/ZKG7/Ubxt/rB5e3sVPjYcYsagy6vRegMAegJi3tpGhNbvE6?=
 =?us-ascii?Q?gZ/rBq0eLV0wzeM3B6Z2YpWMOaFv6GUVs4CpIRV40zgRyNrMeblkqQGzGjaz?=
 =?us-ascii?Q?5ONjMsilyimC9DhEBfLWl1tHBbWLerGsZWR6PU8CAco9JIb0UPFwRZnl1Wet?=
 =?us-ascii?Q?n4jyLh83syHwe89eTn2npZ6rujmp1J6gRH0d2Zb3eUcfYpQgDEVvCPUEbf7B?=
 =?us-ascii?Q?5KtmBHzXDhYWo2P72snYwosORCjhBKvBfwv05Gl2AO/QjSTsh9lj5JbBEuUW?=
 =?us-ascii?Q?qsdwEjsNF+gMU7XPZPvnmPim+ke16XAGGtW6R/F6B8WLyS6A6YsVyrw7XKYj?=
 =?us-ascii?Q?59L2VNCBZ/esM6Oj6wEhAkpvyZq28YUf3tWu4iHSSAn58B+aPN111gLdN5YC?=
 =?us-ascii?Q?pjoYCv3L33zoXCw6UHXKrjslx2aeADef+g/wrtDphUfQG/EkB4SoIWo/rWf6?=
 =?us-ascii?Q?ehXp7QhBV69LFQTqbAyOF8m/O4/9BmCyc/6VZNyEtb2KsJatgYkKweE4MnBh?=
 =?us-ascii?Q?L64eVfwDuE/PUo4DCuG8SwCS/dgRty2HzarIytpazNc7tB8GR3woG0Fzxh1k?=
 =?us-ascii?Q?zetXD1KHvBlpMTDgr+XmjTWcBKbv64rbfwzSeTjauiqj+SlGNvMmRHs4+jI0?=
 =?us-ascii?Q?QLvng1MHFOhuH0OrlSSIosNYu+YMNgyvXsa+TzZ4jzgiwuDhDiDm5QkfTKiP?=
 =?us-ascii?Q?zUKiRdY4+Vld8mfdCR9HcOflzAfOwIpXtA/H6WZSeF+BHiO8tVlgHIRdl1Qs?=
 =?us-ascii?Q?YdSOQ05RaTBAqczQQ3d5HWrJyWBnikSyX1n4TRTAJjkmdbGmIA10AjZ+Tl5L?=
 =?us-ascii?Q?LRZcOS9GuAoK/ZGH1RhjKucocDQmTPTbMybwbi/2g+9NyPEOwL27TOHQBPqC?=
 =?us-ascii?Q?CeBCWlhKy/8/eS6VD2K1gGL/jkSr?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1f3c9f-9f7d-45fe-e974-08d94a7e6270
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:12.8776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOBx0fkAKR3M7jfgaBIs4/Sxdi8WRMXoxV2n3PKc+Kn9BSf/HBaM8jd3diw6/ENBV+7lYVUaJFkBvPkAo02Qq9TZNQzeTmGy6laCC/G8epg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-ORIG-GUID: av7F1J77MPmxfMm9urC_a1R0j2WLpNNC
X-Proofpoint-GUID: av7F1J77MPmxfMm9urC_a1R0j2WLpNNC
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01, RCVD_IN_MSPIKE_L3=0.9,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index a6c28dac03..bed8eaa4c2 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -816,8 +816,14 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
     memset(vdev->rom, 0xff, size);
 
     while (size) {
-        bytes = pread(vdev->vbasedev.fd, vdev->rom + off,
-                      size, vdev->rom_offset + off);
+        if (vdev->vbasedev.proxy != NULL) {
+            bytes = vfio_user_region_read(&vdev->vbasedev,
+                                          VFIO_PCI_ROM_REGION_INDEX,
+                                          off, size, vdev->rom + off);
+        } else {
+            bytes = pread(vdev->vbasedev.fd, vdev->rom + off,
+                          size, vdev->rom_offset + off);
+        }
         if (bytes == 0) {
             break;
         } else if (bytes > 0) {
@@ -936,12 +942,28 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
      * Use the same size ROM BAR as the physical device.  The contents
      * will get filled in later when the guest tries to read it.
      */
-    if (pread(fd, &orig, 4, offset) != 4 ||
-        pwrite(fd, &size, 4, offset) != 4 ||
-        pread(fd, &size, 4, offset) != 4 ||
-        pwrite(fd, &orig, 4, offset) != 4) {
-        error_report("%s(%s) failed: %m", __func__, vdev->vbasedev.name);
-        return;
+    if (vdev->vbasedev.proxy != NULL) {
+        if (vfio_user_region_read(&vdev->vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
+                                  PCI_ROM_ADDRESS, 4, &orig) != 4 ||
+            vfio_user_region_write(&vdev->vbasedev,
+                                   VFIO_PCI_CONFIG_REGION_INDEX,
+                                   PCI_ROM_ADDRESS, 4, &size) != 4 ||
+            vfio_user_region_read(&vdev->vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
+                                  PCI_ROM_ADDRESS, 4, &size) != 4 ||
+            vfio_user_region_write(&vdev->vbasedev,
+                                   VFIO_PCI_CONFIG_REGION_INDEX,
+                                   PCI_ROM_ADDRESS, 4, &orig) != 4) {
+            error_report("%s(%s) failed: %m", __func__, vdev->vbasedev.name);
+            return;
+        }
+    } else {
+        if (pread(fd, &orig, 4, offset) != 4 ||
+            pwrite(fd, &size, 4, offset) != 4 ||
+            pread(fd, &size, 4, offset) != 4 ||
+            pwrite(fd, &orig, 4, offset) != 4) {
+            error_report("%s(%s) failed: %m", __func__, vdev->vbasedev.name);
+            return;
+        }
     }
 
     size = ~(le32_to_cpu(size) & PCI_ROM_ADDRESS_MASK) + 1;
-- 
2.25.1


