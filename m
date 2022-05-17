Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AE2529C96
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 10:34:39 +0200 (CEST)
Received: from localhost ([::1]:45134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqsf8-0007HX-4j
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 04:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nqsbB-0005o3-PB
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:30:34 -0400
Received: from corp-ob10.yahoo-corp.jp ([182.22.125.210]:60642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nqsb6-0002P4-SZ
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:30:32 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01lp2169.outbound.protection.outlook.com [104.47.23.169])
 by corp-ob10.yahoo-corp.jp (Postfix) with ESMTPS id EBD5919FB18B;
 Tue, 17 May 2022 17:30:22 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1652776223;
 bh=Lfrm1jNWNSkwq/mDGojIKJKL5n1lQau/KqK5oZpo7f8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aPgwhPGqiEDpnqeRSgNWtdrgBdBWpVowkOyoOGR481lKOjulafLaBoQwvwjdhE6Zx
 TuNtvmpG2SGSREfqTSEKPtVNW91+69axym0wNGbbrGyLqGSkMHA8jLkUjiHgRS7FGE
 Ha78yULPt0bq7BmrYNkD5CPhy78Hl9AjWSNYHHwI=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iniKNX1Sq0GpesNgbRwl9Fev+z24xSUQom1LFd8l29VIIfCS/mfIJ76Q/s6Iiw09sQSUtvkgSLbEb1RrSBA+O7jUpWXlre0ylvFXS72CQYP0sxOOw+XDIvRA5g0T5yLXz2WZs/YKUS0+W9uCZJfJhpMg/M0qsUm1gHBMPoh5YWC78fBdhqaCkaLRrL1QxLlUWnfFcA2dyyxoQT3XUy7SE3LrqRYgY5fHvW/pfEyXarUf0IJJ3xxohecy0Zj/Aey52PnWjmasHBhNGTFTaXqkKqrxewRzEcY7KEB5nzwSEnZ+YuxcGrzg+Xj664fAp/ChBm0GADuJmOy8pl07e+QPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lfrm1jNWNSkwq/mDGojIKJKL5n1lQau/KqK5oZpo7f8=;
 b=QhyAxYxTYKK+jDWd9z5WOB8N2yY2DOzE9PApLEcYXVqOgBHS80GfyVXum8IBwoNbfcCOXqn3F+fTAXNQROsD4CpWUzRytC3un2NPYnpfBFoGutgB0/L26D/JGDznzKlYW5+ulC6eEqeZm9GadihDWSID0ai1QZj7PArwqUW+13b3HNt+R05a/pYZtz6MXpOJAZfqyn6000dFd8nXKwTuidPHx7rVXLtXF/FApwJM0l++dv00x/pN7dWRRcjBznjx/W3tnYNOpOm51J8d/RliwU12rTFPGTVHkR1iPUbQElY4ccJxbd/mV471htpK++L+pKCleiy60ZXD/+anqs9yiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=yahoo-corp.jp; dmarc=pass action=none
 header.from=yahoo-corp.jp; dkim=pass header.d=yahoo-corp.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lfrm1jNWNSkwq/mDGojIKJKL5n1lQau/KqK5oZpo7f8=;
 b=JHDxTPMOp7lAhRJirm2bOHRmTzSNH5NKccgIys9Y1SMPh6x6axeJL4n9qBO8r1SrFjpWBKwUxbY6a3Pq64omWEeZJCSPnPBEotMV2st5PzIZVx3nHQVWzfvOWY2MoTWYSn4C5X2zXAsI5qdLYzjYw3GAX8QB0SWMo/NvQw33aOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
Received: from TYWPR01MB10194.jpnprd01.prod.outlook.com (2603:1096:400:1e6::5)
 by TYYPR01MB7904.jpnprd01.prod.outlook.com (2603:1096:400:fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 08:30:22 +0000
Received: from TYWPR01MB10194.jpnprd01.prod.outlook.com
 ([fe80::9d9a:354d:e1f6:70c1]) by TYWPR01MB10194.jpnprd01.prod.outlook.com
 ([fe80::9d9a:354d:e1f6:70c1%6]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 08:30:21 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, aoiwa@yahoo-corp.jp,
 Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
Subject: [PATCH 1/1] test-thread-pool: Fix occasional test fail
Date: Tue, 17 May 2022 17:29:54 +0900
Message-Id: <20220517082954.1566-2-hnarukaw@yahoo-corp.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517082954.1566-1-hnarukaw@yahoo-corp.jp>
References: <20220517082954.1566-1-hnarukaw@yahoo-corp.jp>
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:405:4::24) To TYWPR01MB10194.jpnprd01.prod.outlook.com
 (2603:1096:400:1e6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2de2b2e9-cca3-4195-bbc0-08da37df7b98
X-MS-TrafficTypeDiagnostic: TYYPR01MB7904:EE_
X-Microsoft-Antispam-PRVS: <TYYPR01MB79046ECD9C839F2C1E02116980CE9@TYYPR01MB7904.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7L2267DuyY+zWImxlj5oxo6v5IrkWzgCEwJAkBd5Ltvp+dMZCuRTP0lN4/A7mEKntm75H2wSY6D3QbldCryB/kynW75Q3G9eVCIHMHrRTMhqeV3fUjq0FzMtxpn4MXvqmkLLLCOhsfRvubvpAmwFBzJNxrbbudjGK5TgQgjRUabozdQ0soxyEoRz2SVlu6VviAJrkH34wY/7bR1Fb4+UUKJq2VzFw9tA4xxqJwwesQRVhf580HKAiPmIsspCNfEOTA+/GGqbI5+8KvqmWzWWg/8J3hXFYCrorOaYtEKwjC9uMS+T3CgM8P4XYnAvwbtv5tauJWcnKYNUgBCXBSLo4DUt17MC42KMjmYVkwpGpriZMQ0a+dEjpu0HVmGhYFJ6yED4Ypa5Zb/qHvODU7AKhkmzHetr3wrDk/luv6I/w3gJuxzx7CyDG8utPJJE+DdR2CLGiymw0WyZhXDL3WtofmQvl52TzL+WBtXjNtMaNQr4g0DPBKvPs410//1duJmK9/qRSB4WIdfF7IGaleTCah0+7yCcOBYdVTt3Mp+T9MI4neGwPU0ZienSm0FijCRWOqGp0xR/yz3hgyP5m6s8gnzMfVtkwQT7yQ1n5ripKvCOWrf8hRTjCMwpVjs0iSXBa0SQhsw+NyE4n6p392EJ1tKvn14miZ19EMQCxl+MpMK8blZnxlcHbxFPY1LaRWDJ/1DddSwGarTcp/u4GiA05A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYWPR01MB10194.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(26005)(2616005)(6666004)(508600001)(6506007)(6486002)(52116002)(1076003)(186003)(83380400001)(36756003)(5660300002)(6916009)(316002)(8676002)(107886003)(4326008)(66946007)(66556008)(66476007)(8936002)(38350700002)(82960400001)(38100700002)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cSxpGAfIFt+UxIMF7LWHJn/uPyzuWX0fhrUr/3aIAbHIIs1cyvHZqWTanJ/t?=
 =?us-ascii?Q?RKM/PngEQqz4iagPi5ecjyywXKOJ+6rAJWqJ5R/4R53AypA7duq2I1Mu7k8x?=
 =?us-ascii?Q?nE1XtgbtcwoxaT3CWtnveCMFOrRl6VMyjd3ToAbvH8yM47oqXrwbKaXpQpM8?=
 =?us-ascii?Q?A7XdYmauk39px5abKUA/GuccBij4Z2DYHXm3LUkTKzsiyoCvH+11C7Rezk1Y?=
 =?us-ascii?Q?c1vMnfnqJl0GcCpx2X8Imig7++ATLyWfkiT8nz6Z8hiRPFVK+IHDwQucMvCV?=
 =?us-ascii?Q?pjrKbY+FkVe0o/mnWsQztyo9MFukt8suhzr8EP6b5Cp6H1V9Ngzne/GWquzw?=
 =?us-ascii?Q?0KF5U/xVEangLBFS++J6PrGb3UVf+5m1pz7JlwjJ1Yb2+3YaeutjTBoTSeWw?=
 =?us-ascii?Q?VkbwW/9DpVTGC2xGnkq6tuXjEJyWywcyS/xuWsvYKIOABHE8Tc9zkxo8/wnt?=
 =?us-ascii?Q?xvch3VG86MbNg+/uLOJBv1vtNI9kcVKgoSInEg0pQTUTWez8ucjZbnxTyccu?=
 =?us-ascii?Q?ZFWLwtGHFI4YQPFqwRlngtfiGzCWLTobt1QHBi2fS1gEqdzhnNq5JBJo6fVG?=
 =?us-ascii?Q?cnjIYAFs2taAYBYmTwX1LW569q0h//E1r8SIc16FlD4QGHDmATwu9EkL27w6?=
 =?us-ascii?Q?Ww2pRK3NY2BypHxJJF6Qwra1dfPquQ8ilNQQHIMwgZysc6oXyom2MhzUEp6Q?=
 =?us-ascii?Q?DNXn6LQVa1t7AA5ine0J6tqfLeBZGxTQ9Qy8FVA0x958eDt4GfnvzB65zHkw?=
 =?us-ascii?Q?UZ7gAxk9phtj5/mYIOivzXvicqznHSsPbTtuNRAD67nJDhxNUqGzcs4/QGmp?=
 =?us-ascii?Q?VE8i6+fDG/GnPJndXPwMGd5Fc+nMR13Y1pXIS1aoYhfKgTZJW0MsFsH1upU6?=
 =?us-ascii?Q?6vP516qASkLi/+eH+K18AT49sDEz2lBLgtIAyYKbFAZ30LQiAxLT0b/HhOqj?=
 =?us-ascii?Q?6jQypn2o9r8diZ+lvQLZPVdEDihyECo+eIKMY1vg6bT8MLFgOAcyNdkXyfUP?=
 =?us-ascii?Q?eCcupXqcSI4i3v2AS7HEAgD/OtRijeSI257A35hrANwhztidNKRcwIgkF22x?=
 =?us-ascii?Q?CAUA+FyvwH1JW7/Un9sX6X+spbsCBznZAA0g85gl6UkHsohkV0mztTUp4jCR?=
 =?us-ascii?Q?tOk+gsr4RghBaebikg6r7iducQtM/aLtcuG1u8b1Z7Bs6t0i00oqltyjoDVg?=
 =?us-ascii?Q?wSTgJdJtENKFaJVUzmBKfzMrXE/J4O9HYwWSJnsorg3ngFMUmpnPqOg0sMyp?=
 =?us-ascii?Q?F8kCWLIhybmp3foaLYGP1u+WGFmS4U/RQ7AEjHbIKIiSX5VFfnjQGX/wG5+e?=
 =?us-ascii?Q?3wAEzCUonHU/P4bf3X1xhWLEoKE4QU/Ljjsl5ejgh9sh1gBzD7XHGFnQLLjA?=
 =?us-ascii?Q?GN2h9ct8cfVNZ9IKnxdFJlhvdruiyZh4NgR12809G/cRD2Nk/FEYVHMmsGeQ?=
 =?us-ascii?Q?5v7EXI2Q/t4O6JY9vYQqhOK7GHGYtTddJVBQlw7uH+mjriN/HH5jmAsW/Vy0?=
 =?us-ascii?Q?3z5JiX2w5iXD6ds+o4nRLLZkUm/PWwx5UHDT3F6OxW68f/sGPB4cUH95tIeo?=
 =?us-ascii?Q?uVCxYY1H+rF1ltNWSIskYEMiDCCfGAVhZU9HGFpIh4C/IoV7mpo3r2gbDwBC?=
 =?us-ascii?Q?UlmNEsm8ZXlB1KelFo9zVFzPZEBZ8haLeatkWNFwYZtNVgdWEUHBZfz8gdbX?=
 =?us-ascii?Q?aMudzFy3VTzWAWYs5+m8cJWC4JUyg4PUnDbjawrCWAzert1TJIiGgQnTnLjk?=
 =?us-ascii?Q?Qzgvxw1W2Q=3D=3D?=
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de2b2e9-cca3-4195-bbc0-08da37df7b98
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB10194.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 08:30:21.8281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKRzV/KMzUclH/3VJ02VOV/B2Unb0o06UdYGUJksBda5CbrhItv8dPfjGPiXuMg8x/K9tTkkANY5PBBfCruz4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7904
Received-SPF: pass client-ip=182.22.125.210;
 envelope-from=hnarukaw@yahoo-corp.jp; helo=corp-ob10.yahoo-corp.jp
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

I encountered occasional test fail in some of build environment.

Then I found that adding g_usleep(20000); soon after
> if (qatomic_cmpxchg(&data[i].n, 0, 4) == 0) {
in do_test_cancel() in tests/unit/test-thread-pool.c reproduces.

In this test, cancel operation is not done atomically.

If data.n is set to 4, long_cb() finishes immediately, bdrv_aio_cancel()
is called after that, the job is done and
> g_assert_cmpint(data[i].ret, ==, -ECANCELED);
at the case data[i].n == 4 fails.

This patch makes this rare situation to pass correctly.

Signed-off-by: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
---
 tests/unit/test-thread-pool.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-thread-pool.c b/tests/unit/test-thread-pool.c
index 6020e65d69..c29afe2bef 100644
--- a/tests/unit/test-thread-pool.c
+++ b/tests/unit/test-thread-pool.c
@@ -29,8 +29,12 @@ static int long_cb(void *opaque)
     if (qatomic_cmpxchg(&data->n, 0, 1) == 0) {
         g_usleep(2000000);
         qatomic_or(&data->n, 2);
+        return 0;
     }
-    return 0;
+    /* In rare cases that reach here, this job will be done,
+     * but should be treated as canceled.
+     */
+    return -ECANCELED;
 }
 
 static void done_cb(void *opaque, int ret)
-- 
2.17.1


