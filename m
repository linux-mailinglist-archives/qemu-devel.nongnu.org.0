Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7811B66E368
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:23:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHojQ-00005R-Gu; Tue, 17 Jan 2023 11:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHojO-00004z-DE
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:22:38 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHojM-0005LI-Ko
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:22:38 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso4984206wms.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IxmpzMHTz8+hV4OAE4/nl25vNiisU17G9a+jLAxnpIg=;
 b=mz+7JKBKf8ZaXddHZ8CwrHFQ37l3BiD42yen/BDB7SjJtP2jPQCt3ZcKQx76yBBPen
 ZYjUY5EzxOty2+HtWJTdTRiXLb2OyOexnfuUylgSaiBawEfXhwpSlinjkZ8h3DNJ0gjj
 4vePF8TwwE67KbCu4fC05Gh0d3HUdOihbjVNmAmvj33nQ//gN8wlIJ69+Wv02SYzwbUn
 OUke0KITjaxoP5ojxrqEcAiP3spcBNqVZqYxz7ZAGX+GBn1albQvRRsqxhvK+InZ5lf3
 uW6bHRWlySPukbYjxmQLfsuDyQbrK5mjksIQf0uYZjKAr3gavZaF1CvP7JcZGo4R3nTX
 bmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IxmpzMHTz8+hV4OAE4/nl25vNiisU17G9a+jLAxnpIg=;
 b=HJ8Fh0GyRoZVCodCTMArDDyTpQDN+3CMchinzKeSVNJo2EHQBc7nzxo2/T0052MTIn
 yOrIzTGT1Eijg0LGNpchziQrgNgR54EyY/NL8O9b5By6iMRlKXQzAla+1bQPpUfmcwk7
 EZGAX1vAu515EpdBu3Vawckj9nNC/kFiFSaJrKvBejWbBmU1HVko5kMGM4wHO4mLBACr
 5xJOsuMtQyLK6InMc3HGEr7I+69h35NbB9bd5QGb58SHtTQQ3gt/7LZfDIYnG1Y5JVAZ
 mk8IAQ85SK/GdImgb3S5+qe4mUSH2eQ2XXynp1ISQyIfAfl1Lenf9HxKouk0sFerQXnE
 yHSg==
X-Gm-Message-State: AFqh2krtAhhz7sHgdsz39GCcwYYzf5PBFG0UM9SviPH4E1Bdmnyp6iS0
 I/YVNPHdIiREGkpOd73PLY3YLA==
X-Google-Smtp-Source: AMrXdXtirFBilyg7KKPIHgJBDY1nYWvc5I0e/rJ4KESzyjXBBMyKaUK/MBiV8rI/7Lply6hS8Kryjg==
X-Received: by 2002:a1c:4b09:0:b0:3db:f0a:8726 with SMTP id
 y9-20020a1c4b09000000b003db0f0a8726mr376357wma.28.1673972555070; 
 Tue, 17 Jan 2023 08:22:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b003cf71b1f66csm42290935wms.0.2023.01.17.08.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:22:34 -0800 (PST)
Message-ID: <7d47f4df-1a14-d448-f8df-9c31dc2ee371@linaro.org>
Date: Tue, 17 Jan 2023 17:22:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 10/28] target/arm: move helpers to tcg/
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-11-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-11-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 13/1/23 15:04, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> ---
>   target/arm/meson.build               | 16 ++--------------
>   target/arm/tcg-stubs.c               | 23 +++++++++++++++++++++++
>   target/arm/{ => tcg}/crypto_helper.c |  0
>   target/arm/{ => tcg}/debug_helper.c  |  0
>   target/arm/{ => tcg}/helper-a64.c    |  0
>   target/arm/{ => tcg}/iwmmxt_helper.c |  0
>   target/arm/{ => tcg}/m_helper.c      |  0
>   target/arm/tcg/meson.build           | 14 ++++++++++++++
>   target/arm/{ => tcg}/mte_helper.c    |  0
>   target/arm/{ => tcg}/mve_helper.c    |  0
>   target/arm/{ => tcg}/neon_helper.c   |  0
>   target/arm/{ => tcg}/op_helper.c     |  0
>   target/arm/{ => tcg}/pauth_helper.c  |  0
>   target/arm/{ => tcg}/sme_helper.c    |  0
>   target/arm/{ => tcg}/sve_helper.c    |  0
>   target/arm/{ => tcg}/tlb_helper.c    |  0
>   target/arm/{ => tcg}/vec_helper.c    |  0
>   target/arm/{ => tcg}/vec_internal.h  |  0
>   18 files changed, 39 insertions(+), 14 deletions(-)
>   create mode 100644 target/arm/tcg-stubs.c
>   rename target/arm/{ => tcg}/crypto_helper.c (100%)
>   rename target/arm/{ => tcg}/debug_helper.c (100%)
>   rename target/arm/{ => tcg}/helper-a64.c (100%)
>   rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
>   rename target/arm/{ => tcg}/m_helper.c (100%)
>   rename target/arm/{ => tcg}/mte_helper.c (100%)
>   rename target/arm/{ => tcg}/mve_helper.c (100%)
>   rename target/arm/{ => tcg}/neon_helper.c (100%)
>   rename target/arm/{ => tcg}/op_helper.c (100%)
>   rename target/arm/{ => tcg}/pauth_helper.c (100%)
>   rename target/arm/{ => tcg}/sme_helper.c (100%)
>   rename target/arm/{ => tcg}/sve_helper.c (100%)
>   rename target/arm/{ => tcg}/tlb_helper.c (100%)
>   rename target/arm/{ => tcg}/vec_helper.c (100%)
>   rename target/arm/{ => tcg}/vec_internal.h (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
> +                        uint32_t target_el, uintptr_t ra)
> +{
> +    g_assert_not_reached();
> +}

Do you have a plan to restrict the calls to raise_exception_ra() to TCG?

