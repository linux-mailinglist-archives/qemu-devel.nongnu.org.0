Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFD8189D79
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 14:58:57 +0100 (CET)
Received: from localhost ([::1]:51054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEZDj-0000GN-RE
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 09:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jEZCq-0008ED-I5
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 09:58:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jEZCo-00076t-Vu
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 09:58:00 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:41057)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jEZCo-000736-OH
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 09:57:58 -0400
Received: by mail-oi1-x233.google.com with SMTP id b17so10837244oic.8
 for <qemu-devel@nongnu.org>; Wed, 18 Mar 2020 06:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3scQAFUofLfnwl8kMNx11SYpzRjarR/rQ3TimJQiffo=;
 b=umW27f/DN5qOShrNs1kioRVRO1/Uoqgr1jNZ2EUNv22cuvL8IHzlznzkqJCceNQKaK
 QMEzCKhpDzw2iACHlGXBFPlSy0jZtFgg0WKf0mGzZnFSwRI3W8pMwssXN1huRGgdtZZO
 tXx9I38VVJs0iPaHQ3tUH0DGqKVjMjV7Wqqi7tbaPijbThTa0IRlHlFhYkSs5r54ot1Q
 fLNyvKvdk5LEtIVeIUTtZV4ZSd25f4Icl9UhT4zu9mOFbY2eGgZupbJZ7ngKGAxSBmx3
 W1+q6LsWHSPVSFrQNRpu1nWlr95r/9QOneEgbQXeRBcoqAzj+SB6tlNUlAFIRzIyOqO8
 PLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3scQAFUofLfnwl8kMNx11SYpzRjarR/rQ3TimJQiffo=;
 b=BBMaQQvG9Ylmj/jNmz2Jx1rDV3+MlCtQ2yIDGSCYMgAwWr8lZAZFHYMBAh+gtUoPCT
 BWEKLtsg4DkQRYa+duQzdFH8Om6616EoYa+Bo0fMByxc6RXcx0kg2zqiU57vgRYtrVTz
 Aj49hHnPWQf/2K4gdC+oaLsAmka7/L1+6RqeIbC+ctD2keZUJY7hcx+/TfuXAeXmR0az
 cJd35jfdFMHLcX6+ICKSfAS8S7e9p2iuTEGHmR4z7s7my1votahUsH7sTqAv8yJwYErf
 EmcgHcr1dnQldnNg293SpYtfuPiZKS9l4sfGvUvTqtJAvuklwbmA98BsuQ5GEys1wOHF
 g/Ow==
X-Gm-Message-State: ANhLgQ0NXZlb+SCsY0nG0tWYgVEmUdjyxMqH7ZFMhu4RwQG9APUw8O1L
 /skvjUrExtTovLSADv+kXgrpEVcu0PnPc40CCd7GCA==
X-Google-Smtp-Source: ADFU+vvlfrn6XAKiOdif+cFDVi4zOdFnwdRm3M6jNc96UOF5fnw0OoA5nE7m47g3RdHngSZqf/vzrpiVWkWEJsERQE4=
X-Received: by 2002:aca:5b07:: with SMTP id p7mr3141678oib.146.1584539877656; 
 Wed, 18 Mar 2020 06:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200317155116.1227513-1-laurent@vivier.eu>
In-Reply-To: <20200317155116.1227513-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Mar 2020 13:57:46 +0000
Message-ID: <CAFEAcA9Pd6D6xaqN7XfOwRANxm=4uOYmdaBoeQiX4_Z-bXEi9g@mail.gmail.com>
Subject: Re: [PULL v2 00/37] Linux user for 5.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::233
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
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Mar 2020 at 16:05, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 373c7068dd610e97f0b551b5a6d0a27cd6da4506:
>
>   qemu.nsi: Install Sphinx documentation (2020-03-09 16:45:00 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-5.0-pull-request
>
> for you to fetch changes up to 85db278520fd800d8e8de9a527c8f0e1a962055e:
>
>   linux-user, openrisc: sync syscall numbers with kernel v5.5 (2020-03-17 16:36:17 +0100)
>
> ----------------------------------------------------------------
> update syscall numbers to linux 5.5 (with scripts)
> add futex_time64/clock_gettime64/clock_settime64
> add AT_EXECFN
> Emulate x86_64 vsyscalls
>
> v2: guard copy_to_user_timezone() with TARGET_NR_gettimeofday
>     remove "Support futex_time64" patch
>     guard sys_futex with TARGET_NR_exit
>
> ----------------------------------------------------------------

My set of "run ls for various architectures" linux-user tests
https://people.linaro.org/~peter.maydell/linux-user-test-pmm-20200114.tgz
fails with this pullreq:

e104462:bionic:linux-user-test-0.3$
/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/x86_64-linux-user/qemu-x86_64
-L ./gnemul/qemu-x86_64 x86_64/ls -l dummyfile
qemu: 0x40008117e9: unhandled CPU exception 0x101 - aborting
RAX=000000000000003f RBX=000000006ffffe34 RCX=00000040008004c0
RDX=0000004000813180
RSI=0000000000000064 RDI=00000040007ffff0 RBP=000000006fffff40
RSP=00000040007fffe8
R8 =0000000000000000 R9 =00000040008004fe R10=0000004000801a18
R11=0000004000801260
R12=0000004000800240 R13=0000000000000008 R14=0000000000400040
R15=00000040008032d0
RIP=00000040008117e9 RFL=00000246 [---Z-P-] CPL=3 II=0 A20=1 SMM=0 HLT=0
ES =0000 0000000000000000 00000000 00000000
CS =0033 0000000000000000 ffffffff 00effb00 DPL=3 CS64 [-RA]
SS =002b 0000000000000000 ffffffff 00cff300 DPL=3 DS   [-WA]
DS =0000 0000000000000000 00000000 00000000
FS =0000 0000000000000000 00000000 00000000
GS =0000 0000000000000000 00000000 00000000
LDT=0000 0000000000000000 0000ffff 00008200 DPL=0 LDT
TR =0000 0000000000000000 0000ffff 00008b00 DPL=0 TSS64-busy
GDT=     000000400091a000 0000007f
IDT=     0000004000919000 000001ff
CR0=80010001 CR2=0000000000000000 CR3=0000000000000000 CR4=00000220
DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000
DR3=0000000000000000
DR6=00000000ffff0ff0 DR7=0000000000000400
EFER=0000000000000500
qemu:handle_cpu_signal received signal outside vCPU context @ pc=0x602e5482


thanks
-- PMM

