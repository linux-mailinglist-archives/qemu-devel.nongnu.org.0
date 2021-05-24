Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC0938DF84
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:03:05 +0200 (CEST)
Received: from localhost ([::1]:58442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0rw-0005at-U0
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0jC-0006qm-6q
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:54:02 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:31506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0j7-0003U8-8N
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzbkg690dkCOikJCLOaHbr0U5s9Wb53xAk+ckmOce+c=;
 b=Cy/o6Km+BImmgULY0i0gDw72+tSKcExMus1e9UFuovdFX+Jz4zlRWDULa5isHRDieEsniU
 7unbe/r2264O+IcfpA0W0T0Qy3+PEtaxUsn368ZYKk7h7RzohEyaocOl2k+JJTc+JYJBm6
 zJFfJz/mSbVqzW/AeEfqXbVnygryTK0=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-_QBC8zpQMwmmbixbuniTOw-1; Mon, 24 May 2021 04:53:54 +0200
X-MC-Unique: _QBC8zpQMwmmbixbuniTOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZflUj24px2tZZUR+L1ai5eQ1Q6jJXNNkiLfq9auC0uozJoAj+PMioORI7jRYkWrRalO6LJsHoD/vsyuw1DwQ8s7oqfMGRUP7UEvyxjI66cRfahkmFr11mXh5fEjcTBchnWU+TtUXVi+GIJPzCuICt0pHDh/X4wwVxt/XaxuWw3+fB0EG0oC/xumN654wZJsdopz8wZ/WFyivezgJHxNZfZVLz+vflCqY/8w5FDSMx2DYwDSojcXjApVG+wtP6CTajsTRJ3CHEVJe07SGzYa+Pysw7TEHIvaiCosp95dTFnZNzSS0L6IyQh+IA5UOWduSnmJr1N6SJtNxfeEaGaXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znd18hKlQ68bGgc9PoKO8PlkjrpRpyXis4DJZeKfBx8=;
 b=X4QCbkHtDwMWYqxgv8e2wG9er+dmW7XYKOeS0MERJZZ4jVYx4JayY5Vc6XO8pf6KNJpOTgqCSG6c8YgFZIo9OPWRcCIrI4HqMqPn+Wt2doehx1wt1RCS7MZ4kIGe12t3bP9HQrsfgQrGlXnDc2OlvCqGKp9+1FEL10w1RFZQWs5ZZ9UtfAh6K+tmTgsK/sX2iBajsyIYbacA0oL1DfcMn6ddpDvKxFoNZ/b1+aiP3S5aQ6Xna7+fP0ncyHWvP1rvrVsVX780yIGGaIq8ezXCYa6IgRGdYRk6klt2Mpo+vFb0+cWAtJ0OJ8H1Nu0PVq3YOsBddugyGH7We1TTfWhW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:53:53 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:53:53 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 10/14] target/s390x: use kvm_enabled() to wrap call to
 kvm_s390_get_hpage_1m
Date: Mon, 24 May 2021 10:52:52 +0800
Message-ID: <20210524025256.22252-10-acho@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524025256.22252-1-acho@suse.com>
References: <20210524025256.22252-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [114.24.18.39]
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (114.24.18.39) by
 HK2PR04CA0057.apcprd04.prod.outlook.com (2603:1096:202:14::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:53:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd8648fd-e158-4653-0870-08d91e5f2a3d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4126A6669D690212E99BDAB7A0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ThpuOpNvIeKUzXBXcRVtN8b+efB6VKlYtVy2ckS4uzMl2YSck8bSq0tu91W7PHj6oHSc7Q+bhA4iMtzWAYvoC78rvvlLFTS9Eq3DJD44hASTQxy9fg4HUPauvZPzjtW6MTPgdS26xgcOImO0DlAB4cjihQbnIS6Js1WPTCCVvk4fWZNOzb7f3faJCLIoWW2tqXmCifWWAZZRMsBmMOVWg9YNPPIkZSnTBvYSr3W9JCQO4lstVwKb9FR7Q318iJrqIwvFUPZ0087b7++1GOftn4uRX1eneKBzj9Fb7NCeb8i3lw56/6osXvRqgyMybkCPwhZ/YOxqNZ8APPFSRV6vm/VzKLKOoo9wRzzBHvw3TxH/37TOkuMccfAAdplZ3q7ZYbC0UFfXCa2pXtvtYeK5xq9OxEQaHxgU16dosPeJ3G8DZ574NT8UC33nroDKlFxRnQ5ndpSUJZdStvV0tTwYgrEXOscn7fnjJ/6IyT+MQeawpeYyiuSUQWwVpEyzXm5h18j/bRlXxIMdZabc3svyX/M7sHLHDMLGpSNdag5SAQwmh99LrIGU8uRZDYo9jebfD2yrij3j9l/tvdiYcVg1wCaOSYcUN6mPkR78glz/xrktg+kA16UnW0Aju+iyu1+Xf6PcNYTGho4177AAhu2ffVkO33QJakUFlSUmNUvxGCswowergUrhspsHLXN8ynxX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(376002)(396003)(39860400002)(36756003)(316002)(66476007)(38100700002)(8676002)(38350700002)(86362001)(52116002)(478600001)(66946007)(8936002)(1076003)(2906002)(956004)(26005)(6512007)(4744005)(16526019)(6506007)(186003)(83380400001)(2616005)(6666004)(4326008)(7416002)(5660300002)(6486002)(107886003)(66556008)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?THYB4Jp/Cd5U3+/9UVGC3B7GnejStqRtyaHIJPsTlfRgnSiiPfdyLHKBLgnR?=
 =?us-ascii?Q?ha22X95spIy/WgEf1FmqwQLcsDGb7KyB1M5twvArY0Km/tXcJdEHaMxt/Xr2?=
 =?us-ascii?Q?WkPHgUURnl9EXsocc76OANxNrGjhgrlXjaOItpvFU+1GiRLGP3hXDt9qT8FR?=
 =?us-ascii?Q?nQTylwhedTYWa0MCpXfnTZayobOlpQA4zPmqyEKHIaBqSQIRskX9euRd22GA?=
 =?us-ascii?Q?TvjxCqEPjtkfOrbWgYvf9+oPgtTpXji2ZxnqF75aFySdxOoNBw5rGiEPG2Bh?=
 =?us-ascii?Q?d6YCpbPDez2J6BmxQ96JgpMzyE34kmIqtnEFG33MHjSQmkQD4q8jrA55n5uu?=
 =?us-ascii?Q?4miv7ZuUeHAUs6L9H0q0mipNGtjBiF2FBHPo9ZKLmeAZRY5IEqoOYDVZEzdH?=
 =?us-ascii?Q?Hn3ayL294BsdYMgAgXVHyrHiq24auOyGh+F4OfQrEkt0f1g3xe2r1PjIsvf2?=
 =?us-ascii?Q?5U71MSMQMrgRuhDiJlzWM9Z/eroHHcmTZ16pEmVaK3dfG1pTaztF7KSiCRlF?=
 =?us-ascii?Q?0uwF2lHr6PHJc2O+BjuA3GZxgaCc2H61pqN4qLKkMuLf6eTEPhVmojqeeylM?=
 =?us-ascii?Q?qLU05GM9j1XUK7iN/qhu01gH/ZReZQhCuqlZoxzCPo/I1QAxRD4zqCmokoxG?=
 =?us-ascii?Q?Zo1A72Szq3AI8pM8/YzgW+fRmyqGjq7dCqfh5rL0d5fpo8Asd4+z4yxkXWI4?=
 =?us-ascii?Q?aTMlVPKmmkz0yrt42mrFTQpIU1h9ENwrcF5uZUYBUntzKaCQYnKpQU4U1kbP?=
 =?us-ascii?Q?yiXeHgIhPBR06OHtlQvGZcQ0o5h4Nr/eHxgC34lbQ1mwKRPzaVHe7VMGnOf2?=
 =?us-ascii?Q?yHDsY8voV5YyfXY6NKyJbwawMlwcdV7CweZl6IDXAErr74Q+hC19M4p7b4j/?=
 =?us-ascii?Q?aFKAfSMUhMC8SBmo7DJ54OETQA/zc6QNicrj57xKYAtMZfEXy8skyUJ0ATDP?=
 =?us-ascii?Q?1QjOahmvCUvmmrRntvB8JxYWac/kM2KwOSeJQOsW0Y74DO4SrVqBimG2cYML?=
 =?us-ascii?Q?FgOaZP5iahVMo0eVw1VVw3q4ZfmqKiHoJ76FiD1CeICHqDOXqUqBm1OlOlyo?=
 =?us-ascii?Q?fsm3TxClM1wWwIqcP9KBYMfLpZprMtMCjfD4ymDOH15pw1SMFuF/kJXjcj2k?=
 =?us-ascii?Q?gHjHXS2hSSvdRnInokenUmhfPv12yj2qic7dDWX/l92i5dTpd1qULdD5omFp?=
 =?us-ascii?Q?EyG6IdNPhMGrtRxc3JaHoJJ24Er1zQ6gFohAx1SPO2J7xFCJkSAyCQdVp9rc?=
 =?us-ascii?Q?l/i3RLhOd7uu9vMzxUe7y0GbifCgrONbhbPmBC3guw1gMEzioiBSt6BPnD/g?=
 =?us-ascii?Q?MqS34Lj1+dmS0sMGaoz1Jchu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8648fd-e158-4653-0870-08d91e5f2a3d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:53:53.2523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuaNjHmRiAcKv54AML/zjQten3+Jweavs/bkqxlNIesxeH+9KB8Bd7Su5Oihp3Yv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4126
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
2.31.1


