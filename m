Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF296063B9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:01:39 +0200 (CEST)
Received: from localhost ([::1]:45284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olX2c-0003ZN-V6
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:01:19 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWz2-0007fk-3B
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olWWa-0001tt-5q
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 10:27:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olWWY-0001w8-B2
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 10:27:55 -0400
Received: by mail-wm1-x332.google.com with SMTP id v11so5056995wmd.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 07:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NNwHgp7BYvCIYFL4i8XnSO/OJO4XAdj6gZBF3nMPA90=;
 b=uIpDPPSIwi9r2RGM9B7qG+EzET2CUW0gi86CXeAHY8OGppkunIObikm32Pibb9AnZh
 2xJZt0SVKcX3tML/ctrCf2auhePDa7Gnp0g0SpuMyRSnXnDaaeJeU7zEZODa9z+T8nUo
 AmLwVBPAJybJUYNxRkNUChA2Ls49NvsxMx2xyYNIk8Gp2vWo3R5JXvuoaklV16DuW81I
 Rh1Ix/7z8velSSgimhzG/RStACL6nf1u3aWppOZ+lh9rss6CjVC8/tJrN6JGWMutVjJL
 CgdmDnEQLVr4mU+Jgi73p9fPEKwld608ubH963JcRDIm95NAWek1BdYTWseGZYpp2THq
 LfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NNwHgp7BYvCIYFL4i8XnSO/OJO4XAdj6gZBF3nMPA90=;
 b=A2XOT/bO/wFWB69TCt8qQUAno6DZvPK/ptbvDKVMGr2et1tX08Fa4HnnH5/uB2MuwQ
 823tQs3e50TK2HWuN1FDWmYwYhgxsLe5SkMpQgf4S9sKo0rZpI2KPxgsfeFUUc5Sj0Xv
 aPq+68S2uRN6NwTriCb82F2a0VSPy77s/T9GyHlG2vFdGa9oRm5OR/9R18a7rQnDK3Tg
 stiq44DMohAqapCYkJFVmc1bB7HeAbJN/2vPIDqiCS25Glid8ODjJw6zxgfnWWGVzYQn
 /b218zSbZv5KmcjU5k7ntk1HaQXkz3tFrU4V2TMQUImNQby1kIcsLxjJnaDT0wvIrucf
 47sw==
X-Gm-Message-State: ACrzQf1+OazIDPnDuNb4fcBfw2PaBWVCg0kUpRIv4ZghR6HhrcdgjuAl
 NkJCwVJ1UhdwY6ADjY46cwxcTzqiYm4evw==
X-Google-Smtp-Source: AMsMyM4F6dJF3QHUJhNx0g8H0y5rJ3G3XwVdwAOQlEOnkSNotMl3AQdZGhBBiYtRWOBh0fR54wgzrA==
X-Received: by 2002:a1c:2987:0:b0:3c6:c0cc:b4c2 with SMTP id
 p129-20020a1c2987000000b003c6c0ccb4c2mr9248031wmp.56.1666276071557; 
 Thu, 20 Oct 2022 07:27:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1c545a000000b003c6c5a5a651sm3090432wmi.28.2022.10.20.07.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 07:27:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3] hw/core/resettable: fix reset level counting
Date: Thu, 20 Oct 2022 15:27:49 +0100
Message-Id: <20221020142749.3357951-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Damien Hedde <damien.hedde@greensocs.com>

The code for handling the reset level count in the Resettable code
has two issues:

The reset count is only decremented for the 1->0 case.  This means
that if there's ever a nested reset that takes the count to 2 then it
will never again be decremented.  Eventually the count will exceed
the '50' limit in resettable_phase_enter() and QEMU will trip over
the assertion failure.  The repro case in issue 1266 is an example of
this that happens now the SCSI subsystem uses three-phase reset.

Secondly, the count is decremented only after the exit phase handler
is called.  Moving the reset count decrement from "just after" to
"just before" calling the exit phase handler allows
resettable_is_in_reset() to return false during the handler
execution.

This simplifies reset handling in resettable devices.  Typically, a
function that updates the device state will just need to read the
current reset state and not anymore treat the "in a reset-exit
transition" as a special case.

Note that the semantics change to the *_is_in_reset() functions
will have no effect on the current codebase, because only two
devices (hw/char/cadence_uart.c and hw/misc/zynq_sclr.c) currently
call those functions, and in neither case do they do it from the
device's exit phase methed.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1266
Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Buglink: https://bugs.launchpad.net/qemu/+bug/1905297
Reported-by: Michael Peter <michael.peter@hensoldt-cyber.com>
[PMM: adjust the docs paragraph changed to get the name of the
 'enter' phase right and to clarify exactly when the count is
 adjusted; rewrite the commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/reset.rst | 8 +++++---
 hw/core/resettable.c | 3 +--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/docs/devel/reset.rst b/docs/devel/reset.rst
index abea1102dc4..7cc6a6b3140 100644
--- a/docs/devel/reset.rst
+++ b/docs/devel/reset.rst
@@ -210,9 +210,11 @@ Polling the reset state
 Resettable interface provides the ``resettable_is_in_reset()`` function.
 This function returns true if the object parameter is currently under reset.
 
-An object is under reset from the beginning of the *init* phase to the end of
-the *exit* phase. During all three phases, the function will return that the
-object is in reset.
+An object is under reset from the beginning of the *enter* phase (before
+either its children or its own enter method is called) to the *exit*
+phase. During *enter* and *hold* phase only, the function will return that the
+object is in reset. The state is changed after the *exit* is propagated to
+its children and just before calling the object's own *exit* method.
 
 This function may be used if the object behavior has to be adapted
 while in reset state. For example if a device has an irq input,
diff --git a/hw/core/resettable.c b/hw/core/resettable.c
index 96a99ce39ea..c3df75c6ba8 100644
--- a/hw/core/resettable.c
+++ b/hw/core/resettable.c
@@ -201,12 +201,11 @@ static void resettable_phase_exit(Object *obj, void *opaque, ResetType type)
     resettable_child_foreach(rc, obj, resettable_phase_exit, NULL, type);
 
     assert(s->count > 0);
-    if (s->count == 1) {
+    if (--s->count == 0) {
         trace_resettable_phase_exit_exec(obj, obj_typename, !!rc->phases.exit);
         if (rc->phases.exit && !resettable_get_tr_func(rc, obj)) {
             rc->phases.exit(obj);
         }
-        s->count = 0;
     }
     s->exit_phase_in_progress = false;
     trace_resettable_phase_exit_end(obj, obj_typename, s->count);
-- 
2.25.1


