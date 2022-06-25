Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA7255AB61
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 17:47:23 +0200 (CEST)
Received: from localhost ([::1]:44206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o580I-0006uv-CU
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 11:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o57xv-0004lK-9j
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 11:44:55 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:44353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o57xt-0005xz-Mk
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 11:44:55 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MFL8J-1ntpHc2YBN-00Fl2p; Sat, 25 Jun 2022 17:44:49 +0200
Message-ID: <224a6efd-6ca7-bfd8-478b-31e2c8acf2e5@vivier.eu>
Date: Sat, 25 Jun 2022 17:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] m68k: use correct variable name in boot info string macro
Content-Language: fr
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220625152318.120849-1-Jason@zx2c4.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220625152318.120849-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VLKH1kUiT5l6YPDD1XmPChlPHN0yb+1JrvyUvVpFxiVwPZDZlz2
 Jyq3DMA2s6/TFO+n2dpIPEQNRjwV/aDOPKhuzcggcFml6asJ+xUbYM8yZRoP4ywER7+NIsB
 JHEhc2VMDSihPohlRBetXgW/7xuVD6AeL+OX5ckkNs7SecW5VNeM8EFsd0KbTvxFM/vMIP7
 nFPyG+A9lcbvIYD62ljvw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T8l9NIfx4aQ=:vMprowe/cqjdUsYmV0M+/Z
 adtBCQabusVCAcIJUdgaVcgnXnHko+ss86pJmn5DG+iQEOMKUd5PVGFHa+TmvXy4X6EOYjLhl
 mFuCDg20Yxq49gZwKBkZ4ZJGI0FzI8NvW1idP8qoW2QGRzxvfXvMX61en7UHrAvvfeWNvhRxU
 //lby86Kfwtwk5qZ/gVv9NmywrEG6jYrM9iWAE3I8/2RluYXF4oOwHD+uYKdmTGjv+Rl+4ZDS
 JEflTJjNMfJEC4q1px/JrSF1C9QppYseen3m9a51PfcNtx35BU5izMPXy/WmpvL7PKdW8UWZx
 IU1mKlJRbo7XSV6NIICj8COvULCTZ3tqsi1oBvRT7pBNvAHv8EJvAXAbZxegDRnIifYiey/eD
 JkTz4sG+c+xTze2mfC++XXNhP8EFDQjnD2AUsa9fvd047+WlBfeeBlqS5Qab10xnY6rW0Nizx
 H73lkxZRZSS0WPBtMAwdjnSwnpVEdd1oI3YFR7zirWjWvXL2Se4ElPk5O+jTvjxrFbIUPH8Tv
 pw0RhYM3kiUrpPUMPgp8FCNBz+SYC0IRodw7gKjTN6S3dE5uHSIcNoQHqXe4XVtx4aFbY/5aC
 BBtgZA5jV84gSMIklJV6RDafx0S/Pi8WUh8qtu4XCpQwVBTky5wZWjL3Vp7NEcEZiF1Ccu3Vr
 gLL0fNBne9FEKjk149LoNAMvpSFgFy65jSAXievjCu3C9DPWqkzdiPtrJGUk5s/+TMYzjygYD
 dz28Rwxg2SFa4N0+FfcQCvXkI5ut9ibSoLMe9A==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/06/2022 à 17:23, Jason A. Donenfeld a écrit :
> Every time this macro is used, the caller is passing in
> "parameters_base", so this bug wasn't spotted. But the actual macro
> variable name is "base", so use that instead.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   hw/m68k/bootinfo.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
> index adbf0c5521..ff4e155a3c 100644
> --- a/hw/m68k/bootinfo.h
> +++ b/hw/m68k/bootinfo.h
> @@ -54,6 +54,6 @@
>               stb_phys(as, base++, string[i]); \
>           } \
>           stb_phys(as, base++, 0); \
> -        base = (parameters_base + 1) & ~1; \
> +        base = (base + 1) & ~1; \
>       } while (0)
>   #endif

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

