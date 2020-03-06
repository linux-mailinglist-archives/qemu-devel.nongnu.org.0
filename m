Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA55317B2A5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 01:07:20 +0100 (CET)
Received: from localhost ([::1]:57844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jA0WN-0001WT-Gj
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 19:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jA0VS-0000N8-W2
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 19:06:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1jA0VQ-0001kC-OH
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 19:06:22 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:37709)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1jA0VO-0001gR-TY
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 19:06:19 -0500
Received: by mail-pj1-x1043.google.com with SMTP id o2so287250pjp.2
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 16:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=tDnCvKURxcqLYpOUN7T1uHnbGlZSHeALWXQ7q42VdV8=;
 b=j6goZ4qZY8+HVltCYKgKcTGLSqDPMZ/Kw5eCIP0gUNFY+6MW+A/eZWW+uMCccx9hkR
 GwczDtdnqhB40Lc/m6FoYkasWB2Gpvo3ry9UXjGSJUM4M67jhbg/+IkqmtQ3nDUwKemX
 mpBW1m7gSDoA2uBTa+ku5RDx3Uj7v912Qtcsa+/XcGvgP0799UE2+JxweC4zhZvsns18
 PQtXWfD7hYGewXAnaMsSkxbev8gcUyu55alGksMsyLgNKUc6ryxo1JMGgH3pr4+yGLXV
 RWdY2mO22PSSqZaDQb9VNBIW7QvqYkM+g4t8VWGJfoZWtPXupoRgfrPSWGZu5/ZROTxu
 FN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=tDnCvKURxcqLYpOUN7T1uHnbGlZSHeALWXQ7q42VdV8=;
 b=A/Xdn3N6nQGhEoNdROlYR8Oh19MA9MQb3JOq4338kfGkE/4FYs4dPSHSzW88UUhvww
 svFwiOhn4fjEEZjRlKz19KcMJL0UzuWX/mjU1TMH58lsqSNepciOy/Lem+/wKh4JKfdb
 S4fxuuLGgv6V6Fd5jSLxkEbi1Mmr6A9ZGu8kKszUbDvsGBGzrwU9kivUxyCEhWL/1qtn
 copmd69Lawz4ZtLe/xrNOtqQwmFY3BrWrSrMnDqxx793IiLyze3Lz0DCpRKjr/SOgi8g
 OjaEpTEVGLV7qtV50oZj1Z9Mvk9xiZ60tsTOX/KJYg084e6wxWM2h4UszjIyfndO8HNv
 xHQw==
X-Gm-Message-State: ANhLgQ13knhTqDcfp50K4Ip2dZMHU7aUQUXhDfvlafdN/zVnhqtPLQr1
 KMWbWdOofA8QrYJOPlj+52/9uA==
X-Google-Smtp-Source: ADFU+vsO6/rZcFoWLF5islgpzWtygdJLJoBPBpCOqrdxqOQJ4RUaENf+QkxtoJyGsUntn0kazOMN/Q==
X-Received: by 2002:a17:90b:110d:: with SMTP id
 gi13mr641713pjb.123.1583453176059; 
 Thu, 05 Mar 2020 16:06:16 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id d186sm15062612pfc.8.2020.03.05.16.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 16:06:15 -0800 (PST)
Date: Thu, 05 Mar 2020 16:06:15 -0800 (PST)
X-Google-Original-Date: Thu, 05 Mar 2020 16:03:19 PST (-0800)
Subject: Re: [PATCH v2 0/4] riscv: Upgrade OpenSBI to v0.6 and add 32-bit
 sifive_u bios image
In-Reply-To: <1582551584-20093-1-git-send-email-bmeng.cn@gmail.com>
CC: philmd@redhat.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, sagark@eecs.berkeley.edu,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-b2684134-a77e-4f51-9960-90472aa64256@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 Feb 2020 05:39:40 PST (-0800), bmeng.cn@gmail.com wrote:
>
> This series advances the roms/opensbi submodule to the v0.6 release,
> and builds and captures platform firmware binaries from that release.
>
> A 32-bit sifive_u bios image has also been added, so that we can have
> 32-bit test coverage for SiFive specific drivers that cannot be done
> with the 'virt' machine.
>
> Two GitLab CI jobs are added to build the OpenSBI firmware binaries.
>
> Changes in v2:
> - new patch: Upgrade opensbi from v0.5 to v0.6
> - Update the 32-bit sifive_u bios image to OpenSBI v0.6
> - new patch: Add GitLab jobs to build OpenSBI firmware binaries
>
> Bin Meng (4):
>   roms: opensbi: Upgrade from v0.5 to v0.6
>   roms: opensbi: Add 32-bit firmware image for sifive_u machine
>   riscv: sifive_u: Update BIOS_FILENAME for 32-bit
>   gitlab-ci.yml: Add jobs to build OpenSBI firmware binaries
>
>  .gitlab-ci-opensbi.yml                       |  63 +++++++++++++++++++++++++++
>  .gitlab-ci.d/opensbi/Dockerfile              |  33 ++++++++++++++
>  .gitlab-ci.yml                               |   1 +
>  Makefile                                     |   2 +-
>  hw/riscv/sifive_u.c                          |   6 ++-
>  pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin | Bin 0 -> 49472 bytes
>  pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 40984 -> 41280 bytes
>  pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 49160 -> 53760 bytes
>  pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 45064 -> 49664 bytes
>  roms/Makefile                                |   7 +++
>  roms/opensbi                                 |   2 +-
>  11 files changed, 111 insertions(+), 3 deletions(-)
>  create mode 100644 .gitlab-ci-opensbi.yml
>  create mode 100644 .gitlab-ci.d/opensbi/Dockerfile
>  create mode 100644 pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin

Thanks.  This is in the queue, aside from that somewhat pedantic issue about
the CI stuff it's good to go!

