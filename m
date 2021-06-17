Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B323AB316
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 13:55:54 +0200 (CEST)
Received: from localhost ([::1]:36130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqcj-0000eo-Hk
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 07:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqao-0006IB-65
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:53:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqam-0005Dz-BH
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:53:53 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso6197579wmg.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PLm+CAmE6exi2+6ozO8dDlwl9EePwAhLr88hp6FkarA=;
 b=l+gBpnNlmzIsLpjXsAuhDyV3cq1HN+KfsoUrZDhR12BdxXEM0XGEtXBjDh3T2wxPt/
 8SqbkLCpuwqUaIzrgI/3cXCHFuYm2B1cMcdqQ+UtRGmLFpkzoxkBGqqKAhsnc3hmr7sM
 c+eF6uVxpXhwCrvevcXAv4DRiGcokr5bzHNP+Lk2pRsV3jXzB8j7ArrdX2SqVgJ+GvnJ
 DH/pmwmgihkjtpYxp+ablnd1Bv3LOTbmX7tGFw5PyOW78GdNlJPhaDu9ERMV7gNjPgdF
 modpvAvHQqjYi1ube8PAE8gVt5mqEpsBlKK1akA9gofyyGxVa3+YOqqF3BeEzjp+pVuX
 Y2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PLm+CAmE6exi2+6ozO8dDlwl9EePwAhLr88hp6FkarA=;
 b=dTTjlYOA/fxZWSZGv0otEIw4Gl6kHjQymPPhjNeUoAau772998AokKIda60FKSr0V3
 j3rr3S4so72PJAL9Gd+uBOa86Ic5PGNrs8qLJUnUfvY+oPwvduWcI5R6gD3cvLpDDklI
 waTxGUJcAVSJmRUUt/MBoJbFqdwVL5gD41EzIHPruFGXgeVnLEheOU7VBH0He0QRUXTo
 m/2SO5C4OeRo2Fg1xvxwh+dZzHZGqvjLk39sW88/Iy8mGlZR4m/wTbHCoPY7/dUqrsnh
 qMeUvWeqEtZCCbWgFk/UtcVVcLZafS0b0jA672VZfnu7PK6ffC55PFA3mkpY9dHbcFSs
 lxZg==
X-Gm-Message-State: AOAM531zQFfjKqNT8IoKWOa5kLdWAJ670ciCuxs/LDfKF4AbrS2Lj8il
 SCKj5DA0/VLoEO4larNcl8fK0vDp98M6oA==
X-Google-Smtp-Source: ABdhPJzXqa9Qfx2Bx1vEZJUy5ivkHoF4M4CDVTC9Z2dLTUqcQpfF2woEM6t6zxZlcCLY9ABe0Ss8Rw==
X-Received: by 2002:a05:600c:2d45:: with SMTP id
 a5mr806266wmg.161.1623930830756; 
 Thu, 17 Jun 2021 04:53:50 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w23sm8327291wmi.0.2021.06.17.04.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:53:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/15] hw/display/sm501: Simplify sm501_i2c_write() logic
Date: Thu, 17 Jun 2021 13:53:22 +0200
Message-Id: <20210617115334.2761573-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/sm501.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 8789722ef27..f276276f7f1 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1036,8 +1036,9 @@ static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
                 int res = i2c_start_transfer(s->i2c_bus,
                                              s->i2c_addr >> 1,
                                              s->i2c_addr & 1);
-                s->i2c_status |= (res ? SM501_I2C_STATUS_ERROR : 0);
-                if (!res) {
+                if (res) {
+                    s->i2c_status |= SM501_I2C_STATUS_ERROR;
+                } else {
                     int i;
                     for (i = 0; i <= s->i2c_byte_count; i++) {
                         res = i2c_send_recv(s->i2c_bus, &s->i2c_data[i],
-- 
2.31.1


