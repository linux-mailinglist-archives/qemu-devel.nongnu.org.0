Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1F306C65
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 05:47:13 +0100 (CET)
Received: from localhost ([::1]:48704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4zD6-0006eN-KN
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 23:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l4zBh-0004rO-R5
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:45:45 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:36160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l4zBf-00076K-W3
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:45:45 -0500
Received: by mail-oi1-x235.google.com with SMTP id d18so4777514oic.3
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 20:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+/WKWkniWr3oAapU8F0BKTdulQZGR7T7qCX2Jfk5To=;
 b=lpDvlpCFRu5wXbzUz7bdAfJIokhBml5gvrwoedDtuz69sG9H+5wX+Qvx5R/1VvzHgP
 HSwoigvAlxUuCxfnDFfOdaYYgj1hhbIkRF270u6xUpa6u6jwC75zRxigZfw+B1eBL/TO
 jdeiJVMZH3nz/4lPpHKyz1jneCEXdKlu7rd3AexcBQctiK5g/vVHFyvKXswUocSyTPjY
 LGKBI2G87/Vgb3sLk/nIerSkxYluEuqEwLjzs17foH4wQXVw+6pRXbQmyg4H6IMVwLMk
 aSZxi8B2hemulgF0Q4vcgofPIwDwAXfQJ4pbO2tsSEr9vRiYQAvDj1xx9/Udd9tXv7+z
 JD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+/WKWkniWr3oAapU8F0BKTdulQZGR7T7qCX2Jfk5To=;
 b=lVCsNoIgetriHXhGy1sy7YGmFOzTDBcnoEdn+42cQprzdFdjD03R6kZa4YwaWYxt3x
 XRHq58MRMVtnST45TtuzOJVrnCLTG1V92KueIAw3/sQdF4+6mTiKAzj7nAKAX9gxGyvP
 be3yoIskDpDloRgKBqPx9kHjkzO2O09nrq+4qUndmuzRekLFPFRmOZwVuOmVIGlfTlFz
 4fcU4zoI6Z/6I22Pn6SwtK6nVqQ0MWSpDTCL8k5xY17QL2EPESSgHLp61ELIg8wSbXYq
 fxlRiihh2lfoeGbynyHvs32uRPQQu2UwBeYwK++c7XPz4pG+pL5eH6u2yJfZgJWwuoRZ
 dTKQ==
X-Gm-Message-State: AOAM5315KLSCeVTWmO16+J6KFKmxnnj2ilM3gMX6AzQMIHk7lSGovxDk
 QfzbMrEEYmhcHbZ2t6Y3KvmPphQU8n3QMa6gbSZ+pcoJH1T2R+9IVhennqP/K8Ca2ELVtbLFzdw
 fFREBcBlGVeVWl550rCpZ2csN4Ec2AKzobirs/PmIOivAo0zEGBrSXmi2xO8gOWG/8AzCK6k=
X-Google-Smtp-Source: ABdhPJyqRIh/lt+9qIJ05BbUrl8jfXZRWT1j2xawPDgkQRt44CNLuD6Ki6/tL2PZSxiYJnrprVXWCw==
X-Received: by 2002:aca:b909:: with SMTP id j9mr5583821oif.113.1611809141843; 
 Wed, 27 Jan 2021 20:45:41 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id k198sm887399oih.33.2021.01.27.20.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 20:45:41 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] target/arm: Set ID_PFR0.DIT to 1 for "max" 32-bit CPU
Date: Wed, 27 Jan 2021 21:45:29 -0700
Message-Id: <20210128044529.1403-5-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128044529.1403-1-rebecca@nuviainc.com>
References: <20210128044529.1403-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=rebecca@nuviainc.com; helo=mail-oi1-x235.google.com
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
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 40142ac141e5..c98f44624423 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2197,6 +2197,10 @@ static void arm_max_initfn(Object *obj)
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


