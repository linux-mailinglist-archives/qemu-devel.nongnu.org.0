Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE23FD915
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:56:59 +0200 (CEST)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOrS-00080K-Hw
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlP-000766-T2
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:43 -0400
Received: from mail-bn7nam10on2134.outbound.protection.outlook.com
 ([40.107.92.134]:37985 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlO-0002UE-8S
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bxs4m1VawiWYcSdkPeEHa3P9ZK+Y6IuSC3EmkcJUbOE/7yQQXNM2k0zn+ZJVX2uJqcTJnR7BmOyVgs21byNCEzow7iFn/B95Ye/0z6rSRXRG0fC7duvS3TVx63tQTAKNw7NytFPjOOF3uZREpR8INjS5RPf3k6YfshqslMXaTigdpDCh+dlDMJSxpD4tFHos9Ay2zqG7KPrgRNstHyibXZOeoLfmWd9FH3Grobi+V68qm280/mZ557wVqB7GQBU3voo2S8sJYV1tn1+AV+EIDu1+/jsAtC3FXVD+0KLdWa+lSNywqrropinmgzdAogAczXpfz8wzBxIRkqHhNJDy+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/WDogIKRTf9tAty5g7PKeEQpl5M+V98YbsyCPWHLy8=;
 b=bKcWQDX3ZsfxMuuuJdcEWDAa8lfGuKm0CVX6axrJPiF701adhoEqmKVftnNoS1cFrQACC497Fw3Yyz4Yh1x7U9xmsXAW5h7Fs63NNxallPxLa3ZCGE0JntwTB13nPEH5eP9tioUhyyS9P+EfBdL5zCblyedBRToTks40RlBHFK/m7Ul+LRXlC2qsw95P61vZpGbI8YWtporojAK3BOZG8jj/OovnSoMPcHnudtZPnEDM76HZQYIctOkfOsLgMhbicqyFifyD4y0W2cAxiBXjzGRFva41EWQAFfQdg/fLoxIaSZlzgnSMoKpNzQWYVAKywyPE1rO4iOYeOR5ltgRklg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/WDogIKRTf9tAty5g7PKeEQpl5M+V98YbsyCPWHLy8=;
 b=lNPDNnUWQpR2U6HL3byqC6Tb6fLle3Zks6rZL3ExUWs3eJ1qv4o28lQnTbihjB2qGkHO4RM7+PQnjOmaMw8oNy+pWFe2L3TwgxGDhBm7tLSIaXvaXFRTV0189MWf7wsMVrwDdtd1sjBZhnRFNP2HBDlgqyPV7YsicBE6OEcZVELTSjGJ+NEsYly4WDBMmjtndbtPvjL6sBZkpumT7JvSppW3BYoKsufZhj38kIhncWw4CM5EqmDKs1CKM1fdrRDCD+iUu3okTe2ap+W9wut5tEuWMrxVNT0Ij0Zncuv62/ZQTgKemrCe6r2MXzYBdjAIwo2MBKF9DQiXODsaiH2QoA==
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4224.namprd03.prod.outlook.com (2603:10b6:805:ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 11:50:29 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 11:50:29 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v3 4/8] fuzz: add an instrumentation filter
Date: Wed,  1 Sep 2021 07:50:00 -0400
Message-Id: <20210901115004.34768-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901115004.34768-1-alxndr@bu.edu>
References: <20210901115004.34768-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0328.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.8 via Frontend
 Transport; Wed, 1 Sep 2021 11:50:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb987f55-851d-4e66-834e-08d96d3eb23d
X-MS-TrafficTypeDiagnostic: SN6PR03MB4224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4224A62AF2D16E3CB833A39CBACD9@SN6PR03MB4224.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tGxggu2X4Nd7IrsvUpzsWrdQRnZE7M4b1p+DYJaPtnHZGjHax2U2GZ1jhd4yQ6VvPPFZQOcbygm48sEgaQgt6VKlaDRC2bzZ7I6uiHZlM70yla2qsADqkG2UbY3TcfJ1ygsVMHExXCZbz61zt1cBeUHFJQtwFql3Yh3klDXlOZY00ullKp59oVtNAOL5Ng9XF1OXLAAd7uKNOEIw+x8b69SkSmdm4XlDt0pXvjXonULUi3uN9UyHg8psEzepD0MnojKuvl7iRvTxXaYMca5PLXPRiQcyaiF7AV/XvD9655Fd+/Rp4bGbNROwZej+Z4sEsEep/sQP2KXXGPhMvjjvzgisUBbajOcEGqGbxAqJ9C7zXqd5mqbxRdfRgKpHEEfscONHFZz36zm+amqjPF0wAb8jKr+w1GfEeTy/YWMWuf4Q7mjexonLFpJZPDpWT5iWgq40gvLsABWUEvyjy7weEq4fZIY4/0qTxOCeThrdIbsSDQD04jw3b8yNIK3XK1WDv1omzsTHNyl7IAQs1b3AQ6LDqLyTnb7GSKRh1sNa9qLcoVaC8Gf0tCdw4QzkRQMpVTv+WOS+gqPI0Q8iW1vuqdsO0PIxJDt39S/RdNfJxXZ/C5Dz4Pg+qJAVc2QMWx/J/7ekMRfNNtMLhuz87qFLbgSp9fmv4wQ93yTGzjmbpTBCVIcpVvwI5tnOD57jvgbBVrbuxAMu7jkV5rasfdspUdDkJy5sSWDpOiXlbQ9phpWVh1b2Kd5hCBAKgH7vLmaR5NE4apXkrNEQUFGIEi0x8j0sLcjMqk80avsrvgIi7RH11eLW5uIEP9iYqYStCNID
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(75432002)(8936002)(38100700002)(38350700002)(6486002)(4326008)(52116002)(5660300002)(86362001)(36756003)(956004)(2616005)(966005)(2906002)(66476007)(66556008)(54906003)(1076003)(83380400001)(186003)(316002)(6916009)(66946007)(6512007)(6506007)(8676002)(26005)(478600001)(6666004)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nSP8LzNZxtyoi4rldefwCA2V4N8vm5C0kXPXyPOsAL5fqh0mQpp6VVZlRy+h?=
 =?us-ascii?Q?F+UfnEF05vlzgQ7DwBf4jTUdnOg26Ky3v4yB0ufJw73xI+JZeVZx3IUi+zt8?=
 =?us-ascii?Q?MdM1xTAYxOR9x1AvrFxsXDwiRXBymxHEfKxMpyQ3Hh148BkwojHcLEiSxyKD?=
 =?us-ascii?Q?F1OXhIvjCrgbtKbnD8GZFA5JCb82KwgHplfcKDMjWt0irjsheM/J38EmPaE2?=
 =?us-ascii?Q?+s7+xeGgGG9zTE3EvQomV+y5sUt6XAbNWBh33zb5t0GNM7kd+yqjASmQ7P+8?=
 =?us-ascii?Q?UKtoXar923AUhLlLo+U0jQWuuJCxOQEAld1iKuBiTWgQb3aqCtsPo6apRoUz?=
 =?us-ascii?Q?41HiYyj+L36Hf1UeJRu9sOsj8c2rp2zD7EG+S2k1oDfpGSYCP+EkZM9NLU/y?=
 =?us-ascii?Q?twOyyTVT+JcupykZE3A+q8o6qyYMjDiN2k/asUDzB9FfixNFs9WBuBorFQAs?=
 =?us-ascii?Q?k0c2ZkSkl0htQD2WWpWp0J9b2WoHPEpyFv0+WfSIp7bjqcPfUVOlUkAtstSZ?=
 =?us-ascii?Q?POJS8jYobBsP7ZTMY/AQM0wN+e9qhg5b/kf/Kw3xCYkNAQsvV72bzjl9GvyB?=
 =?us-ascii?Q?XI7JXd73kt08fZEWBkEc+SGhSewyEOpj3kn9tLJ2PQG8ipm2Fhd0bLxHfwmf?=
 =?us-ascii?Q?6ZREW/j3779oUZJHPM3vv93oxJDr2PXToYW0ET5dhqcI1C7k8ngvYFbf1QPn?=
 =?us-ascii?Q?ef3x9lyDcf+O9h2e1HRMz1XYnHSgXvsB2uqHQSMLfxagef7/U+Dob4+F12YS?=
 =?us-ascii?Q?WDKBxUXRe7ANYY7lUP0G0nALvv3tlkrSPZIJ1PO+N7Bp9zgULV+e4mAs+vtC?=
 =?us-ascii?Q?S34f7xmkTseHk5ieDgWPPM1rZIpnVamvRvQaIrmknv8NEa7b8NnAaVeqMXpy?=
 =?us-ascii?Q?PancNcUEY/ijSQsdhQsSI8yDLl2QujvecNRWWB4tGs9ElhXECBVfyJo/xa03?=
 =?us-ascii?Q?AuVdQxFH7rf6utblnMHjwOZulC90mm35ZpnYPJLYAPWS1J/dAmEnVJjYGcnu?=
 =?us-ascii?Q?3HRzgYyqIIjadKYSezWnInzzNPqMBabCZVP9c3qNOBQlmU72wAzGJLOaPjhP?=
 =?us-ascii?Q?rcv1ZmB9iRy4AOR2lIgtJ9C06SoDg/XkJBK811z+r64UFgZqeVSBlHIVgWj1?=
 =?us-ascii?Q?EWmoR/VCECnxPZ1NcaqttA7oyquxFtrA+y8urfG43+O/Rrzzn5KyfMdBPgw/?=
 =?us-ascii?Q?oUky1yzLcJ50ORGrWdYIABgdiTUiTLlDOZy0rPsPBdRik4Bll+71kVJdJegf?=
 =?us-ascii?Q?st/YC3ipIr9M9XvCt61hubWunPHTESdubRQiAx5zCBEpTL7RH6x6E3bCEDE7?=
 =?us-ascii?Q?gTlfa40QA+Qh4ls+bD5/WXhg?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: cb987f55-851d-4e66-834e-08d96d3eb23d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:50:29.6800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2seUCuiNo9AdYBTIAbjp1xs5RMQxkYgyg1kKfXNVy+LH1bGAL/8AeCMZOr/9EvDX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4224
Received-SPF: pass client-ip=40.107.92.134; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.238, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bonzini@redhat.com, peter.maydell@linaro.org,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By default, -fsanitize=fuzzer instruments all code with coverage
information. However, this means that libfuzzer will track coverage over
hundreds of source files that are unrelated to virtual-devices. This
means that libfuzzer will optimize inputs for coverage observed in timer
code, memory APIs etc. This slows down the fuzzer and stores many inputs
that are not relevant to the actual virtual-devices.

With this change, clang versions that support the
"-fsanitize-coverage-allowlist" will only instrument a subset of the
compiled code, that is directly related to virtual-devices.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 configure                                     | 28 +++++++++++++++----
 .../oss-fuzz/instrumentation-filter-template  | 15 ++++++++++
 2 files changed, 37 insertions(+), 6 deletions(-)
 create mode 100644 scripts/oss-fuzz/instrumentation-filter-template

diff --git a/configure b/configure
index 9a79a004d7..dcdbe3f068 100755
--- a/configure
+++ b/configure
@@ -4198,13 +4198,21 @@ fi
 
 ##########################################
 # checks for fuzzer
-if test "$fuzzing" = "yes" && test -z "${LIB_FUZZING_ENGINE+xxx}"; then
+if test "$fuzzing" = "yes" ; then
   write_c_fuzzer_skeleton
-  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer" ""; then
-    have_fuzzer=yes
-  else
-    error_exit "Your compiler doesn't support -fsanitize=fuzzer"
-    exit 1
+  if test -z "${LIB_FUZZING_ENGINE+xxx}"; then
+    if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer" ""; then
+      have_fuzzer=yes
+    else
+      error_exit "Your compiler doesn't support -fsanitize=fuzzer"
+      exit 1
+    fi
+  fi
+
+  have_clang_coverage_filter=no
+  echo > $TMPTXT
+  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer -fsanitize-coverage-allowlist=$TMPTXT" ""; then
+    have_clang_coverage_filter=yes
   fi
 fi
 
@@ -4884,6 +4892,14 @@ if test "$fuzzing" = "yes" ; then
   else
     FUZZ_EXE_LDFLAGS="$LIB_FUZZING_ENGINE"
   fi
+
+  # Specify a filter to only instrument code that is directly related to
+  # virtual-devices.
+  if test "$have_clang_coverage_filter" = "yes" ; then
+    cp "$source_path/scripts/oss-fuzz/instrumentation-filter-template" \
+       instrumentation-filter
+    QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize-coverage-allowlist=instrumentation-filter"
+  fi
 fi
 
 if test "$plugins" = "yes" ; then
diff --git a/scripts/oss-fuzz/instrumentation-filter-template b/scripts/oss-fuzz/instrumentation-filter-template
new file mode 100644
index 0000000000..76d2b6139a
--- /dev/null
+++ b/scripts/oss-fuzz/instrumentation-filter-template
@@ -0,0 +1,15 @@
+# Code that we actually want the fuzzer to target
+# See: https://clang.llvm.org/docs/SanitizerCoverage.html#disabling-instrumentation-without-source-modification
+#
+src:*/hw/*
+src:*/include/hw/*
+src:*/slirp/*
+src:*/net/*
+
+# We don't care about coverage over fuzzer-specific code, however we should
+# instrument the fuzzer entry-point so libFuzzer always sees at least some
+# coverage - otherwise it will exit after the first input
+src:*/tests/qtest/fuzz/fuzz.c
+
+# Enable instrumentation for all functions in those files
+fun:*
-- 
2.30.2


