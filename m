Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232093712A3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:49:52 +0200 (CEST)
Received: from localhost ([::1]:36098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUH1-0005JV-3v
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4Q-0003Ke-CK; Mon, 03 May 2021 04:36:50 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:55263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4G-0000kI-GZ; Mon, 03 May 2021 04:36:50 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mo77T-1lEHP33xrH-00pg9y; Mon, 03
 May 2021 10:36:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/23] vmstate: Constify some VMStateDescriptions
Date: Mon,  3 May 2021 10:36:06 +0200
Message-Id: <20210503083623.139700-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nOEPfaFhzVvOw7YbHmknBBvFzIUbULsyJT2Mb7BNnddNmhft3PP
 tNn8NOZSOfU/erVAXGALajuhbrP0JGqQXj5LmRpLx+cqpN+M/adkFFIQ7UaWq/63kw54VCH
 3MfRnyc196kRXBr3g3o5qV3egD3Yzrre+Zwd6+kyktx1Wx+pwfaR0iMqfhNwi7jiBJAalzC
 /uzYkmccDDH9XWiILWybA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iNQu44QAzoY=:HUc04ZWAG745Z70XlUTSnf
 TA9aLRn79/R33jjEC8GqIENsGTDAH+5R6ioI3MZNTABRoaCCYsakH8lKyyXHvUPWysEUUoHP+
 zcuWzPR43ZfPC+s780re29UwWuNgzl4AA9o3eJ+wxRceP5FVzQHHQ7jN2XtXyb1Id5ck10/H6
 WIAdg9TxTJJoEIFucHGCqmMsvYyYzAwjjahomHCohQTRQ5lQQh7BMg1HB4ysqJ+BrCarMKz16
 3l9FxfYWv1zpqpfouw+ldHHVf9Lm1RQbvGs62ecQjiVK4ay85tWmDpIdAP2TW24cf0RefDj/H
 LfJxate/knD7E0LToibaz4JfkeEVCGyEwAWSJbndASH1Zund+dDEaqlrNjOXHB9wwt+X5daqy
 g2+PHLHWzOCn5rpYMGp6I+3v+9YXeWfRXFnPIBlCvks6dDfnx1Y/sorheDD8V/9/eEnTCCZxH
 uODWQP9OG3AE5kkYi0XekrJ2+++oyK7V2r7rVBl2q7ZwDSSz6A+Y3gdrV6fhavd9vBe55g5JX
 8/MmtalWc/bz0Bt0Gw/hN4=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keqian Zhu <zhukeqian1@huawei.com>

Constify vmstate_ecc_state and vmstate_x86_cpu.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210408140706.23412-1-zhukeqian1@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/block/ecc.c           | 2 +-
 include/hw/block/flash.h | 2 +-
 target/i386/cpu.h        | 2 +-
 target/i386/machine.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/ecc.c b/hw/block/ecc.c
index 1a182367ee63..6e0d63842c14 100644
--- a/hw/block/ecc.c
+++ b/hw/block/ecc.c
@@ -78,7 +78,7 @@ void ecc_reset(ECCState *s)
 }
 
 /* Save/restore */
-VMStateDescription vmstate_ecc_state = {
+const VMStateDescription vmstate_ecc_state = {
     .name = "ecc-state",
     .version_id = 0,
     .minimum_version_id = 0,
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 7dde0adcee78..86d8363bb09e 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -74,6 +74,6 @@ typedef struct {
 
 uint8_t ecc_digest(ECCState *s, uint8_t sample);
 void ecc_reset(ECCState *s);
-extern VMStateDescription vmstate_ecc_state;
+extern const VMStateDescription vmstate_ecc_state;
 
 #endif
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 570f916878f9..1bc300ce85de 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1786,7 +1786,7 @@ struct X86CPU {
 
 
 #ifndef CONFIG_USER_ONLY
-extern VMStateDescription vmstate_x86_cpu;
+extern const VMStateDescription vmstate_x86_cpu;
 #endif
 
 int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 137604ddb898..f6f094f1c938 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1396,7 +1396,7 @@ static const VMStateDescription vmstate_msr_tsx_ctrl = {
     }
 };
 
-VMStateDescription vmstate_x86_cpu = {
+const VMStateDescription vmstate_x86_cpu = {
     .name = "cpu",
     .version_id = 12,
     .minimum_version_id = 11,
-- 
2.31.1


