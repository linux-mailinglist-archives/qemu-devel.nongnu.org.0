Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C3D13B3CF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 21:51:42 +0100 (CET)
Received: from localhost ([::1]:45824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irTA5-0003mV-BZ
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 15:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33477)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1irT94-000388-Ip
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 15:50:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1irT91-0000sZ-8f
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 15:50:38 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:36431)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1irT90-0000iR-VJ
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 15:50:35 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mdva2-1jP9zu336U-00b05q; Tue, 14 Jan 2020 21:50:20 +0100
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
References: <20200114202226.E859E745702@zero.eik.bme.hu>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH] target/m68k: Allow movec only on 68010+
Message-ID: <202ca4b5-cb25-a654-fbfd-a958feebcf66@vivier.eu>
Date: Tue, 14 Jan 2020 21:50:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200114202226.E859E745702@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AIvJSukv3Zat6fuR+Z4apuNGgjag23xH8wZGeJFIvHBkUcy97FX
 Y82fa+h3AaaL3JWuV+vJfDA98l6YGlbeSOEFjYEAsv0c7Dm8cSYTiBrFV/WyZR9BgL9TSQ3
 eC74czWIYxgxV/1tk0YLsS4pj0EnkEiINuCsZ1gFluSSdjNksVp0KYLw/fJ/vjvb887qwVA
 FEh7RMPOquBXZLEh6TE3w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GFcxJ93CuIM=:jVCG4TgzEzUptHcpvVf3R9
 OPPJfZsHyNmLduRLS6UeGO49Ee6ygKUbw8IxAl7vIyOtfQWC4TQe8gg5cLj3Ipjeu07qCmA6/
 2L7UhrnBd/BUK4eCsb1DF8hBYXpxIKmJc4GrZpO2xpDSDBEUR4nz7NI3ISPuNoDHbPkk/zG6/
 hTrScXtsBNAmSkiIWzCwLLJkw/VWWqYhaQ56VBM0ySqIbatXby/MJHfK/9ip9S8EfaXr3uueA
 tJ7QKgMwtCr+4iTxAEK0381IoShlQWbvfNTyyibj/7dbtIgaUpJginW5HBxEBO6pDrhws3TGJ
 4qX8dVrJ8lxmFFa4FDA61Zj6jzSmm+5PiD8315bFoVA+8VeH1SUs86KK0XVkIl8iJ24xj+kgV
 MretV8JVrWPucAhK8wZmWT2eQ9ePR44aUg8yptQgbCSQlyHxrF0uvtfYyzLylIswyNiB2foX9
 jtSD3iELkudl16/VPazYLT2QYETcloxOT/2PqxPyg+jMtOGxsjbDSVMRfYGS2iZrWiBtOOmgP
 i2IHJ3drpywpoydA7+9sukkTFIq+XJy+AY86cxQtRU7hhTWWPHyrZcq5J1Z2qZar87HarB6nq
 AIiNBfIPBYePGSqlfHbod+l/m3/CGlj7pdyRsgWG1UBqS1qSW0QYyVYbmsAvCNz4DEuJgzYUc
 VSxyJlpbLph2C/R+eGXChqqWyMiSvFfsg6VW0TUe4khVo5PHOtIi9cMr6WhwPame8Aga3BUod
 TyysQ/NYMbq04O4Nr3QqaPuzhXoG6ANZBaPfq9vs672Bjkpo0zdOO+AZX/VU2ekzRBBb2d6A0
 JzzG9HJx/KaHk9jRjYnvaH68oiPTJfhiFLr2RXt3q2+ZmBTDDfziomhRuF/sDqHFiQnKUTfG/
 vS4ZGkbAojMKdnA4cfaBJwzICE5UYs+iK6ql9uqzI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/01/2020 à 21:13, BALATON Zoltan a écrit :
> The movec opcode does not exist on 68000 and should raise an
> exception. Fix the feature mask to only allow movec on newer 68k CPUs.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  target/m68k/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index fcdb7bc8e4..f19da064c8 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -5988,7 +5988,7 @@ void register_m68k_insns (CPUM68KState *env)
>      BASE(stop,      4e72, ffff);
>      BASE(rte,       4e73, ffff);
>      INSN(cf_movec,  4e7b, ffff, CF_ISA_A);
> -    INSN(m68k_movec, 4e7a, fffe, M68000);
> +    INSN(m68k_movec, 4e7a, fffe, FPU);
>  #endif
>      BASE(nop,       4e71, ffff);
>      INSN(rtd,       4e74, ffff, RTD);
> 

Good point. But as movec is not related to FPU I don't think this is the
good flag to use.

Lucien has sent a patch to fix this issue last year:

  [5/6] MOVEC insn. doesnt generate exception if wrong CR is accessed
  https://patchwork.kernel.org/patch/10997467/

it needs a rework (M680x0 feature flags are now specific to each CPU, so
the table cannot be set to the older one, 68010, and 68060 is missing)
but I think it's a better approach.

Thanks,
Laurent

