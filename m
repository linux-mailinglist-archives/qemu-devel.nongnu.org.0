Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69A731AE89
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 00:47:03 +0100 (CET)
Received: from localhost ([::1]:44640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB4cw-00066J-Gr
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 18:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB4bH-0005Pn-Df; Sat, 13 Feb 2021 18:45:21 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:43813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB4bC-0004cj-7N; Sat, 13 Feb 2021 18:45:19 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MW9zm-1lMY1I2LDG-00XayV; Sun, 14 Feb 2021 00:45:06 +0100
Subject: Re: [PATCH-for-5.2?] MAINTAINERS: Fix default-configs/ entries
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201117114656.1222555-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ac55cbf3-946d-9e51-7d33-b60a4119898d@vivier.eu>
Date: Sun, 14 Feb 2021 00:45:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201117114656.1222555-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QvZJ5p5dhtGeIM98qo0sdm5u3GDbdr8Mdxowp923+zbewz0CyVT
 CqzY5Pi3//o79nzfohq0mBtdfm5Ce8b4n2AR89mGtqEt0ODKCBzP2YT/beuJLAbB/ogtn1b
 4L7ulo9W/3B0I98sRfkRZb+fXpGjAAY11vAmnOSZyq1gyINagxTVdlV6c9WGbrL+aQW9WMr
 XKoHuPQnFqbRqwLLwLsEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8xCiZBDzSt8=:K5GnqweXS5kcGij4J55xk1
 otaYAq8hSSuqi9javirc1r6DNUHQTnzh1srjhlOIdSDTXFjR69SYW19q9OntiUXCtCZDshY7S
 d0uG32YkoIqrfd9yG/iZvV1JsKDMZFi9SeYH0cdvxeOh6cjr/FiJHrINyt09hVMVEWilSSsvL
 puxb3vl4mDO+AcXvvIXD6hTxkRqrTbwmkUupRuVnIANgCZxqJpfU5Nr126qcyue0iQn7MOBTI
 XbgvgM24VmjKb1FSmRALuIUJ1tG3RP8HXLaqOLpu1GGZVETyrWLiv5hYyQP9HzJbq6VAu+1ve
 u2NOm/jcP0oiHOR297SBLJiqj69MFSQhYauUDPTZOLYy1FBK5lCdgj2IuA1hB9hXCxKKlCwjx
 U4E8cdWlz+rNa81ggaZbfq633eH+8f2QYaqX8onwkzxgq++TGt9OZEpijLx6I4OAGFMzrgwU4
 tFvlRJlkTujN+q+6u3k5kuwhFlrQpz2ZrWAizrC5RR0HNirj9pAF
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/11/2020 à 12:46, Philippe Mathieu-Daudé a écrit :
> Update the F: line after the Meson refactor.
> 
> Fixes: 1bb4cb1c338..73362fc0b0c ("default-configs: ...")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  MAINTAINERS | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2e018a0c1da..6378b5ae416 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -87,7 +87,7 @@ S390 general architecture support
>  M: Cornelia Huck <cohuck@redhat.com>
>  M: Thomas Huth <thuth@redhat.com>
>  S: Supported
> -F: default-configs/s390x-softmmu.mak
> +F: default-configs/*/s390x-softmmu.mak
>  F: gdb-xml/s390*.xml
>  F: hw/char/sclp*.[hc]
>  F: hw/char/terminal3270.c
> @@ -226,7 +226,7 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
>  R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
>  S: Odd Fixes
>  F: target/mips/
> -F: default-configs/*mips*
> +F: default-configs/*/*mips*
>  F: disas/mips.c
>  F: docs/system/cpu-models-mips.rst.inc
>  F: hw/intc/mips_gic.c
> @@ -250,7 +250,7 @@ S: Maintained
>  F: target/moxie/
>  F: disas/moxie.c
>  F: hw/moxie/
> -F: default-configs/moxie-softmmu.mak
> +F: default-configs/*/moxie-softmmu.mak
>  
>  NiosII TCG CPUs
>  M: Chris Wulff <crwulff@gmail.com>
> @@ -260,7 +260,7 @@ F: target/nios2/
>  F: hw/nios2/
>  F: hw/intc/nios2_iic.c
>  F: disas/nios2.c
> -F: default-configs/nios2-softmmu.mak
> +F: default-configs/*/nios2-softmmu.mak
>  
>  OpenRISC TCG CPUs
>  M: Stafford Horne <shorne@gmail.com>
> @@ -353,7 +353,7 @@ F: hw/xtensa/
>  F: tests/tcg/xtensa/
>  F: disas/xtensa.c
>  F: include/hw/xtensa/xtensa-isa.h
> -F: default-configs/xtensa*.mak
> +F: default-configs/*/xtensa*.mak
>  
>  TriCore TCG CPUs
>  M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> @@ -1018,7 +1018,7 @@ AVR MCUs
>  M: Michael Rolnik <mrolnik@gmail.com>
>  R: Sarah Harris <S.E.Harris@kent.ac.uk>
>  S: Maintained
> -F: default-configs/avr-softmmu.mak
> +F: default-configs/*/avr-softmmu.mak
>  F: hw/avr/
>  F: include/hw/char/avr_usart.h
>  F: hw/char/avr_usart.c
> @@ -1047,7 +1047,7 @@ HP B160L
>  M: Richard Henderson <richard.henderson@linaro.org>
>  R: Helge Deller <deller@gmx.de>
>  S: Odd Fixes
> -F: default-configs/hppa-softmmu.mak
> +F: default-configs/*/hppa-softmmu.mak
>  F: hw/hppa/
>  F: pc-bios/hppa-firmware.img
>  
> @@ -1420,7 +1420,7 @@ F: hw/s390x/
>  F: include/hw/s390x/
>  F: hw/watchdog/wdt_diag288.c
>  F: include/hw/watchdog/wdt_diag288.h
> -F: default-configs/s390x-softmmu.mak
> +F: default-configs/*/s390x-softmmu.mak
>  T: git https://github.com/cohuck/qemu.git s390-next
>  T: git https://github.com/borntraeger/qemu.git s390-next
>  L: qemu-s390x@nongnu.org
> @@ -2792,13 +2792,13 @@ F: accel/tcg/user-exec*.c
>  BSD user
>  S: Orphan
>  F: bsd-user/
> -F: default-configs/*-bsd-user.mak
> +F: default-configs/targets/*-bsd-user.mak
>  
>  Linux user
>  M: Laurent Vivier <laurent@vivier.eu>
>  S: Maintained
>  F: linux-user/
> -F: default-configs/*-linux-user.mak
> +F: default-configs/targets/*linux-user.mak
>  F: scripts/qemu-binfmt-conf.sh
>  F: scripts/update-syscalltbl.sh
>  F: scripts/update-mips-syscall-args.sh
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


