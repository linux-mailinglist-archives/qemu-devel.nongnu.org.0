Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6154A3995
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 21:58:07 +0100 (CET)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEHGw-0006TO-Mp
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 15:58:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHDZ-0003mI-DG
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 15:54:37 -0500
Received: from [2607:f8b0:4864:20::536] (port=44939
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHDY-0004GU-0l
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 15:54:37 -0500
Received: by mail-pg1-x536.google.com with SMTP id h23so10314263pgk.11
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H17Q+N7n4Ovh7BLlnPFDN2adNzKixTrKOcb37TvN3ag=;
 b=FayhlYww5DKUTBbs0WI4JMKgk7l4Z3b3MCONLFraFahNdNsWpEk62hALJY2cZYTjhG
 EqI845ZL6sSlTltF6WH2BsnhXFGsX35Agh1OeZIMJTfBzD0Eczd2M+wSaRhf0WGUipSs
 HObNIMJMpMGbC5ylQfG/8nCPSVyrg81QrXogZszTpu3VcEZ/UpKxf1fiUTJOBfSs3BlR
 /5sXPDl5nEn3Ei8qENQz8ZkvBot1U/oaRn0PaRHqmNKEEVog+yEPRdDUuuj15ugP0kDS
 SURGthrXNwEEdYuUXVINfFIE9GmlbvxLmd4zPGo/dZZsR0jLCvPiEpIW0P/dWXyNHcs2
 Ql1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H17Q+N7n4Ovh7BLlnPFDN2adNzKixTrKOcb37TvN3ag=;
 b=RBeVjO2S9gVSvg6hhgdy4zHZHDDCayfG2nF1Nc/3bSEh4LON7kDQ6YtNlYSeL51Euh
 nvp+1sPMWkLyPQZ3dGF2otZ5bJXSaQO778hXRysQQv9C01tq31+TMzPWA0zlFXx4d39O
 b/N6HbHGEDhnv6KK2SpI/it/Ze5wgqs/49+gF1pogCEq2xNYUEjlPBn/fJOiSRuptx8N
 9zdD2hk4YEdiFYJ04QQ5vzEMXqldL3BbBSsFTaRcEzljltXHgNuCZd9Pjk/WEtc10hEI
 YrUHaNpOkwoVK4Kk2EBIhtSmizwLlPb7pDa3glvlp5Ykzpk52pVDE27UH1RZr1vRoPaH
 +6LA==
X-Gm-Message-State: AOAM5319KubJA9vosNwHBlvRQc5Upu/Kl5QOhg6FA2xHDSPoVIQ0lsIM
 FolETzLUASmx6rDMAg93jhC4/g==
X-Google-Smtp-Source: ABdhPJxlQ1L/cv77JVDLXaKCV6Nc9PNoagu6zih9aZbeTaKZXb1xhJyppuBiJTDbMgY6+Cd97SGO6Q==
X-Received: by 2002:a63:4755:: with SMTP id w21mr14667189pgk.336.1643576074304; 
 Sun, 30 Jan 2022 12:54:34 -0800 (PST)
Received: from [192.168.2.37] (240.194.168.125.sta.wbroadband.net.au.
 [125.168.194.240])
 by smtp.gmail.com with ESMTPSA id b13sm15572604pfm.27.2022.01.30.12.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 12:54:34 -0800 (PST)
Message-ID: <57a6aec2-de05-dd33-1428-0c2c998d86ef@linaro.org>
Date: Mon, 31 Jan 2022 07:54:28 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/7] target/riscv: access cfg structure through
 DisasContext
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
 <20220128145642.1305416-5-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220128145642.1305416-5-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/22 01:56, Philipp Tomsich wrote:
> The Zb[abcs] support code still uses the RISCV_CPU macros to access
> the configuration information (i.e., check whether an extension is
> available/enabled).  Now that we provide this information directly
> from DisasContext, we can access this directly via the cfg_ptr field.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> 
> ---
> 
> Changes in v3:
> - (new patch) change Zb[abcs] implementation to use cfg_ptr (copied
>    into DisasContext) instead of going throuhg RISCV_CPU
> 
>   target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

