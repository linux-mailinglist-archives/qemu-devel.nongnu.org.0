Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB1E33F910
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:23:20 +0100 (CET)
Received: from localhost ([::1]:40294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMblH-0007Gz-PT
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMbKg-0005zt-CP
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:55:51 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMbKd-0001ZH-9r
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:55:49 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso3992261wmi.3
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 11:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6GwYrg2spNUWYaTssNEChugaP3Sfjdva8S2Q7UgDQtA=;
 b=A1pL7xF44jkDsy8tk+BM2bgLTiGRy3jgCriMOdvDICpkLYj9MTFhHezC4Ozr1eOWQE
 7vmeKSV1zZWmQeFsGULQlPM/q3rK9Om8wwch26JUhBWE2swZBJyepAXOba1atbCFaXQm
 kHzpXd7OUgpQDmzx+5nTxVL0ETVnoxzCoFfvnFKU26EIFZFhZ+TrfC1ZyAymwjSPzYXt
 +FHSMU9lMQXALPEt2hhH67KautI6oLus4tAZjQD4fLb0j5WAF9No/CMuAi8TH07Mmi4J
 kOnntxc2vTn4XX6kkWBoZZ4iJzSqNEOHPPi7pSDsq2E+tXJTya8q68+w5QHvBs0Fuxhd
 +Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6GwYrg2spNUWYaTssNEChugaP3Sfjdva8S2Q7UgDQtA=;
 b=p1aIstKTASEQH5ZbjBjHy67Aq/zfG2bT3TxcKrQSKD8C9pIMoVLvsKCHTCuf8JC8CT
 fSId1knrjprGLWiXPhQALFIld/ifQ1ZTI63wxKexSeMspAwfSX8tRb82dmwhI7eoh9dh
 4tL252RoIH/wGtb7KOIZmn3PmXD4mbAwqm2YAoUSEeCflwA/T5GNTNkeW3bmgGxEeaLv
 Ohn3s887IgJ8emifaPlxlvcrvonwkphWjs9ynssjsnrLz/GCdvJBjB8C/a/8FHptJ9Pk
 2ohTcwU/AtUdUi2SBcjDeyIyf/WxDTlgdOF9IPENkmp10s/OcOwBvOdDiUOiSxX89Jv2
 ofLA==
X-Gm-Message-State: AOAM533XwJaPbqVK63EO7V57JTZiOm/SX5hOnFhVUjakpyjlBToEWq9J
 WByKTpPTKLX+a72q/VvRtsI=
X-Google-Smtp-Source: ABdhPJzqr3bUeVJhmh9I6xJj6WtRjdu5dOxCO+uzfHeniNU//F9hnH4lDK0fUwWAXMs4PQPtUdu5eQ==
X-Received: by 2002:a05:600c:4013:: with SMTP id
 i19mr225806wmm.33.1616007345389; 
 Wed, 17 Mar 2021 11:55:45 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l15sm3332534wme.43.2021.03.17.11.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 11:55:44 -0700 (PDT)
Subject: Re: [RFC PATCH 32/42] docker: Add gentoo-mipsr5900el-cross image
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-33-f4bug@amsat.org>
 <20210215115957.GG1542881@redhat.com> <YCp7Ce6ELbLFvRXZ@sx9>
 <ebbdecd9-e599-1a4b-60e8-3464afa4a20e@amsat.org>
 <21217ef4-91d8-6877-5d78-bb78e00773d8@amsat.org>
 <alpine.DEB.2.21.2103121741460.33195@angie.orcam.me.uk>
 <d0401476-0b3c-d7ce-8d0f-aa9b348da4fe@amsat.org>
 <alpine.DEB.2.21.2103122053200.33195@angie.orcam.me.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4a79a00b-7be9-deec-89de-941a73454f77@amsat.org>
Date: Wed, 17 Mar 2021 19:55:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2103122053200.33195@angie.orcam.me.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Maciej, Alex,

On 3/12/21 9:04 PM, Maciej W. Rozycki wrote:
> On Fri, 12 Mar 2021, Philippe Mathieu-Daudé wrote:
> 
>>> but your two options to 
>>> choose from are:
>>>
>>> 1. Build for the soft-float ABI (`-msoft-float') where any FP calculations 
>>>    are compiled such as to be made by the CPU using integer arithmetic.
>>
>> With the Debian toolchain I get:
>>
>> /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No
>> such file or directory
>>  #include <bits/libc-header-start.h>
>>           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
>  You need to have a soft-float multilib available.  You can use:
> 
> $ gcc -print-multi-lib
> 
> to see what multilibs are available.  You'd have to have one that includes 
> `-msoft-float' and `-mabi=n32' both at a time.  If there's no such one, 
> then you'll have to build your own cross-compiler (including soft-float 
> libc).

For Alex:

I tried Maciej suggestion using:

-- >8 --
diff --git a/tests/docker/dockerfiles/debian10.docker
b/tests/docker/dockerfiles/debian10.docker
index d034acbd256..42933538a49 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -23,6 +23,7 @@ RUN apt update && \
         ccache \
         clang \
         dbus \
+        gcc-multilib \
         gdb-multiarch \
         gettext \
         git \
---

Then used qemu/debian-mipsel-cross.

Maciej, I tried your suggestion as follow:

$ mipsel-linux-gnu-gcc --version
mipsel-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0
Copyright (C) 2018 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

$ mipsel-linux-gnu-gcc -print-multi-lib
.;
n32;@mabi=n32
64;@mabi=64

soft-float is not listed, but:

$ touch a.c
$ mipsel-linux-gnu-gcc -mabi=n32 -march=r5900 -msoft-float -c a.c
$ file a.o
a.o: ELF 32-bit LSB relocatable, MIPS, N32 MIPS-III version 1 (SYSV),
not stripped
$ readelf -h a.o
ELF Header:
  Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF32
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              REL (Relocatable file)
  Machine:                           MIPS R3000
  Version:                           0x1
  Entry point address:               0x0
  Start of program headers:          0 (bytes into file)
  Start of section headers:          456 (bytes into file)
  Flags:                             0x20920026, pic, cpic, abi2, 5900,
mips3
  Size of this header:               52 (bytes)
  Size of program headers:           0 (bytes)
  Number of program headers:         0
  Size of section headers:           40 (bytes)
  Number of section headers:         13
  Section header string table index: 12

So we can compile, but:

$ mipsel-linux-gnu-gcc -mabi=n32 -march=r5900 -msoft-float -L
/usr/lib/mipsel-linux-gnu tests/tcg/mips/test-r5900-dmult.c
/usr/lib/gcc-cross/mipsel-linux-gnu/8/../../../../mipsel-linux-gnu/bin/ld:
/usr/lib/../lib32/Scrt1.o: relocations in generic ELF (EM: 3)
/usr/lib/gcc-cross/mipsel-linux-gnu/8/../../../../mipsel-linux-gnu/bin/ld:
/usr/lib/../lib32/Scrt1.o: error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status

$ mipsel-linux-gnu-readelf -h /usr/lib/mipsel-linux-gnu/Scrt1.o
ELF Header:
  Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF32
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              REL (Relocatable file)
  Machine:                           MIPS R3000
  Version:                           0x1
  Entry point address:               0x0
  Start of program headers:          0 (bytes into file)
  Start of section headers:          908 (bytes into file)
  Flags:                             0x70001007, noreorder, pic, cpic,
o32, mips32r2
  Size of this header:               52 (bytes)
  Size of program headers:           0 (bytes)
  Number of program headers:         0
  Size of section headers:           40 (bytes)
  Number of section headers:         15
  Section header string table index: 14

The multilib documentation is scarce :)

Also I wondered if I could abuse the linker a bit, knowing the resulting
binary would be crap due to ABI mismatch, and got:

$ mipsel-linux-gnu-gcc -march=r5900 -msoft-float -o test-r5900-dmult
test-r5900-dmult.o
collect2: fatal error: ld terminated with signal 11 [Segmentation
fault], core dumped
compilation terminated.
/usr/lib/gcc-cross/mipsel-linux-gnu/8/../../../../mipsel-linux-gnu/bin/ld:
test-r5900-dmult.o: ABI is incompatible with that of the selected emulation
/usr/lib/gcc-cross/mipsel-linux-gnu/8/../../../../mipsel-linux-gnu/bin/ld:
failed to merge target specific data of file test-r5900-dmult.o
/usr/lib/gcc-cross/mipsel-linux-gnu/8/../../../../mipsel-linux-gnu/bin/ld:
BFD (GNU Binutils for Debian) 2.31.1 assertion fail
../../bfd/elfxx-mips.c:3566

It seems Debian default packages aren't ready for QEMU needs.

Alex, the other options I'm thinking of are:

- Have you build/upload the gentoo-mipsr5900el-cross container

- Commit the test-r5900-dmult binary to the repository

- Craft a test-r5900-dmult in assembler without libc:

$ mipsel-linux-gnu-gcc -mabi=n32 -march=r5900 -msoft-float -o a a.o
-nostdlib -emain
$ readelf -h a
ELF Header:
  Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF32
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              DYN (Shared object file)
  Machine:                           MIPS R3000
  Version:                           0x1
  Entry point address:               0x102f0
  Start of program headers:          52 (bytes into file)
  Start of section headers:          1508 (bytes into file)
  Flags:                             0x20920026, pic, cpic, abi2, 5900,
mips3
  Size of this header:               52 (bytes)
  Size of program headers:           32 (bytes)
  Number of program headers:         9
  Size of section headers:           40 (bytes)
  Number of section headers:         17
  Section header string table index: 16

- Do not include r5900 test in mainstream QEMU

What do you think?

Phil.

