Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780192BC1C4
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 20:50:28 +0100 (CET)
Received: from localhost ([::1]:34212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgYtv-0001kw-9R
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 14:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYrp-0008St-2m
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:48:17 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYrn-00066j-Hy
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:48:16 -0500
Received: by mail-pf1-x444.google.com with SMTP id n137so1102133pfd.3
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 11:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Owq8NpQXEqYhcb/Z3EuQ+HNm9ZnmziyzbVeOX8TUW+Y=;
 b=vcq7gfQphkCQoJIWEtf71PJlAVGyKBP4B65YyAVB229qTENgp73amqIGUxMbBBxbl2
 BEODxxpmCR/U7CXBQrbWArpjO2fWVOruwcH40+oM3UK3e9mY74HLwjmhbnwqQJK4FTjf
 5f4+TZ3FPyHolNZiqtTyp1CBeUHZpKYDO/gHgkVrbM8rDXIlgqKJ1xl4i7fzj+eU8kjP
 eP0im68JhPVxQcAsAPOzkCaA5WxtnvrJHORh1SnmZvIxaT5kPP/a8T/iMBfx32m5Hrpd
 W+OiD+s6YT11WZeZqLq1pFk52paqMVLmDwLjmjU0SfkRDM+zUEmxUpdYisSA4RLYxGxw
 L1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Owq8NpQXEqYhcb/Z3EuQ+HNm9ZnmziyzbVeOX8TUW+Y=;
 b=NZRqd+cFkT3zZcayqDzr60fjJtmoqf/uV7EjGbnVArtJGEO+x9jzjd+p+8r1FX7hOS
 1g+RNv/2xh/S4jvkMgvMDGMFAZ+kDN28svOrd7LUFq8lihuNNT7nDzACQwTtCMrMKH0n
 BPEhnNZZgIBUJDFu9RPehmUkHhNBQMlmabzp8FnHTNw/Ifm3HCS9CHxRMknBteTe8UiO
 YwWFwbgvTCIiiJChRRsc4xsqIuKSHMGuc5Yt/m/W20+s43dDhovYppdrtVwE9DhTPEWT
 UdncLn5phSewC43t46EasJhiyjq/MuKu5kb9NmfYnFT1Z/pxDqTvODCmeDG6F6HqtNpI
 j5Zw==
X-Gm-Message-State: AOAM532MBEyAQjFFX6UWSyxU+N9iDh1pi3QKadlve2DuerryoRIqHdM5
 i6wHDRzn8otdthOuXwSjZfaxsw==
X-Google-Smtp-Source: ABdhPJyFu2WUGmXA0HgbJyrZt/ueKiLzd3uwedBBT5GmwL9zJkaG1pRZxxjLcEZLFCYYbH+wLAHaRQ==
X-Received: by 2002:a63:4007:: with SMTP id n7mr21642075pga.343.1605988094250; 
 Sat, 21 Nov 2020 11:48:14 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m7sm570552pfh.72.2020.11.21.11.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 11:48:13 -0800 (PST)
Subject: Re: [PATCH 05/26] target/mips: Rename dsp_helper.c as
 mod-mips-dsp_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <29c3dfbc-0c95-2978-a451-5ce5a5ea8027@linaro.org>
Date: Sat, 21 Nov 2020 11:48:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> 'MIPS DSP' is defined as a Module by MIPS, rename it as
> mod-mips-dsp_helper.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/{dsp_helper.c => mod-mips-dsp_helper.c} | 0
>  target/mips/meson.build                             | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename target/mips/{dsp_helper.c => mod-mips-dsp_helper.c} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

