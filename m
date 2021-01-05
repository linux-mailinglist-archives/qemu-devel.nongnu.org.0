Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA82EB2C7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 19:49:30 +0100 (CET)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwrOb-0003U9-F2
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 13:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwrMc-0002eU-0M
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:47:26 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwrMZ-0000QO-QD
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:47:25 -0500
Received: by mail-wm1-x32a.google.com with SMTP id e25so509015wme.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 10:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/F5mg+ViJeKivNTmDkkmQjl45CGuL+nrLDVA0mGiDy8=;
 b=CBMnMrIijl6tviknjpAZa4xzLBSzAwaD3pG+21BavAULPc2Jnn+Qq8DIgGn4Lo8yOX
 B1xqLuKtfUDWDRZSl1O3r1n0NJaUmb2O9yHur6L/FSXxd4ZmuCikdxSBBg2817bk0fR0
 vKJXC5rRJ/Hk4oD8Kw2JT45l5hFpnc+HehNdNa4HRczECkeh3F5q1kB/PUz92IRo1iY2
 B5+3hi6RXt90mepSFBWlL7K5LzGzrOCwuwKRSBfqbm2DpjNl8BWPtJhGygth622wInYT
 KQ5tIBSjJNzoUj2dMy/RK+losuUZ8dWOqMVs37SSGXp2Lj12oT5Wea44olXOJE0SNx+Q
 ExjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/F5mg+ViJeKivNTmDkkmQjl45CGuL+nrLDVA0mGiDy8=;
 b=uUS/z+vqXgj+0/jTNVU69mG9OA+/eQRt9Kjn0tbc2HXTm/EM2Kah39myRaK9zEpXV5
 KrznSIj2YXt28P3bliKuCrzaLSRyIN/gp6/t+MFMJc80Zw80rDQi62AKGH1AQ8IZW9ie
 E0PX3VtX9PlUTxVm8zR5NUDr4Z0HjJwfmGjfTU+fD6NXOhQIu/C1nKqKOTFp+SaOkE61
 uUVnA5Nyza4PwQucBwkJXZj8BrAupZKKI0uY+toJP1jVDDc20oS8LdTVGP+BzNZt0x56
 3DqU+/PWoXefPWfy6S6oHezmS8bMhsbc5k5yUp/P3lHxxA36zEEBqqvTaB6diHlBBklo
 9cnA==
X-Gm-Message-State: AOAM531hcy85IsfK7DNXVehci8MwmSmDmLfT9e4iVON5egzok0XRX1tn
 1O60pnKS+R+J2iWCCD+HU54=
X-Google-Smtp-Source: ABdhPJzm95Jv23n5hKMZtuUfyvmmSvcdFp0GF29amOqfyXT4xXCCNHvDFzvcbwpRGCF/o0HXHmG89Q==
X-Received: by 2002:a7b:cbda:: with SMTP id n26mr458236wmi.144.1609872442108; 
 Tue, 05 Jan 2021 10:47:22 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id m8sm59491wmc.27.2021.01.05.10.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 10:47:21 -0800 (PST)
Subject: Re: [PATCH v5 42/43] tcg: Constify tcg_code_gen_epilogue
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210105171950.415486-1-richard.henderson@linaro.org>
 <20210105171950.415486-43-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <624bd5ce-c37b-6f55-cb98-5a02c4614f52@amsat.org>
Date: Tue, 5 Jan 2021 19:47:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105171950.415486-43-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 6:19 PM, Richard Henderson wrote:
> Now that all native tcg hosts support splitwx,
> make this pointer const.
> 
> Reviewed-by: Joelle van Dyne <j@getutm.app>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h            | 2 +-
>  tcg/tcg.c                    | 2 +-
>  tcg/aarch64/tcg-target.c.inc | 3 +--
>  tcg/arm/tcg-target.c.inc     | 3 +--
>  tcg/i386/tcg-target.c.inc    | 3 +--
>  tcg/mips/tcg-target.c.inc    | 3 +--
>  tcg/ppc/tcg-target.c.inc     | 3 +--
>  tcg/riscv/tcg-target.c.inc   | 3 +--
>  tcg/s390/tcg-target.c.inc    | 3 +--
>  tcg/sparc/tcg-target.c.inc   | 3 +--
>  10 files changed, 10 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

