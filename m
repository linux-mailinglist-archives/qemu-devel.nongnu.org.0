Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2DE3D55B9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 10:38:26 +0200 (CEST)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7w81-0007CF-7v
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 04:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1m7w6a-0005pX-VD
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:36:58 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:37768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1m7w6X-0002Ja-Kv
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:36:56 -0400
Received: by mail-oi1-x22e.google.com with SMTP id u10so10054951oiw.4
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 01:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=sJNa4BjRQ3rRzFhvqWbCpc6e28XwQuPvaF9T9WeQL50=;
 b=fwRfJP3R48VHjzkbtqSkEtEfTOYioTvnQ//d05q+qINZlVIwVqhWFCZNK0Q2a9oaPh
 oIHFRCDMi1G7Az2AoEkqztbqoexBITgK08Bwl1nluC4AISC1p0XGVmCUFDlNL5+zFGUN
 HVOFBJ86mrV5rkxuly7gJpRZyLgHKW8zLEiawQKupB81+B69QD07bnAqClrJCBv4/XlI
 AHZLCp8L96EqsxBdEpN5ojAicPzlN9MmLYSOBgKMzAYHuhTOZH9IwdwcVeTEmDnhd/3K
 l7JJbvhxYA3g2nwm8P40U/nbnWevnTXH9304H4ScAXiaILypLEC9Q3cpVYv3yQ16+Bey
 aXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=sJNa4BjRQ3rRzFhvqWbCpc6e28XwQuPvaF9T9WeQL50=;
 b=AoLyGUoecyelvk6UWSmYj77hqQQ28n67SWU0+jIHLoC8OsrTPke/x5hzkNIRBXf5eX
 zyy60Yy5m/XJJYmzyLAzFSNDLbBIpp6nOxv+LRrI0orkElnE0ILhFO0+r5ZBE73vq+iJ
 CE97joiQikiRnrFUWs3U76mikHb19y6/6j6essWzusbVlmWMYOYsveiiMn7KvZ5i3lTN
 qXCFrYV5lxSQuBR8DB7l8GbRGVmOxaskpoeE6brNA0k6Mv78E33Xbfcfy/aJMYdZjDMx
 JN/XK7PwBm0NTG7AYuL+7ibp6JxHx1BP2ViANvaxSMPWyDUfP1axt5xMYNbgAkyE78VC
 sipw==
X-Gm-Message-State: AOAM530gaZDsgNyta1JBbZ4JT5esdES0vY/PWLb1is7Moe0KY4kag0TC
 Oqw7OgQxLXXrdEw69nGZ4Q3iHQ==
X-Google-Smtp-Source: ABdhPJz+ZJ5d0fWGXgUBDgyvO7wsfJp22KV/1DfkjF177jCt66Q0yFQbHi7qONIeYlnAw7LjWowBBg==
X-Received: by 2002:a05:6808:914:: with SMTP id
 w20mr16464957oih.152.1627288612344; 
 Mon, 26 Jul 2021 01:36:52 -0700 (PDT)
Received: from [192.168.11.11] ([172.58.97.112])
 by smtp.gmail.com with ESMTPSA id s6sm6184945otd.6.2021.07.26.01.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 01:36:51 -0700 (PDT)
Subject: Re: [PATCH 01/20] Hexagon HVX (target/hexagon) README
From: Rob Landley <rob@landley.net>
To: Sid Manning <sidneym@quicinc.com>, Brian Cain <bcain@quicinc.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 linux-hexagon@vger.kernel.org
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-2-git-send-email-tsimpson@quicinc.com>
 <1b632e88-43d4-3034-cf7b-d42be056d842@landley.net>
 <SN6PR02MB42054B50C60ABA378256492DB8159@SN6PR02MB4205.namprd02.prod.outlook.com>
 <553c32e8-188c-5b2c-2f4a-a8cfd7b903a9@landley.net>
 <BN7PR02MB4194007550E66EBE877625A6B8E19@BN7PR02MB4194.namprd02.prod.outlook.com>
 <BYAPR02MB55091DE5B976956075B46FADBEE19@BYAPR02MB5509.namprd02.prod.outlook.com>
 <8845de00-ddc7-86a3-600f-6ede81e168c2@landley.net>
Message-ID: <8192e9bb-a0de-1b2a-271c-ac7323be8244@landley.net>
Date: Mon, 26 Jul 2021 03:54:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8845de00-ddc7-86a3-600f-6ede81e168c2@landley.net>
Content-Type: multipart/mixed; boundary="------------2E95BAA3CD04544C5187BEC7"
Content-Language: en-US
Received-SPF: none client-ip=2607:f8b0:4864:20::22e;
 envelope-from=rob@landley.net; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.091, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------2E95BAA3CD04544C5187BEC7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 7/26/21 2:57 AM, Rob Landley wrote:
> Anyway... it doesn't look like qemu-system-hexagon (softmmu) its currently in
> vanilla qemu? Is there a public fork that has this somewhere?

I did a little wild flailing to get ./configure to give me a qemu-system-hexagon
option (patch attached), I.E. just enough to get meson to shut up and quite
possibly still missing something important. (Is this python? It looks kind of
like python.)

Unfortunately after liberally cribbing from the cris architecture (which seems
like the simplest one) I'm left with several new C files to implement, all
currently zero length in the patch:

  hw/hexagon/boot.c
  hw/hexagon/hexagon_comet.c
  target/hexagon/machine.c
  target/hexagon/mmu.c

(In theory there's a "none" board on all the current qemu-system architectures,
but I've never figured out what to DO with those...)

All this raises two problems:

1) I dunno how the hexagon mmu works. (I can presumably read the kernel code and
reverse engineer what that's looking for, but it would be really nice not to
_have_ to?)

2) What's a comet board? (Memory layout? I/O devices? I guess all I need for
serial console on initramfs is a contiguous block of DRAM, timer interrupt to
drive the scheduler, and a serial port. I keep thinking there should be a way to
tell the "none" board to add that stuff from the command line... but dunno how.
"map DRAM here". "add this clock hardware at here". "add this kind of serial
port at here." "call elf_load on this file and start executing at its entry
point"...)

3) Reading the arch/hexagon kernel stuff ala "so what IS in a comet board"...
CONFIG_HEXAGON_COMET is only ever used to guard one #define in a header file:

  arch/hexagon/include/asm/timer-regs.h:#define RTOS_TIMER_REGS_ADDR

Which is then used to initialize structure members in arch/hexagon/kernel/time.c
without any sort of guard there, and no it isn't #defined to 0 by default
anywhere I can see? And of course obj-y += time.o in
arch/hexagon/kernel/Makefile has no config guard there either. So if it wasn't
set, the build would break. And that's currently all the symbol does?

Anyway, I still hope somebody else has already done most of this in a git tree
somewhere. :)

Rob

--------------2E95BAA3CD04544C5187BEC7
Content-Type: text/x-patch; charset=UTF-8;
 name="hexagon-softmmu-skeleton.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="hexagon-softmmu-skeleton.patch"

diff --git a/default-configs/devices/hexagon-softmmu.mak b/default-configs/devices/hexagon-softmmu.mak
new file mode 100644
index 0000000000..c07ed1132f
--- /dev/null
+++ b/default-configs/devices/hexagon-softmmu.mak
@@ -0,0 +1,5 @@
+# Default configuration for hexagon-softmmu
+
+# Boards:
+#
+CONFIG_HEXAGON_COMET=y
diff --git a/default-configs/targets/hexagon-softmmu.mak b/default-configs/targets/hexagon-softmmu.mak
new file mode 100644
index 0000000000..003ed0a408
--- /dev/null
+++ b/default-configs/targets/hexagon-softmmu.mak
@@ -0,0 +1 @@
+TARGET_ARCH=hexagon
diff --git a/hw/hexagon/Kconfig b/hw/hexagon/Kconfig
new file mode 100644
index 0000000000..9ae8a5ce30
--- /dev/null
+++ b/hw/hexagon/Kconfig
@@ -0,0 +1,2 @@
+config HEXAGON_COMET
+    bool
diff --git a/hw/hexagon/boot.c b/hw/hexagon/boot.c
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/hw/hexagon/hexagon_comet.c b/hw/hexagon/hexagon_comet.c
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/hw/hexagon/meson.build b/hw/hexagon/meson.build
new file mode 100644
index 0000000000..83f23f5368
--- /dev/null
+++ b/hw/hexagon/meson.build
@@ -0,0 +1,5 @@
+hexagon_ss = ss.source_set()
+hexagon_ss.add(files('boot.c'))
+hexagon_ss.add(when: 'CONFIG_HEXAGON_COMET', if_true: files('hexagon_comet.c'))
+
+hw_arch += {'hexagon': hexagon_ss}
diff --git a/target/hexagon/machine.c b/target/hexagon/machine.c
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/target/hexagon/mmu.c b/target/hexagon/mmu.c
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/hw/Kconfig b/hw/Kconfig
index 805860f564..7cfd7db690 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -62,6 +62,7 @@ source sparc/Kconfig
 source sparc64/Kconfig
 source tricore/Kconfig
 source xtensa/Kconfig
+source hexagon/Kconfig
 
 # Symbols used by multiple targets
 config TEST_DEVICES
diff --git a/hw/meson.build b/hw/meson.build
index ba0601e36e..f43c4bacdd 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -46,6 +46,7 @@ subdir('alpha')
 subdir('arm')
 subdir('avr')
 subdir('cris')
+subdir('hexagon')
 subdir('hppa')
 subdir('i386')
 subdir('m68k')
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 6fd9360b74..aef434421f 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -176,3 +176,7 @@ hexagon_ss.add(files(
 ))
 
 target_arch += {'hexagon': hexagon_ss}
+
+hexagon_softmmu_ss = ss.source_set()
+hexagon_softmmu_ss.add(files('mmu.c', 'machine.c'))
+target_softmmu_arch += {'hexagon': hexagon_softmmu_ss}

--------------2E95BAA3CD04544C5187BEC7--

