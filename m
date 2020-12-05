Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6E42CFAC9
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 10:21:40 +0100 (CET)
Received: from localhost ([::1]:34652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klTl5-0001Rj-8o
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 04:21:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1klTja-0000a0-LK
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 04:20:06 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:37746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1klTjY-0003Vx-Rs
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 04:20:06 -0500
Received: by mail-pj1-x1044.google.com with SMTP id o7so4593136pjj.2
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 01:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oqcsHqqalIa4+5alL3D6RDSc5VPFDi9I4JZ3ptjNhFg=;
 b=tq3LAduSB3Kf8DRTUOvPqULw7Bg9+ipL7KlgDj/q33fsJPNLJKMVX4eFmdgR8y2RP1
 Jbhq7piNU9LFHl71NFQxen2wczfaZN5UEUHfE4jArPh7f0j3swtWf/l4VF3dQ2RC0C+o
 7UT2la86qz0lpNS82lmaSfuh0SuB3XSG9a1k47xVPeXOdSxzsGjOGh3u50mhRf/aoVWd
 d8qgjC5XL754jiEF85J/Tt3ao9mx9US0Lfn2tuBh5fzYqw1SYiB0EJSpWoKWJ074TOOt
 wqj0kIiSiPMjoCOIA3vOmsj+117Nk3hE3Vq7KNeDqogAZt1PQ0EsczxKyv7DDnQ8CzV4
 Z7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oqcsHqqalIa4+5alL3D6RDSc5VPFDi9I4JZ3ptjNhFg=;
 b=FFIZ1HHyUTHXCF1GFrkNk9VW3R8eydztInLF4GJvBZq4YMx3BLnCZ9ZntvwntlDNQg
 55EAVYfnkyC4KlkG1QZO1ebx++pVQsASU0UAjhVjYqsJg/CZaEXrjB50SW7dYZkhyMk6
 QHsi4Yfaiy8cmsBGGPYEQUrci/XC4bclDZTTucurY9ov+V1y4Zg3dMhuckbiSH0h2GD1
 6GxIvWUy97JD2aQWIrJTZbCZBNb0DoFJ1NRl/E/caZ1yZHqLxNQfXGHnIgaMKj7pba2m
 3swzr31JM7vwsIDv/hkKQssG20kbIQFtWW2ou3/VSnCWS2W2xMIRqUdKjAYUhB3pAjIs
 b1+g==
X-Gm-Message-State: AOAM533Br7kpK27RnUqQS9MGxgx8X7LHdpWG/MAaAu54l6G59lFk2c6m
 Kgb5x6/RBkWSSuCa+Sh6pXo=
X-Google-Smtp-Source: ABdhPJx9sYjwhTaI0IW4eHkJFagHy9qYLHESThXkz5NtiAXYquEjNh98OmTYtG/kaxIq/5gqlsdBFw==
X-Received: by 2002:a17:902:22e:b029:d9:e591:7bd1 with SMTP id
 43-20020a170902022eb02900d9e5917bd1mr7557528plc.50.1607160002571; 
 Sat, 05 Dec 2020 01:20:02 -0800 (PST)
Received: from software.domain.org ([45.77.13.216])
 by smtp.gmail.com with ESMTPSA id s189sm7095282pfb.60.2020.12.05.01.19.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 05 Dec 2020 01:20:01 -0800 (PST)
From: Huacai Chen <zltjiangshi@gmail.com>
X-Google-Original-From: Huacai Chen <chenhuacai@kernel.org>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] MAINTAINERS: chenhc@lemote.com -> chenhuacai@kernel.org
Date: Sat,  5 Dec 2020 17:22:01 +0800
Message-Id: <1607160121-9977-1-git-send-email-chenhuacai@kernel.org>
X-Mailer: git-send-email 2.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=zltjiangshi@gmail.com; helo=mail-pj1-x1044.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use @kernel.org address as the main communications end point. Update the
corresponding M-entries and .mailmap (for git shortlog translation).

Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
---
 .mailmap    | 2 ++
 MAINTAINERS | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/.mailmap b/.mailmap
index 663819f..a1bd659 100644
--- a/.mailmap
+++ b/.mailmap
@@ -49,6 +49,8 @@ Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
 Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
 Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
 Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
+Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
+Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
 James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
 Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 68bc160..7f00e74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -388,7 +388,7 @@ S: Maintained
 F: target/arm/kvm.c
 
 MIPS KVM CPUs
-M: Huacai Chen <chenhc@lemote.com>
+M: Huacai Chen <chenhuacai@kernel.org>
 S: Odd Fixes
 F: target/mips/kvm.c
 
@@ -1148,7 +1148,7 @@ F: hw/mips/mipssim.c
 F: hw/net/mipsnet.c
 
 Fuloong 2E
-M: Huacai Chen <chenhc@lemote.com>
+M: Huacai Chen <chenhuacai@kernel.org>
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Odd Fixes
@@ -1158,7 +1158,7 @@ F: hw/pci-host/bonito.c
 F: include/hw/isa/vt82c686.h
 
 Loongson-3 virtual platforms
-M: Huacai Chen <chenhc@lemote.com>
+M: Huacai Chen <chenhuacai@kernel.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Maintained
 F: hw/intc/loongson_liointc.c
@@ -2851,7 +2851,7 @@ F: disas/i386.c
 MIPS TCG target
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Aurelien Jarno <aurelien@aurel32.net>
-R: Huacai Chen <chenhc@lemote.com>
+R: Huacai Chen <chenhuacai@kernel.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
-- 
2.7.0


