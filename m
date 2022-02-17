Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9400A4B9A31
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 08:55:33 +0100 (CET)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbdU-0000aL-Ci
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 02:55:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXd-0003kP-8Z
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:30 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXb-0004R1-69
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:28 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H4RVGt010846; 
 Thu, 17 Feb 2022 07:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=VTjWafM9t/8ZS+8mz/vsztcccCTsO5fahMk5KsghvJ0=;
 b=TBGTzSDfQ/0Hm4nL2/CwVmLgwREI5M+xx9wIFHUosmcMySz+UbLbKr85pI7c9QgGzEqT
 gPpOtc+Gwt6S9tXnOPGI79LRx1yeLYQJopxg8ZIPhLKGop5t2S3JTrSgqQ52t/TvjcH6
 8bv2837ypYrX82OqRdp9ZM1Kg9/ZhVqRxj2gPPrOHh3PvFJemPQRsmw+lYBcxPFnxonH
 BL7O4Wm3lFzTU0HZz4fQVwSV3E/0ebVlaw6fS0P1Kx4Kw0auWMYmj3K1yI45lT80YeJb
 2T4y9jFmqQA2QOeuE1NZg3vaWx3hAIQXRwVYGBXthNdSksPmnpQHSk94TOkwQYb0hpKS pA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nkdmt28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gVr3135681;
 Thu, 17 Feb 2022 07:49:16 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
 by userp3020.oracle.com with ESMTP id 3e8n4vjduh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXOrb0ZphP5I5dTrWwQuM0R/DN0oideOlRqzrsmMvX0nIRlLV9dwfo18NvRq/doL+OJkqhppsdYEcbhgZfStrg3UuwW5M2DmB77UhXWSYPoLOrkIaHur/BgznVhZisUSZOr95lFFxCDEuj8XKOXRQd6zdIDeVNpohtj1ns18ovVSS0BsnUHS9n40YlEHGO+ngu5TLzflfA+dTOVwx32gKD88GM2oauke+fSoOl85GBUz/AbELIJK1uFxkEDREKAC2tNZrRTRiag1xpVTUUQ/h3YGYnpcAcOgD6f4ro5KR7/1rKdQ/5eQEYMDTu2q2I7j4Fg2ZBayoF5MuPOMAXMFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTjWafM9t/8ZS+8mz/vsztcccCTsO5fahMk5KsghvJ0=;
 b=bi/M3QitoNK1oV9gTuKUf1stACRivFx8USl5JQvSlN/ZiNh4b2PvDHzfzbCYeVcjCIakaYBj5DbaiMcR8ZnX3VeF/8kqm8MA+Ea2jsaF5phG0A+WlZhQu+pPyw1ijaHjGStQHw4QYg76qaFNPeXMAYynrwwGIZOVqAVNvF7/xzKyUb1r4VA8M1MsI15KZUB0f8nv+hJJ3teJqzY68sk93FPZ9/hq1s/QohoXI8DKtGaapx3KWGGFZJPRCbFqZbSyhUsPHggTmT2MHYiBE9UruKMa6POh1WrE7QyaFDMyHr5tkxe6E8qwFE2Ul/QHRN1pLUr+5TAPA+bpIx8tyU7ucQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTjWafM9t/8ZS+8mz/vsztcccCTsO5fahMk5KsghvJ0=;
 b=KiWS5jzlM5SWgRkA5t42PZeADFnbwc9GJWxgbRFZmDyZNGfWCrJmSmQ7ZuKWjzVFVAGvWJkvprSq7eDh60ovvXEiez7/3e5yj/D5Rgs3XlYwFO4LxQWBqchtb7oNii8XkK3U61y6n8sWN13aqy8kjnIU9XJuThhfuBGBHIJb4dc=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by BL0PR10MB3009.namprd10.prod.outlook.com (2603:10b6:208:75::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Thu, 17 Feb
 2022 07:49:14 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:14 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Date: Thu, 17 Feb 2022 02:48:48 -0500
Message-Id: <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1645079934.git.jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:806:a7::7) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffd38354-ca6c-4043-0ba5-08d9f1e9fe26
X-MS-TrafficTypeDiagnostic: BL0PR10MB3009:EE_
X-Microsoft-Antispam-PRVS: <BL0PR10MB3009AF0CDD997F62D39C5D3C90369@BL0PR10MB3009.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jezw0BraAaOg29V/Dco1/vZJTo7bLF4DDvtu1bTAjekpmih4w6sjSGjH2PkVwRn7mOLUOaaFZb20S2kh4+RCkR9cWAiqKAK8P5mrnZJne0kA0MOC5R+Ce/6g1FleKD7WdI5UvvGu05JWkNCwZETruZxc7DcDJFv4gBaWv2TdwqebIfJuPz0F9rvYh+E+hoWT0483MqWEN5usDxE9hF6UrLla10Za4L11iuUS+Lq2IIeKoHC2Zd4Pqb0Xj3HJcJgGKojn70NlINVCR1uavAQD74Gi/47ZHPBfK7hsgLKxbaZjk2ajeP4xWsHY76YHal7qtRTyugd4uMPQtKsNqjprldTPKA7xZhgvArVWzvsMnXZB+TwQu0f/ZKXrwTChCorTtNt6cPJl0FJR0IVlb3crFO0FEGz+Q8AmcugTakLztBWkCDxGYhN2ERmzPYUGOjV/OSXuTZ+MxyyUkNikJe2pUmD1Qqkg3xQT8Q0gc35EcUE3z9/Ujx2qMR3a+4Z0iaLaJVIBaMa0wVZykU9oj4dEu756vzJwrtR/ALW/66DtHv1/iZtPCF2Xe5rbErqgHt+xakwQV9yoLgIGZL33bIdFgEr+CTYMdjdwO7ZAspiSRICvef4MYcvQa4dk18QrTcJnvQU0w10DFedT9aPTNvvT/wkVve4WyGI00V3go1Z5oWTe00+G9Y1FjSCMk103Qq5++mNICAoOlBtzebBwSXb6eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(66946007)(6916009)(66476007)(4326008)(38350700002)(316002)(36756003)(38100700002)(2616005)(6486002)(508600001)(66556008)(6506007)(8676002)(107886003)(26005)(2906002)(5660300002)(86362001)(7416002)(8936002)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Jx9920RWeQFskEl0ibWwPF4jyArb8MKW4ZvM0vmlGd/mF0Pr2lPvgVEDrKU?=
 =?us-ascii?Q?kJSnAsuA/tQxul/rr5gwZKFrPvQyh812sAMng/1FactkG5IxbHW/fd7WJrbH?=
 =?us-ascii?Q?zCE8RJmIWr7JGUwkK1CPdRAtw7dTLBa9p4Ci6lyjAq0STW9s95Z4sf89RO8O?=
 =?us-ascii?Q?PS/YqmBtA7MWP/oEyPhb1vmbFslGL+6B6jvVt+K7YwLIvMmbo091WL8wFrti?=
 =?us-ascii?Q?AtaxesG93ebrZ3/7C1fLfPJueEUT1SU8HAjriBOMR/hgnYwrgApHyj6NjIWA?=
 =?us-ascii?Q?uDAYRbpZVwzXZRJdTu6+cawOn7WPMGJH3iV/lqNc7EwvTl/+vD/3WA+djdL4?=
 =?us-ascii?Q?81DBl31FNGfgQqgKZD3wBGRypVEi4Gyf6FWTIKGnfpTibNNgoK4vUlsfAGiY?=
 =?us-ascii?Q?jh38XROMpzdkHz7hJnw4ijF2N3WTlft0uJ8GoFk79ItVMLnfQuzKH9Wz8srU?=
 =?us-ascii?Q?Pc3Yk+krYXJ9tiSg9WSKNZ1v6UlXE35NvH4pJRtlEDYTkX3XtFUlfBM+JBwr?=
 =?us-ascii?Q?xbqayhfn6p5hts3h1/qzEIuHho/N7h/QbLjhsxLgT9iN/R3wkAt/uWw1qsjp?=
 =?us-ascii?Q?JeWnWcxHOYEfuNe9oYAg5vvqP3kw8iRbuOYmV4yakZmB1AGHZcBbxerAjgDo?=
 =?us-ascii?Q?L8tQNeVMFPXzhNQ+kLkwFzJACcvf9RjPBKk8YTRD7n9K0/T8K4nk08r8uAZu?=
 =?us-ascii?Q?3xlDl6swY3mzTt6IG9zCs4oaexgiB+xYrj1QsdyYHxcBIRYRmqrYTMxs0idE?=
 =?us-ascii?Q?MRpIouBPuGv2/qFi3g4xqZ9Kue68NYnqMN0p669XM1kNSGTenOm9IL/ZWpQo?=
 =?us-ascii?Q?Pos+7vJrsI4kIbJRE1q9vk34jkdDfvW51efZb0RVdcm4AzHs1dp5vDkEUbar?=
 =?us-ascii?Q?8hM9/UTDPo4pIOxCXVOickV9DewWhZeITbdX4KQDO5abmaQ7qkQlf/2DSoxk?=
 =?us-ascii?Q?0ueQGL0EFR8sA0UfPIXXX1mufRN5cXDWE0FFUu2ohmuTdJ4aui9W3mKs4FV/?=
 =?us-ascii?Q?vf81HIwma4ZGufDNfOl1Quxkm8eDXwIesJCvDEStbBgjPUkrFkncFrwzbhTU?=
 =?us-ascii?Q?bpLvyEyIwgx463/Xqi7JvrE9QgkHRYUAFf1iZ1E23HJ6PL1H0YiqbCnFNHrC?=
 =?us-ascii?Q?Cfn7fluWh/vohF/+usy4Tf0pXNBc2rNQYyi3peBXBeR/uEz1teX67bQruDta?=
 =?us-ascii?Q?xiL+jPOAR0BzZIVo5JQIPb7FThWq5Ukdc4isHqIuP5xxgp3UP6jKoFSYwR2n?=
 =?us-ascii?Q?YJN5oiuZE+21Znbg6w92yhvt4NwXTTEv10pOaCO07v18xlgQtzbDSJXMOE4b?=
 =?us-ascii?Q?U7aQ721vqFAton3BZKdMQGU7SFCuesahlf5P2Ihdm1yqUzR1oNH6xkNumlNZ?=
 =?us-ascii?Q?88Ou49Y9uil9OKp4j3JqpCqeNnxzL79MU+Ux6mjmjjOUoXSDE+0l3vgz14L6?=
 =?us-ascii?Q?xJeKxoy4g1Hb4VOc1aLl8wpJdaU4LO0AQMmbuk7H+1y8DzYPLq1hwpYNwto3?=
 =?us-ascii?Q?XJoK8O5uJdsGF7AkUneTgjAtQqNcw2fjHHWrxMlM5GkgtkVLYWaUhlPAVqYK?=
 =?us-ascii?Q?CkD7YNd+o7TfUSS6fA22q3hVZT20BjqRKtTUbf24TP7XcglLSlhK+d3STy7p?=
 =?us-ascii?Q?LSwrIBZAstRccBXAS2KHEqA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd38354-ca6c-4043-0ba5-08d9f1e9fe26
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:14.4778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdhFtqnlH/KNyphUYQUJd2M6Om2Algf6F+V0oT4c+/6hIXBBsx/MhdHeKSyndJf9G1GLhR/I/FbHoFKog9jzJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3009
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170034
X-Proofpoint-ORIG-GUID: 0-mD19eV6dEn1EeNQJ4_YwNFM-mDaP4w
X-Proofpoint-GUID: 0-mD19eV6dEn1EeNQJ4_YwNFM-mDaP4w
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The compiler path that cmake gets from meson is corrupted. It results in
the following error:
| -- The C compiler identification is unknown
| CMake Error at CMakeLists.txt:35 (project):
| The CMAKE_C_COMPILER:
| /opt/rh/devtoolset-9/root/bin/cc;-m64;-mcx16
| is not a full path to an existing compiler tool.

Explicitly specify the C compiler for cmake to avoid this error

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index 3a29eff5cc..9a326eda1e 100755
--- a/configure
+++ b/configure
@@ -3726,6 +3726,8 @@ if test "$skip_meson" = no; then
   echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
   echo "c_link_args = [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "cpp_link_args = [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXFLAGS $EXTRA_LDFLAGS)]" >> $cross
+  echo "[cmake]" >> $cross
+  echo "CMAKE_C_COMPILER = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
   echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
-- 
2.20.1


