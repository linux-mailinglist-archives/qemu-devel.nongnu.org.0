Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5407937697A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:24:07 +0200 (CEST)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf4Cs-0005jL-D5
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf49W-0004H5-0i
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:20:39 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf49T-0006U3-Pj
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:20:37 -0400
Received: by mail-pg1-x535.google.com with SMTP id m124so7584558pgm.13
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 10:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cBdEiAdmsO6oOJw11FopNzR17zqSZ6pjpZMeeXuLhHc=;
 b=taNX8yN2ZFZA/SNwaLchFJiFPG5w4HwjMfl+DVwzCXUBvZAq7n6SOL0RpO4uhd/QIX
 AFiPlyp/av1BZ3gRAEflqyRd9mE0/2HCaRnfTOnW8PaYZH98crRGmzt6nKQRAxaJWwA8
 9gtwXuxc/+1suFbNOuUGlWfhmsC+Avv7myXLM/yGDxwUKWJkXvyXbVlS4gUu7Gnuw9sv
 PrdkD+AiawCyk0+RDSG5X3BrfZj/u1ozVBYYWEEHeUITb85jyAas0z9rKaELEj8tbS3g
 cBqkmz0ZSE3mmC9p7WuIFhGDd4e0HbE8WdMrxJwpE0GfvoK5jvQ/mylNLXTObuj5Tjty
 yQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cBdEiAdmsO6oOJw11FopNzR17zqSZ6pjpZMeeXuLhHc=;
 b=LNH6IJ51s52A7ZsPa5M8lTUUQ2kh4sAATa75fq9MUNE0fsq3ue7KKScRlNzDo48Im2
 eyXJKiKT7XGiahpsBj0KjGNPhgkZ716WSR0VxVJ8Ptp0N2oyNRshPAhv2ZmHufHni7Dl
 kpv1o7FobSylxCmWcJuZHJ4Mm0IAMiOwstkAbHkHFjjfj+6VjS4cIm+7d9RHPFzodInq
 4V1NbwGGIXbQMJXjp+bSzkCppWMw1Gk8y8jGVYxWzz8GdNWmUaGBqwR+XIB/t4EgEEHj
 A0ld/peGUV4dQxrMt+rlT+O7xkq7LflEtgSshVHaUm8E1yyJYGJK4KltbWNi7S8P5fEP
 yOMQ==
X-Gm-Message-State: AOAM533QtUR1B2coEEykG1vYm5+o7Nd4KcFPqYxzw84VcTPIear4+Z8c
 rYRA2k1+xowdB4M1NcDxMm91Yg==
X-Google-Smtp-Source: ABdhPJwmiwVNNj9Km/3b8yFNUs0NjwRW3xu4ErSD/pN4LlJrJAH0dWyrdpETX8SqJEsKuf8VWVOKVg==
X-Received: by 2002:a63:db53:: with SMTP id x19mr10930231pgi.327.1620408033089; 
 Fri, 07 May 2021 10:20:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w1sm5046197pgp.31.2021.05.07.10.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 10:20:32 -0700 (PDT)
Subject: Re: [PATCH v4] hw/ppc: moved has_spr to cpu.h
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210507164146.67086-1-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6d51fb2-3180-441c-222a-c3a78d813ad2@linaro.org>
Date: Fri, 7 May 2021 10:20:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210507164146.67086-1-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: bruno.larsen@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/21 9:41 AM, Lucas Mateus Castro (alqotel) wrote:
> Moved has_spr to cpu.h as ppc_has_spr and turned it into an inline function.
> Change spr verification in pnv.c and spapr.c to a version that can
> compile in a !TCG environment.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   hw/ppc/pnv.c         |  2 +-
>   hw/ppc/spapr.c       |  4 ++--
>   hw/ppc/spapr_hcall.c | 12 +++---------
>   target/ppc/cpu.h     |  6 ++++++
>   4 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

