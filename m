Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D68239C501
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 04:20:24 +0200 (CEST)
Received: from localhost ([::1]:38764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpLvC-0000oO-Ms
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 22:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpLuK-0008Js-1L
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 22:19:28 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpLuI-00085X-0w
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 22:19:27 -0400
Received: by mail-pg1-x529.google.com with SMTP id 27so9287742pgy.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 19:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YbevpYdZY/gCcPsEQXvJLBVaZ25kgXVXhCedwdEsmb8=;
 b=VtGrweiFUnMqPnkV8YQ44tN8u+QrbVLjg3ywsa/swD8PitmU2B0I6L4HJoqXgnA1rZ
 yezdlY5U260doiui10FfDJ7yDAOBtk+a/MtiupyDnsEdzv36HBLvFIuPbtGl6xH+YSYx
 PC3yVzcqurZd63aMQmWIxI276cagBxuBsLxCXErQ3XhOBcAmTTZpzhhwXjQoZEvccpgc
 JzpiYO+WEDhbMVw8Pbp2HQZ4Qu/MJqyLADrgf/sDoLVommHO96sVvGXGlau9NOaIkENr
 OUH3IiUsB/CNeG0kPHDp0IS9N7PmYyON3FHd4EvGrx8cLjn8C1znLECQY6lKHt8zPcpq
 AB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YbevpYdZY/gCcPsEQXvJLBVaZ25kgXVXhCedwdEsmb8=;
 b=Fd6M0K90Xw/7kZt2fu0bejZfC4wxY1Rx0xYFTtfWNwDveUXxoXBEiHmd3dlx3qr8Q3
 PZDuykfiwf99puwg3IinkOLr4jFBiGcy2m6Oa08p/SubNOKpzI6eTUH3scGdTRS9YED1
 QrOZxLYDLk6uLZY8zO7+oOfKtZ8nmHNGN1TdY5PhuNwngHFUb0hyLoO3mLl9JCwJSP5x
 ix/PygCfFEnyDu2QBvX9dbFgUe/Us7numt3fVbeWav1ovu1AMxDo8XTrhYS9lKp0oTv2
 V6xE8zjFtmUNx1qTjAYuBAGhLbQrduAkGURyqoXkBZS8/KIpwWG8GaO40GOb7pB8FTKF
 Y86w==
X-Gm-Message-State: AOAM53141ED16OIPGXO7QY7Zj7UgEJrQWbDZKvRTaElCAN/2gTNSXSeH
 UIHxBcyTaUrwIps2TGW/v7weCA==
X-Google-Smtp-Source: ABdhPJzN7c8UbbRu6gkz8m3lknml6Sw85uiikqGgFAeLxZ0pDGon/sW91rUPg+CWduZmQPfEWLA0tA==
X-Received: by 2002:aa7:8392:0:b029:2db:4a7:d866 with SMTP id
 u18-20020aa783920000b02902db04a7d866mr7381853pfm.66.1622859564187; 
 Fri, 04 Jun 2021 19:19:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 i21sm2712317pfd.219.2021.06.04.19.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 19:19:23 -0700 (PDT)
Subject: Re: [PATCH v16 51/99] target/arm: move exception code out of
 tcg/helper.c
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-52-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a3aa04e-917b-cfb2-124f-10a23062e81c@linaro.org>
Date: Fri, 4 Jun 2021 19:19:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-52-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> cpu-sysemu.c:
> 
> we need this sysemu code for KVM too, so we move the code to
> cpu-sysemu.c so we can reach a builable state.
> 
> There will be further split later on in dedicated
> exception modules for 32 and 64bit, after we make more
> necessary changes to be able to split TARGET_AARCH64-only code.
> 
> tcg/sysemu/tcg-cpu.c:
> 
> the TCG-specific code we put in tcg/sysemu/, in preparation
> for the addition of the tcg-cpu accel-cpu ARM subclass.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/tcg/tcg-cpu.h          |  31 ++
>   target/arm/cpu-sysemu.c           | 670 +++++++++++++++++++++++++++
>   target/arm/tcg/helper.c           | 734 ------------------------------
>   target/arm/tcg/sysemu/tcg-cpu.c   |  73 +++
>   target/arm/tcg/sysemu/meson.build |   1 +
>   5 files changed, 775 insertions(+), 734 deletions(-)
>   create mode 100644 target/arm/tcg/tcg-cpu.h
>   create mode 100644 target/arm/tcg/sysemu/tcg-cpu.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


