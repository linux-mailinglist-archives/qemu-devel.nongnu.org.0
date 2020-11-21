Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC392BC1EA
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:07:31 +0100 (CET)
Received: from localhost ([::1]:42796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZAQ-0000V5-A9
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZ91-0008Lz-Cg
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:06:03 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZ8z-0003kQ-Oa
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:06:03 -0500
Received: by mail-pf1-x443.google.com with SMTP id y7so11139258pfq.11
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aidsLClWvfGrmD3iDYyqbEThYLsV2cw2aSYBXT0SED0=;
 b=SX/aRrtwda+hZbr0hgYZgCyzah7sDD9lJ5Z3eXGafGcNEbysiWxUwV22mbg0q74De+
 +n2NLnz/acDUQsQKq6+36oA/P2pbRZ6LAp7N1ZLOJUDznbQ5XQouodm2Grt1cOGH6Wv9
 h1cWrAwLTSxoC/HGTa1U3yuhR3/J3BoJZxw1ujruK5DapW31Bwbe19DJ3hLXa/gAal8j
 58a56hWZFTEr9RxXrGc5iLkEgKgsm4ZTWAxn84uuutQLEjhJgNee5AKtuE/8WUsWCWgu
 G3RUvStr6wGMU8J+rEsEHrpRTUToxU0YBfDat32BnK4AUIR2ncCfZG5Pxy6NOuJACxjk
 r89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aidsLClWvfGrmD3iDYyqbEThYLsV2cw2aSYBXT0SED0=;
 b=B+XzqQxK/6peWLHMQoNU7kou1EjLITBPDkWI82AOkytqtDslnUdOwMaizq0K9skNfj
 vvifUW15qI2FGe8cYnAfxcO2PwUKg1TgAkxt88bZCXqVdsXPD1efb9YMOpLJx4hEtN4e
 P6XeBhK/1O/LBBE/lxp9S2EY//2pcBO2X5IERhX+vetoz2DMxe6tAka+n2nbt5BhD9w0
 10uX46VvsS/+G7OzwFAm2alOF12pBP9S1pCKwZdYkokuFM3loVvl0xqkjfXox9iyZwE+
 ykhYFp8FGOsAc/AKCGjfdPBtpO5s1ydiwx6wtld43AO+GL64e/ZXOrUnVKebRNOuJ45N
 YZsA==
X-Gm-Message-State: AOAM533vZtiQp6OI7+pgKYfSkQSFtVhrFmsppW8ZKY59YilUzSzSGWi3
 mr0+jp7iwFfyHqOuvr7DVSg1Rg==
X-Google-Smtp-Source: ABdhPJzn+5lzQhhaiKovfJzmhvafNYaxBUBzIqn/0WMy6y0hNjCPUH0Q7jyYZl0zfV3DZw2+95+TdA==
X-Received: by 2002:a17:90b:3004:: with SMTP id
 hg4mr17042589pjb.57.1605989160197; 
 Sat, 21 Nov 2020 12:06:00 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a21sm8093230pjh.3.2020.11.21.12.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:05:59 -0800 (PST)
Subject: Re: [PATCH 13/26] target/mips: Extract NEC Vr54xx helpers to
 vendor-vr54xx_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65101609-f6f1-11ad-01ad-ab277c2d6250@linaro.org>
Date: Sat, 21 Nov 2020 12:05:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
> Extract NEC Vr54xx helpers from op_helper.c to a new file:
> 'vendor-vr54xx_helper.c'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/op_helper.c            | 118 --------------------------
>  target/mips/vendor-vr54xx_helper.c | 131 +++++++++++++++++++++++++++++
>  target/mips/meson.build            |   1 +
>  3 files changed, 132 insertions(+), 118 deletions(-)
>  create mode 100644 target/mips/vendor-vr54xx_helper.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


