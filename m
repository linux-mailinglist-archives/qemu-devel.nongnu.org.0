Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD2A2BC1FA
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:12:29 +0100 (CET)
Received: from localhost ([::1]:57616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZFE-0006YM-Fb
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZDr-0005Yr-Pk
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:11:03 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZDq-0005TA-64
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:11:03 -0500
Received: by mail-pg1-x543.google.com with SMTP id i13so10480357pgm.9
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TUWCUK5/MOX1pWPj1p3le76cphWyIprYbhmjXS3j3jo=;
 b=zAHsOkrGlw4/5mh/el4FskubyPEituXCkEYNcHCX2AYjstgDsiuzrKdVFe/TCykd41
 lwZzwVSALQRQfJTT2HULdSYmcLhCsmOx+u/MwOCJs/YJkQ2Xb0WojRH9N/FAkXPoHtyL
 373eaHhejoC8B9cT/hARfd9TC+11S99GgkXR2HodtRKKIkz9RLm84YgCBJ4mSlbSFB8B
 K6OBA+eZvZH/8ukY+mruHXVvmhlZlC6nklN0p5q+AYjsxGdH4pVqBwcCmJ2TDFQSGaSj
 Sdv9gS9JDLoq/VdYSreuvVHoGhHYqoEmzQ5sxPJbrHWGvyTt01UMga9ptxMr0kL5NabB
 hloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TUWCUK5/MOX1pWPj1p3le76cphWyIprYbhmjXS3j3jo=;
 b=Svpf8iXrFbca+OE/mqHoXE8GCvf3NJ2pUkDCFvZdzshwxqltQVty7xLIGZpIMbfGUw
 ffCDT+Q8I9DL+1s7j7mazP8KASUqfrI+Z0vXoM8Dpfsnbe+8l2s++YwjuxSMBr0nKb+j
 1o8BWhKTDOjbDmaYur4bo3MNDghTNYZcwcWkbrRC8O83S9LS4EruiEjaMCQAFT5jO/or
 aZebxC6PF6N6gDw2Bm4QvhbHEz+XQGwKfQE/NoZsKThQK+XWH4siVYDG3X8TKBZSoJ8d
 llu2xRxV6A7Ps2Mzftu75X5+jz/sX7baogZHqxHWPdLyX3u2ldU1LblFsIHmpUvprOxk
 6vxg==
X-Gm-Message-State: AOAM531on225oDokMmisIZj1USVp4uRDRRPAmK2wqsxUT1qibmXfOzhN
 eGlrGtiYjSO2RAwCHlj5NtQBQg==
X-Google-Smtp-Source: ABdhPJxW7TzzSdVfUXvHTR0XJF0jseF8qxqvLGek1XzQ6QO8NBC2APCWdB0tHWm+LtMR9p4QAR4naw==
X-Received: by 2002:a65:5348:: with SMTP id w8mr21537970pgr.371.1605989460722; 
 Sat, 21 Nov 2020 12:11:00 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 16sm8474775pjf.36.2020.11.21.12.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:10:59 -0800 (PST)
Subject: Re: [PATCH 19/26] target/mips: Extract Loongson EXTensions
 translation routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-20-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b520ffe3-1d98-88f7-895e-23e374bc2b4e@linaro.org>
Date: Sat, 21 Nov 2020 12:10:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
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
> LoongEXTs are general-purpose extensions from the LoongISA.
> 
> Extract 440 lines of translation routines to
> 'vendor-loong-lext_translate.c.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c                       | 440 +----------------
>  target/mips/vendor-loong-lext_translate.c.inc | 450 ++++++++++++++++++
>  2 files changed, 451 insertions(+), 439 deletions(-)
>  create mode 100644 target/mips/vendor-loong-lext_translate.c.inc

s/lext/ext/?  Seems silly to have loong in there twice.
And I presume this is where gen_loong_integer goes?


r~

