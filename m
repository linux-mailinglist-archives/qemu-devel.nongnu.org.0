Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242A69B476
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 18:29:51 +0200 (CEST)
Received: from localhost ([::1]:59242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1CRi-0000en-Au
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 12:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45326)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i1CQO-0008EH-3i
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 12:28:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i1CQM-000638-SQ
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 12:28:27 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:32951)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1i1CQM-00061H-JS
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 12:28:26 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MD9Kp-1hsi6o2BCT-0099ug; Fri, 23 Aug 2019 18:28:07 +0200
To: Shu-Chun Weng <scw@google.com>
References: <20190819185348.221825-1-scw@google.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d969c965-8dd0-c332-1286-47a117504979@vivier.eu>
Date: Fri, 23 Aug 2019 18:28:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819185348.221825-1-scw@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mqO4bBjybXSq0Pi7neXr0XPuNX8hjM7kl5yf//HpIuzUY+Q9pVr
 AljGA3kBiChZTOTS25IdKOxeViJwpMzgQbUyBKuLKCtQOd8nPyEId7qP4OhWELPxp2N2rbi
 E6XHT7gt0V9ktOpoMi9T9rjoJnNfGnpxfUjfcHlYMgC7ZldbZxx7i0TJiT00bOjxGIayAkf
 /drlybvCpp/tlRNUvYAag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ugFUzP8at6w=:5FJZqggdA4GUZ1dBWr89sA
 XMTjl8RV3rLceiYTJk+29FPy9HeupQIVy2ODt8VWlyP/sMjNMlCmsuMdOZ3MQL3p1sJ6S5ePG
 KC02Eiwksg9AZmdsfxMJnJKK888fKMQw7eIV3Ha5EKkMp5LNrQ20TzyPJr2/Nei8gmMrcazjC
 psh/aTAjKtf2DfYcKFj6lVRHkZ39D51pUCDcQIB4hb6oPXP8O2uDSjJLv+f7uZPZQ5LB4EQkZ
 0yrM8X+cAfFbF4LdPqx4tXIBClQmrln53RzF+Sfe0LPjcPlHt4iQzgEWfY/M2nisSVCWkwQVp
 CWGXk1BIi27dNK9PP0X+cqfVNrgJjxwwlXlWnxw8AS1QHC8ekqhIiHtpE6B0UJUHpVcrw3XpJ
 PN6vhbH+0dc3owI8guKHSR6ZYj7P5iXqW7EWsdkpzYTxGKr1Nl28q6bqrdRAKJ9DtzAF5/ymp
 6wtC66BqdGVAhB0tYuPYogXvuv0kEvtfpnGWHbOBfIUCLoDb+ZRGn2Ox9KXxXAHxnugaY6icc
 afQAik2U8CFKifh1wLNuxEEPOJ3dCfrTQ5DoRHvPd4cUSmYrcY2Urf3tmhDM+ZmzmWvMRVJhM
 DkSG0BQdWwfQ7e/oZ5roSspq2PFGFWyP4XVk0IYzayURj0lvDIGYhfCkobOt+3kEtjeZDQVmN
 raCSp8qhE1WL8YcOTkf4bGxpPC2yMZRARjSxLfIpGoTZWRU4kLEw5XrUx/0V3PIhYg5/Qu7BZ
 QzuZJGB7KH9clss+22ytzzrp4f/c3tbZyHIWfbWN22jV6tKaOCoOxqxw9n0=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: Re: [Qemu-devel] [PATCH] linux-user: erroneous fd_trans_unregister
 call
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/08/2019 à 20:53, Shu-Chun Weng via Qemu-devel a écrit :
> timer_getoverrun returns the "overrun count" for the timer, which is not
> a file descriptor and thus should not call fd_trans_unregister on it.
> 
> Signed-off-by: Shu-Chun Weng <scw@google.com>
> ---
>  linux-user/syscall.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 8367cb138d..012d79f8c1 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -11846,7 +11846,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>              timer_t htimer = g_posix_timers[timerid];
>              ret = get_errno(timer_getoverrun(htimer));
>          }
> -        fd_trans_unregister(ret);
>          return ret;
>      }
>  #endif
> 

Applied to my linux-user branch.

Thanks,
Laurent

