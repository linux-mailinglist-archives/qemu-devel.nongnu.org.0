Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D012AF699
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 17:33:56 +0100 (CET)
Received: from localhost ([::1]:45664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kct4F-0005mM-DX
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 11:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kcspJ-0000ud-Lf
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:18:29 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kcspH-00081l-4j
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:18:29 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 33so3077122wrl.7
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 08:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zi75fku0OFNQzErpcH7q/kQ/tyIaSHtSE/ulFmYsCsM=;
 b=fMfpb5NoiKVpBGPNWQ/PoXL0vwEFXbv60aSeDqpinj/2spVel/IoDNZ3J5UXe2PfOu
 fLBiTlEtdbp5ZqDz5mUfCFSxJLTxWGX6mjudCR4OUpPWc0tvYkx/fjqPOmaZaGvvZBiA
 idBqLc6m5oAyfWf4gw9SHRPuW+PwltrKa7pftbGlq3S7Z9aXLXReKY3FrkWroIOTKMHZ
 uhtSxNF7Q/+36A+4/NSeb9MUacyA6axwvbxJA18OF1vqsvpDMeZHywaoYT4QrHCXbmKe
 iijsthSP9xy8k9PZQy9nQKshcUsLxtfohWK+rtr+6OvnswNdTt5wd0suGU+cTk1Wus/O
 AJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zi75fku0OFNQzErpcH7q/kQ/tyIaSHtSE/ulFmYsCsM=;
 b=ZHDeC4meqBWXQOMkZezs6aSoz7Re8z5G7iOFaSXSKG+cqvDlhmgKFSKat7qleOB8XW
 uA4+xNqtTY2uvjWbNUSbdUFRwKY+yeAzO7fbWlIuPWS0B7YM2IqTeo3KKQRh+0HL8iaP
 6g6bCoiCwYDplXC6nY6nH1m7w8PWEf356lPRBiCjD7N0ySz/sb/51Xu0xiKW+Qw6o48C
 Ap87Ah1HZSwCLtk9ohyObK/Vi7zug4U4mFGUcoGiYoe2fnwZ+IFuxEC33lWG6qRPQsz/
 KZugI97LZFyQ1mxXYQYWFgld6sw83r8ZS8wlG7YNyLJd5nMaUQpph25acNkQQFEH6rTi
 AdOw==
X-Gm-Message-State: AOAM533oQ0wquTzA1lmCPN0ABkWivXl0UzKqPnuiRPGUDuDJgiXaASFf
 JMeEe53i92XbDq7OHzRB3czRvWUZlgTLxQ==
X-Google-Smtp-Source: ABdhPJyRlv9JNsAqkclndDNJ0ZTWBY0JlxAxgOhJlRffnW+s3lLjmYKn02w6wlF+s1MCYLT/o0cDhg==
X-Received: by 2002:adf:9104:: with SMTP id j4mr17993239wrj.198.1605111505451; 
 Wed, 11 Nov 2020 08:18:25 -0800 (PST)
Received: from cmiranda-laptop.localdomain (bl19-104-46.dsl.telepac.pt.
 [2.80.104.46])
 by smtp.gmail.com with ESMTPSA id s188sm3115178wmf.45.2020.11.11.08.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 08:18:24 -0800 (PST)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 15/15] tests/acceptance: ARC: Add linux boot testing.
Date: Wed, 11 Nov 2020 16:17:58 +0000
Message-Id: <20201111161758.9636-16-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111161758.9636-1-cupertinomiranda@gmail.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wr1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Cupertino Miranda <cupertinomiranda@gmail.com>,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

Just an acceptance test with ARC Linux booting.

Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
---
 tests/acceptance/boot_linux_console.py | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 8f433a67f8..3eae551905 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -137,6 +137,26 @@ class BootLinuxConsole(LinuxKernelTest):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_mips_malta(self):
+        """
+        :avocado: tags=arch:arc
+        """
+        deb_url = ('http://snapshot.debian.org/archive/debian/'
+                   '20130217T032700Z/pool/main/l/linux-2.6/'
+                   'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
+        deb_hash = 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinux-archs')
+
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.wait_for_console_pattern(console_pattern)
+
     def test_mips64el_malta(self):
         """
         This test requires the ar tool to extract "data.tar.gz" from
@@ -973,6 +993,17 @@ class BootLinuxConsole(LinuxKernelTest):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def do_test_arc(self, kernel_name, console=0):
+        tar_url = ('https://github.com/cupertinomiranda/arc-qemu-resources/archive/master.tar.gz')
+        file_path = self.fetch_asset(tar_url)
+        archive.extract(file_path, self.workdir)
+
+        self.vm.set_console(console_index=console)
+        self.vm.add_args('-kernel',
+                         self.workdir + '/' + kernel_name)
+        self.vm.launch()
+        self.wait_for_console_pattern('QEMU advent calendar')
+
     def test_m68k_q800(self):
         """
         :avocado: tags=arch:m68k
@@ -1101,3 +1132,27 @@ class BootLinuxConsole(LinuxKernelTest):
         tar_hash = '49e88d9933742f0164b60839886c9739cb7a0d34'
         self.vm.add_args('-cpu', 'dc233c')
         self.do_test_advcal_2018('02', tar_hash, 'santas-sleigh-ride.elf')
+
+    timeout = 240
+    def test_arc_virt(self):
+        """
+        :avocado: tags=arch:arc
+        :avocado: tags=machine:virt
+        """
+
+        tar_url = ('https://github.com/cupertinomiranda/'
+                   'arc-qemu-resources/archive/master.tar.gz')
+        file_path = self.fetch_asset(tar_url)
+        archive.extract(file_path, self.workdir)
+
+        kernel_path = self.workdir + '/arc-qemu-resources-master/vmlinux_archs'
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE)
+        self.vm.add_args('-kernel', kernel_path)
+        self.vm.add_args('-device', 'virtio-net-device,netdev=net0')
+        self.vm.add_args('-netdev', 'user,id=net0,hostfwd=tcp::5558-:21,hostfwd=tcp::5557-:23')
+        self.vm.launch()
+
+        console_pattern = 'Welcome to Buildroot'
+        self.wait_for_console_pattern(console_pattern)
-- 
2.20.1


