Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0741821E11F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 22:05:49 +0200 (CEST)
Received: from localhost ([::1]:41050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv4hv-00014i-Vh
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 16:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jv4gY-0007uP-Cw
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 16:04:22 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jv4gW-0006G5-MA
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 16:04:22 -0400
Received: by mail-wr1-x444.google.com with SMTP id z15so18130872wrl.8
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 13:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iJReQOIYVR+hDlxB+L3VcS6ZiNXB7LvJkcVb9PUtdRA=;
 b=egGZei3pgMwO3u2LoCla+Sc+Qr4psViwJ6QQ5M+pGiBhZjK5OmcgmK4l+Gdzxikwm1
 r5hdDPXotD9BVIXVtclv/ukGs4K/78CISsJBh6FU93L+T0MMoECrmHqAuzwb/3lCBwyv
 14Hy0xk1GfAD6PVjK3OYr8FpsBvVxwRUTeUCmsrLR38rgaCZCI9iR1VcJFM6d7F/O5Uh
 r4HS06oTJHTnbVaZq6RsMrpNzxz7ZSA8d7KPCCodTGqqaJaSy75qTnSGILeKHcRhf895
 tTGPUGymuEC1kP7ZTfx2VIHN7HT/ceBzccSau531exREEN/ktk0mnQh07Fbn8JbCkj6F
 CCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iJReQOIYVR+hDlxB+L3VcS6ZiNXB7LvJkcVb9PUtdRA=;
 b=KzcK4OE2JC9g4RpbiMWGtB21930eiM/qmBULXnhBL5RgRPKi+03ElRMUTwevo2L4ZB
 e0u/mtbsPI0BnUtNltpUZXl1e7HYK4HjeVy/Akb+7PBHvBjVo2MCZyFdN2Fomj+m+IF7
 Oz6Ge++pvMk/8MZitai4fb7O4TdkZwfXrXzc0Xelwd+x1/5+dBC7MhvRKSyeyH0JoV3i
 0fKF3cHTIfKW0ucW7d8fIT4fQXz9slUMeZ2GXSsDNcDWLJltZo/AToxugH0Vdpkzctmy
 tlm2I4t6b6JJXXaY7RnKhXlQJvBzcXVA8B2vB8DWutV9ve2UCAbzTOC/AY0feNYvGekH
 izwQ==
X-Gm-Message-State: AOAM531aY5E7eHOnNcuJuIF/Q/lCRcgscuSxCxKbQrp7fKOPtKMydI31
 D593YpUD6kOswzOB7u+3yb02gg==
X-Google-Smtp-Source: ABdhPJyDYVPuV1GhmLeVfHDE8UkJmFkRvjFxBtEC77YNrA4tb+dtN8fi74cfYvRCcCJ1neddlXGR4w==
X-Received: by 2002:a05:6000:11cc:: with SMTP id
 i12mr1193551wrx.224.1594670659382; 
 Mon, 13 Jul 2020 13:04:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g13sm26056579wro.84.2020.07.13.13.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 13:04:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EEDC81FF90;
 Mon, 13 Jul 2020 21:04:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 04/11] fpu/softfloat: fix up float16 nan recognition
Date: Mon, 13 Jul 2020 21:04:08 +0100
Message-Id: <20200713200415.26214-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713200415.26214-1-alex.bennee@linaro.org>
References: <20200713200415.26214-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, robert.foley@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 peter.puhov@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200712234521.3972-2-zhiwei_liu@c-sky.com>
---
 fpu/softfloat-specialize.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fpu/softfloat-specialize.inc.c b/fpu/softfloat-specialize.inc.c
index 44f5b661f8..034d18199c 100644
--- a/fpu/softfloat-specialize.inc.c
+++ b/fpu/softfloat-specialize.inc.c
@@ -254,7 +254,7 @@ bool float16_is_quiet_nan(float16 a_, float_status *status)
     if (snan_bit_is_one(status)) {
         return (((a >> 9) & 0x3F) == 0x3E) && (a & 0x1FF);
     } else {
-        return ((a & ~0x8000) >= 0x7C80);
+        return ((a >> 9) & 0x3F) == 0x3F;
     }
 #endif
 }
@@ -271,7 +271,7 @@ bool float16_is_signaling_nan(float16 a_, float_status *status)
 #else
     uint16_t a = float16_val(a_);
     if (snan_bit_is_one(status)) {
-        return ((a & ~0x8000) >= 0x7C80);
+        return ((a >> 9) & 0x3F) == 0x3F;
     } else {
         return (((a >> 9) & 0x3F) == 0x3E) && (a & 0x1FF);
     }
-- 
2.20.1


