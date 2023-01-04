Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5429E65E022
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:40:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDCCW-0002qk-Am; Wed, 04 Jan 2023 17:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDCBK-0002Q4-E1
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:24:23 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDCBH-0007Dm-UB
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:24:22 -0500
Received: by mail-ej1-x634.google.com with SMTP id fy8so22046440ejc.13
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kdJK7hKhTxXNAjCVewSU4FCPOPdb8xkIvabuXsiLWtw=;
 b=CkvqpzPQ3FaSqpRI4Tas2VvKPAZtJdwd13Eiy8L2CneL/u5tzug3cMd2bL73FAaoNU
 svfMWQaBW+8C43zuEhJaVYhtpim1/7a9Fragv4jCyg3c8jLKlUYiolauCgFq1hbEa0kk
 q4f0TqxS0wsuXaKrwNz88rZqpkcKpF4sklOA3nQiernVB2z/wxpeuflgj4b5oGbgO0eR
 51gSQZksnvDaXS2tgFJFuCUk5fwQ2lH2puOt/CRltHixLrIdEtJOHIwdTl61XRmIW/eL
 gYluP+7QudzoN2qTN9OYHbZTbWu4xOhHy8x6wvcSASxifj/+zpeJqrj2m1mCbLsFPTTV
 Inyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kdJK7hKhTxXNAjCVewSU4FCPOPdb8xkIvabuXsiLWtw=;
 b=KRaF02UymSfW1vMeq8l04jHZNJPn7Vg0ntHc2jNjsVllK0l1nSuvruOldG4IRpDEJL
 6vl9WNkeu8/9eL062qHUtw4LYoi30VcJfboJ+p/qfgcKr6faTw0RnP+oem+k/G8jIqDr
 DP5S+lxTr7dfjAyT20NbK54+6kzbfYrT15XHnq9DnanIx9r0G/GWwG4YQ08/4WPv/dR0
 cW7XEsmBvnbDXO3SmHPiYsv3GSbjpMwFauiitVWpcfTqOaMLt3fY1gvlgyLBhLQG6gUk
 TD8WtZ3Y5S5f6KEA6u+z3e7di6UWpkt6raBKmoJJFGoo1AyQ/lMBqSgx8z2ExxGv4b2F
 8eUQ==
X-Gm-Message-State: AFqh2kph9VWOwzBlcYp2gyzTPDKt6EI4L4umWTjRJXQInN8VemZjk7I6
 j1HHa78aquuOeo0Z/EuRz6XXItgt2ztIqjiy
X-Google-Smtp-Source: AMrXdXs3CUGU5yg/n77GCtilLwu1wiI8vhqe9Mpp5uILUgm3oKkw+kCF8Xj9E/s+HFldzXBsGDAODQ==
X-Received: by 2002:a17:906:5786:b0:78d:f455:3105 with SMTP id
 k6-20020a170906578600b0078df4553105mr40686622ejq.45.1672871057841; 
 Wed, 04 Jan 2023 14:24:17 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ky14-20020a170907778e00b007c4f8bc322asm15658779ejc.196.2023.01.04.14.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 14:24:17 -0800 (PST)
Message-ID: <820138bd-1971-17f3-c5a0-37fc6c4422dc@linaro.org>
Date: Wed, 4 Jan 2023 23:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 13/27] target/arm: move translate modules to tcg/
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-14-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104215835.24692-14-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/1/23 22:58, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> I also moved translate-{m-nocp,mve,neon,vfp,sme}.c
> 
> Originally from:
> https://lore.kernel.org/r/20210416162824.25131-2-cfontana@suse.de
> [RFC v14 01/80] target/arm: move translate modules to tcg/
> ---
>   target/arm/meson.build                  | 26 --------------------
>   target/arm/{ => tcg}/a32-uncond.decode  |  0
>   target/arm/{ => tcg}/a32.decode         |  0
>   target/arm/{ => tcg}/m-nocp.decode      |  0
>   target/arm/tcg/meson.build              | 32 +++++++++++++++++++++++++
>   target/arm/{ => tcg}/mve.decode         |  0
>   target/arm/{ => tcg}/neon-dp.decode     |  0
>   target/arm/{ => tcg}/neon-ls.decode     |  0
>   target/arm/{ => tcg}/neon-shared.decode |  0
>   target/arm/{ => tcg}/sme-fa64.decode    |  0
>   target/arm/{ => tcg}/sme.decode         |  0
>   target/arm/{ => tcg}/sve.decode         |  0
>   target/arm/{ => tcg}/t16.decode         |  0
>   target/arm/{ => tcg}/t32.decode         |  0
>   target/arm/{ => tcg}/translate-a64.c    |  0
>   target/arm/{ => tcg}/translate-a64.h    |  0
>   target/arm/{ => tcg}/translate-m-nocp.c |  0
>   target/arm/{ => tcg}/translate-mve.c    |  0
>   target/arm/{ => tcg}/translate-neon.c   |  0
>   target/arm/{ => tcg}/translate-sme.c    |  0
>   target/arm/{ => tcg}/translate-sve.c    |  0
>   target/arm/{ => tcg}/translate-vfp.c    |  0
>   target/arm/{ => tcg}/translate.c        |  0
>   target/arm/{ => tcg}/translate.h        |  0
>   target/arm/{ => tcg}/vfp-uncond.decode  |  0
>   target/arm/{ => tcg}/vfp.decode         |  0
>   26 files changed, 32 insertions(+), 26 deletions(-)
>   rename target/arm/{ => tcg}/a32-uncond.decode (100%)
>   rename target/arm/{ => tcg}/a32.decode (100%)
>   rename target/arm/{ => tcg}/m-nocp.decode (100%)
>   rename target/arm/{ => tcg}/mve.decode (100%)
>   rename target/arm/{ => tcg}/neon-dp.decode (100%)
>   rename target/arm/{ => tcg}/neon-ls.decode (100%)
>   rename target/arm/{ => tcg}/neon-shared.decode (100%)
>   rename target/arm/{ => tcg}/sme-fa64.decode (100%)
>   rename target/arm/{ => tcg}/sme.decode (100%)
>   rename target/arm/{ => tcg}/sve.decode (100%)
>   rename target/arm/{ => tcg}/t16.decode (100%)
>   rename target/arm/{ => tcg}/t32.decode (100%)
>   rename target/arm/{ => tcg}/translate-a64.c (100%)
>   rename target/arm/{ => tcg}/translate-a64.h (100%)
>   rename target/arm/{ => tcg}/translate-m-nocp.c (100%)
>   rename target/arm/{ => tcg}/translate-mve.c (100%)
>   rename target/arm/{ => tcg}/translate-neon.c (100%)
>   rename target/arm/{ => tcg}/translate-sme.c (100%)
>   rename target/arm/{ => tcg}/translate-sve.c (100%)
>   rename target/arm/{ => tcg}/translate-vfp.c (100%)
>   rename target/arm/{ => tcg}/translate.c (100%)
>   rename target/arm/{ => tcg}/translate.h (100%)
>   rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
>   rename target/arm/{ => tcg}/vfp.decode (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


