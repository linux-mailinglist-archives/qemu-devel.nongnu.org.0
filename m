Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26575412933
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:09:23 +0200 (CEST)
Received: from localhost ([::1]:32952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSPZ-0000sT-Mf
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSJw-0007so-1d
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:03:33 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSJu-0005WR-6a
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:03:31 -0400
Received: by mail-pg1-x52d.google.com with SMTP id h3so18901215pgb.7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 16:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Eb5tbAUBx4O4TjBuubD97LwuJ+vCfrpj9eSjgWMaIq0=;
 b=Snakz9Gk+4NsxXkuPyEymkKYCx9V50muLct4cVVWOxwwUHzm5E2N/GUEECOaqUkgM+
 dqV0Hg7vypH9KUN5leFHSNn1W2ACm9JXplSwCMsbDfkfS/aDr/vS/sBoX4XjuXaHPX7o
 YRM3rcG47E3JDvj+YIQkOUIQ2Jfu3P3sQ7ZI309ZPg0aN6APYvd5fSav0VAMrqbyCi+V
 LVdra2Xx8QVHzBzQSbaVCY5zOHNLlOu5P0Lt0iSAHsG6FPFVKrNIknkd5cCEFUNH9+TU
 iG72Ka+8k+RaLuWxkUp37VAKMzXmvc6WV0jbsETOUHj7ZrrMQQC8j6R2j/08W139gpZE
 VpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Eb5tbAUBx4O4TjBuubD97LwuJ+vCfrpj9eSjgWMaIq0=;
 b=zYaYbno/STjIfVQfxVWATaBoiOFyRNap9QpLubV4NIxHZOKeu200AjLYpjcMb+kS45
 KJpKYov1ph9cpAA87bPnIrtNRjJGaOmDeTfhVteiLkF0tTTayrkoZJWnOrOJouAuN8wV
 rIfiQyzm0YtYCtaRR2/FpJNiM8IapIe4Rglw4y/B7kFOyUoYxpT0reICRIvtfgDUALsF
 6VXY3Qm3FvXN/RmN3P02rCxR7tD3HcmM4HI1sYh8pWZqjZaKmU215QWByI3U3KX+AIuf
 RQV16YHd0eJ/McvKovrs90uK8uG801/cAyhj+5thqEr5Z3L2QHzbyD7QvnvE76Ad5Rno
 GyEA==
X-Gm-Message-State: AOAM530D3ruFeIILC+Y37V2EkLI9AaKn/HG4w6Y1BDN13ZndYTKKaUN2
 KOEqUFXbVDHVvp6WQAgIF3vWnQ==
X-Google-Smtp-Source: ABdhPJzEmv6zGWLPuYQmNKHYk+Jvo0UIRuQju+o/tsY+6n5FVSAn0eQMXaoB5q2V4tCku/Ttab+X5Q==
X-Received: by 2002:a63:d806:: with SMTP id b6mr25811383pgh.395.1632179008591; 
 Mon, 20 Sep 2021 16:03:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m12sm449481pjc.18.2021.09.20.16.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:03:28 -0700 (PDT)
Subject: Re: [PATCH v3 08/30] Hexagon HVX (target/hexagon) semantics generator
 - part 2
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-9-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ef87e8d-f573-9a71-5040-85ac45018e7a@linaro.org>
Date: Mon, 20 Sep 2021 16:03:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-9-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:24 PM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_helper_funcs.py  | 112 ++++++++++++++--
>   target/hexagon/gen_helper_protos.py |  16 ++-
>   target/hexagon/gen_tcg_funcs.py     | 258 ++++++++++++++++++++++++++++++++++--
>   3 files changed, 364 insertions(+), 22 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

