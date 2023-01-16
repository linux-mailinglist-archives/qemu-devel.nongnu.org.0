Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520066CEE0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 19:32:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHUFo-0004MB-BW; Mon, 16 Jan 2023 13:30:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHUFm-0004K5-0l; Mon, 16 Jan 2023 13:30:42 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHUFk-00088A-C4; Mon, 16 Jan 2023 13:30:41 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MGQ85-1pVX1V2XaH-00Gq0H; Mon, 16 Jan 2023 19:30:28 +0100
Message-ID: <4ecdef61-2013-1896-d05c-b014cd9c8dc4@vivier.eu>
Date: Mon, 16 Jan 2023 19:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH trivial for 7.2] hw/ssi/sifive_spi.c: spelling: reigster
Content-Language: fr
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>
References: <20221105115329.306527-1-mjt@msgid.tls.msk.ru>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221105115329.306527-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qYPt+aAoLlPhvBUChHthX3QKokSt6Dex/jqbG3G0oOK6u5L5Lrz
 xUI+4zaRWXwbKTKyDd2kkyK7k85gLgB/94duQWc2nDHszzeyF8F3FgB203JLyazifDMrlCA
 2uHQuWUOZdxJHfeMUio4nQbpZfU45k5gluMkWsThmYLCrjYdTA9yxbbIqyeacw+WXkoE2qM
 PNn69mC7CIjfaANHgZuiw==
UI-OutboundReport: notjunk:1;M01:P0:WGrr2d4wcrk=;otGs34qk3jfSuKL/T+8qRYZlJlu
 SrT5wX5bQKES2MJfWevZ+u48dEYwjPeKfP/p88gtzpgRyy2KMXmFuOD5MVoCDXDrYchb+RE3I
 dhYieYuB6ZBVHtfhwb/HSC216Jv+ks+OEgBqahzZ/3Jxu/u0UGM/YIG4UZ5i3BkQxm5UWuNot
 CLgcRs0Lid243tIA3wc8ks/18u4TnE1oXOf1XN17Ai1o27mi1LsQ+xD7ctqAnhEL9DPND1aYz
 SsGBKa1PCSWA1ew4+6U5QC8RVSF4PujRfCBVYcSFIxE7lu++/EDLTardxcpKXKAd9chKa3Lo9
 on2KSWZsWKVORNJQ7ufkviKeUPIVas1PrjkG3+NmNOWjBYi7QW9YsovrL2FVQJ+NX0BnM4e8c
 wzziQsZqTDn+BWjT7P2Xa4N0KQu/0QNxaEqOL4P0gmocZApfQYFxkUfZU+e7CbLatxsKXOQ8t
 boviLbbnsUPV7wEPxFiHVLXbfmtklJ1jYPJhpv239E5TOdzDcSy9Ysip6BGS+btPxIRwAugVZ
 2Sbjb01F7+7Ok0haXmN4kcRw2O9CvhBTe3p+kXtigqHJZK6IHGMFPYoL5l3KQj8bncBcK3kiQ
 NcQz4aCfWhaa2l8zdIXeTRembPh8ftf+AOEG46pey1dbu6bRmHZI5rF1gkOP4/g1BOZ90LPdW
 tXWlP1yMTmliJjXLceKfZnRYL19yC1kLVj5bBdW1fA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 05/11/2022 à 12:53, Michael Tokarev a écrit :
> Fixes: 0694dabe9763847f3010b54ab3ec7d367d2f0ff0
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   hw/ssi/sifive_spi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ssi/sifive_spi.c b/hw/ssi/sifive_spi.c
> index 03540cf5ca..1b4a401ca1 100644
> --- a/hw/ssi/sifive_spi.c
> +++ b/hw/ssi/sifive_spi.c
> @@ -267,7 +267,7 @@ static void sifive_spi_write(void *opaque, hwaddr addr,
>       case R_RXDATA:
>       case R_IP:
>           qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: invalid write to read-only reigster 0x%"
> +                      "%s: invalid write to read-only register 0x%"
>                         HWADDR_PRIx " with 0x%x\n", __func__, addr << 2, value);
>           break;
>   

Applied to my trivial-patches branch.

Thanks,
Laurent


