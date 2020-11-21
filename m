Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB92BC1DB
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 20:59:05 +0100 (CET)
Received: from localhost ([::1]:52370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZ2F-00011i-Rv
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 14:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYsT-00018E-SO
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:48:57 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYsS-0006Iq-6j
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:48:57 -0500
Received: by mail-pg1-x542.google.com with SMTP id 62so10441523pgg.12
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 11:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zny40mwdvhNa0uLYaYl6G/s1vvrEIHoq0TBq/GXK5ZQ=;
 b=kPyafatkbwZ2t+2WFfN32SRi8n4FTSl0Q42ARxQegiK3dQBPPl4sQgzq6sHMY22UHx
 jOhrQH6BW33R1a/vTjCoCzo+8dl9J6G0xn3y9Ntc7LmCjpRw5zfcNOvcTMBRZWo74dcb
 XNRfnLGfJ7VYfqYyYtGrir8qQBshxOqs+1R4FUywxDB4MPx3457+jONPPOlnAZd6b9bD
 x046bLptFRklLjRGmgBw+BAGCjaYb67XmFP1qEi0bmWqDWBJT/cOxFhQ8jS6xUkLxTH2
 HNB1Hezit+rqYB0VqVKGkYu26qo+Q/ihrrUGiQcccRZuiBuv0lomLvDrKvdgeqS24K+W
 w5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zny40mwdvhNa0uLYaYl6G/s1vvrEIHoq0TBq/GXK5ZQ=;
 b=NoFDxUgfqLh5XvfZMZHTbGvuMxyl5WWpahTb6UJC6+QhOPx83jbhO+QOCcP/l9qKBV
 jFqaaxBzjacsQ/C5Nh+zZfE5pgl911Jr+0++DjXCM1AMeAWWFi8Mf5XWz1LEN+7XZ5t9
 X1XbVeF8QUjok2QgVQrSKdgOJPI5xgxprUSkiWmC9jBDyN4yZ3D/0Tr+jljHHOSNw7UQ
 YBVj+KyGVF+rAjZJ6fjMWaBcsBk9s7BWlNWdMn6t0bFz761SzGSvH6GFUT3TrLj8SUk+
 Uto6hDv5qpTawYURk27zZ0Tzj508EJzkhnZJV+RudG/jyDqPT+FpevEgyk3JqsFYffLw
 JkAQ==
X-Gm-Message-State: AOAM530w0qjAEkuovesjkcWg7tuQRe0MDwQ3dGdy3NsXXtS9kq3nnB87
 pDJeYFwTYYSB8ibofBKmbfooSjqwMHyTIA==
X-Google-Smtp-Source: ABdhPJycu0QXoRuqkfpqXC9IQW78cUd2zV4fCqxupRi5caZ6e7VGIrEz07y5uWZel8iKoVojulU/Kw==
X-Received: by 2002:aa7:8518:0:b029:18b:cc9c:efab with SMTP id
 v24-20020aa785180000b029018bcc9cefabmr19410068pfn.39.1605988134766; 
 Sat, 21 Nov 2020 11:48:54 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h127sm7465186pfe.16.2020.11.21.11.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 11:48:54 -0800 (PST)
Subject: Re: [PATCH 06/26] target/mips: Extract DSP helper definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3beab845-9119-95a9-5366-1cac9c37eaf4@linaro.org>
Date: Sat, 21 Nov 2020 11:48:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
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
> 'MIPS DSP' is defined as a Module by MIPS. Extract the helper
> definitions to 'mod-mips-dsp_helper.h.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/helper.h                  | 335 +------------------------
>  target/mips/mod-mips-dsp_helper.h.inc | 344 ++++++++++++++++++++++++++
>  2 files changed, 345 insertions(+), 334 deletions(-)
>  create mode 100644 target/mips/mod-mips-dsp_helper.h.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

