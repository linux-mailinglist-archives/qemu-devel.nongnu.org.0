Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E44027AC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:18:24 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNZ7P-0008JS-VT
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mNZ3A-0004c4-RE
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:14:00 -0400
Received: from mail-dm6nam12on20711.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::711]:1178
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mNZ38-00040k-FS
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:14:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFzC7Msccfz1zWVijpKXTYlLDCrVm6VOd6MSL286kMqRhTXQzNK2lSZ1P24xxvXbXvd77IyBZq7ywsqZq+MOM2Fsp6Qaf+Mohw9G8S2CAQhZV2E9oUbC/f+UV5q76kt4udEiVz1ecPc6eQ4ZR8Nf0HSZzP/jAUMLKvb6NLQbvNFcrWi7VS+SERxssbTI56OjvW1i0CLjlMjpfsZCB4LElCqDFvfmHit06v3G7+BVsO/5vyWTpKespj3vc/lXKq//EckHgwQ0Bt/6N7JbkcnIeUd8NHOHu9ELzZ/vC5FXZskYl3xCru41A0XFJzC2nfUgf4DnXMNqKvvF3nCUVhSMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=fK/Dh3Apsn/YZTtlWBNyWnEMjxfqRbjkFUDFXr0xBq4=;
 b=L1ky0Op3LvRM+au/48itrPPSCrflt1O7oiTPA+sBrEhivywbs7/zI4AP1R4siom13v1VmN4VnX3GQa+YNrwN3oAuLQV/uFkm6o/DSgReOt6dbu/xZG8jVgIEegGPBhTzzQ7VJw8jmVZkUwRxHrYocTeSPwtno/e7i6QU4C6gvprTyuIoqE93EBrWV+FlqFSCiDw4pgQz/BZwHI7JXgM8VE5Fzu/K7OJXusoIE94QTTsxpyeKP5FeGqjYGTCc9CG+pV657TekccyyM1JpRlhCHPtDMppgqxmW0jj1bOHU86FSHJMDbt1NkowexuirMn/EXRrhNDFTroNgrVTsWe1j8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fK/Dh3Apsn/YZTtlWBNyWnEMjxfqRbjkFUDFXr0xBq4=;
 b=bwktN2NLPC1GTlZn+S/L7AykZQkBi3Uz5dq2jN8f3vwh5kxi1qpul23AEpgKVDYbcgpSFjm7o1hyq/zzD+ooyKzOKh//fGVQM70IEk8jCuYLdEni9jWFgRqEpmB/0CtMD5HtRzXBbGCts/bvPdbPgA2XaJy5ra3GFNwrfZIddqU2+lSiH7MV+UVQRfTpU984p5YPm4Gz7kDW59MpXI6QQKU42iC8xZf3FTEyVUG5fFfkAauxi7G4/Vyjxow6Rz+ZppkqP1YnoIoT14lISO1+APtS0Eu4lNzM4N2ZaqaVaBXSsCptmI+5qZbAOf1sWQAhMnPkbpjoHElsPUmIAoBKww==
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5402.namprd03.prod.outlook.com (2603:10b6:806:b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 11:08:52 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 11:08:52 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: fix unbound variable in build.sh
Date: Tue,  7 Sep 2021 07:08:41 -0400
Message-Id: <20210907110841.3341786-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:208:32b::27) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BLAPR03CA0022.namprd03.prod.outlook.com (2603:10b6:208:32b::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 11:08:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2754be1c-9ca5-4320-9ae0-08d971efdff5
X-MS-TrafficTypeDiagnostic: SA0PR03MB5402:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5402CFEBDD43494BB265988EBAD39@SA0PR03MB5402.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9rvaZVX9fFiJn4GtdN8C7EKjfRSl63MKTFjpLHijQ8Rp+JtuyWYB7hUS4Z/RVb8vUnbbV3nKI6Dd2PAAuriNz4bVPoAsQYe13JsUveljjMYssMsCEIBKcmm1glRnauRV1AXSd76iwRV3aHcCE3/hc/WRHjPoDsvBKacw5ZGcIQWl7biKbmAB0F1YWpZuXkiILMPb1HCnUIwtyi1f9+tGNn19qyv9NjFaxPm1ns0KK7qT1AxoyVCb5iCCHmlhN4R8ZbAIDVgWvYlB/dD8Zg19kQQ7UJKIujBweLEBlIPtPBAZQN+gltP9Qr/i3fLQK1IiKluchwQ2K0Jr+R3MtydtxaaWI6n9BF+cfcJXOJhgO6xhTWxGt4RxYben+Evr7m5gNVf3v/4TGy6aqOAWCR4qIJ21JL9BR2tUdsi0TrIbCAHeuuIfWjfPFnVovF9w2ax54MO0fQ8js5T6Dzq7D/lmMt5cdtn82s6Ii9ph0TudA4UGjvRP4DyUkYNwkKzsN1BcYbOtqEatuy15ohSkNEQn9bJRJEXgdt5xyhB5/W8Hzh2ZMM/ETWbCMKkzn3o68KPwXStFBtNG2AmsUzQOc6+EWRujOJI6BQpnJ7qk/vwK3BSe64rHD44K61qydBIqJFUaFVNrm6oN5+EQd+G1oH+yqFntriBPD5IKNV2ty5rrv0cY6qHcHljfoXBavtM0uFQP5DadSZRaJtEEZfAAW1QfFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(956004)(83380400001)(6512007)(316002)(2616005)(38100700002)(26005)(186003)(6666004)(54906003)(4326008)(4744005)(38350700002)(36756003)(6486002)(66556008)(66476007)(66946007)(6506007)(1076003)(75432002)(2906002)(5660300002)(8936002)(478600001)(8676002)(52116002)(6916009)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a71VIPFF0A38ZP3KdUoG9LsFSyQZxZM3dY5/aV7biLEeGRM8y83doXfYWFeG?=
 =?us-ascii?Q?m/TLuVRXf01G6kgjFbHBuh6fQFi9EqxFQcGJAijzySZ4k40wkf+llIyE5hbC?=
 =?us-ascii?Q?oScP8Ck1Rs2IKsVPfngD8z6xhMXR08YOWxnLkqvm5G7QqsjaQAXMde0nnKQQ?=
 =?us-ascii?Q?5LE6gtxaeHdbkwX3l85V4bcBTiHpON4k6c79zs63b0+MMXVvGPjYumLZU41V?=
 =?us-ascii?Q?HqgODt6d+V0ffNpLlhOgX1ow7r181giCB0oM6caAx54jQejdVGIPIP418BU2?=
 =?us-ascii?Q?Svy8ObUyk34D6a/ngipd/MVcVkwC5QP0jMkj2h3j4hYXqPMBOsipL7qRTGiq?=
 =?us-ascii?Q?HkKj2v2kkm+46oGl/ky0U5i2T7mgC05jAYeEfyXI56iOSQZQ3gWt+sK0kBjp?=
 =?us-ascii?Q?WFRKfroh6CRPua//MxRKHGP+80oIcQYuEDI86s5brDwu9K2apl/qKRCIwFeA?=
 =?us-ascii?Q?sQJVR3Bt/CvdR+SaeAr3GPJcbrijTG50EHyEXTSFcQWbLgAM5rrzCFa1ylQR?=
 =?us-ascii?Q?1A6m3w+Yy5m/m5b8hfVkpNAFjfMHnnZPus8EAREytbmj8kq+jRGU0stynuVk?=
 =?us-ascii?Q?zhVJhsOAAtcja9Tmjzg2yB16w7/WBWk408Lzslbi76IMefvBkGXNJnonrZ1B?=
 =?us-ascii?Q?7HxC1OJLZ81TNhnM+FSMN5X9WhFfGMR5+AhhQ0Ib1TVBiVZ+rWptymvVQL8g?=
 =?us-ascii?Q?PzHDvtigV6vCkibQOGOve57Lem7HEwQcmvMZqXQ751cGhg2tqtYoen31wzFJ?=
 =?us-ascii?Q?QVF3KzaHilJ2sMQzu6gQM0qy9EadR/q5lKORVKhjMaaaIFkP3Zq+7fgoGLwy?=
 =?us-ascii?Q?MK0HVH8+VyzkkQfcdDlWoZE8rWZoA2fR9B92qkhv3xM2yaSfi5ME6d/7phJM?=
 =?us-ascii?Q?xNHEIRQ8kPmGkVf0cNHiHpqmSrwiP46BFohkef3uvTv7WfBxZ4aXkb2bC+gv?=
 =?us-ascii?Q?qfjTck88syfpOf43O8H6xLNDfxv/rMm5mzhgrQNe8RMT88tg/EByUL1cly2V?=
 =?us-ascii?Q?zxsIsgvBo4hH9Tce8YrfmiToZ5emAIUx1z4pSSloJmH4Ro7I1+oOLI+/N4uc?=
 =?us-ascii?Q?sKbu9dd5YIRJNuTErMMrx4ZMGIFabfkk2Ef1QJzVl3RJDYmz9MSKZS2O/Md8?=
 =?us-ascii?Q?hKqqRyAOnpcltBlCpix0AKRb600Fxa34YgsXkq2UyGSXUZoclmZGBtctOcs/?=
 =?us-ascii?Q?ijcw8HlN4uVSR+HOgCdQPu/l3OnJzfn+bAHNdnkwXJvmWXw/4aCzrj1R/GgL?=
 =?us-ascii?Q?qWMQlQqpfvVbL7xRWAYJpsQc2nzX9L/7GU3UWngoel4o8fVN9jI8KJU+xUYE?=
 =?us-ascii?Q?Krx9KC7kv76SB5Xuu27Ifkcd?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2754be1c-9ca5-4320-9ae0-08d971efdff5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 11:08:52.0602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKooyl3wz21uUhBpiHMHcNb8+0twfC0IaX8zONas+4Ib0Mvl0XUjqan5eGEvt4D9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5402
Received-SPF: pass client-ip=2a01:111:f400:fe59::711;
 envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, MSGID_FROM_MTA_HEADER=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

/src/build.sh: line 76: GITLAB_CI: unbound variable
Fix that.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---

This change is in preparation to revert:
7602748c ("qemu: manually build glib (#5919)") on OSS-Fuzz.
Reverting as-is produces an unbound variable complaint when we try to
build the fuzzers in the OSS-Fuzz container.

 scripts/oss-fuzz/build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index 98b56e0521..5ddc769c9c 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -73,7 +73,7 @@ if ! make "-j$(nproc)" qemu-fuzz-i386; then
           "\nFor example: CC=clang CXX=clang++ $0"
 fi
 
-if [ "$GITLAB_CI" != "true" ]; then
+if [ -z ${GITLAB_CI+x} ]; then
     for i in $(ldd ./qemu-fuzz-i386 | cut -f3 -d' '); do
         cp "$i" "$DEST_DIR/lib/"
     done
-- 
2.30.2


