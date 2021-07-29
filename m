Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E78E3D9D9D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:25:30 +0200 (CEST)
Received: from localhost ([::1]:43114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zU1-0001AE-Gd
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zSa-0000A1-FI
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:24:00 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:55144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zSZ-0008Ir-2E
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:24:00 -0400
Received: by mail-wm1-x333.google.com with SMTP id b128so2942704wmb.4
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 23:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a1NPaWavj/EB06JVkLuelJ5ncsKJORztdo2Od8y9Ke0=;
 b=nsKH8Opn6ifzOWDkOL2gEeSZdFUFEejITVE7KX8/caqOZb86QBHQpF8HQJqqnAIeYr
 pY80wSZ5PAjTlk9H9Y8WmGopHyizX8El6SDRw3FD+/Ng6TiS10JjAv7NgsmlLvL5UYHL
 P2uxgRnBTI1xKn32QtlzCfrPEPQQoUdusPGsHr9Z9cXVXYEpN6NmukK2g+88AQV7GFT/
 EnMlYJmabvUdYLkLixYyhkBsFd/qKs8iuoTt3STBnnFRRLNqKsGtcKocQ3axq0CgRw5Z
 qFb+BFoY7J7pOfNe4ONUIeCY4a7aPGvhY23+pS5UtayBHRIMabf3knDJ3Oo3K2XlOHYl
 QqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a1NPaWavj/EB06JVkLuelJ5ncsKJORztdo2Od8y9Ke0=;
 b=E6QCzFwPdLVNNWB0mf1LWW/S956WhUcJtTwDSQOq+hAPZp8sRHmBRbIhDpCVyMCXKy
 EAmqQNbioCVq21d0322pUiIsDMHrbGq/JSD2SBh662y+guNNZ4dghXao8THizlGnY23H
 BdsJHcgXFf+M9a9e1H5mhmyFPjrq7BUZc9VIuq4mBZghbok6Ko2ycrAuEoCW50HqdTHh
 oFsv71xT5VLBNwZXnM4Dk6gUfxZ9Ts2mc1ULSsn0hOcWIHBhBRBqgLF6Xt5Xkn8hdSYB
 DlVdqut51gNjLnpauDer3nRPb6GhiSQZD3syL4vOtBIzkiM5G0Ypc7Oswcj9XKe3m2dQ
 kfpw==
X-Gm-Message-State: AOAM531xCaW4BbcLL5RsZbefVQYqHtC/+e4TgZZNuG/ks9HMmRURuhtx
 lUqugK8lCc4CYCBrQfS7ZTVc6eR22X+40w==
X-Google-Smtp-Source: ABdhPJwu25w2DHDc8XRrGc6qKvmqS6iAbwjFNvnhVbCwHV5fDU99hmrCVQg281Hce7h9epqveHvEoQ==
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr2977094wmf.37.1627539837460; 
 Wed, 28 Jul 2021 23:23:57 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id d24sm7870935wmb.42.2021.07.28.23.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:23:56 -0700 (PDT)
Subject: Re: [PATCH for-6.2 19/43] tcg: Expand MO_SIZE to 3 bits
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <18ffb0e6-19c7-b980-b646-3400bb0cc15b@amsat.org>
Date: Thu, 29 Jul 2021 08:23:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/29/21 2:46 AM, Richard Henderson wrote:
> We have lacked expressive support for memory sizes larger
> than 64-bits for a while.  Fixing that requires adjustment
> to several points where we used this for array indexing,
> and two places that develop -Wswitch warnings after the change.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/memop.h                | 14 +++++++++-----
>  target/arm/translate-a64.c          |  2 +-
>  tcg/tcg-op.c                        | 13 ++++++++-----
>  target/s390x/tcg/translate_vx.c.inc |  2 +-
>  tcg/aarch64/tcg-target.c.inc        |  4 ++--
>  tcg/arm/tcg-target.c.inc            |  4 ++--
>  tcg/i386/tcg-target.c.inc           |  4 ++--
>  tcg/mips/tcg-target.c.inc           |  4 ++--
>  tcg/ppc/tcg-target.c.inc            |  8 ++++----
>  tcg/riscv/tcg-target.c.inc          |  4 ++--
>  tcg/s390/tcg-target.c.inc           |  4 ++--
>  tcg/sparc/tcg-target.c.inc          | 16 ++++++++--------
>  12 files changed, 43 insertions(+), 36 deletions(-)

Nice cleanup.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

