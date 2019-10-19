Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D30DDB83
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Oct 2019 01:53:51 +0200 (CEST)
Received: from localhost ([::1]:42170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLyXc-0007sl-4Z
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 19:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34642)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRf-0000Ps-MR
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 19:47:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRe-0005dx-En
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 19:47:39 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36825)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRe-0005d7-8r; Sat, 19 Oct 2019 19:47:38 -0400
Received: by mail-wr1-x442.google.com with SMTP id w18so9316345wrt.3;
 Sat, 19 Oct 2019 16:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d2Dhv4ozB6GokdikOHsEv99K2NKwEzUmYJOH6ccwUU4=;
 b=Y4fvp0ZVBCGgfybaHWMB1TTb1Rjfsdk1SyLXdJt8eM8cA/pQU38fz6wp5BVjFlg5/h
 jvVsDVG7hxLu30aeGgKCEIaMx9rMRXa0KH/h0ithiBLNuXCrX7Md7cytwViNJEg478tX
 nXJi5vUl+x0EWzgxp2tyCFrnAhXgV6TqojlYoXGkU+cSHuvdPIhpeZrwWgzxTIZ5u7C9
 UmUETJBKZ3P07iD7g7YwqNl+6lV41z1WllK4RDEoT5ySRW7Zq3nLFh5CYWXeL3fItA0r
 zSE+AWFmAnRNHqNSpPRd1cDwtNypOzGqxH+FxoiWg10/4ofsT9Ybw5I/GsU58W0ADXCu
 w40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d2Dhv4ozB6GokdikOHsEv99K2NKwEzUmYJOH6ccwUU4=;
 b=PetSwJivUhRNi3pYbV2FbbIL/eULYhQB4kqyCRk32ZECQIbNfRU9jMtYfJfU89wGuC
 BXHf39WcFVmyVte/7S3w5Bux9boFXCFD9xn9xxoGeGdUdjP/dmNUV7Kg2eYFRL1qOQaV
 6CM0nFgpxhYMuQ7hLsiGy+tCjDTYqv8+dOoKVbXG0Hz54r2SiiBTe1HXikE07H34Z7i0
 n8jic5rQt89vV0l2isfAK7Y/fWGLtmGHIC0W0G/gECNsVcUp/kSruUSAYP0CUdS8i8Uo
 RLP2v1lENn6rw6ya4CMNIrkx8XGavH1umCnz/fEzGeRSM9rQ29f6QMLYjnms6XnQY0FO
 U4kw==
X-Gm-Message-State: APjAAAXERBznTH309zyBF7krXOklPyKPBikCiCtdcT76YcOe8wHJXSa6
 GjGSwqiJ1BUZtBkeJvZpb/iY3X9y
X-Google-Smtp-Source: APXvYqwhARONlB9dru7D5rkLvLJ+U10xdpgYyYJQjnMOqcyzF73zX2vre0cfe0bo5j8VwMr/B1MuRg==
X-Received: by 2002:adf:e74c:: with SMTP id c12mr7419657wrn.133.1571528857127; 
 Sat, 19 Oct 2019 16:47:37 -0700 (PDT)
Received: from x1w.redhat.com (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id u1sm10433763wrp.56.2019.10.19.16.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 16:47:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/16] hw/arm/raspi: Use -smp cores=<N> option to restrict
 enabled cores
Date: Sun, 20 Oct 2019 01:47:10 +0200
Message-Id: <20191019234715.25750-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019234715.25750-1-f4bug@amsat.org>
References: <20191019234715.25750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
 Matthias Brugger <mbrugger@suse.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Pete Batard <pete@akeo.ie>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The abstract TYPE_BCM283X device provides a 'enabled-cpus' property
to restrict the number of cores powered on reset. This because on
real hardware the GPU is responsible of starting the cores and keep
them spinning until the Linux kernel is ready to use them.
When using the -kernel paramenter, QEMU does this by installing the
'raspi_smpboot' code when arm_boot_info::write_board_setup() is
called. This is a special feature to help the Linux kernel, and can
only be used with a Linux kernel.

Even if loaded with the -kernel option, U-boot is not Linux, thus
is not recognized as it and the raspi_smpboot code is not installed.

Upon introduction of this machine in commit 1df7d1f9303, the -smp <N>
option allowd to limit the number of cores powered on reset.
Unfortunately later commit 72649619341 added a check which made this
feature unusable:

  $ qemu-system-aarch64 -M raspi3 -smp 1
  qemu-system-aarch64: Invalid SMP CPUs 1. The min CPUs supported by machine 'raspi3' is 4

Fortunately, the -smp option allow various kind of CPU topology:

  -smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]
           set the number of CPUs to 'n' [default=1]
           maxcpus= maximum number of total cpus, including
           offline CPUs for hotplug, etc
           cores= number of CPU cores on one socket (for PC, it's on one die)
           threads= number of threads on one CPU core
           dies= number of CPU dies on one socket (for PC only)
           sockets= number of discrete sockets in the system

Let's use the 'cores' argument to specify the number of cores powered
at reset to restore this feature, and allow to boot U-boot.

We can now run U-boot using:

  $ qemu-system-aarch64 -M raspi3 -smp 4,cores=1 ...

Reported-by: Laurent Bonnans <laurent.bonnans@here.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 569d85c11a..45d3f91f95 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -190,8 +190,8 @@ static void raspi_init(MachineState *machine, int version)
     /* Setup the SOC */
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
                                    &error_abort);
-    object_property_set_int(OBJECT(&s->soc), machine->smp.cpus, "enabled-cpus",
-                            &error_abort);
+    object_property_set_int(OBJECT(&s->soc), machine->smp.cores,
+                            "enabled-cpus", &error_abort);
     int board_rev = version == 3 ? 0xa02082 : 0xa21041;
     object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
                             &error_abort);
-- 
2.21.0


