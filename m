Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7642E4E1E25
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 23:22:30 +0100 (CET)
Received: from localhost ([::1]:32982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3wT-0005si-4r
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 18:22:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nW3vA-0005CY-Ps
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 18:21:08 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:45253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nW3v7-0007Ye-8Y
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 18:21:08 -0400
Received: from [192.168.100.1] ([82.142.28.230]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M6lxY-1nSE9r1F7u-008HYf; Sun, 20 Mar 2022 23:20:37 +0100
Message-ID: <183f9699-62a1-9392-fc61-9d74db66f6c5@vivier.eu>
Date: Sun, 20 Mar 2022 23:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.0] linux-user: Fix syscall parameter handling for
 MIPS n32
Content-Language: fr
To: WANG Xuerui <xen0n@gentoo.org>, qemu-devel@nongnu.org
References: <20220320052259.1610883-1-xen0n@gentoo.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220320052259.1610883-1-xen0n@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QtZVouKLVvu8geDiHtvoUMeBmQK4DUYPaBqnY75O2Anpg1FLXbQ
 Qi4nmKbe36TgB5ssjd1hh2v1wfGFoemnb0mEwDWTvV2gE2RlMKuv3OxpwOC6Fobq2hFCptp
 RqrDbX77C7WXNXGKa8cqnmEtC0rMjH9jkZwc5olv+RzFp5t6sVi1Vq1Qidx4Ebpr3lPqL5l
 Gyt4Yy6A6qsXjfl9dKcNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vc5OGdBWIA0=:7RQ6QkMTvfuaD87JXA7t8P
 JeKfodA5iApUn1wSj0SHTRCy6+BZg+IESPpYp6mS6pLSWqZ7a4iDWU6Sr84JkCmOPE124G67G
 fQToSEDJZ5Fmmm3vdm61XaLXMebnwjiwOpVcRPf5KpbePSSSZ5GApeTSZkvhKS7zpm8gqR2JJ
 DmjI3Srs7nY1HR20OTZWFBL7OJcDhNBJOOLJpoVf3JM9nAFAXfeTj0lR5IivjovMFaYRI7rGE
 DZ7jRKbXOmktZ2KzDYXhwVfl+cpYftrNND17WDmdx3ToPIcamccDXHtJb25i1mQsc/AulgNaS
 Oc88cbMhsnp4BV/GZ9COQSwO6xo5URGOzBP1/AigH4MminNOSFQVr0ZIqIzmhIV0T5+Jw/Ayz
 mKi70lQVaXfkUE5dEXFACfCDNZ6w8oAhkvr0XLMmxMvie2mzrd1CaIlfWrnuqFt/Gg07f1MuI
 8hfHoEoxnSQ9rl7weCMykUEUDudrcZ+dNxDw2DpF/SlvtrPku5U2ddFKf6nErpPH4wYfOyWYk
 TXGpsd972e5xy2LDPRD0JJT7IspOpyyK0L+VGkJb32Y3zyHnGIb1sdqkwvSFWjLYFUPTLe5X+
 WNZ2OQh6fV28HvWiblygkR1UA1tYx+O3W6NvtZquY6TOkFqCIBy9hSTQ8zKhlFiyh2lD19c2A
 WB0rIOZbGSWlCRt+nzTrM/mEf7tV7ChhX2aR4F5Q//Wy8sCwyb8NTAfUakfQ4R0bHvAM=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Andreas_K_=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/03/2022 à 06:22, WANG Xuerui a écrit :
> The MIPS n32 ABI is basically n64 with the address space (i.e. pointer
> width) shrinked to 32 bits. Meanwhile the current code treats it as
> o32-like based on TARGET_ABI_BITS, which causes problems with n32
> syscalls utilizing 64-bit offsets, like pread64, affecting most (if not
> all) recently built n32 binaries.
> 
> This partially solves issue #909 ("qemu-mipsn32(el) user mode emulator
> fails to execute any recently built n32 binaries"); with this change
> applied, the built qemu-mipsn32el is able to progress beyond the
> pread64, and finish _dl_start_user for the "getting ld.so load libc.so"
> case. The program later dies with SIGBUS, though, due to _dl_start_user
> not maintaining stack alignment after removing ld.so itself from argv,
> and qemu-user starting to enforce alignment recently, but that is
> orthogonal to the issue here; the more common case of chrooting is
> working, verified with my own-built Gentoo n32 sysroot. (Depending on
> the exact ISA used, one may have to explicitly specify QEMU_CPU, which
> is the case for my chroot.)
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/909
> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Andreas K. Hüttel <dilfridge@gentoo.org>
> ---
> 
> P.S. This patch is done with my Gentoo hat on, so I'm not using my
> usual xen0n.name address. I'd like to add a mailmap entry for correct
> shortlog display though, but it seems there's no category for "merely
> preference" mappings yet. What should I do in this case?
> 
>   linux-user/user-internals.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 


Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


