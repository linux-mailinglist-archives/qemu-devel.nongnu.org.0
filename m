Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42592363797
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 22:43:58 +0200 (CEST)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYEGr-0004Hf-8r
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 16:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEFG-0003RQ-2u
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:42:18 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEFD-0005mk-LW
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:42:17 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so19157320pji.5
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2DqqlLOlZNThx7SGzeDvBLTRukxHya7bJsf7c79TTcM=;
 b=L9bWAfI2l1KcErFcQjs8HnkSnegykcBKJHhuZxsNS+95j6G+zShUHJ4p6YiLWEOrMe
 OIJx3hnws1kWNk5FWQuUijp73xieVMqzn+4N/JzPXloHNN4e2zygfh8ta9dunB4hDOu2
 KRB+Rgj5/JZfYUJK+rXZVVYg9uxL+z3r9gdcYsJ6LBVvlXJSQ1T0R7qI97W4lskKcKlP
 qASQHrz4kfpub8HrAnxTUiQHLi1G5JEAzSxrYkHeEjVwJzivq21Mlv+NieyGvcMR+Nse
 UGOye82bmz36AcFfXmjN1GJXwUbs4ZmB1RNt0B4e9C7CRWvqdPZ7Gdrb/1jUOmZl2m8h
 ZVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2DqqlLOlZNThx7SGzeDvBLTRukxHya7bJsf7c79TTcM=;
 b=BiypNPatf3c5hSVJNm1VQYUdftGNN7yP61VWxg9iFXIufp23yfFFSzuzZArPa31OVg
 HhfTuk8f++fF4ZXRSnqCQtXcWBQvbIrxi78+NhNtlLo77CUqsrNs21NqK9TvAyl0HDmL
 FRV4pPiME0GcDLki+ysD0AB3DaOilRhXb/9V/KWE+G2dcUB8o6W4jSHj6XV74CIUy5pa
 wHu0PQqZqtBgD/HECqBCjPuELankDC4PzoR82/zrTc4afPoOPJ6wphsKs5DmOZB3oA1B
 RM0OfwC95qWReUuO7iYx/3F8XEX4Y3Sb1oP+o5bqFoijpBlv6/eC4UtLyKdP4s+Av8k+
 166A==
X-Gm-Message-State: AOAM530MKaRSp9040Z/6dP1FxAXt+jhssZfVAS8seXUn78eOOI/EPGOl
 BeP/jI7mjbrl2o456gxszN2Eiw==
X-Google-Smtp-Source: ABdhPJwzEfYYQyd+9xzjDH6bWAoG47vFIYF88ydd9wzE/rXJxrpIiznl+KWUsDY68a9rZ+LPuFcMUA==
X-Received: by 2002:a17:902:cec3:b029:eb:5441:9897 with SMTP id
 d3-20020a170902cec3b02900eb54419897mr19452642plg.48.1618778533083; 
 Sun, 18 Apr 2021 13:42:13 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id i126sm10081594pfc.20.2021.04.18.13.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:42:12 -0700 (PDT)
Subject: Re: [PATCH 26/26] gitlab-ci: Add KVM mips64el cross-build jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-27-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <863ce89a-b8fd-e6bd-0d3e-2ccd8e862169@linaro.org>
Date: Sun, 18 Apr 2021 13:42:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-27-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> Add a new job to cross-build the mips64el target without
> the TCG accelerator (IOW: only KVM accelerator enabled).
> 
> Only build the mips64el target which is known to work
> and has users.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

