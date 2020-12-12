Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EFC2D89EB
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 21:10:07 +0100 (CET)
Received: from localhost ([::1]:35056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koBDN-0004ja-8B
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 15:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ko9wq-0001p8-1z
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:48:52 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:55581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ko9wo-0004is-5q
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:48:51 -0500
Received: by mail-wm1-x344.google.com with SMTP id x22so10274370wmc.5
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 10:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g1UoMihOtLViCDs0gKPs5V/SbCAcTDboBs+m7pkVSPs=;
 b=E4LPK4fxYaCCQAOxQ9nIlDxQ5rqjQzcmnxj0Ap/CqumIy9r+/vJOwebqlD5FikJcxf
 NjROetZQMiIJ07Y0n+Z/Wb8/w2AjQqVAcadGYsXPK0r71ofELqDe7xsfjHfuO7CbyF/V
 CvO3boilv5PTpPpXIUeAXwsdG2n27Y7jaubiexrdLqUfPEyXPt6y9kHRCSHHkrgQAI/i
 luMVLBo7bUVaIAMlIoSJyVgLMtkqgUhqwIyiapn6DTgegW7TDUN5AFXyb4ET/ZgIGQZm
 A90Pk8ZrvXDgyMKWsgB10uDPGi2wQJ4Kt8mkat2uz3qOeqz7GhfEfX3r5T77Z4AHDAq8
 3Sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g1UoMihOtLViCDs0gKPs5V/SbCAcTDboBs+m7pkVSPs=;
 b=dDv/Ke6EGcBnCAD9MeYuUB0CjaeYgXzxJLqGyrqD0NaaB53J1EPTq8wWHp5iAltqI/
 HyYLbJTAECPLKL5HvFIUQj39AI/5tYjyMdBDX4g7lIK3e1Vgi9jsoW7vOM0Iz50BlDs0
 ooLKToHz6ZMtQ5psPjzqdsdxVYwnRI47LpBpwozHzIOC/TrgLDYQZPE/Z3CwcfQ+IWtn
 IqEr2X5bAecXgA9IcR9bGCXphoQCWzhlVSZCaVHSwnqMUnYkeOKMe/P216mD44ftSSfv
 3Ao4RNl0Hi3eSVM/7PY+jkrYUpha5su7m5bBa1aLamaT8Hs4GVFZVEI6hpiLCBhTHpQN
 VMxA==
X-Gm-Message-State: AOAM533fuot+f+aVP3muc82JP+7bMZgMXrBDKLu4LfrY7OvUwY9W1ZCr
 7x1TK7v9HApGvIrW4yVDTtGj65BBTpbnNw==
X-Google-Smtp-Source: ABdhPJxmSiLWt+X9izBINlRW+ThzuGLxPF8sF5H5XvEganw0yLvQqgboR2abx1g8j3wMmCL7aM8Z6g==
X-Received: by 2002:a1c:7f81:: with SMTP id a123mr19050587wmd.6.1607784099625; 
 Sat, 12 Dec 2020 06:41:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w3sm20146993wma.3.2020.12.12.06.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Dec 2020 06:41:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] include/hw/sparc/grlib.h: Remove unused set_pil_in_fn
 typedef
Date: Sat, 12 Dec 2020 14:41:34 +0000
Message-Id: <20201212144134.29594-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201212144134.29594-1-peter.maydell@linaro.org>
References: <20201212144134.29594-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Fabien Chouteau <chouteau@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The grlib.h header defines a set_pil_in_fn typedef which is never
used; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/sparc/grlib.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/sparc/grlib.h b/include/hw/sparc/grlib.h
index e1d1beaa73f..2104f493f32 100644
--- a/include/hw/sparc/grlib.h
+++ b/include/hw/sparc/grlib.h
@@ -34,8 +34,6 @@
 /* IRQMP */
 #define TYPE_GRLIB_IRQMP "grlib,irqmp"
 
-typedef void (*set_pil_in_fn) (void *opaque, uint32_t pil_in);
-
 void grlib_irqmp_ack(DeviceState *dev, int intno);
 
 /* GPTimer */
-- 
2.20.1


