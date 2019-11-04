Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD5CEDC44
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 11:14:59 +0100 (CET)
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRZNy-0001zE-62
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 05:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iRZNA-0001Xl-JP
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 05:14:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iRZN9-0001XH-D4
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 05:14:08 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:58559)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iRZN9-0001Wx-3K
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 05:14:07 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MY60J-1iSGhj03pN-00YQqp; Mon, 04 Nov 2019 11:14:02 +0100
Subject: Re: [PATCH 3/3] dp8393x: fix receiving buffer exhaustion
To: qemu-devel@nongnu.org
References: <20191102171511.31881-1-laurent@vivier.eu>
 <20191102171511.31881-4-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b777385a-2fac-1301-7371-fd09505651cb@vivier.eu>
Date: Mon, 4 Nov 2019 11:14:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191102171511.31881-4-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9U/RaLRsKDX/QxEy8IL2sRtKKOfwMooORYqSQWONzHG/Amvn9/g
 IDWy3If9N5B/CFGUy5Y24v4l1KgoU0je/jM272fCQBOibrAn9FcmdeWYt2l3wPycxZzulU+
 aL5rpjWQdzw2YPk46xl6Jnx6GOUwvgw4nTkksDFQuCDa+ElNjc5rLxu7GFIA3hDsGYlVR2o
 7Y3D9Az12Wc00pak241Xw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bMHkqewJesA=:caRdg1e8QnsvBXJI8G3C0n
 hb1Oof89HpkwUwTQx4FbuUkIHv5q49ktlgDvHOE/ZzcJ0hp7Z2n38hZsyzcsXC63xmcfd3PyS
 YHmylRnTsIZzWxH69jiMZReBcataXjqnMfu57sbIdi/ZX2vddLMyGp9RHEypBAZPTHjubxIUR
 ryH1prLp/KkQafvoZi4E1/IK+qWD70pnfq1AixY4GLWx0zAXCpJXiM2hknIR3VTvjMBbzLrTs
 kUtjekgy+ggVPzyHlUlkkK+ftTmB4MlJNK/7LO00UW6IRvc0UNkSbxm1Wzbi7GCtho75Dslul
 YM5zxbhk6FWz3K51oI17esiO3RsrSnrL7CwZx4UmcY2UHZKZUyHY134+8+/cFcFCTNSOaUY4y
 PhLS1BhZoRLWY8o0T9/kR5zhG5YiT4ujPxoPTcTMyH300eylt0Ua9MiGP75pz71Aid0o3vIph
 1Wji3F9fv6Dqr9FGKcZ8OljsCMfuk4VslkdPM8TzOtCGwC2vjEHaXtzAvbdHXeqRxNsl8v8VS
 3Ph104M2j+t5yYb2Pfx2YR4nslDvax6r63k6y+gErQcfJAmc921fzu/S5lxfbc5OkLMRw4Ttl
 yJkdouloUu807B7iaCqQr2kKyoot3bWlgvtMfAA6XUGyX7N8ZsAmax6pEvyZFYhGXG/eUD5S3
 VfWnjXrsbwft0c0AOvTWSH6Quv8LEm1yC15yqC3dWy12Ut7uLdbxWYuLmc077Jfz8NzWuN52G
 wG5GBce4Lk9aB7oyB4ksrFeXdELF6Kb5tBXUx+y09qkAONDGGJ+B5AhS6anAMkLplJ3aHAz2k
 E9zZADMJ75wJ50Cx8TNAL/VRtF/GBgQOTGMAKtXJO9Fj/t95wkapRQ+3sqs+dgLzIuzX0sPUm
 KOcm5K0U8MiC0lKB/icfdxyHUgmj3PS7tSyiBhXRE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.17.24
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
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/11/2019 à 18:15, Laurent Vivier a écrit :
> The card is not able to exit from exhaustion state, because
> while the drive consumes the buffers, the RRP is incremented
> (when the driver clears the ISR RBE bit), so it stays equal
> to RWP, and while RRP == RWP, the card thinks it is always
> in exhaustion state. So the driver consumes all the buffers,
> but the card cannot receive new ones.
> 
> This patch fixes the problem by not incrementing RRP when
> the driver clears the ISR RBE bit.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/net/dp8393x.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)

For reviewers, this patch main changes (without indentation changes) can
be simplified to:

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index b8c4473f99..123d110f16 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -304,7 +304,7 @@ static void dp8393x_do_load_cam(dp8393xState *s)
     dp8393x_update_irq(s);
 }

-static void dp8393x_do_read_rra(dp8393xState *s)
+static void dp8393x_do_read_rra(dp8393xState *s, int next)
 {
     int width, size;

@@ -323,6 +323,7 @@ static void dp8393x_do_read_rra(dp8393xState *s)
         s->regs[SONIC_CRBA0], s->regs[SONIC_CRBA1],
         s->regs[SONIC_RBWC0], s->regs[SONIC_RBWC1]);

+    if (next) {
         /* Go to next entry */
         s->regs[SONIC_RRP] += size;

@@ -337,6 +338,7 @@ static void dp8393x_do_read_rra(dp8393xState *s)
             s->regs[SONIC_ISR] |= SONIC_ISR_RBE;
             dp8393x_update_irq(s);
         }
+    }

     /* Done */
     s->regs[SONIC_CR] &= ~SONIC_CR_RRRA;
@@ -549,7 +551,7 @@ static void dp8393x_do_command(dp8393xState *s,
uint16_t command)
     if (command & SONIC_CR_RST)
         dp8393x_do_software_reset(s);
     if (command & SONIC_CR_RRRA)
-        dp8393x_do_read_rra(s);
+        dp8393x_do_read_rra(s, 1);
     if (command & SONIC_CR_LCAM)
         dp8393x_do_load_cam(s);
 }
@@ -640,7 +642,7 @@ static void dp8393x_write(void *opaque, hwaddr addr,
uint64_t data,
             data &= s->regs[reg];
             s->regs[reg] &= ~data;
             if (data & SONIC_ISR_RBE) {
-                dp8393x_do_read_rra(s);
+                dp8393x_do_read_rra(s, 0);
             }
             dp8393x_update_irq(s);
             if (dp8393x_can_receive(s->nic->ncs)) {
@@ -840,7 +842,7 @@ static ssize_t dp8393x_receive(NetClientState *nc,
const uint8_t * buf,

         if (s->regs[SONIC_RCR] & SONIC_RCR_LPKT) {
             /* Read next RRA */
-            dp8393x_do_read_rra(s);
+            dp8393x_do_read_rra(s, 1);
         }
     }



