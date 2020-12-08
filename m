Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDDB2D36B7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 00:10:03 +0100 (CET)
Received: from localhost ([::1]:57364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmm7O-0003nn-NC
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 18:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlsR-0005eM-C5
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:54:36 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlsG-0003RX-FA
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:54:33 -0500
Received: by mail-ot1-x343.google.com with SMTP id w3so327792otp.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PQ8ql5JUVC6dDLQWe3hHTJeK/OrlyGwzOEs5LugB9as=;
 b=GKn1nqrg3ha9+tv0CV+TdGJJ80fUWApNsdnmiz2+MYkAsGjsR1Qrtc2/QpWxgIHf8b
 ydu5T3IsWzvc7edu21DRjxzB+OuD4jtTg5kByMhQk05FYWmP/AfZpEIAMPZHET8lI0ra
 g95w2aaMvphHJPdPoyUD5IIJHEeBpxH1BNiQOPON8P3Ag9yuwBfaFF9/lFaSBCvaiLYG
 iwbvMCVNlYtZzBWytqcRJ23id/9AQEW4D1t5uONqbKSO+qiJ3ZNLaWW7RFQNKUVMezo5
 LXRCvN2OIIWgLyHT8FLgWnuNQK/2MPJGTR4ejOHFP6RstoANdwygzvJwgZKkNRFdz6U5
 26lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PQ8ql5JUVC6dDLQWe3hHTJeK/OrlyGwzOEs5LugB9as=;
 b=UiBtU9+c6gm00aiean6fcslavsRixxds4++4hSPd6Ddmiv9YaD1iII8ENlKOgrgTZ5
 u0MKQe3KOBVk/I2DuwqzOy1yo4R8NpdPr1XzN4OV55TvRvxapZK1xyDj55UKDMcTaovq
 e0zvezGF0+Ef03HBfgmREhyjH8K2ibgJyjtv8rEqnfBuW31A040vWJS9eP3CgpcxrC7F
 /R9rNqBODOb4/8u7vAh3A6w6Xv+7/Ss+YvDvRtnPcA6d2Qm5gbVcuj89Yf0I2uP7fbMr
 u5yio+UHVCD3XB4OsL0iJkGiGSMo/vTGeTeGR+wLd7EwvmPKPc4WjzclB1mXgVrVNxTm
 WOow==
X-Gm-Message-State: AOAM532wf+HDKF4FQI1lrD3i4BRdLIxCLBYVxoi0T80d6VN7gaOaR9Lv
 yS2lJ5l1vm/gbGEdbJWsUueqCg==
X-Google-Smtp-Source: ABdhPJzjEMaGTRjRaBYyPFnaqrmG1o5Q8LUDpZn8vFrLey65GlYioSgf3+H73zXziPZ2BVVeDv8rLw==
X-Received: by 2002:a9d:8e2:: with SMTP id 89mr274281otf.215.1607468063553;
 Tue, 08 Dec 2020 14:54:23 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b82sm42405oif.49.2020.12.08.14.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:54:22 -0800 (PST)
Subject: Re: [PATCH 6/7] target/mips: Declare generic FPU functions in
 'fpu_translate.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201207235539.4070364-1-f4bug@amsat.org>
 <20201207235539.4070364-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23c1eb1b-31de-abdd-26ec-be0142d73eaf@linaro.org>
Date: Tue, 8 Dec 2020 16:54:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207235539.4070364-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 5:55 PM, Philippe Mathieu-Daudé wrote:
> Some FPU translation functions / registers can be used by
> ISA / ASE / extensions out of the big translate.c file.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/fpu_translate.h | 25 +++++++++++++++++++++++++
>  target/mips/translate.c     | 14 ++++++++------
>  2 files changed, 33 insertions(+), 6 deletions(-)
>  create mode 100644 target/mips/fpu_translate.h

Is there a good reason for not putting these in translate.h?


r~

