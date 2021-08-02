Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E263DE03C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:43:57 +0200 (CEST)
Received: from localhost ([::1]:48188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdqu-0001YE-5P
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdpj-0000ri-BU
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:42:43 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdph-0002Iv-Uq
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:42:43 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so1510911pji.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 12:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MdI9ytc9A73M6G+pMwUNHMae3IhGFjLmh0ifI2o0qK4=;
 b=v8H8Uz8U/O173+EY1UzcyECOk8aPRgvqDp98qJ3Tc6w0qOAS8j3aOgf1pKkpkUN+7X
 un0i3K7rWkCeIucMFdOdEjI/fESaDppmDKrM7fUZ6Ln0C9qgxNuMTc+WyFJI+qKZkXio
 S3vhw6sKnN/hCn7b8KdknXD9YztfeY0xt/5cVtWoVVO+rVb8zWXKaIPkboAoVuJBAZFy
 qVwOQLktWbT0nfyiUDaS4w560jmXId+nvPRHiuPE1vSnBuBBvX19R0ASQaC+yZbm3ynr
 rGzhx0OL+f9ZAlIbenBsGn1SxjiVrn6ZGVuMU+EjP0PVD8ViLDM+hzjTUOuO5oKVylaA
 DHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MdI9ytc9A73M6G+pMwUNHMae3IhGFjLmh0ifI2o0qK4=;
 b=h8IcBWYmTvPC9ttWNM4OwLu/ovrzhMtsgm+WQ2sPl6K6hpWwr1mqkySXF4lP7IfKNk
 VKC8J98s4XikKyXLhdAI5M/7QEuC02gdSShF7Q3kaGBuB5NdG6Xur4EWof/s/PjUUHo0
 TUGgH7hevMdSFccIwWI6WKRu2E9FKY8KWYbPxZoVJb5P6JnPEXi2O9RQCwi+nUixbQEk
 khJlxPz3pACWeUoBDMpDBE41bZNXnLjvflW14ViQmEG4pZ27cSUc7/h9WwLz+z04HP8c
 +32SpPQ9NaqBqAmbXtuso4wR+EmJMO8bdLaZZoz7vZyu7x4X1SNDSLeQcl5C/XiAjKvN
 JI+g==
X-Gm-Message-State: AOAM530Roo/Fmc24t47TILbNGDLJqbRnAQ4u1zmejFDQXZGf9VL13sXv
 9UK8/70kx/5pneAn6xb+MOP+Dw==
X-Google-Smtp-Source: ABdhPJzuzstOz9sJLgSbiPZ7yGpzYlgn+MhnKUyxbEMc4+PtkZyjZC866M5cmAcR8AFZq5b/jH/SZw==
X-Received: by 2002:a62:e40d:0:b029:3ab:42cd:d156 with SMTP id
 r13-20020a62e40d0000b02903ab42cdd156mr14303095pfh.81.1627933360591; 
 Mon, 02 Aug 2021 12:42:40 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id a20sm191362pjh.46.2021.08.02.12.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 12:42:39 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 2/5] target/mips: Introduce decodetree structure
 for NEC Vr54xx extension
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210801235926.3178085-1-f4bug@amsat.org>
 <20210801235926.3178085-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91a881b4-7b82-2f8f-7700-e42db90e46b8@linaro.org>
Date: Mon, 2 Aug 2021 09:42:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801235926.3178085-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/1/21 1:59 PM, Philippe Mathieu-Daudé wrote:
> The decoder is called but doesn't decode anything. This will
> ease reviewing the next commit.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.h        |  1 +
>   target/mips/tcg/vr54xx.decode      |  8 ++++++++
>   target/mips/tcg/translate.c        |  3 +++
>   target/mips/tcg/vr54xx_translate.c | 19 +++++++++++++++++++
>   target/mips/tcg/meson.build        |  2 ++
>   5 files changed, 33 insertions(+)
>   create mode 100644 target/mips/tcg/vr54xx.decode
>   create mode 100644 target/mips/tcg/vr54xx_translate.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

