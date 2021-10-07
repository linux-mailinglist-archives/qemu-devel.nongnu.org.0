Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E64425B41
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 21:01:29 +0200 (CEST)
Received: from localhost ([::1]:59734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYYdy-0001Ob-8f
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 15:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mYYc8-0000fV-R6; Thu, 07 Oct 2021 14:59:32 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:52049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mYYc6-0006mO-Sd; Thu, 07 Oct 2021 14:59:32 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N1Oft-1mw2V21q8p-012nGx; Thu, 07 Oct 2021 20:59:03 +0200
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <877deoevj8.fsf@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: Approaches for same-on-same linux-user execve?
Message-ID: <d8dc40c8-73bf-9d8d-e23b-f7054dc06292@vivier.eu>
Date: Thu, 7 Oct 2021 20:59:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <877deoevj8.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:D7ZWfmsf4Dm+3g3vz8Hi00yHHRP7z53LkHrfGGKk/KtPfyZu8eD
 O4jC4X9KeE0XCU0h6Vj+zyHh0/HNIPfmMxSxoZllTvUH2hFTHy5LxSkcWRJWTl2eOgCEKCQ
 Ra9Z+pSg5veKnfFCBC+F4+NwKNjuQkQ2bKmdfzpOEjh/Ns/4Ci5zsfGSt0T64PMoc4tZSog
 Qn3voLVHmGwLCR/MuSA/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nLovi1u1NII=:OzfrnMsdyUFtYHzV/pVcx3
 Zl2lM+wdAym2VDadmpJSxr4JH2f6TeuXXJmQcet1vzg99Ld2JkF7lWYJ+3EoZosxswOdHaPZ0
 wqkADAthyXKxw4rFZJ2zBsuQfH4s91AkBOs8Pcx77Sh5i0DcrHpn3V9EPQqXGTgixtR2I1XB2
 VD/AlK6U7pezvfTOzPopY/gEQ44MLjElIimXMCuVjhV0U17AugDg3LZ+tFsGPnERjQyurRabB
 960VaBD29l1dHfVJksAmkLCfkzlLDVH8U+oyl4kpn8ru2BMR8fjQyS7nnr4x68KE6iUgyn7cy
 WE2DvDFh61YGkrOxdcHrXqonBYLlbUR2+t93t0bTrq8IlzxqhCxijzamOT9R0tVDK/PE9zxzU
 Nqz80OYm1pTNE8akRfk5qMnWOFv7Qff4rjFyfzSOD2Eu/pLFMijRjgpqoGzfs5hD6I0k6nQZ9
 9gAiSv9Qi3Z8U2RD54r0MDq+oTah1X4doQTEy6BChglrxPcD+uUY5A+Y3QZMMGQKfNORTdP1P
 ZPzncGiQtfIWkKXkkm8dRXwWQJuBjGUm1vm1D4go+E964cU6b3j3UPWYmqbsKoSMKHNHe9d/A
 DRI5JzyLGA5bmBurD5tf4zhCQj34SUtJMztjSIqmC08SEdDWeM49yz44dZYJbUoZpyfZQXatD
 YuV62YYuErJkS864mUHFSOGEPSjTnPF+CzdNChhvizUjp2TCB6hkiJuFgOYRnAw3IAukUzb16
 4vGa8TX/SvdALQtHR8lxgFBe7hK7CqJEayPvFw==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.964,
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
Cc: assad.hashmi@linaro.org, qemu-devel@nongnu.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>, qemu-arm@nongnu.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Arnd Bergmann <arnd.bergmann@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/10/2021 à 16:32, Alex Bennée a écrit :
> Hi,
> 
> I came across a use-case this week for ARM although this may be also
> applicable to architectures where QEMU's emulation is ahead of the
> hardware currently widely available - for example if you want to
> exercise SVE code on AArch64. When the linux-user architecture is not
> the same as the host architecture then binfmt_misc works perfectly fine.
> 
> However in the case you are running same-on-same you can't use
> binfmt_misc to redirect execution to using QEMU because any attempt to
> trap native binaries will cause your userspace to hang as binfmt_misc
> will be invoked to run the QEMU binary needed to run your application
> and a deadlock ensues.
> 
> There are some hacks you can apply at a local level like tweaking the
> elf header of the binaries you want to run under emulation and adjusting
> the binfmt_mask appropriately. This works but is messy and a faff to
> set-up.
> 
> An ideal setup would be would be for the kernel to catch a SIGILL from a
> failing user space program and then to re-launch the process using QEMU
> with the old processes maps and execution state so it could continue.
> However I suspect there are enough moving parts to make this very
> fragile (e.g. what happens to the results of library feature probing
> code). So two approaches I can think of are:
> 
> Trap execve in QEMU linux-user
> ------------------------------
> 
> We could add a flag to QEMU so at the point of execve it manually
> invokes the new process with QEMU, passing on the flag to persist this
> behaviour.

Another approach can be to use ptrace(PTRACE_SYSEMU) to catch syscalls.

We need a wrapper that loads the first target binary and fork, it attach a ptrace() process and
intercept the syscalls to emulate them as we do in usermode linux.

I was thinking to this solution for instance to execute big-endian program (like ppc64) on
little-endian system (ppc64le).

But I'm not sure it fits in what you need...


> 
> Add path mask to binfmt_misc
> ----------------------------
> 
> The other option would be to extend binfmt_misc to have a path mask so
> it only applies it's alternative execution scheme to binaries in a
> particular section of the file-system (or maybe some sort of pattern?).
> 
> Are there any other approaches you could take? Which do you think has
> the most merit?

I don't know if it can apply to what you want, but I wrote years ago a binfmt namespace that applies
binfmt configuration only on a container but I didn't finish the work (it seems there can be some
security issues in what I did):

https://lore.kernel.org/lkml/20191216091220.465626-2-laurent@vivier.eu/T/

Thanks,
Laurent

