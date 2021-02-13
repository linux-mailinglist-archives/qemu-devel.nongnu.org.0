Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4682C31AD67
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 18:41:40 +0100 (CET)
Received: from localhost ([::1]:48582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAyvK-0000Aa-OT
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 12:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAyuF-0008Br-N5
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 12:40:35 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:44211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAyu4-0001KX-3h
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 12:40:29 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MF45G-1l4QNS2zxA-00FVf4; Sat, 13 Feb 2021 18:40:14 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <b71cbfb68c227ae999e8caa5e247d5bb93ddad43.camel@linuxfoundation.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [RFC PATCH] linux-user/mmap: Return EFAULT for invalid addresses
Message-ID: <4309ac79-d729-682c-b3e2-7d657869566c@vivier.eu>
Date: Sat, 13 Feb 2021 18:40:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b71cbfb68c227ae999e8caa5e247d5bb93ddad43.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xRh2YUAMGSb7VqfpZEJYgjRPThVAOzZqEjkkw0L7gBHUHWJCQNg
 nKVIa8izk547Od/Cm8Ztw3+qGgV8OJEe68jv9QKciT2cuCuQ2/bapnzD5+zXGhzMkliVgPB
 NPfp6e61DkoaEbaZFeUJJKgk2SGHBrAMrNaTdiZBxiiB5ejdva64C+1KJ79+/KV4sdtvXws
 F56pvlRThp+7GfReTHGhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lhfnbnYmRSE=:KAv1+1b27RtFLlUdoNub9d
 gPsDRXQft6WurKv34c7z7TUZq/0LGhA0MeWDsummER2koeIhHI1A4JD4AnHyj08R/wT3PkpVx
 8wtBjoZfg5n092AHTthCHU76XuaeDVYQYvvEFbPGasnIFz2qVVms87TfND0iVmKyOheF2U16m
 GVbQwe62+dgeOy6MjIuE87thhFHOQCh3xcxgvpE2nPbIdnGkcQhdM+97qKjeYN4jLVP1Oxl4l
 PZeWcVyuryD2TZLEJ4RcILusxaMokSogoREuM+ZDJ7StpjVAS8gva1yjFatme0tXsooj9kWzZ
 zyWN3XFaOY7H4nHGNGIGgDnEifG43RDxbHAukgmdE4wROcWVehpInVopX65cJZZmZKkjZTU7n
 f/SjB+fmzfk1YDIrJvj3AD5YbgyWLleoYrj/TahnArc15BVsVBumo9ebsR9/g
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/01/2021 à 18:46, Richard Purdie a écrit :
> When using qemu-i386 to run gobject introspection parts of a webkitgtk 
> build using musl as libc on a 64 bit host, it sits in an infinite loop 
> of mremap calls of ever decreasing/increasing addresses.
> 
> I suspect something in the musl memory allocation code loops indefinitely
> if it only sees ENOMEM and only exits when it hits EFAULT.
> 
> According to the docs, trying to mremap outside the address space
> can/should return EFAULT and changing this allows the build to succeed.
> 
> There was previous discussion of this as it used to work before qemu 2.11
> and we've carried hacks to work around it since, this appears to be a
> better fix of the real issue?
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> 
> Index: qemu-5.2.0/linux-user/mmap.c
> ===================================================================
> --- qemu-5.2.0.orig/linux-user/mmap.c
> +++ qemu-5.2.0/linux-user/mmap.c
> @@ -727,7 +727,7 @@ abi_long target_mremap(abi_ulong old_add
>           !guest_range_valid(new_addr, new_size)) ||
>          ((flags & MREMAP_MAYMOVE) == 0 &&
>           !guest_range_valid(old_addr, new_size))) {
> -        errno = ENOMEM;
> +        errno = EFAULT;
>          return -1;
>      }
>  
> 
> 

I agree with that, the ENOMEM is returned when there is not enough virtual memory (the
mmap_find_vma() case).

According to the manpage, EFAULT is returned when old_addr and old_addr + old_size is an invalid
address space.

So:

    if (!guest_range_valid(old_addr, old_size)) {
        errno = EFAULT;
        return -1;
    }

But in the case of new_size and new_addr, it seems the good value to use is EINVAL.

So:

   if (((flags & MREMAP_FIXED) && !guest_range_valid(new_addr, new_size)) ||
       ((flags & MREMAP_MAYMOVE) == 0 && !guest_range_valid(old_addr, new_size))) {
        errno = EINVAL;
        return -1;
    }

Did you try that?

Thanks,
Laurent

