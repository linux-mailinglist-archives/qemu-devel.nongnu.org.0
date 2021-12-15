Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0F1475BF6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:39:28 +0100 (CET)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWNL-0008AL-IH
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:39:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWK1-0005EN-9J
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:03 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:29980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWJy-0008Rp-QX
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:00 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEgO1x008084; 
 Wed, 15 Dec 2021 15:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=8xoyHZEUyMcTWfa3wzI5ZpQ8ifq1XM2JKlVzhEWkFXg=;
 b=rUVWsrjORRvc8NedbzBghZe+Wq2PlWWxnFs/+5d+wS/HyIfCDbu3Fv1TzZnhautAwpSt
 96pa+cSpZsxiMRPdP2SW/JXn1KAf7D9EBXep8V2wgnWSZcYTtGRRPWmTNZFfrdh4zsaw
 VoncVhI4z1jYL9AeB9ZZQau/MQE8SQ6O0/jhoIUrXLaz8NXXX9XdMHHoTIPIpW7YJcoI
 TvxmYS4Y2WiJYXg37+gSa+/NeamFr1vkzUNMMOjkpmXjJccTOTsC4nSOg60x9CWnmlXi
 S8zxENdyhwRf7GTcrbhTXTR5Gl0mCNZMN7vxOM2VpgymawqHnquyqZfN8mFdU59Z4N+F 2w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx2nff729-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:35:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFU7pW165413;
 Wed, 15 Dec 2021 15:35:55 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by aserp3030.oracle.com with ESMTP id 3cyju8grxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:35:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr46n2B/heXBSde0h7qi073JazabFYaEUkkyhJAw/C7QlUlzp6ZMiKtwiqcFuAW9wxi/ZW6hAInuL7+mu0Oh0eDgXTJEz++LKvIs3FY1zqVUq0NwMzW4/Qa8/x67tbP4jLm/N2Dcka1/0/nR78CsN/h/41hG8VqOWp+4v0aOyBQZF98b3LLMD6KrThBEl3+uSCmw2ozkL3OLCvEEKB6OW1RkUmSe8g86HlAOh4f7V5HqoNT/uOfp2ZmnAVQUsj04DTW9ndQLBGnlWQBEdWx/ux2vb4azg0ceZ6a53DpjMU0a9FEyazxw1WiwBqCGvLtZCdBNXBNfAbUWojsgHY/0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xoyHZEUyMcTWfa3wzI5ZpQ8ifq1XM2JKlVzhEWkFXg=;
 b=GIB0bT88CTv3UU55qHK7ewde4lBeUBYBkYDI0/RbQSXjtnv8yGwKhGVpTSJzGHR87m7WFsuk01WvmAG7h9g7S0zSPS08h8ohIdXajsD4jCPC2KTeO2j0JFBo0mD3eswkckINHeZs1J5vctNFHKN3hAH1pgZQKrLMpuV7holggNpFScchAzFKGDSFeIFZRFxFxdIVzvWapXgGWbrM4ezG9m11KGP2mVPpPt8UCztmVD3BN9xkZAcE6PWrpk1FZMyWzsEm0NZJQJXmscF/jjnBetxsuMmVAfj2HozvVfkVZVoSZsVj851ckLyPpYTM0LK8nnUv/VaRHKK9qJHxgl7P6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xoyHZEUyMcTWfa3wzI5ZpQ8ifq1XM2JKlVzhEWkFXg=;
 b=eLCARr2XUBYQLD3WSFFWbZSnPwc79GEr4yK5spNrOxbfwVhtIqoFStWyuuSuB3f6mqm56ZPg3E7hHVn6i8C5hV4Q1j57fCP4ELqPo80D7/4Q6ULQcL7MCXDlv0NVss9woEd48zNBRNpv8lipWUh+oYsklpVYuUH2+W0c7zYUTQc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4094.namprd10.prod.outlook.com (2603:10b6:208:11e::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 15:35:52 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:35:52 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/14] tests/avocado: Specify target VM argument to helper
 routines
Date: Wed, 15 Dec 2021 10:35:26 -0500
Message-Id: <31a4b3bb6a48f291890641ab348e7749c70a2d06.1639549843.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1639549843.git.jag.raman@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8681a5e-c886-411e-e001-08d9bfe093d4
X-MS-TrafficTypeDiagnostic: MN2PR10MB4094:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB409450EE72EBFAE037ED3AB890769@MN2PR10MB4094.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N3QqvARxH0gogXFi5zT7x4pk0ezOw2UkwhGE+NScsf7GtSf8y6ieWh3QMJVjm1qk7fsDD4Hz2/D0yt1PNbqyOhYejVnXgLn2yLyJVKj4M9RfTkm1c/AOOREF6r84jiU2o45UB435t9KvZ73YyESMPbN71XwWknNOAf/U+h8f2s210sAQePiC/DOy33JJPMzdBk3sQcY2KqL9EjF9pomE5dJ1XKD0gW+D6RWNRWdvAIBnhXyY4UephBndhRyT80loqGIpFifOtUyeBPtqMnFe6RGspD4Oz+RLKmtKB4XsP2Kxjj7KUlcWDAL8XbKNhqVBY3IDqvv2CS2HFBzwqp5ibReEKyi1RU1/jI+4yyyfuIVs6IP/nRx91v+2E2in0zqF32ApwLcOAvisIK7BYjCxzMm3VB5nJ9s73ohfB02/557lTah+vPTqRKKGMpRaGLDru1boJVv1IZU8H434DA7kwkL38hE94bjE2U8WeudTFi7j56myYkoMymzLqEPZkKjk6aqD7SOWXLFc1n2Ocrw0ah3J0Ib+axK3GiYSotE3NQRj90r3UNlugNQzpsrXAb4cKFKbfO1AmDzsXS2vxKLg0p5cf3X8ni3m0l1C+ztp5gp4xq8OnthBkmUr7wPmUVuY7ynb7gzA9nBo7TdDQ3zDWvmvAUh6JLcNWatcy0Lxkd18lxlxPX+uzV460XUaWeFWu03kYNDaKb+sv6Iuv/lcIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(6666004)(52116002)(4326008)(2616005)(6506007)(86362001)(8936002)(6512007)(5660300002)(6486002)(26005)(2906002)(38350700002)(6916009)(38100700002)(316002)(186003)(107886003)(66946007)(83380400001)(8676002)(66476007)(508600001)(36756003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tzCreNLwK02HA2D1cvXx95NQBPBDbfm3822zEdQ9AJIboLsehGi3B9Wl+oMj?=
 =?us-ascii?Q?D1+mHSWp57RW6TiIUjTPTgV4YrQbUCk68gASHG22h9h4DbYNNRe0BrmrPhsC?=
 =?us-ascii?Q?YiBakGxjO+pxVNqI1hjO5Ki1N43pfLeaWr+ImmhTcESAXW+qqmhNUO2R05HT?=
 =?us-ascii?Q?cpwdkY6cwa++VJ/4DCzkCXwnO1Ax5nYDRIeteu2YHSESpzhCProU3cdH7Lk+?=
 =?us-ascii?Q?Z4EPfxRTI5tiSD/ApGA1qaVHc46hxpLL6QDrTeFEztalvgtA1GT2ql9fAzHq?=
 =?us-ascii?Q?kduDPIItNQLMmD5MhwI+0G9cDRNiJd7h/YqVa9s1LhUpqHT88JzPO2Y20gw9?=
 =?us-ascii?Q?2KTUiCRHs/caErE0P12oKQomH1htgBXJJP/NWSYxHSELI8KVGDTIZy08F3PI?=
 =?us-ascii?Q?LYfOtNQhWXb8F37pmZfzLgrtSPvQw7rtiXn2nSxkZNF7F4FnKH5zXAecWotG?=
 =?us-ascii?Q?5k0NhyNW9GrMN5ll7rLwKtjFfCY987Z1kBO8orcH8FkJm365jto25iz+7lpG?=
 =?us-ascii?Q?a4QEac3yZxWKYby4VS5FCksw/mWkULjTJby8U2A8eFaevkOrmjdLzU8/zre7?=
 =?us-ascii?Q?xUTzMpCl/+4uG/NaT4HNxY10tkh51E3NMLCUcYSgu+OxRqgkatObJNyOkSiu?=
 =?us-ascii?Q?5BiALgBewoxvab3n38B5YQjV7NUIV3tYmJUyprIET0JCTzCrQWuGkudHOxkq?=
 =?us-ascii?Q?Jl3r5qqIHxSXyXNjkvUSB0FIKfEl/FHdgCCNrtvjXHTh3d9FWHeOwZq+TlBZ?=
 =?us-ascii?Q?OXHK4DEpY0hWMiIqSIM2I28rsjgpWc8TvEZy9hvZ2KwCtG74qd1nD4raa1V8?=
 =?us-ascii?Q?iKOw1Yvos5aR2cKCISYULk85dGkZrjN1R8ZYawAXo1DDYjYbiOOEHKzN64Tl?=
 =?us-ascii?Q?kNa5yOHzvZDaWmOap1kUItvHKWx6XaD+Pjl+Onrkjn1PLgge1xOADMXMnsE5?=
 =?us-ascii?Q?gmu9Hb0kFN1u2EQYir/hm1M64Zo27JDiH4NGsuwRhnjjN8HkjB86UYIxjzm7?=
 =?us-ascii?Q?Irzz0mFY+hMfUh779TV/QLmKY5zvY5rcbMrnC30CsK3Cnnh4TBcBPeoRpgxA?=
 =?us-ascii?Q?ig4vOZoXp5CWQz3WSplSpkH6hGNTLFURrFdNlcfUurdZm89Tvo40ecFR1GyV?=
 =?us-ascii?Q?4NBBeg9Tmo/hw7XQ8RNDaJYufHST/e8Ct0eysQRtxv3rCL6NX+2xAmTAnN2X?=
 =?us-ascii?Q?OPf08Pm6WRsTk2/RwprXFpLK8JCZrkg8flZZM3F3Brr2Rad5yiuUCzmcMTQY?=
 =?us-ascii?Q?YsC8K9Y/iBJDnb3mI4BftrJpgEDV7qPlIK3NuT9PT8BnMLpnNlSWCZ/3IUvZ?=
 =?us-ascii?Q?gSkZG9ux3fEns6oT73Qfkn9oPR1qXLx6E9jIHJ/HbRU8EvfaOMEDfPmJr5u3?=
 =?us-ascii?Q?fMxrB5hzg1QgP+2qRQZ+VrCJVT6B5RX4XZL2t9/gcmCbNQJYkBkhHxrk/cRs?=
 =?us-ascii?Q?cYScpBP4yZSfHAnfK4gyoSAmCv6YZx3T8TToJ4avRCHj8mqncd1iQ4S93kGk?=
 =?us-ascii?Q?UezPJkBNzZRn47AjSeWqfRrDnfg/lyIELYO6pfEUC1ZKfB6E5ktfG0AIOYDY?=
 =?us-ascii?Q?JprdP+FAw+Bz3cKogXhrzN6/iRibAAAfXqNaZ8mPWpGunLCuRbRSwdWutV2S?=
 =?us-ascii?Q?2RVQwtUdbF2vKixvbvuceP0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8681a5e-c886-411e-e001-08d9bfe093d4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:35:52.5135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFugJaW0RPQcegduq20keWfnjtFKJvEQSx//ND4XedB425gOk8LYTxVto61G2pgnDYAm3JZvBmHn55PsFkQ/Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4094
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: KHHKo9C4Qc67zIblDUZGx8E5kQ519BdI
X-Proofpoint-GUID: KHHKo9C4Qc67zIblDUZGx8E5kQ519BdI
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Specify target VM for exec_command and
exec_command_and_wait_for_pattern routines

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 tests/avocado/avocado_qemu/__init__.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 75063c0c30..26ac782f53 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -198,7 +198,7 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
     """
     _console_interaction(test, success_message, failure_message, None, vm=vm)
 
-def exec_command(test, command):
+def exec_command(test, command, vm=None):
     """
     Send a command to a console (appending CRLF characters), while logging
     the content.
@@ -208,10 +208,11 @@ def exec_command(test, command):
     :param command: the command to send
     :type command: str
     """
-    _console_interaction(test, None, None, command + '\r')
+    _console_interaction(test, None, None, command + '\r', vm=vm)
 
 def exec_command_and_wait_for_pattern(test, command,
-                                      success_message, failure_message=None):
+                                      success_message, failure_message=None,
+                                      vm=None):
     """
     Send a command to a console (appending CRLF characters), then wait
     for success_message to appear on the console, while logging the.
@@ -224,7 +225,8 @@ def exec_command_and_wait_for_pattern(test, command,
     :param success_message: if this message appears, test succeeds
     :param failure_message: if this message appears, test fails
     """
-    _console_interaction(test, success_message, failure_message, command + '\r')
+    _console_interaction(test, success_message, failure_message, command + '\r',
+                         vm=vm)
 
 class QemuBaseTest(avocado.Test):
     def _get_unique_tag_val(self, tag_name):
-- 
2.20.1


