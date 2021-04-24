Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A8F36A281
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:12:29 +0200 (CEST)
Received: from localhost ([::1]:33968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMlY-0000tI-Dg
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMj4-0008U7-SM
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:09:54 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMj3-0007Zs-Cf
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:09:54 -0400
Received: by mail-pl1-x631.google.com with SMTP id m17so763966plc.1
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2rTUVtVsFKAdOLcVY4zzmwcDPm6/0RZsAHmH6nRHAxQ=;
 b=pKA6egXGxOj5IABWY2zNJ4wJzVuWL+xo434EoN8a41E4CDRIy9uu3peZqt5NL4lRx/
 gXA0iLGAERS8HPJtlyKgC7Z/WFVPqCXbYAbnMN79K8+dUkDGCy3Qu+O1YRkyMzN1zV/n
 V+0mPnJpJmjba7oHwPoqPnr9u5ED+wQk90bOk1jyYAZMgGcaRxDfi4vlI4RTCmR7ZF/L
 xMBtBcCC7oKBmYUrWVuoHmobK/adRUl9sfUQItcpAA2QyylB61BE/YRk/3bkcwEXRTmj
 abVD6715DGZIijZDyTccVa7xUNBdmF5Q8OZ8i3XRlvnLG7uchZgrK7CB1actWvmYgpJG
 UULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2rTUVtVsFKAdOLcVY4zzmwcDPm6/0RZsAHmH6nRHAxQ=;
 b=YHFKlLlz4Lcc303ji1OzA7toi6+Mn2lrWfta47QOZLc1ITdahKoFRucOStTAkdaKjy
 cEi5XTmx/DEsU9Lt6EJtmOdggGoQH2PaEOKKH0gd1cr024eobqVobtj5JvLKZcdG5lIL
 Y/hXOF1rW3jGlccJ7v+KqtyByfbfmIxftSjDDqIruGiO6nAHlIj7bNgNNac25729MAP+
 g8c/+N5rpU2wx0MmIOWOiy3l61S+wGbtfFRgEXLfKzdGIduw3nfKZXP4dSe4KeO3usaI
 JRBnyTuIeZmSObU5lrZuad2NP+TlFcDBYcAjtXuiMTj94jvj7jMPMk/h1p0L1+lA2HjK
 47JA==
X-Gm-Message-State: AOAM533G+pZuPKJOjdgMiAn149OMwZiz2FXyYBToSteRecu3/tnVq2UP
 C27FZnY2uK4OhBMvLhfoPrMWPA==
X-Google-Smtp-Source: ABdhPJzUSaPwj+QcYoOCKuonmLSTmS8n8wnSZ9Sgu/bEg8ZnWo8zLmri+Rstnuo7NYmcQv49MqXa0w==
X-Received: by 2002:a17:902:c407:b029:ec:aeb7:667f with SMTP id
 k7-20020a170902c407b02900ecaeb7667fmr10235980plk.9.1619287791912; 
 Sat, 24 Apr 2021 11:09:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e1sm7541922pfi.175.2021.04.24.11.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:09:51 -0700 (PDT)
Subject: Re: [PATCH v2 34/48] bsd-user: style tweak: don't assign in if
 statements
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-35-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92688b24-94e8-ed0f-b9da-37611c7e7be7@linaro.org>
Date: Sat, 24 Apr 2021 11:09:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-35-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
>   bsd-user/qemu.h | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


