Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB1110DD2D
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Nov 2019 09:53:36 +0100 (CET)
Received: from localhost ([::1]:38654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iayVT-0001XN-FJ
	for lists+qemu-devel@lfdr.de; Sat, 30 Nov 2019 03:53:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iayOR-0002zs-Dx
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 03:46:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iayOP-0003Lg-CK
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 03:46:19 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38721)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iayON-0003I1-Bx
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 03:46:16 -0500
Received: by mail-wr1-x443.google.com with SMTP id i12so37861292wro.5
 for <qemu-devel@nongnu.org>; Sat, 30 Nov 2019 00:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CBRxWtDlvULN12RBX13IvLfJzLneBpejsob1f3dMgIA=;
 b=P3m8ba5SfoD9CvFQIyysrJ6zd1+LXlyIlQ/I/8tFWiWOP10FfbNrI6I3N92+EI9tR2
 1X1BOdvXry73FKiBRr/hq7tZWcdSDxVmKoywedXOFpBuJVEWYTlyb2KwNH+tTVwohlgt
 kYYs8SjfFe1a6OEGPeCsXmZE3oRhe3F31rkmI5BP0aDlUMh8JFBkQWGBgN2wpc+/kjbg
 y7/bLOw/y1wc80Q/mlh344/7vCRtP2hanfz+uYeqFm+yedDljUENvIyVG49b27sHMS+C
 yfWSjl0+tGdIZbhthWgFBTu3P2BOeQTaKgHXue71aD7hwUKPntx2CsGTUuVYNA/k/Pv2
 7NZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CBRxWtDlvULN12RBX13IvLfJzLneBpejsob1f3dMgIA=;
 b=G6GB+Y698X+ZszxFfcKGm3x2jDYx5Swr7S/VkYgQIHGumUc3yo3OjuGN2gmroDrOyx
 cPkc5DF7wVyBXthnFpFuOFyFs2Q/B4oUJTCIZ9DncW72Pg1LgGGkrvcd6ofFh+n2+7AR
 eoJYpbYWd1hdXjBAv2YFXDP/a6K0r4SIY9aOXK/tGgr2hfwpR4Fti44X8rpbmGd84b9Y
 al5oxww0f9ogvHIwqj2AQ5FuLXFe9aND4/42dVguZCD4n4DAtbw75J4Vcx3gIycjoD3C
 PGZdoKf7PTtH4fsYTb/4XSRt2qtSW/mDatGKTwSFuNzY8tg3N5QV7137IJi/e8YW0GL5
 If0A==
X-Gm-Message-State: APjAAAXFeGdnMJxFWO5SoC014aI6sjRm7wv1rtSl8EPRDoeykFXDPBbv
 a9w8tdiXmRKyp16RYrrV6qaHMQ==
X-Google-Smtp-Source: APXvYqw5PqJLYyEK0P13CUbavVGtEBmP147u78i2w68kgGjDLejsVdjUWRKojTyfJTtQIHJI4VVTuA==
X-Received: by 2002:adf:ec48:: with SMTP id w8mr11249106wrn.19.1575103572858; 
 Sat, 30 Nov 2019 00:46:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g21sm33108233wrb.48.2019.11.30.00.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 00:46:06 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E6E761FF93;
 Sat, 30 Nov 2019 08:46:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 06/14] target/arm: use gdb_get_reg helpers
Date: Sat, 30 Nov 2019 08:45:54 +0000
Message-Id: <20191130084602.10818-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191130084602.10818-1-alex.bennee@linaro.org>
References: <20191130084602.10818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 luis.machado@linaro.org, richard.henderson@linaro.org,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, alan.hayward@arm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is cleaner than poking memory directly and will make later
clean-ups easier.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - make sure we pass hi/lo correctly as quads are stored in LE order
---
 target/arm/helper.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0bf8f53d4b8..0ac950d6c71 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -105,21 +105,17 @@ static int aarch64_fpu_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
 {
     switch (reg) {
     case 0 ... 31:
-        /* 128 bit FP register */
-        {
-            uint64_t *q = aa64_vfp_qreg(env, reg);
-            stq_le_p(buf, q[0]);
-            stq_le_p(buf + 8, q[1]);
-            return 16;
-        }
+    {
+        /* 128 bit FP register - quads are in LE order */
+        uint64_t *q = aa64_vfp_qreg(env, reg);
+        return gdb_get_reg128(buf, q[1], q[0]);
+    }
     case 32:
         /* FPSR */
-        stl_p(buf, vfp_get_fpsr(env));
-        return 4;
+        return gdb_get_reg32(buf, vfp_get_fpsr(env));
     case 33:
         /* FPCR */
-        stl_p(buf, vfp_get_fpcr(env));
-        return 4;
+        return gdb_get_reg32(buf,vfp_get_fpcr(env));
     default:
         return 0;
     }
-- 
2.20.1


