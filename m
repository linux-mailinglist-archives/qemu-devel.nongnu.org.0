Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948CF31D0F3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:28:17 +0100 (CET)
Received: from localhost ([::1]:41240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC61A-0008V6-DG
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lC5my-0004vD-Lh
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:13:37 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:59521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lC5mw-0004j1-0W
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:13:36 -0500
Received: from [192.168.100.1] ([82.252.134.158]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MsZeX-1m1iGg41KF-00tyq3; Tue, 16 Feb 2021 20:13:30 +0100
Subject: Re: [PATCH v2] linux-user/mmap: Return EFAULT/EINVAL for invalid
 addresses
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <b71cbfb68c227ae999e8caa5e247d5bb93ddad43.camel@linuxfoundation.org>
 <4309ac79-d729-682c-b3e2-7d657869566c@vivier.eu>
 <0fb977ec30a318ace2bb1853b9cca7b8d7cfcea5.camel@linuxfoundation.org>
 <40acb232-a9da-951c-38fd-2fa1c529edd5@vivier.eu>
 <6cc082b0f12641ed38675cac776999b184c8020e.camel@linuxfoundation.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f052a7dd-012e-9011-3fb4-d22f266c6727@vivier.eu>
Date: Tue, 16 Feb 2021 20:13:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6cc082b0f12641ed38675cac776999b184c8020e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VU/sMdUPnprE3bVpeIipduGexN6WurRuROQvRdSQtXuEK4E6H56
 okXZ23lyf9XpVo0vcM+eyWjZb7V3cOPnuGCppqY802ZmA+cRi8DvCCzEwdSmBARLe12kJTK
 COCTASRE7mKo6K3zl4E+5wFvqT8sFEeXzFZLz+w7rG2a5PGHvzRzeW1yQxYAQTsvXDLX2dU
 fzcz61dxHxFtx4PS7zSMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kRjJJzbAXt8=:QkWfQj5FuMG2N76IkWbW1R
 hTRK0U9oqg70cAPpOLg+qFPQZkxqaHw5WaWsqNHjA7KwjB6RIDkGNjOKd46kqwbNQyP574yUk
 zZq+AL/W6sPmd9AyCpGwMvQr3vx5OMWiZxqs7eCwR/nKzQ7uUVt3qVJO2svfO+dalHdJ1Qenj
 b8kFTDem1/gsZY/Wff5Vnc9NG6CLEf7QCEx30gQGt0aupCu1WYAUq8fjdrOSD9wGduNMbZQYC
 BJTCMEtq7fxWYfEY26saPNpp6zdd28VdbS6oZhDsDrY3J44yNO8VDEGzBbq7ruZHN3pdU5Sw8
 wxL7CSHLJXPffxKf7D8vOS2OpEcu2AX6b6TuzkJOXksSjQMSFYWGwxnc6sbqQDi6g2u1Kk2gR
 UU+FIiUY7ITD1L5Ce89j7GSSBqGjoDldWkuh8YNiwbjk5gmxpu1KiOIUteakz
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

Le 16/02/2021 à 20:01, Richard Purdie a écrit :
> When using qemu-i386 to build qemux86 webkitgtk on musl, it sits in an
> infinite loop of mremap calls of ever decreasing/increasing addresses.
> 
> I suspect something in the musl memory allocation code loops
> indefinitely if it only sees ENOMEM and only exits when it hits other
> errors such as EFAULT or EINVAL.
> 
> According to the docs, trying to mremap outside the address space
> can/should return EFAULT and changing this allows the build to succeed.
> 
> A better return value for the other cases of invalid addresses is
> EINVAL rather than ENOMEM so adjust the other part of the test to this.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> 
> Index: qemu-5.2.0/linux-user/mmap.c
> ===================================================================
> --- qemu-5.2.0.orig/linux-user/mmap.c
> +++ qemu-5.2.0/linux-user/mmap.c
> @@ -722,12 +722,14 @@ abi_long target_mremap(abi_ulong old_add
>      int prot;
>      void *host_addr;
>  
> -    if (!guest_range_valid(old_addr, old_size) ||
> -        ((flags & MREMAP_FIXED) &&
> -         !guest_range_valid(new_addr, new_size)) ||
> -        ((flags & MREMAP_MAYMOVE) == 0 &&
> -         !guest_range_valid(old_addr, new_size))) {
> -        errno = ENOMEM;
> +    if (!guest_range_valid(old_addr, old_size)) {
> +        errno = EFAULT;
> +        return -1;
> +    }
> +
> +    if (((flags & MREMAP_FIXED) && !guest_range_valid(new_addr, new_size)) ||
> +        ((flags & MREMAP_MAYMOVE) == 0 && !guest_range_valid(old_addr, new_size))) {
> +        errno = EINVAL;
>          return -1;
>      }
>  
> 
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

