Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E6D440A9E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:31:09 +0200 (CEST)
Received: from localhost ([::1]:36236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsCC-0002j7-Lo
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrq1-0004QZ-32
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpz-0004tU-6C
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:12 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso14131392wmc.1
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BNAmNOFFRMtzbm+ASOY3SjgYHaI6yIt+ECOnr2R3IOQ=;
 b=qPR2rv4WJgR48HYQ9D8POZcSC74zCUTK+mAu1gxO4b/DCZKuINQdNFoRH4IwDvVkFg
 xt1nI0l+fndYXsXJ3gzo3aZ2J8THrQ878kAlkJbS65KGlGFbXMLxBAwW+XYcrnFJaO8n
 vc6EqQdMosKuvmrYUNOklg84zh2Dn+0WUTCGjr4VvCuLUj1wV9ump8o0ImpLhnwIuihm
 KcjEcgV5jK7p4Jff3m0zGkbWgDJaYV2Vrl8vS62oQwTJNZ1xbsO+uwacwu8KGK0/zjig
 6ZPpo8DVjZDFaXfEjOBPkTBbREIRgWRmGVcHdQaDgEQ86rHNLQh7KvN9+LGFZHCoSh/s
 2GGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BNAmNOFFRMtzbm+ASOY3SjgYHaI6yIt+ECOnr2R3IOQ=;
 b=NMVvgqLXA5o11pyMhgATlwLjmcZFwRidAvhB0iMFFZdekqwdMKP38CrHD3+QUntvxy
 a2PhIJXJImlXLt8S9yiCS39mOtv7Qh3t/vdgQ4NGPH5wYpfmVCH1J9hOA8yv+fP8wSkv
 6xXkfx7IyuZV2BjWhbsov+8Qll7F3AJByyQK2v7UTAd7grCUOg2kcub57hWHCUHbOKah
 3rGKPBhz/P6VFBn5KlHUA0Nm9CbVAm+sI/Lpp6DNN4qQL0aa+1bY5YWALggexJNPFhWf
 I/0msaoRa+TeoBT3dkhXlp51Bnyng0Z2INRMISvnkw1J8P7jxvhBDFOfz7zmZG31l1CK
 3Xww==
X-Gm-Message-State: AOAM530l5OuLsa/F16BkBOWcmS9fZmwIEfi2IFFs7ipQ3s6M9HuQLb42
 OsB8Fq+jMjR8A1I54zXkbEI1lt5K3Vk=
X-Google-Smtp-Source: ABdhPJwE3D6CMQqCIfW4Z1Y1nFkF31XFMmgKUlbTTt5bDqKNUXnSF5Nk1Gcc5gqOb4HZRiKqSES4AA==
X-Received: by 2002:a05:600c:2288:: with SMTP id
 8mr28285084wmf.40.1635613689512; 
 Sat, 30 Oct 2021 10:08:09 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 b6sm10305799wrd.85.2021.10.30.10.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:08:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/30] hw/intc/sh_intc: Replace abort() with
 g_assert_not_reached()
Date: Sat, 30 Oct 2021 19:06:08 +0200
Message-Id: <20211030170615.2636436-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

All the places that call abort should not happen which is better
marked by g_assert_not_reached.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <039e6a784532f2af27f8adeafdb8e0391722f567.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 9995213cb0b..a0db742d75d 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -96,8 +96,7 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
             return source->vect;
         }
     }
-
-    abort();
+    g_assert_not_reached();
 }
 
 typedef enum {
@@ -168,8 +167,7 @@ static void sh_intc_locate(struct intc_desc *desc,
             return;
         }
     }
-
-    abort();
+    g_assert_not_reached();
 }
 
 static void sh_intc_toggle_mask(struct intc_desc *desc, intc_enum id,
@@ -240,7 +238,7 @@ static void sh_intc_write(void *opaque, hwaddr offset,
         value = *valuep & ~value;
         break;
     default:
-        abort();
+        g_assert_not_reached();
     }
 
     for (k = 0; k <= first; k++) {
-- 
2.31.1


