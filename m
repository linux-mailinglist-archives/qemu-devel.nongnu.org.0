Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647032E85E3
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 00:15:43 +0100 (CET)
Received: from localhost ([::1]:41702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvTe2-0008H8-FC
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 18:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTbD-0004O5-Jg; Fri, 01 Jan 2021 18:12:47 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTb7-0001wZ-1g; Fri, 01 Jan 2021 18:12:44 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r3so23400438wrt.2;
 Fri, 01 Jan 2021 15:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qro7y7rQW9N9QQR+C1gkV1wlCAwyhKQjnQXxujG4TJI=;
 b=HDAm5rn7idftaY29oAM293BL0vR3TKj0WppYi74Z3/mFRzKAtHacrD14NBUavxQPRC
 TfPxhuV9Xe1MQ4phseclN5A5N/fLr/gTk0wqNwmzr6c1SCoXE102T/fvjwQ/DWw58QxM
 qtPZvZ+sM88qrzapOyXMvI6VRdH//2NzvXdPTopfRTUl9Lnm6gU+G0k8Ds0CTkCXinEY
 RUHH3obI98nzYfU0oEMz4QU9actTLdKLWOATlBGZrc7/WDG1NNjpEjUxXfmTpBaHDyRB
 Kyn/m4BNr2GsntvdWTdST0GJYFvugPVNG+S8UjVjfbelXnM/1C2JJFWZ0+gAD3dxlw6L
 VUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qro7y7rQW9N9QQR+C1gkV1wlCAwyhKQjnQXxujG4TJI=;
 b=Ceq4VWWlfw2eACgoB9CHZwVHu9uYpW1QKi889n8XOfFMUyn8ytBcJLxnWavAel8ecx
 q8pbHste6G/G4v/fveyksG0N9tULCWkonaCPU93SWhFGHk+tOxD4cD6TTkiLCeK5w0Tb
 4O4zd0L8EswZ/8HfeWACz4ds3QH64F6Yw7IL7RQOYQnkGVzTAmzT/62pbjMb2VfVV5pW
 1q8dx5St+aOu1VyuwdMsn9BPzwv8LOzBv2CF2bLP1+7D65Tx83aQHofD1GzNw//bt5wU
 iYjI8wQbrsl0kEnrxaAjYvc6zrbcOUma5Q8Xj0CdCn7zwDTFNijL7tZsb/crcSF3PmHd
 XLLw==
X-Gm-Message-State: AOAM530f8UYkhc06RZByWXrJsSCfYpFIElv7+LUV1PGTQvuSGZTR9s6q
 E1aOvk4jrPXgX+8UYHkHL8LtE1zJJh4=
X-Google-Smtp-Source: ABdhPJxuKYkrI5XgnghK4rBv+8okos6om53py2Aai9snCIeVnvUODPXI9blMLZH457FWvPbIUM9z/g==
X-Received: by 2002:adf:ee90:: with SMTP id b16mr70508430wro.221.1609542758551; 
 Fri, 01 Jan 2021 15:12:38 -0800 (PST)
Received: from x1w.redhat.com (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id k18sm83074047wrd.45.2021.01.01.15.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 15:12:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/5] tests/acceptance: Test boot_linux_console for
 fuloong2e
Date: Sat,  2 Jan 2021 00:12:14 +0100
Message-Id: <20210101231215.1870611-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210101231215.1870611-1-f4bug@amsat.org>
References: <20210101231215.1870611-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

The kernel comes from debian archive so it's trusted.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Message-Id: <20201224031750.52146-9-jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index cc6ec0f8c15..fb41bb7144b 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -170,6 +170,27 @@ def test_mips64el_malta(self):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_mips64el_fuloong2e(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=machine:fuloong2e
+        :avocado: tags=endian:little
+        """
+        deb_url = ('http://archive.debian.org/debian/pool/main/l/linux/'
+                   'linux-image-3.16.0-6-loongson-2e_3.16.56-1+deb8u1_mipsel.deb')
+        deb_hash = 'd04d446045deecf7b755ef576551de0c4184dd44'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinux-3.16.0-6-loongson-2e')
+
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.wait_for_console_pattern(console_pattern)
+
     def test_mips_malta_cpio(self):
         """
         :avocado: tags=arch:mips
-- 
2.26.2


