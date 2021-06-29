Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132EA3B7453
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:28:11 +0200 (CEST)
Received: from localhost ([::1]:48332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEie-0005zz-A1
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEbc-0001jl-D9
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:52 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:24274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEbT-00044u-5e
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624976441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7AfSLRN7oMwfjUsIwliox4w+6+wvPIcVnP6iNgU2+o=;
 b=GsP8ZADQVsUwtVbPgibb5k/WqIQ+sHd6VsA7J61rNSF2OIcTmpc5iu4gr1YmQSaKjjTEHb
 A7gEGWPFTPp55IvvolvNWXkkdUOCUPxCn7pkexhvRMMChTe5UwavZkomMM/rlzGUcWxfdk
 c0rZCzoezLbUKvbSjog2WkYVXdEbzGY=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-LFcdJKrHNvG8FLZeazpKCw-1;
 Tue, 29 Jun 2021 16:20:40 +0200
X-MC-Unique: LFcdJKrHNvG8FLZeazpKCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrekgM2nUMWR36ZdNAsHeU27YAtd1Y82DWvSHz9CSndo+y7lyAYPxIjBeg1NQOFXP4McWoNljHFGJdLjLSlmB4J4uzLGxpa8gJeMlJWsOXJhAwXfQVcNmN0fLsVM49JLncBIL8nr9xUck6u23/AZo5uwjXWkMVkYEvGFKwyE4t1pFY+rEaOSn+shsLtH4OF5aJcjjUSIH/FzzjCPMMIjiDJaUOibOZw8tSU1NoRvKXKtNgr5cCS3k3VtqTY1TwozNlZNi+1nEK3fKoXeeSIbTLWUZXbXv/ZBeZDdFsd4rZ201GL8d8xvU5JvUFTAIEzfbSA14W1CX8NPuNN2OEwLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nw1yACjG9lZbj0bE06qheLUxHfn2hS48id5iWCu2OPs=;
 b=HEyvQ9DPuymQabZWLxQCpsNDEudd26+9ks6xUnxtxQHioAGV+gLKI+BjqUTLU4Bld/iiwyzEjvQ3p6TGTRK7hTcS0Z8atayNLr1+cLlvUO0jG6y5KWRTijxYsG8m+n6gQRo6tIlLOQUK9Ieqpi5WLyBPsePm6H+RIOwIufdVYXOCfBNzVUU3KtWUmlAFn7xDcKLdlT2r+fVstEI6MC9g2I7FeofF8g7N2f3k5Wuat835uafE8mDk1ay3rb/gFbLWGpHSUrk7SqZRjgErFuf1E/D9dLo1ZqY/kdmKyndIyQzJsLjap8XeQB6xpXrGYTltERElh2bxwcdZ+gmYAEJneA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0402MB3327.eurprd04.prod.outlook.com
 (2603:10a6:803:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.24; Tue, 29 Jun
 2021 14:20:38 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:20:38 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC v6 10/13] target/s390x: use kvm_enabled() to wrap call to
 kvm_s390_get_hpage_1m
Date: Tue, 29 Jun 2021 22:19:28 +0800
Message-ID: <20210629141931.4489-11-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629141931.4489-1-acho@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.28.175]
X-ClientProxiedBy: HK2PR03CA0053.apcprd03.prod.outlook.com
 (2603:1096:202:17::23) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.28.175) by
 HK2PR03CA0053.apcprd03.prod.outlook.com (2603:1096:202:17::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.14 via Frontend Transport; Tue, 29 Jun 2021 14:20:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b69e91b-b224-4f3d-44a7-08d93b091164
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3327:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3327E5EFC8962969740DC272A0029@VI1PR0402MB3327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: khytpPEnuAvZLNKR8XC5tuMcUowECYCQyxtuCRsFUfNUrXUf7FDceYoMrgqWjYMnSL/j26xByXAtIkRkWym02QbRn+F2X5lDMHB1+AqdlcDdHnC64M7+x8A35CK38oOBBsgoUAzqaktdZhMp9QS4+TBI/qNlkd8epfPv3zYkffIMsqBH2d1047E6U5+JTcOT+TO+z6QnMIIZsnXIFF7IoEu4cxJVcys7wFvpZYJJgQr1Wg+rQnHqQi4S8c0HB4HXT6G4cBWdZldwbEwpCE/J0bACs3Wyj+Ohz4/cTNizpCWoCsqiXCbQKUnuNR809cHmh5aSFUejwQPSz9ny0xkuN2zgitGkJypvd38ebeD7OZm5uguyvRlMrQh8NnRR28sNWeQ3fUXgDPRcFSvMoH5WKi4aEIdPz1fzITmMTZMtFsVI+FXysBr8ljYvd2yAAS8M8+c3vAkdcrREB6PCtJisFO8ftF9ntumoj7vy/A7la6caMnVnrCri9fTSqc2MUJtN+ExxUQSHl5zr4exDyblBFvDJ2ZP8cLNsaU4Th21ue1IJsvBKQeVvQ5viwHN5Pci2sn+Ep7ZT/AEFje+QuM6vecyiYWDbspJjpmcfFPFZHaxYlwe42hxFlAfcVOOBcuOBFL8LifWX7ii3tNe7u8O1YFjMBUwo2mlcmg+NsWFb9y8Z8Bj4fxtSWrB5bOhYU6YsF0kbyviiMga0LDX6ZzjaGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39850400004)(396003)(136003)(376002)(346002)(83380400001)(8676002)(6496006)(6666004)(16526019)(8936002)(186003)(86362001)(2906002)(478600001)(36756003)(4326008)(956004)(2616005)(66476007)(26005)(316002)(38100700002)(5660300002)(4744005)(66946007)(66556008)(1076003)(6486002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/mjZjKmBCQlZ1iVSFohPpOxcZwCjmNU85xpnHBH0eRQisEElrgbr3DCzBwPN?=
 =?us-ascii?Q?atmB+xCPZ04Uj5Pg7J55DelBSsaay/ICbx0Lks+qO94bNe/EaLFBYjvzIBpG?=
 =?us-ascii?Q?6HN+ZvSjg8jbDHIUWCbK1P5y+6YpK+3AuMSMQqXR+F5dAQ+F39Edg8pz8HWL?=
 =?us-ascii?Q?q7x+gRRWdDHcjNLYUCV95UrgbhC5cF4a8bOrfBO8FXnY0dPQ8bkWvOm4YfnY?=
 =?us-ascii?Q?DDYOZXL7HWUfJ8+l+Tp0FDri3BljbVkyNJqz0NnMF4KTlaR/3mj+NbC3685l?=
 =?us-ascii?Q?kDfQtTBFomKs0F2tM5V78RuYH89MMSrztzafgG2dUKB6mpvIjt+RROb0NYks?=
 =?us-ascii?Q?Kg0hr3epGy/nWZVuqtOoPsZqvCcFsBTXtO7AmWm3xkaacSw47walEwqIVDZp?=
 =?us-ascii?Q?NPwWlgdG4TFI/902LOoeIIIyBjUk7aMfkwSb9vo+FENeQIFrzByh8nxsNqEn?=
 =?us-ascii?Q?mBpHncgzCS4VI33chkvdaFH0SbqexLXtVF897YHTRiEEg8GxAcLbPnh9jcxJ?=
 =?us-ascii?Q?l2KmdKF6RS1Y3oPSV+wXo5QGIg2QsXrAi91og0X08r9SAoASVUMPxqzrPB7b?=
 =?us-ascii?Q?ApiaddODcRvtd9+iqNIf+Zlt+wdQS2d9JyWPeFbhlOlL1Ie6nXpsq7eRD/Oe?=
 =?us-ascii?Q?oIan5rJYTyF8Uf6PbOZt/cwABj4pDZrs/IBvpqjHqG5w4VDS4/zJqrZuh7n7?=
 =?us-ascii?Q?RB4spL9kU5FAKx4L07aa/AJ6zi0jSnlZF9oeI3nW1RZX7NHF0riGWFnHLJGe?=
 =?us-ascii?Q?UWbcL+0glxQGVwDOfNltwroHzU6Zl4iC5r1gpzsL1NtV6kuRJ2woA7PMWtVc?=
 =?us-ascii?Q?JqBe3uChymbLfWfHf0vGQZX/r+LWGH1mCci7aPVrqvCvRKWPRKR3P2R5wW5q?=
 =?us-ascii?Q?1M6yfsN6EKCvShU7xQlP+d8gUd4aSdQBYE3x0lxKEZsTJHXOJ9lUuIYerzHa?=
 =?us-ascii?Q?ZaVhDsEluySv15T5UnzxsmipBa/QKlImIkhelfIVNSojofNSi86Vw5jHfTxz?=
 =?us-ascii?Q?07tStuvFOZUQ7vhYADDIVccvB7RyVMmIV0fN9Z182J5gLVvIK8C8FKi33d3i?=
 =?us-ascii?Q?KT56/iBMrmrXMsvmDJWhm3b9DQCg8CuCLMfBJUOjgbpYVW3rzZMeIF7/sHo2?=
 =?us-ascii?Q?T9vfzRnjkW7AEA30udERL6pM+7mQyzlxUUFD2Xno+FFjRGz8WgI6cCbXKW6G?=
 =?us-ascii?Q?ZxV9BD/oUSCBhHkipKGpUUQXPAu18P7ufoSFPz2vpwA82Elyx1AOa8mOq5M/?=
 =?us-ascii?Q?PW6JQS7Dennfe9YXJ6GVvlpAkGDQk13lufCAYdz91k3RNjIkQ+YEFMnv/Kjx?=
 =?us-ascii?Q?xcVFglm0lPokDGyoSoWVjcVL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b69e91b-b224-4f3d-44a7-08d93b091164
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:20:38.3613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4J3nNUMPwO73pFd/vObkSQ5YDkF+Z0IqvpKIt1VrWosqs1AOZOVYdo5s9AppPyIR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3327
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

this will allow to remove the kvm stubs.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 target/s390x/diag.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index c17a2498a7..8405f69df0 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -20,6 +20,7 @@
 #include "hw/s390x/ipl.h"
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/pv.h"
+#include "sysemu/kvm.h"
 #include "kvm_s390x.h"
=20
 int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
@@ -168,7 +169,7 @@ out:
             return;
         }
=20
-        if (kvm_s390_get_hpage_1m()) {
+        if (kvm_enabled() && kvm_s390_get_hpage_1m()) {
             error_report("Protected VMs can currently not be backed with "
                          "huge pages");
             env->regs[r1 + 1] =3D DIAG_308_RC_INVAL_FOR_PV;
--=20
2.32.0


