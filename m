Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BBA1B84A7
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Apr 2020 10:28:02 +0200 (CEST)
Received: from localhost ([::1]:60688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jSGAK-0004nr-Nv
	for lists+qemu-devel@lfdr.de; Sat, 25 Apr 2020 04:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jSG9W-0004Fo-6G
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 04:27:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jSG9V-00076T-JY
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 04:27:09 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:53479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jSG9V-0006vy-0O
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 04:27:09 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmCyE-1ik5i41Hcm-00iEQX; Sat, 25 Apr 2020 10:26:56 +0200
To: Helge Deller <deller@gmx.de>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org
References: <20200424204858.GA26164@ls3530.fritz.box>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH] linux-user: Drop open-coded fcntl flags conversion in
 eventfd2 syscall
Message-ID: <56b61288-2c39-2b04-fca5-999fd6ab0f74@vivier.eu>
Date: Sat, 25 Apr 2020 10:26:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200424204858.GA26164@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:x3inSwoGxOYV/czEzSEgFWI/ZXlFPwWQKoq6zyLkfRDd5ZXCsEW
 ji5UUSi41hADSA78cFWVOJuHM2dszNsvFmPALfmtfn5ggbSZq63iN13jVFCetlm1qaXoYKh
 U2KdozsIaf+c2cJ6WJ8HHKH6kYs61FRDkPS0eSHv/F9rn/AcAG9o4R5oJ4foiRd446aRYLU
 ofybzuEtgpEx7SNMHujFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KFVdD1wGmBA=:fOvth/JqxaKDlalhtuPAo2
 1di/7weVHTDbykPS3ASfzVSBv6KzmW70Zwp2z0og/GPXIw0xw3+KISxRxluHRXuQBr3+PvFtM
 kVTWEJM+ajKd9BBbWqxsh0XOvl0KgYVjdcUUcm833vzwVGritVjozuzgr7agDNNCgsNRL26ga
 LGNw4Cw8TQdcmI+iGntW8ChFFMK8w2xgNZIbK2V/WnTQrGT7oSBytfJxCeFwFjgwO9UjV4LBP
 8JqE61gTR34xz1C0Igo/51s0S+yLwmhtL+CpogLtPgk1UoAFSUXrP2neCtMWbRQNHqP1zZNhn
 u09/xU0qSXa7SGzKxPSITdtpr35JRPX458z3oWCI28Ex3//HhUDbzDMdpWKNWRJX75XTIbdxz
 LwyUuTvzBPoJX4Mg02q4xiIIspPbNC/kDJ1A9ndIy760C7TsoPYKMW/oPA0LNaEMf4icn40UX
 hjiIXkOhHE+z844oGQ4XEqeQMX4FZbW/mo7k8f0ufCzBQNRayrOYcNNxuTe9euRrwS6berQei
 wR674LtQoTnbAw8UegNU+bZ9gAoUt9znKzp8fN7G3a/YPHsMjIjz15lJyqxSNG8uElUp0cazJ
 V8P1vHuF0Ej9dytaYXT/hWk6J0FyU0o22gtTLBizNqnm3/qIW++XUTd9bD6pRPeX0d8irdQ0P
 y6noWo0jhxlynuPcidBYLzYyQt8s8h6FB+ddPm8txctqXDbrCHqD4X3Uiz5HSAe35T3ePEFP2
 4FMDxwevDz7SS44GsvLOpyJQPNcYK0JgyssItq4o0b3w8fwtHInMW2UcHwjSnIUKHlK0I9mun
 yg4ysIfp793aR8+TjBXY34AovtfHzfaV4Tw+ZYUeHgJ3PK24j+wePXtnr6QmNcBidM+fqiN
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/25 04:27:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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

Le 24/04/2020 à 22:48, Helge Deller a écrit :
> Drop the open-coded fcntl flags conversion in the eventfd2 syscall and
> replace it with the built-in conversion with fcntl_flags_tbl.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 05f03919ff..ebf0d38321 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -11938,13 +11942,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>  #if defined(TARGET_NR_eventfd2)
>      case TARGET_NR_eventfd2:
>      {
> -        int host_flags = arg2 & (~(TARGET_O_NONBLOCK | TARGET_O_CLOEXEC));
> -        if (arg2 & TARGET_O_NONBLOCK) {
> -            host_flags |= O_NONBLOCK;
> -        }
> -        if (arg2 & TARGET_O_CLOEXEC) {
> -            host_flags |= O_CLOEXEC;
> -        }
> +        int host_flags = target_to_host_bitmask(arg2, fcntl_flags_tbl);
>          ret = get_errno(eventfd(arg1, host_flags));
>          if (ret >= 0) {
>              fd_trans_register(ret, &target_eventfd_trans);
> 

The problem here is eventfd2 doesn't take O_ flags but EFD_ flags.
Most EFD_ flags are mapped to O_ flags, but one is not:

include/linux/eventfd.h:

/*
 * CAREFUL: Check include/uapi/asm-generic/fcntl.h when defining
 * new flags, since they might collide with O_* ones. We want
 * to re-use O_* flags that couldn't possibly have a meaning
 * from eventfd, in order to leave a free define-space for
 * shared O_* flags.
 */
#define EFD_SEMAPHORE (1 << 0)
#define EFD_CLOEXEC O_CLOEXEC
#define EFD_NONBLOCK O_NONBLOCK

So I think it's better to convert them manually

Perhaps we can defined TARGET_EFD_ flags to make this clearer, I don't know.

Thanks,
Laurent

