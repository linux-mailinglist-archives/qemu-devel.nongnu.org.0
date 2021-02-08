Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E7F3137A0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 16:29:26 +0100 (CET)
Received: from localhost ([::1]:32884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98Td-0008Ld-Hd
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 10:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l90Uw-0005CS-F0
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:58:20 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:35656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l90Ua-0003xp-0H
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:58:10 -0500
Received: by mail-io1-xd2d.google.com with SMTP id f2so1969374ioq.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 22:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RzKZuoyEuNW82NcVhGHHTiOVySuGgC0h+4EIBJuvWAA=;
 b=ApmOQnUBQtN8W8NkpFFYcWgIAEuQdvVSz7hB0ouVRpiurcllSAQQGqDX7xO5DUvR7U
 ocV69CFnJFk0FVcdJlh8epGW4RwHdW+/Ku5fl/1BGu8exk/MUrZDzcHpROcfTGmrtY5z
 AvNyYBAwxS0H2rDq0qM6IF2wMa9uma+f6lnQlV1vlKHjVKqFfE+N/mFn1OWcE+J86M9p
 irPaBNhA63TeYNsCcOrNUNuX/arQuZCGbklqe8DVnKqo2cbwIN3D9PRkmHy9JxzwipYK
 yGlNQ1n9jtoBkVPfCZ62m1+kkIA/rNW665Vis19ZhX8SYFu2HdSi/12JQtcZWTu+Sbyp
 1KgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RzKZuoyEuNW82NcVhGHHTiOVySuGgC0h+4EIBJuvWAA=;
 b=ZLhZJ5JYh4yspJEnCEYSq1HbwAZlBVsvuKrvbOcSsC8B/ixSGjo20BnemCCmU0XKL6
 AIwe0eCV64CMbr3JnhIR1A+CoTilXyyAnV77asrv2fPmj5zZ0CN+mlwMrIOw3dTWgogY
 HvfDh1hsSsHktNFI7JOV4/tEb3iZx/CjzjEfXmXxxvOeQwB46psfL6LbZGfGCjn7y3JG
 D5pE9kyBRTstIvNY58BCz/JzCDfgdx8HAyU6igz3RUxUrce5gsWU5058egpRpV5fQVGp
 PNyqN8ld3SEBNWrA+RGQyvaWe7TF/vyIRpr3ErpIdQ2SRybSzIV9D464SVrYsm6bD2l7
 qvlQ==
X-Gm-Message-State: AOAM531RiiHifj0tqt93zjBYHEf/r1INZETsrOkE8Dq3byVr6S4mS5MT
 PB1/gU0NH9g+02B812k7yc4L9gsz5j8N2ID+jI9E87lhEPvSNNtk6PlplsFLxTGrTIUPtpmn1Os
 ddA0efUlle6ER2b+CaIkhMkEFK3AbKFJntGo08jwEeOMw2cxDZYZ909hNK+p7tErq19nTZH8=
X-Google-Smtp-Source: ABdhPJzE0Hrq484IjWXCmFWSFiuY7RxfrSGb3lEJxT8rRROAYohX6pIUxkV3Rc99Rf4G1x8Tub/MYw==
X-Received: by 2002:a05:6602:1541:: with SMTP id
 h1mr13659630iow.171.1612767428349; 
 Sun, 07 Feb 2021 22:57:08 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id c19sm8335904ile.17.2021.02.07.22.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 22:57:07 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/4] target/arm: Set ID_PFR0.DIT to 1 for "max" 32-bit CPU
Date: Sun,  7 Feb 2021 23:57:00 -0700
Message-Id: <20210208065700.19454-5-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208065700.19454-1-rebecca@nuviainc.com>
References: <20210208065700.19454-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable FEAT_DIT for the "max" 32-bit CPU.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8ddb2556f8cf..5cf6c056c50f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2202,6 +2202,10 @@ static void arm_max_initfn(Object *obj)
         t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
         t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
         cpu->isar.id_mmfr4 = t;
+
+        t = cpu->isar.id_pfr0;
+        t = FIELD_DP32(t, ID_PFR0, DIT, 1);
+        cpu->isar.id_pfr0 = t;
     }
 #endif
 }
-- 
2.26.2


