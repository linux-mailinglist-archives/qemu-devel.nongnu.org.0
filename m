Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F6D2BC1F0
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:11:05 +0100 (CET)
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZDs-0004tu-8r
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZAS-0001It-45
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:07:32 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZAQ-0004EQ-HY
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:07:31 -0500
Received: by mail-pf1-x442.google.com with SMTP id 131so11157320pfb.9
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VxabgZHid1MhB1CxwaR3hjPN0QSdxWKkgBIYUiDyYb4=;
 b=g/DNLmI12jcSTtnQpPZE7YdZBjd4WlF2wx46ikqCvy6ESF/bfBkaCT56HFu7eOoMkN
 HwZ759dtJHw0wnK0t3qqBBoUWkYRZ2UIH1J5+EYBZEFW4YAAIqncUZkRwEgMgA9INSae
 RPtPYUqFSu9m2SwNNpi1E9hbeyaBdMi9gtM2voT1WVr7/WdttzYgH0xlcSXSdTY5xQVj
 ND39e3i12Py7tmpuq7msSYU811ZL4qsDklfxUCYp17Cx10MF3qXlthDNS0ABG31ImoIm
 bnPFpDUQ96pJCiQiZFOF6V+J0T1DzuwBPkiUODDZ0l8yc7pLXOInJ2JW1uU6ysnC5Htw
 eQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VxabgZHid1MhB1CxwaR3hjPN0QSdxWKkgBIYUiDyYb4=;
 b=cbydiYK0pKmQLmE+XLZVpWZv2EiH7fV9lHpP5A9fuzi9jTXU6ulG+5LOB0ALnuGFr4
 IE1Ip6vfKB6z36Q+lXqCOxeJn7ixNAV5vjv0oNjrMmyPLep7jpUUYYD9VRRcn+BhArFY
 CG0bWkkMVUF0gwxIXkBO+QmhAD5yOyYNauELLlGVhJKTySxQwI7uWuGMrHZgE8OwtgcU
 LFKW23kPd5gZ+lv31IPSBvkPEY/wfc55k3txdlZ8YvVIrPxiquIh+5sBEz6gJVzYmIYP
 c+A3xWPqo8RIo++LWWO/owvlSZHHC04L2K3NjkckoxWtUdqw6hBDaZXlXU++Ucmj3vaf
 J1TA==
X-Gm-Message-State: AOAM531U+zsuP4w8XsiGIBJMs6OAQfnTlmeZjsATkE1KMHHFID0CXzVi
 fBegMYvZ9BUFiSuq5TPi5Xa6fPVJ90IYrQ==
X-Google-Smtp-Source: ABdhPJwd7aV6qtdN8rBQTSpy5PExWrbd+gdHb8DIbAIolE3QD2CNQZEL+gw+4p8W6vX97UkOu7ab+Q==
X-Received: by 2002:a17:90a:c254:: with SMTP id
 d20mr16789513pjx.112.1605989249240; 
 Sat, 21 Nov 2020 12:07:29 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id fh22sm8376224pjb.45.2020.11.21.12.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:07:28 -0800 (PST)
Subject: Re: [PATCH 16/26] target/mips: Rename lmmi_helper.c as
 loong-simd_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-17-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c29fd890-93c1-702e-b6b5-57289df4cdc1@linaro.org>
Date: Sat, 21 Nov 2020 12:07:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
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
> The LoongMMI extension has been renamed LoongSIMD
> (part of the LoongISA). Rename the helper file accordingly.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/{lmmi_helper.c => vendor-loong-simd_helper.c} | 0
>  target/mips/meson.build                                   | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename target/mips/{lmmi_helper.c => vendor-loong-simd_helper.c} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


