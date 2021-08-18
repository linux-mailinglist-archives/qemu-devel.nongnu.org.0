Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245973F0D1B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:05:40 +0200 (CEST)
Received: from localhost ([::1]:49232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSkk-0007Et-NN
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGSj2-0006MR-I2
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:03:52 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGSj1-0003at-1r
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:03:52 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x10so5548593wrt.8
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kBLQJttgEaF6HFcUhFaGk8hheCBa2DAESOl7TiCPtrk=;
 b=XzivhbLZJpMchHkEcLaInGJK/IuZtsIdKCIflnYHieH2DtubbvtxJvFdRAJQBkSuO6
 vc8fjT2yy2vNhD1DxmvKvjA3FnQuKxK2m424CzYZBPPBjGkQQJ2BEJeq1AmQrzrFt4+I
 UXc/gfUyKcIKxV+6URLzekeqkAEIG6XaAvuXNBuI22Uh9QJbgVQGCpBvzSeNuXeN8Wkp
 K7jL6tGH/crniBdWE7A9gtD3aqbf4r2CrhEEULQoEe2M0XbH8GUPgvcYMcen5DUyP77f
 onGO1Nc93UmfVfNcZnBQVTkIntlViyMH3aEhf9J5ZsHItEUJ2WR5eecmbbU+hIQdqv+1
 HSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kBLQJttgEaF6HFcUhFaGk8hheCBa2DAESOl7TiCPtrk=;
 b=rl+MtRw8/agJkFMOOsWna0rxkdMM+P1hLomIwVj8ZZCYCOAfoeCo2UT/UMBD3fi9me
 tLk1uSHcj/8P4aXxrns6+4vp2/B/smKvIHH7i/gmx0sLLHiVG3G2F+7k6d3ceMj69yzY
 RjbOeWjdWCQ2woNf/eN5pUG4g2sl3Qy1mdrdPZvJEwT3PNZq+oAVr0tacxD3MB8RpQq9
 +UZOPp4yQaya03kjWUkIkIawgv+ppIHXB3SQ9AMxj86+K9YdPJLpO+WGtmzELml3Urr4
 P0017bu+n3+zwwt0uRVJQV9GnCws4ryrdqe1vcok7KtLg10iR2uSIkO00vMLeSDUQVTv
 lIvQ==
X-Gm-Message-State: AOAM532OJKZKibhEm+x4uKKrKOesHrfCd32ko0KEiwjf40QeF/BZamsO
 bUZP1pYmuCbB8rkJ6KW32AoNBdbODqE=
X-Google-Smtp-Source: ABdhPJxyfDk15KBv+97QEMnBr2NAARXS+Q+CUk4fxokeoipjFzUmNz3nr/nJ7WHPWrjC5dsgk4Qiew==
X-Received: by 2002:adf:f68d:: with SMTP id v13mr12878749wrp.358.1629320629053; 
 Wed, 18 Aug 2021 14:03:49 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z8sm874812wrt.77.2021.08.18.14.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 14:03:48 -0700 (PDT)
Subject: Re: [PATCH v3 03/16] tcg/mips: Drop inline markers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818201931.393394-1-richard.henderson@linaro.org>
 <20210818201931.393394-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d076eb2e-b77f-1bb3-6532-280a4d0723c8@amsat.org>
Date: Wed, 18 Aug 2021 23:03:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818201931.393394-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 10:19 PM, Richard Henderson wrote:
> Let the compiler decide about inlining.
> Remove tcg_out_ext8s and tcg_out_ext16s as unused.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target.c.inc | 76 ++++++++++++++-------------------------
>  1 file changed, 27 insertions(+), 49 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

