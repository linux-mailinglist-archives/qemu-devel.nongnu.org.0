Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8F0440A7A
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:15:19 +0200 (CEST)
Received: from localhost ([::1]:49918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgrws-0006eL-9m
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgroq-0002dg-8P
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgron-0004mU-Ep
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:06:59 -0400
Received: by mail-wr1-x429.google.com with SMTP id d27so3648782wrb.6
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgEP8heWwmNNYe7Gv2jNtzQfVFRGEcHPc2bYaZZQZxI=;
 b=qwd206OnSYjHzyYCMYn09tQpRbjqJB3uam1+if8jRiinif4XtRHbr37NjCmzGACUFo
 1gQZZjH/wjjt5b1SemTKt2MvOl7ItyA+9TzLwTURDWu5mkyHLIbdaT6+UJdlZYNVIL9s
 gT2JTMPg9L1x7zeigpLv8fTdQl595gXJqBLDHiWt+QmIp9I50a53PsAbE44/kYZPj/qR
 wHUhJkHwIHfx7JwOAMHhKpKW20s+br7Kb44RAXUVMf8/oJYKzbpIU8PbleKbOdb1qHUA
 R1vwURCHpQIvdusoOmFJ2X8iDnCP/icIvseLY3DJs+RmdTKXIwML1iRKgIVD341h3+zY
 fkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bgEP8heWwmNNYe7Gv2jNtzQfVFRGEcHPc2bYaZZQZxI=;
 b=DBzkY2HJWgsyCcB5+wZcgKPXsy/icSVS63oPwkInBDJFGxUZON6MDQq8RIkNzM52Wy
 tj7Ak1rXke3J4yj5IxthQQnyyWmPhSb+TBJzZ9P6tI9jd3fEesBoPeHx7pPmQUGqV81W
 qc9aJXjAagUUTvsD6b0l9rdZGF9zW/wf+WxVtSRP3c+TktWmxnM4/ilvWNbdV5FOM0oV
 duQMKu6EPQCVpBU8pk24GWDR7xDVIYjLEo2aQvzyLH5nSfJ2yH/k3g4uXvkoFbmFj7yr
 z9S3bPkbXXI/wSNfslnGwnE5+ZBbPAZX6RwHZX7pxqCwEdw7vWZMltffSEhwSy/0tIAa
 ksXw==
X-Gm-Message-State: AOAM5305rbbI81HyDhC+O25PXPSK0jJpra1EQ35/qqJTmImuTwxAkpv7
 N5l2MD+ehayp3Hqk0mCUeR+7cI+teJg=
X-Google-Smtp-Source: ABdhPJxMN6hvF+1e2BLpO1KYkwT4Z8z8VwF6v7n5L0J0DoycagFmFhwCVLGaMdWoEB/0Gr4V15Fugg==
X-Received: by 2002:a5d:51cf:: with SMTP id n15mr12277137wrv.106.1635613615831; 
 Sat, 30 Oct 2021 10:06:55 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o40sm11249059wms.10.2021.10.30.10.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:06:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/30] hw/sh4/r2d: Use error_report instead of fprintf to stderr
Date: Sat, 30 Oct 2021 19:05:53 +0200
Message-Id: <20211030170615.2636436-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <7f320ab72f3d4d43cd62925230a9f83583413f67.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sh4/r2d.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 57ccae7249a..72759413f37 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/sh4/sh.h"
@@ -324,7 +325,7 @@ static void r2d_init(MachineState *machine)
                                           SDRAM_BASE + LINUX_LOAD_OFFSET,
                                           INITRD_LOAD_OFFSET - LINUX_LOAD_OFFSET);
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n", kernel_filename);
+            error_report("qemu: could not load kernel '%s'", kernel_filename);
             exit(1);
         }
 
@@ -345,7 +346,7 @@ static void r2d_init(MachineState *machine)
                                           SDRAM_SIZE - INITRD_LOAD_OFFSET);
 
         if (initrd_size < 0) {
-            fprintf(stderr, "qemu: could not load initrd '%s'\n", initrd_filename);
+            error_report("qemu: could not load initrd '%s'", initrd_filename);
             exit(1);
         }
 
-- 
2.31.1


