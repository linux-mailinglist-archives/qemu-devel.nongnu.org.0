Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4102369CF5
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:00:19 +0200 (CEST)
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4mX-0006E0-Hl
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4kv-0005dz-8m
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:58:37 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4kt-0001Dz-HY
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:58:36 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso2060548pjs.2
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 15:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AFHty9IHLSGc0YhTuue+7PLrSRso+/niC90572h7FwA=;
 b=fyQWighMTycn8tsLGKVd0E9gXIJBJoN+CtqPktR2WQx25udoILmo1tYenpTyaWTWgG
 birKI+cG8awVUhWn3Tq8Lvkm85QMdf2+/3G8YYoisNIsM8faToU+sql4WsZCnZBeiOOX
 cEtz+LvJJXppE1Vt4Q4OaIXhfZ8lwdJ7FF6I9zUysr2FophqUK4ppIaYivkZcQeH3m6r
 q3F7YyLs/lbqzcS1TV4lg56m5uAgeosjeAJML0ENaPjHf5cqIkSC8P0Kw7HVWbe4waNW
 ivR7PJMdzGee3gAV1xvveZIZd50Z0BAW7RZeJIZEZqQZeLIbZpgAWD2xnBNLh7OuuAhn
 KGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AFHty9IHLSGc0YhTuue+7PLrSRso+/niC90572h7FwA=;
 b=iVzeuF33d1FLF9oX+I/CDC3ZnwWx7pTDBvZFIHTcmH5ZL1ulHvkZ3vR/4fXxhQPK4d
 VOpu3JJCyRpYnC2CzsDG5o0v1RGFZYwiC8HhNbmIIquaJdE1EPEYP8E5Hpi3qBNdJm4K
 Zwhx8gWbtxKv/6fFRTL3EUWFUQGzzHQbOyaBiFi1S4ApAYRpBdZyn4XsU5Fxid047mYN
 1cYApE7cudQtfAAOnFYdfjI7TTZ8EbbPayMxtW9IvVJLGfPLUxHQj07P48WCKPopqFh6
 sgFbWQJR5DyHhATmJV8ghqYLm1bzhlZc7mntwOxHRrsjni7HT5cDBxJ+lgwpZb4QZ3k3
 0u2A==
X-Gm-Message-State: AOAM531tk2z8kOCW1tR17ECpFdw9YUK/OeTT0hFF92nWjOy7xV1mAWHg
 AfY5G8rBTj36G8mg4smCbae61w==
X-Google-Smtp-Source: ABdhPJxCuheNpcaGJIGqnAWMskr21R69WO+h3A8t9XFzmXMmRJ37EncSAyAmgz7jcWP+g5jjGgkYZA==
X-Received: by 2002:a17:90b:110b:: with SMTP id
 gi11mr8039778pjb.173.1619218712104; 
 Fri, 23 Apr 2021 15:58:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id d4sm8186892pjz.49.2021.04.23.15.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 15:58:31 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Migrate missing CPU fields
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210423220044.3004195-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <589cfbc3-b0ed-bb49-6763-ae0b2426a520@linaro.org>
Date: Fri, 23 Apr 2021 15:58:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423220044.3004195-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 3:00 PM, Philippe Mathieu-Daudé wrote:
> Add various missing fields to the CPU migration vmstate:
> 
> - CP0_VPControl & CP0_GlobalNumber      (01bc435b44b 2016-02-03)
> - CMGCRBase                             (c870e3f52ca 2016-03-15)
> - CP0_ErrCtl                            (0d74a222c27 2016-03-25)
> - MXU GPR[] & CR                        (eb5559f67dc 2018-10-18)
> - R5900 128-bit upper half              (a168a796e1c 2019-01-17)
> 
> This is a migration break.
> 
> Fixes: 01bc435b44b ("target-mips: implement R6 multi-threading")
> Fixes: c870e3f52ca ("target-mips: add CMGCRBase register")
> Fixes: 0d74a222c27 ("target-mips: make ITC Configuration Tags accessible to the CPU")
> Fixes: eb5559f67dc ("target/mips: Introduce MXU registers")
> Fixes: a168a796e1c ("target/mips: Introduce 32 R5900 multimedia registers")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/machine.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

I didn't review the whole CPUMIPSState, but I agree that everything
that is added should have been listed.


r~

