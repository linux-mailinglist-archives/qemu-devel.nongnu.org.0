Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859F4357635
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 22:40:09 +0200 (CEST)
Received: from localhost ([::1]:44368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUEy8-0007qS-20
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 16:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUEwV-0006XF-Ho
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 16:38:27 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUEwT-0005HN-Ih
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 16:38:27 -0400
Received: by mail-pl1-x634.google.com with SMTP id p10so4817740pld.0
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 13:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x9tjJztlwSObXYlc9WYD2kAR3Ixu8zPPT25ZRyHvJy8=;
 b=RNFkJqwxLHxNGC8VQ4ob6Ppvwx/vIs6W8O3bdG5kEATm//dun0AhPETb8RvnTHBrGi
 REnzb9LTTYFr+xv6EITsotstQ4Nr4l2hfqlwmq/M897kS7XTBBt81MSQBATvCPC2xYll
 i7hblmtNLNqJUwELgyGMCLt2PsiJQzvkmDl70Ax6fdwf5L/1c7bSyOo55saDD1zoNZjA
 hlZuVnFt5jQdKM0YccGNfIZ35PuJi82kzgKPpNBvGk9osKCT2Rxrtv2Ds9Z4EKMuIbG9
 uDwyjsdzoKHhSzUXU8KeRCfkS3codOYzE1keGdPhdENTejDidrRPeIzZeJtqXxGf+TUg
 aVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x9tjJztlwSObXYlc9WYD2kAR3Ixu8zPPT25ZRyHvJy8=;
 b=RPHdIdJsn4VpYMLdlr/Rt2+gSXLj42FICWd8UqDISPA+vmlxsj/gMegSY74zlk/prt
 99IMpctPo3v2h9uJyQ8D1VTDPoXnSHTLrS4n+CARANesKxHYYA6cHxCG1/X6Fq4yFffh
 Vp18QVLvzqXm5l1E6gzeojfxoMvYSig4tgU9yk/Z4Bi2igOoMkGiU0N1aLzmtJj6OYDk
 yYfyrFe6WAygNZeOOyDWVrA6Zx32Ia7iTwy3iGZYKpCzOmQ1V4EMP96RUkOGJGXl4NLI
 XOPOGoHU8+CnVqzYsJbv7F59N5ZSWnp6ynKWm0GxMoPquF9FHbkMzL2MY2LcZmRSfTUy
 vTMQ==
X-Gm-Message-State: AOAM530usB0+UlSwjcPT9QvQJ/3dQPwTd6eR2XubmuEKLf0dAz3nk0dg
 5BDKJj0hgju8TqVtUgZdmNDtdg==
X-Google-Smtp-Source: ABdhPJzj9MMgjLQlNkfrrrhAaSLG3AOxuIAIeC9+seTLSX150KMZZzI4CfhLNgM8ahaTRTGlaSHesA==
X-Received: by 2002:a17:90b:3846:: with SMTP id
 nl6mr4992247pjb.48.1617827903914; 
 Wed, 07 Apr 2021 13:38:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h190sm5917955pfe.202.2021.04.07.13.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 13:38:23 -0700 (PDT)
Subject: Re: [PATCH 15/27] tests/tcg: ARC: Add TCG instruction definition tests
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-16-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5eba7288-ec55-e8d3-1fdd-83f1d1374b62@linaro.org>
Date: Wed, 7 Apr 2021 13:38:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-16-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> From: Claudiu Zissulescu <claziss@synopsys.com>
> 
> The added tests verify basic instructions execution as well
> as more advanced features such as zero overhead loops interrupt
> system, memory management unit and memory protection unit.
> 
> Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
> Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
> ---
>   tests/Makefile.include                |   1 +
>   tests/tcg/arc/Makefile                | 114 ++++
>   tests/tcg/arc/Makefile.softmmu-target |  43 ++
>   tests/tcg/arc/Makefile.target         | 101 ++++

You shoud *only* need Makefile.softmmu-target.

The bare Makefile is (or should be) unused.
The Makefile.target is for arc-linux-user,
which you do not build.


r~

