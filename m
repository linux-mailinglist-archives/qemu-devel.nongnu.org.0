Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4F34EAB8B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:44:31 +0200 (CEST)
Received: from localhost ([::1]:48204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ9Kw-0001vy-5w
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:44:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ9DA-0003q0-K0
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:36:28 -0400
Received: from [2a00:1450:4864:20::42f] (port=36423
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ9D8-0001A6-EO
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:36:27 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u3so24171110wrg.3
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jn+w0GAcUlDgRGTG2s/c6dZzbEISAktahvM0Y42FQ7M=;
 b=Jnx2wDP+1ss0lptO7LCtAeUrUf0TAcT13xyeN4na/4eQMQILUJ+nvuOP6dp+2gHcaA
 K7S005zzcd8S4vyVlfLdpBNXnhAyTaYDPM9K8P7/2jRpqTGSZRU7/eE88nHY1Cp3+TZk
 3lSXIZKBdB2Cb0pvWXhsTKMo39QxUHmQBiNNKSDRukxrSPdorVsCLOCbqyMfpPirmzWP
 VPs7VPPHk8l6mKiEOzcY1HpKCdJii77wIE656agF9RvkshgZ5bAabYJ0UXMd/NBego7/
 npta8NQ0BHuuayveuXNdV9IOvs2ZHNiP0PcMOIr7fudUNZ6ykovmJC5i86vJA/qOeyYy
 z6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jn+w0GAcUlDgRGTG2s/c6dZzbEISAktahvM0Y42FQ7M=;
 b=4EQ2cI6AhAikp0Ja9XBd/h6iecdpAJqIybfLYeYiP56hqygMq4pv/V9ahbBNfhm1Qx
 I8xzbvJpCHiwgsl1K4CMob9Wt/iFWgJaZX8qiQmJxMFKKeCeodI+3XdpppykgQ3UcRzI
 Q71F7kb6gH21RlMVKZs/MrYa/t6gQ4d2+QA6CBXjYrhI0bo+h6cLGUJ+HI/LWVvP7Yfq
 m8pvM5ecULXTuaiZ4yzgNxB6D00nviyUMr/S6fFADWi6mZO8CLBii5AXZtCr9BiXHvFl
 dAbd5i0z+BwRWiiCsaaUsbfU6P/2tdkFriKGiinShF3SQXjogy7QXK6zSch8MYnXIVh3
 HU7Q==
X-Gm-Message-State: AOAM532Fp4eLh2pmmFxa4OZTzijRU+xVz+xkxyIk0B6/M3kpFbRaGGJ/
 1TrDtdoNoUKaHD8bdXu6RoQtF8cXGxAS4A==
X-Google-Smtp-Source: ABdhPJy+Q1Nv+70lRUWFAZlf2RSF2SVRjhD3cuivjLgOcn3SJu+XRkbJ664KUqgzER3s+NM1qQjkPA==
X-Received: by 2002:a5d:6a45:0:b0:204:597:2708 with SMTP id
 t5-20020a5d6a45000000b0020405972708mr31794837wrw.2.1648550183523; 
 Tue, 29 Mar 2022 03:36:23 -0700 (PDT)
Received: from localhost.localdomain ([2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3])
 by smtp.gmail.com with ESMTPSA id
 y13-20020adffa4d000000b00203e3ca2701sm19959244wrr.45.2022.03.29.03.36.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Mar 2022 03:36:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] qemu-binfmt-conf.sh: mips: allow nonzero EI_ABIVERSION,
 distinguish o32 and n32
Date: Tue, 29 Mar 2022 12:36:04 +0200
Message-Id: <20220329103604.41208-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329103604.41208-1-philippe.mathieu.daude@gmail.com>
References: <20220329103604.41208-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Andreas=20K=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, WANG Xuerui <xen0n@gentoo.org>,
 Alex Bennee <alex.bennee@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andreas K. Hüttel <dilfridge@gentoo.org>

With the command line flag -mplt and a recent toolchain, ELF binaries
generated by gcc can obtain EI_ABIVERSION=1, which makes, e.g., gcc
three-stage bootstrap in a mips-unknown-linux-gnu qemu-user chroot
fail since the binfmt-misc magic does not match anymore. Also other
values are technically possible. qemu executes these binaries just
fine, so relax the mask for the EI_ABIVERSION byte at offset 0x08.

In addition, extend magic string to distinguish mips o32 and n32 ABI.
This information is given by the EF_MIPS_ABI2 (0x20) bit in the
e_flags field of the ELF header (a 4-byte value at offset 0x24 for
the here applicable ELFCLASS32).

See-also: ace3d65459
Signed-off-by: Andreas K. Hüttel <dilfridge@gentoo.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: WANG Xuerui <xen0n@gentoo.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: WANG Xuerui <xen0n@gentoo.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Alex Bennee <alex.bennee@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Closes: https://gitlab.com/qemu-project/qemu/-/issues/843
Message-Id: <20220328204900.3914990-1-dilfridge@gentoo.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/qemu-binfmt-conf.sh | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index e9bfeb94d3..9cb723f443 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -60,28 +60,28 @@ m68k_family=m68k
 
 # FIXME: We could use the other endianness on a MIPS host.
 
-mips_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'
-mips_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
+mips_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
+mips_mask='\xff\xff\xff\xff\xff\xff\xff\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20'
 mips_family=mips
 
-mipsel_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00'
-mipsel_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
+mipsel_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
+mipsel_mask='\xff\xff\xff\xff\xff\xff\xff\x00\x00\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00'
 mipsel_family=mips
 
-mipsn32_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'
-mipsn32_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
+mipsn32_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20'
+mipsn32_mask='\xff\xff\xff\xff\xff\xff\xff\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20'
 mipsn32_family=mips
 
-mipsn32el_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00'
-mipsn32el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
+mipsn32el_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00'
+mipsn32el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\x00\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00'
 mipsn32el_family=mips
 
 mips64_magic='\x7fELF\x02\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'
-mips64_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
+mips64_mask='\xff\xff\xff\xff\xff\xff\xff\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
 mips64_family=mips
 
 mips64el_magic='\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00'
-mips64el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
+mips64el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\x00\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
 mips64el_family=mips
 
 sh4_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x2a\x00'
-- 
2.35.1


