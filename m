Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DC019D2B5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 10:51:07 +0200 (CEST)
Received: from localhost ([::1]:52276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKI2c-0000w6-3A
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 04:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48477)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jKHzt-0006j0-P8
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 04:48:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jKHzs-00042E-6J
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 04:48:17 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:48861)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jKHzo-0003uS-Ls; Fri, 03 Apr 2020 04:48:12 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MxUjv-1j9KoH3CNl-00xtob; Fri, 03 Apr 2020 10:47:56 +0200
Subject: Re: [PATCH 3/3] crypto: Redundant type conversion for AES_KEY pointer
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20200325092137.24020-1-kuhn.chenqun@huawei.com>
 <20200325092137.24020-4-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4b614cd4-ad35-94b1-a7b6-6950fa08617c@vivier.eu>
Date: Fri, 3 Apr 2020 10:47:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200325092137.24020-4-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uktO8gj0OT/HiEG2wKWdfZ495ohaivZv0O9Ybmz+Jw+zgOflZHl
 MW5kh3LfRJmQ6+Ybh3VpcjFuRt9y0MZ/ATtuVOtRDJee4yh5J1aWURF/FqbYfMZIFpQhwgw
 5kkHqo3aDk314HaYX9oz1uaUn1CsfaxxSJBJCCuoAW+JQejQTbIW8a3MvX08jTPKwfjhdE6
 6GnP93QuZaEypoDCyZCjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s0VWlWlK9J0=:3WR3hnrFGbK/SmOslzCt3o
 TXyCujopkGGRVC2vZQLqQtwIEojVSh9QMruS+QZq6a4mc4lTVmdLkqVHeBzoPnwcyqvKECKRo
 sQNK83yRDrfy5z/4zcf7kNi+l0bo2/H9TrAzcfzAQ2QA+HjtGYV7L2LvEDBQ/DKVMo5a2Dad/
 jlU052q2bl8n9zKG5pmn5QGkW/+TLR3xJnkUtGSmdtzIMxWoBeGGDDzaHAhXXwnL++N7eTwPE
 ebpjUnxvH5s+eOijpgBTtXYjdTrVXtAZBjrpfYXwY7udMVimutqY+lnCtvcxFa640dJjYQ4L5
 c0hymsom9PqQ98RVwxz+aBg9AdJCv14rEc5CRcBdc2+Gf5vm2UkLiI+nkDT6TP9doPLSFkqqk
 SadJayEaJF6pm/ogj20pVeHlqxkHg0XUiaEmhhdTn44lde3JcgfGanscKNeZaCfeH/bxbBaVb
 P02MM0AlEQyCuK5jozjHUTqpZmYRQ6KOWYjFtbcZS/ssVA9hBzjTWkEX4rbp8l+iPyX+2bRV/
 hS4GjXLdl0Pnxq2827WYdj9kIXnL+w4PmCgvoW6KG3+fwMcA+uIa5M+8rqP2mUjink4QKA6Du
 YsJFs6qJ4I3WIJuXg10O4mq/UjL5LzYYS8CZF34nq5LdW845sk8gn2V5DGYlWDxhsVhFTAeF6
 aFORGzj5x2mwfUgNBHe3P5iqr4/nT/aleBDpy0bUqLmID20o31z1xLn0uUQPRTQuY7L1mi9jN
 ft4YQlshWSp13i6rYmbtcfbA02g2Te97KdRGHYrQbpHuz1toI5qNSlKg9Jquw1H4i0Pm3DIQV
 6AnAv1mEP50hZB8SsedkbnMLi/PXAmo8BJDqJkmIQ9L9vQVxBFYDK4tdVgViLL9eMdxXn+w
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 zhang.zhanghailiang@huawei.com, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/03/2020 à 10:21, Chen Qun a écrit :
> Fix: eaec903c5b8
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: "Daniel P. Berrangé" <berrange@redhat.com>
> ---
>  crypto/cipher-builtin.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/crypto/cipher-builtin.c b/crypto/cipher-builtin.c
> index bf8413e71a..99d6280a16 100644
> --- a/crypto/cipher-builtin.c
> +++ b/crypto/cipher-builtin.c
> @@ -133,8 +133,7 @@ static void qcrypto_cipher_aes_xts_encrypt(const void *ctx,
>  {
>      const QCryptoCipherBuiltinAESContext *aesctx = ctx;
>  
> -    qcrypto_cipher_aes_ecb_encrypt((AES_KEY *)&aesctx->enc,
> -                                   src, dst, length);
> +    qcrypto_cipher_aes_ecb_encrypt(&aesctx->enc, src, dst, length);
>  }
>  
>  
> @@ -145,8 +144,7 @@ static void qcrypto_cipher_aes_xts_decrypt(const void *ctx,
>  {
>      const QCryptoCipherBuiltinAESContext *aesctx = ctx;
>  
> -    qcrypto_cipher_aes_ecb_decrypt((AES_KEY *)&aesctx->dec,
> -                                   src, dst, length);
> +    qcrypto_cipher_aes_ecb_decrypt(&aesctx->dec, src, dst, length);
>  }
>  
>  
> 

Applied to my trivial-patches-for-5.1 branch.

Thanks,
Laurent

