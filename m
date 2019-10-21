Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B1ADE814
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 11:31:55 +0200 (CEST)
Received: from localhost ([::1]:36586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMU2c-000672-04
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 05:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iMU1I-0005Gm-Pt
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:30:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iMU1H-0005GR-Mv
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:30:32 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:37343)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iMU1H-0005FJ-Dj
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:30:31 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MG90u-1iEjAy2Grs-00Ga5Y; Mon, 21 Oct 2019 11:30:24 +0200
Subject: Re: [PATCH] linux-user: add strace for dup3
To: Andreas Schwab <schwab@suse.de>, qemu-devel@nongnu.org
References: <mvmsgoe17l5.fsf@suse.de>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <8bb89a03-47b6-b5c9-7c19-42584c6f09c8@vivier.eu>
Date: Mon, 21 Oct 2019 11:30:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <mvmsgoe17l5.fsf@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yLWq69hbjzuIhGaiZ2xjW/j96IFakesRQz1SbQA9amNqvFQoaq2
 iW+2QK5tZhfyoHKgVA2Z2IBhc9/vctBoqRdEJnvlutt0hHYs20Vw/7H0O7K+NVcLFk+x7Cz
 CPr/6oWOxhfiLL7WYH4EcvCP/1a5/eUh6KKdVAO6jbztRyMBoRuhfCvOSLSnOrKy6MAkgvb
 JE4lC1Q1Rp8ARiH/z+iNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cPuFAsJFY3A=:F1Fqtk84hLjWDzwnUn4WLo
 AZ0ZwVZ1tWSpR1kOfPtNFSAxrh6iHLQh6HoyKgtlCDbNdtqtdKxac1mNBLrQ+6nEinyKSvnEU
 c4Vziqjo7pC5CvyZOZz24pyIwoi8t663Ua4FFp6Fpd6SOCdA5d4p3V+CzooOPC39nN679+JVg
 sN/7E3g7S8fTbt1TUYh+kihNUv3LKKIO+wEekILAFvQWsRmMTdNLP7Rt0ZVvs7+G3OPSdu4Dm
 dQMjcPaEnOdPB2a3ILS+LvTriYWfmwBimYjbhbZAdXAoHRInnUhMjl/c8ptkaDu5VGp6SPLwD
 VSb0dnlKC/nGJ0wkmsgylr3HTiQVg8xlZEFVB2qFCZk483kGEDGEp8ighnioDVZF0+8wTo0en
 KaGwWxYMPW9atFCtNFxBdyPyXeckVUeqaTy9yV4+tLXF+dn4cSDrKm8lbwk7CBs76E75CTWPK
 oxH7UTknrg3EMbjkbNYKeiz8Pck5oNCNzXY8sgzNpac1YZjlhBfPm7gi8izvP1CJJmeKXeWQv
 epfaciEDKAg2YKI6+80Kra4cHPAGzxg8OwP/hRWgmzWyaOAZLI7CgHhsIQExSNVwsTNBvOL6N
 zep5ZPAftBECi/3GP/JyFNg9BBMWKpJ2ArOjUU5JaY9xYeO1fCFLMYtVCiVN1g2n5h8K9a6dA
 IDfxtHPvW2gRdr2rRRxHaK5UFtUdAbk0cWZhnytqw6br0APyDfIWJRgt1dzfhCrbSJWgCKcDi
 H4vULbB6DmYw+ajLCBsXlJNjWTpnyU2Uqibu4nFWPO+VPCO0HGyibRwUBHqVGNZ80AzeVUbM9
 GCLLYs5L2xZPBJEPsEifu6FSNg+Ow+wM7grwqZE9JFfu/hRTOlopqeVmwDnncVxh6rvjrCPX0
 j5R83gRRNoZJnYuIjb06CVQHDcufAdqXS5oVC6Q4Y=
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

Le 30/09/2019 à 11:01, Andreas Schwab a écrit :
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  linux-user/strace.list | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 63a946642d..863283418e 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -121,6 +121,9 @@
>  #ifdef TARGET_NR_dup2
>  { TARGET_NR_dup2, "dup2" , NULL, NULL, NULL },
>  #endif
> +#ifdef TARGET_NR_dup3
> +{ TARGET_NR_dup3, "dup3" , NULL, NULL, NULL },
> +#endif
>  #ifdef TARGET_NR_epoll_create
>  { TARGET_NR_epoll_create, "epoll_create" , NULL, NULL, NULL },
>  #endif
> 

Applied to my linux-user branch.

Thanks,
Laurent

