Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2590298ACB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 11:54:11 +0100 (CET)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX08g-0004oN-Og
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 06:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kWzvQ-0004Wq-Lh
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 06:40:28 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:60591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kWzvN-0001ug-9w
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 06:40:28 -0400
Received: from [192.168.100.1] ([82.252.139.38]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MXGak-1ktbI433le-00YfXB; Mon, 26 Oct 2020 11:40:02 +0100
Subject: Re: [PATCH 0/4] linux-user: update syscall_nr headers to Linux 5.9-rc7
To: qemu-devel@nongnu.org
References: <20200930003033.554124-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <8a9a57c3-e646-778a-225c-9a6f256b4465@vivier.eu>
Date: Mon, 26 Oct 2020 11:40:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200930003033.554124-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:buwAi8G/2gl+HQwiDTsVsd0uPwMve1Eruq6D5dMHmRtt6dw84j4
 nK8BkZYGX1ZmsPykCdSRnEeh4JiQZ0BV5c1CvN8XQy7/Fasct0j+pItmLfAztIi9Ymnl13E
 cJH9cByvAOSRotM8SML6eSdGfifZIjHWxptTg2nqJDhmP7xNN0F1kxXTwi6EJS4zmf09xyf
 eRvsQZybjtN0WiLO6NiKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:74F0LidhBpw=:cDKOObGATTbWbthp05dckZ
 Rgwl8LqjqsyAIUXZflUjizTV/D3+xnXfZVjrwjBPNSE1U8yR/70gMl6iRA9GbTdkQonNaH8mv
 lHWmsSV3hSxQWp9n2adY642+rmDX+hFvg25PPot7s9iVFVo1y/nDw17WLy/IcpNQ0Ho9rKlrF
 Ulqk1UUOhz+nhHQx10/H9wEjMW+n57//L8xcTC+u5hNGpwzGJSoeyH682/2ATWYAf0ANiXvqa
 a0svtFMEOvxYTFmEoU9CeHQpI7lgdcq+Cxgqwfho4ZeC8zXrbRLRtubgMNF7PtWbMHDyBQbCs
 hIvs6VqFiLQKn7qUiGfNjcFhi3pFZVRRpntFGM/dAC/vEEC22vqbCaj24JbCI/CgyI3sHptUs
 uRA7kYtW5ntj7P0VmI2GvdWWNvKbFr1Gs8Of0rb9iN3xAljNPoFvgwLF8bdoh
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 06:40:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/09/2020 à 02:30, Laurent Vivier a écrit :
> All the changes have been done using:
> 
> scripts/gensyscalls.sh, scripts/update-mips-syscall-args.sh and
> scripts/update-syscalltbl.sh
> 
> I've checked syscall_nr.h generated from syscall.tbl are
> always correctly generated (there have been massive changes in
> x86 targets).
> 
> The series also removes _sysctl from syscall.c as it has been
> removed from the kernel (and we didn't emulate it correctly)
> 
> Laurent Vivier (4):
>   linux-user: update syscall_nr.h to Linux 5.9-rc7
>   linux-user: update mips/syscall-args-o32.c.inc to Linux 5.9-rc7
>   linux-user: update syscall.tbl to Linux 5.9-rc7
>   linux-user: remove _sysctl
> 
>  linux-user/aarch64/syscall_nr.h        |   7 +-
>  linux-user/alpha/syscall.tbl           |   4 +-
>  linux-user/arm/syscall.tbl             |   4 +-
>  linux-user/hppa/syscall.tbl            |   8 +-
>  linux-user/i386/syscall_32.tbl         | 820 +++++++++++++------------
>  linux-user/m68k/syscall.tbl            |   4 +-
>  linux-user/microblaze/syscall.tbl      |   4 +-
>  linux-user/mips/syscall-args-o32.c.inc |   4 +
>  linux-user/mips/syscall_o32.tbl        |   8 +-
>  linux-user/mips64/syscall_n32.tbl      |   8 +-
>  linux-user/mips64/syscall_n64.tbl      |   4 +-
>  linux-user/nios2/syscall_nr.h          |   7 +-
>  linux-user/openrisc/syscall_nr.h       |   8 +-
>  linux-user/ppc/syscall.tbl             |  30 +-
>  linux-user/riscv/syscall32_nr.h        |   8 +-
>  linux-user/riscv/syscall64_nr.h        |   8 +-
>  linux-user/s390x/syscall.tbl           |   8 +-
>  linux-user/sh4/syscall.tbl             |   4 +-
>  linux-user/sparc/syscall.tbl           |   8 +-
>  linux-user/sparc64/syscall.tbl         |   8 +-
>  linux-user/syscall.c                   |   6 -
>  linux-user/x86_64/syscall_64.tbl       | 742 +++++++++++-----------
>  linux-user/xtensa/syscall.tbl          |   4 +-
>  scripts/gensyscalls.sh                 |   3 +-
>  24 files changed, 889 insertions(+), 830 deletions(-)
> 

Applied the series to my linux-user-for-5.2 branch.

Thanks,
Laurent

