Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB6E36A296
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:27:22 +0200 (CEST)
Received: from localhost ([::1]:57354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMzx-0002Fd-J3
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMrD-00041X-IG
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:18:19 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMr8-0003PC-Mk
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:18:19 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 kb13-20020a17090ae7cdb02901503d67f0beso5995031pjb.0
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zEccYKy19ttEa88PvWowiNDnFEvlqdtBOje6PKXeGtE=;
 b=uQVPHtrUrY5TqdGQqwOds6wd0hfORLHCn4qB3SkFYW5eJD5KvaqjvgImz3lOFu4MyB
 qsg8ZzkhOK4Q2Re3qIyrlqdUDWRddLXr3K5z00Arwwxb5Sd4zH/F+DQneZgX69sgxuS1
 HCws09v0XfpOmvX3uTcyZvaWDFjnYDGfWVLluUa77cZZ99n8LRGkiwK12FECi7CpWLA6
 WfJxzMKSXAj3zcma/j9mB1rzCZovcJVQ2AgDI9m2Ad26VY8Ia0MOjtcRMJDfJPs2doJ5
 Sh+YepNGkcj/g06vUjoU2DxhNUmToh/7auR4MuKDyuvbEti05QmyL4w8Bzm1GTRarP/5
 sUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zEccYKy19ttEa88PvWowiNDnFEvlqdtBOje6PKXeGtE=;
 b=PYMuHAPi+zfZAFS9a1cqeU7P3qYSnr9MtClOQwtjR5Lbfj/8qzfbzDNs3IquL23Hdk
 IyzQd4+KE7LdlLzdED1vwuvvND2Krmh/6appW3ji+u5BrXLSrC38x6NyxQMAlk6oEzUW
 fEkZ72uL9/Cv4ieIAq9Q53v4f4cczuDgCfTG5caagJVS43wtxTW2RPvgAVZKaLp4uSYz
 IsgXzFR94jyclARlbvY9gTHFza/pTkMt2IhoJyt5AgHEW4fhBgpZnFy1SwEPmZwFP/Ec
 RlYH+ANKWG0wDY838xJkEdj/5Dct5gzADlw+8kQrlrC+KOXPy8VisiHzECFWEAqxqGjE
 aziw==
X-Gm-Message-State: AOAM532pjKPiqrEKFRaBa9ecnQhSrm8HrDE4ZQsck6XhKahagKE3sq0Q
 ymNBcwzaeyQnkM2OsmhH+DP4/Q==
X-Google-Smtp-Source: ABdhPJynFrvdQDsDb6nCHA9F1IQwkANTiIt4SCf3BoKOgbU0wxY1RItVve5aaoTBgNZLACuhPFX/UQ==
X-Received: by 2002:a17:90a:9405:: with SMTP id
 r5mr12955101pjo.139.1619288292880; 
 Sat, 24 Apr 2021 11:18:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id l62sm7288646pfl.88.2021.04.24.11.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:18:12 -0700 (PDT)
Subject: Re: [PATCH v2 42/48] bsd-user: style tweak: spaces around operators
 and commas
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-43-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7acf539d-9d58-31ee-e3ba-69b99bebbb2c@linaro.org>
Date: Sat, 24 Apr 2021 11:18:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-43-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 9:00 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/syscall.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


