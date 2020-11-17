Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F112B64FA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:53:14 +0100 (CET)
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1Q1-0000BA-CW
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Lk-0003Tz-6m
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:49 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:34515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Ld-0001vE-IG
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:47 -0500
Received: by mail-wm1-x330.google.com with SMTP id 23so2078769wmg.1
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 05:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SvXzb1LM/VlcgFEm6/Dvj5K8p8EtRfYYdKzhQEsVrn8=;
 b=axWP7W8y7F+sltOPhmLb90zUO2rQ7Q4k7lmz+Z9Qn+a5dtVV1VlpP8Iij00K7C98jH
 Ro4p+UrzTacUwoj3PlLnthCQdcBS9z56kQHqrMf7i0TyGhn0xkVCeQ2p+58J0gikc1vD
 76ZwFC4bgsiCSTT3Aq0z3rOoq7gLfe/jpLudk1bcESwOnCCog1XN3s88X8XctIcxDoA4
 mm8/cMdMVfFqcZXHzCkcwFE1MHxIRyWcMoXaliyMZru+nwJUAjwSl7fzsKfuXw7S2S8a
 v8VQwlUGYfzncofSQza0qxXXo1Me6jL+flAJ3Yq3veTirHJ7jsFUqDeD1Cg5bVB7a3Pb
 Hgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SvXzb1LM/VlcgFEm6/Dvj5K8p8EtRfYYdKzhQEsVrn8=;
 b=Y7mYVWa5CV5cT0b1jDdGhUPKfIJZGx9hKU9f0pP8FLLn3gbFnaIB/avw/7nWppA7EB
 iwY8bl3dbpyfPWx4sZ9cx4wtXagVrrW9UHzYnNFUgeN6qoPHZFKxtjptqxRJ+BXNiNqc
 DxxPSmZbLv+BFdE5BrenUomA5BB/GKHcyzpiPTIQWMafJF3G5SxHQvr6cZTn4seDSfZ3
 ooYfHT8tkejzIPm8GU4yMpTnkGxkFu/Qmw3GU0TgUDKWjg87evZ4MAF/mxhGrWaeD4Ap
 wnKQ5X7eUIDCYafvxmFCX4ZuS1XzhDWEgNFk+ylRNF6peEAdV2aQZ2ZJ72u08vjBwh31
 3iFw==
X-Gm-Message-State: AOAM530/9xEo61/hh5EjUdRZdSMcmkHi5zY3zOV4oFxO6bNLWPzLPOV2
 hxV4+AiGmW7+zIDTqK/ec8lDw7JtI+8NAA==
X-Google-Smtp-Source: ABdhPJzMJBSLUwOrWz9s/weumjlgY8U2v8iE7UYZGmqxBwXgN3tYrUKlGh7xBAFGLf0ZqVOzdKgNAg==
X-Received: by 2002:a1c:660b:: with SMTP id a11mr4288532wmc.159.1605620919918; 
 Tue, 17 Nov 2020 05:48:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm3578630wmb.11.2020.11.17.05.48.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 05:48:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] hw/input/ps2.c: Remove remnants of printf debug
Date: Tue, 17 Nov 2020 13:48:28 +0000
Message-Id: <20201117134834.31731-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117134834.31731-1-peter.maydell@linaro.org>
References: <20201117134834.31731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In commit 5edab03d4040 we added tracepoints to the ps2 keyboard
and mouse emulation. However we didn't remove all the debug-by-printf
support. In fact there is only one printf() remaining, and it is
redundant with the trace_ps2_write_mouse() event next to it.
Remove the printf() and the now-unused DEBUG* macros.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20201101133258.4240-1-peter.maydell@linaro.org
---
 hw/input/ps2.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index f8746d2f52c..72cdb80ae1c 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -33,12 +33,6 @@
 
 #include "trace.h"
 
-/* debug PC keyboard */
-//#define DEBUG_KBD
-
-/* debug PC keyboard : only mouse */
-//#define DEBUG_MOUSE
-
 /* Keyboard Commands */
 #define KBD_CMD_SET_LEDS	0xED	/* Set keyboard leds */
 #define KBD_CMD_ECHO     	0xEE
@@ -790,9 +784,6 @@ void ps2_write_mouse(void *opaque, int val)
     PS2MouseState *s = (PS2MouseState *)opaque;
 
     trace_ps2_write_mouse(opaque, val);
-#ifdef DEBUG_MOUSE
-    printf("kbd: write mouse 0x%02x\n", val);
-#endif
     switch(s->common.write_cmd) {
     default:
     case -1:
-- 
2.20.1


