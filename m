Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFB4162277
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 09:38:38 +0100 (CET)
Received: from localhost ([::1]:58274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3yOr-0003P3-Tv
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 03:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34939)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j3yNt-0002qI-JQ
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 03:37:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j3yNs-0000ie-9n
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 03:37:37 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:48753)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j3yNs-0000iO-1C; Tue, 18 Feb 2020 03:37:36 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MMp08-1inXzD1u5s-00IoV8; Tue, 18 Feb 2020 09:36:59 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200217223558.863199-1-laurent@vivier.eu>
 <80c66cb5-3f04-5066-8be4-a53ece4f500f@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH 00/22] linux-user: generate syscall_nr.sh
Message-ID: <d2d57fb3-7b9f-71e7-57be-ae6b37cd47a1@vivier.eu>
Date: Tue, 18 Feb 2020 09:36:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <80c66cb5-3f04-5066-8be4-a53ece4f500f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zkUDoKjR6uUY9rHINCxW3obYSDH8cAPGL9eqvXU6y1UKxEnaiDZ
 OJkHlcRfrRDzHFv+/YEMue8ho2KxujTjLueJ6ttOK6y2xQPtjVP2AMdf28R5qHcaeGnA8W2
 peT5H2bzxxgfr/bOtSnl2MM/9CkgzSu/JM/p6QH3OebSJlhROi1+bgEgCOy+nXW5yN3t3sJ
 PTg5YAPKVP2EA11+4WAGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ghp9vNzLDrQ=:AETZDx1feomwSGfdGfus21
 2X4Daj17BPcJD1grAlvficU5GTx+hR8tSs7v1YrVoX0dD2ETNgJMGnVu3RB6Yp5gcsfeaYZTw
 mbaS/TLBt3tzpbEDNVkEa6k5AczGCorbmxw6OBtbOuuGNfSmZ/yPD3Cszf+USKoYyHfahfiBK
 wQLIpgxlslGorJ5IPwYuS8/ITCUnskr4JpYm9st0Mx+WhXglgJjwZcShc5h0xRgc7cgEbhBtk
 trmCQ7i/hoy5ahdxY009JVrchKfX/ClmsWuW/Eqt8OaUuLa3IjXOMi2bxWcn5Z3qrCkKSqSZ5
 qYPtq0M5L9YtetD2q15CWvE4z833Fx1PInjGMEY7SWOLkv4wwDeWzBe+ihBBCtHL5mqKyD642
 3zzr2iVEeJVr+deX4KcieQ1Dfl8gSdEc+eETv6qADa7AZy5Gxz3cF+nLpubfFbu+KGRXi4C3k
 Q8ciRQEA54uxjKNqyYWZ0RQyZA6I3sNFsIDp16vGaPaATbcHYrTvgnVZAq14v1uGk1P0VxWGv
 lDdibx9gYFWxGLKRrjj4+qRWCqdRrayoMPLIlIoVcc+kxA4sR+Nvk33dz4VzYeFhXXmixSzzg
 cNsnvH/cDEg82ABvLD5gyVRMiRbBbYHEtY3KRkh6Tfq6N7INvRwerNTJFuNpVDosxkMIQpwKP
 kWX6D3JXloDxRq0c/4mSVzu2p0gMW5/CO9tX7fsf7+W3N3wodhhzGh/KFiv99geibeaPWhcWp
 AEcO3691WlCDgP4THLDxsVM6zw+x4pBa718U2s4Od7NT7hzM94osK/A7/9lWnXalmGzD3CNyO
 YdN/h6aCQ9EvxCMGlmznVfm3CU2VCEnSaZrY9Np3q8FfxDI6LiixvdK2lHACGN2uIrFFrbc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
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
Cc: Cornelia Huck <cohuck@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-s390x@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/02/2020 à 07:13, Philippe Mathieu-Daudé a écrit :
> On 2/17/20 11:35 PM, Laurent Vivier wrote:
>> This series copies the files syscall.tbl from linux v5.5 and generates
>> the file syscall_nr.h from them.
>>
> [...]
>> Laurent Vivier (22):
>>    linux-user: introduce parameters to generate syscall_nr.h
>>    linux-user,alpha: add syscall table generation support
>>    linux-user,hppa: add syscall table generation support
>>    linux-user,m68k: add syscall table generation support
>>    linux-user,xtensa: add syscall table generation support
>>    linux-user,sh4: add syscall table generation support
>>    linux-user,microblaze: add syscall table generation support
>>    linux-user,arm: add syscall table generation support
>>    linux-user,ppc: split syscall_nr.h
>>    linux-user,ppc: add syscall table generation support
>>    linux-user,s390x: remove syscall definitions for !TARGET_S390X
>>    linux-user,s390x: add syscall table generation support
>>    linux-user,sparc,sparc64: add syscall table generation support
>>    linux-user,i386: add syscall table generation support
>>    linux-user,x86_64: add syscall table generation support
>>    linux-user,mips: add syscall table generation support
>>    linux-user,mips64: split syscall_nr.h
>>    linux-user,mips64: add syscall table generation support
>>    linux-user,scripts: add a script to update syscall.tbl
>>    linux-user: update syscall.tbl from linux 0bf999f9c5e7
>>    linux-user,mips: move content of mips_syscall_args
>>    linux-user,mips: update syscall-args-o32.c.inc
> 
> I suppose the patch subject was generated and you meant to use
> "linux-user/" instead of "linux-user,". Is that right?
> 

No, the idea is they touch "linux-user" subsystem and "ARCH" subsystem,
not especially the "linux-user/ARCH" directory

Thanks,
Laurent

