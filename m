Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B634997D5C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 16:43:40 +0200 (CEST)
Received: from localhost ([::1]:49144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0Rpr-0000Ut-TQ
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 10:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i0Ro2-0007mF-A1
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 10:41:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i0Ro1-0002kq-6E
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 10:41:46 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:35659)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1i0Ro0-0002jP-TS
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 10:41:45 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N9dbx-1iLABC4AC5-015Y8E; Wed, 21 Aug 2019 16:41:40 +0200
To: Sandra Loosemore <sandra@codesourcery.com>, qemu-devel@nongnu.org
References: <20190821142151.19995-1-sandra@codesourcery.com>
 <20190821142151.19995-2-sandra@codesourcery.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e84f586a-7238-7bbe-f519-bb7c370c404b@vivier.eu>
Date: Wed, 21 Aug 2019 16:41:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821142151.19995-2-sandra@codesourcery.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WQ4LZvZck9yiUUncayqzjLRssd3nG3EV9wAk0NvVdEWu3wgEpTM
 MQZsNJXW3fLPeLphk2NijV78LR5uOcCm6nWbCbUMszspIbGgxfKtmtj23Vr9jCIDT0tz1hs
 hxpqHGjxfeStgJnGsU88GdlcxFmj+574TljTq5U3anhXUFr6TT9u2iw5TusUU9EvC8wW7VV
 xdRFlLVHDt1loHtbU1NWQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DLYOt+NZ02Q=:dlntVr6NWId/9y35dpE3+Q
 q3mZpHoDIl6uzzjQgm/jdRYk+rS8RzQglHglPupslfdjfn/ROw0GroI25BZUuC58zvCrwcP84
 nj2ADIhyIgKGY1Toc0x18H7etrFYniGnDQhy0/QgSwHcTecGvcArnnOFjFGHgX2CdIWDhkRcl
 QCsXzQGih8Vr6Yejcmuqd0CyXSq4xl5Y3cYtPdUVJDqjVKBQ+SNZMgAwRZX/osmWZ0iDvftwF
 /4LMqObymM0u8hBO1ipluPgx4wq5xqhdG7v6Nr1j/2coLLcoZU5CsNN1pDv0il4ccon3J9jmq
 3z0eImJsRiya6V+KY3LtWkdPcKpHEfUTouVPZIC8yWVRIN1jjJ2iFoqLX3JEaHHZo6d8WJNU7
 wXk3RUBw00OiBGkx5U+43jN9+6llJc8HXpidMfgmAXs1tmp+967Dc5GbOZh9iFvFmV7tWmsNe
 nPQ3toGacYadQtSKLqcufUQETf9PSk/k7Bw01+2Nb06jBoUP/jxPtJoRdui9K9RXVl5hCTNV5
 9rh7QEjZgOLCUvuM9UWxOJQrNaumWi/3HDLOO47II7eFxOHd5h79O6N7ive+ZBMrOs+tWQAXn
 lR3ddmpYZevmTOl7NYap2uWf0BOcgs4CW0YvseAEKEGjXJq2ST9DlMtuhNx1Z/Rn93MOl6V9T
 uicwc+VLOvrj1kpW33QOwbVsc8kalG3c5OtTQoS1dr542PHyZ6nARnIx4voVmR0B0pEEyNhLG
 pNcJXzZwoxurfbWGjGbn97icxcPTabQs+InPfc8LBn/y358DafK9u1jUzDw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: Re: [Qemu-devel] [PATCH 1/2] target/nios2: Fix bug in semihosted
 exit handling
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/08/2019 à 16:21, Sandra Loosemore a écrit :
> This patch fixes a bug that caused semihosted exit to always return
> status 0; it was incorrectly using the value of register R_ARG0 (which
> contains the HOSTED_EXIT request number) instead of register R_ARG1.
> 
> Signed-off-by: Sandra Loosemore <sandra@codesourcery.com>
> ---
>  target/nios2/nios2-semi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
> index d7a80dd..06c0861 100644
> --- a/target/nios2/nios2-semi.c
> +++ b/target/nios2/nios2-semi.c
> @@ -215,8 +215,8 @@ void do_nios2_semihosting(CPUNios2State *env)
>      args = env->regs[R_ARG1];
>      switch (nr) {
>      case HOSTED_EXIT:
> -        gdb_exit(env, env->regs[R_ARG0]);
> -        exit(env->regs[R_ARG0]);
> +        gdb_exit(env, env->regs[R_ARG1]);
> +        exit(env->regs[R_ARG1]);

It's weird: in line 215,  env->regs[R_ARG1] is args.

Are you sure it's not something like:

        GET_ARG(0)
        gdb_exit(env, arg0);
        exit(arg0);

same for m68k.

Did you check the kernel code?

Thanks,
Laurent

