Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689C535700A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 17:19:43 +0200 (CEST)
Received: from localhost ([::1]:34834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU9y2-0004Gh-DO
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 11:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lU9wm-0003Nm-4H
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:18:25 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lU9wc-0006n6-OU
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:18:23 -0400
Received: by mail-pf1-x42b.google.com with SMTP id n38so3455976pfv.2
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FoqXAIYu0KZW0fA4k5sZobqLXy/IQzN9mtWIcOL/ovU=;
 b=OhSN9xsi4uln6mbrD9sjD25GtAvdX5TrDu+fPc/Ptv3i2YnYBSCP4QkFaFcdDQGfLQ
 ir+MHutC4lr/dKphbzsVHqZFBY3p97knQ2Q8xeGEWOHU8DaikuYcFydoC5g94M5XAZkT
 d7TFgdkvKTjQnPgGIiwVcyjGZi7g3SoDURj/7L9chcZ7glVzY10puFMcbpzqSPmfl3gh
 MJd8qME5SVH/RYZlNhJaEtE9TPRJ2meez5cIYZ6SVtZb1Rh91idwS90TNnCxuhDJibGI
 sPYPRwSTg9FC+y8yMPXUVEPXTgnzlrgAk1vp0Oill/+6AJnvSlCzw9doECtVn+6D0ALD
 z4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FoqXAIYu0KZW0fA4k5sZobqLXy/IQzN9mtWIcOL/ovU=;
 b=U9ccbImBUKMlCboy4QTF1DFWAnSyUDaA0fQF578/TdJCZVJ7FY8CMJ4PLeSg8JKwND
 C3iETAwPeQJ39vbkDgLz6ggL3iKOnbpjZI7uJIi8uVDHfUl+08a1MsFfl0IZZZYeMLYn
 bw142ae+MNaiknxSoB6joluOOqxWwrC/do3q2IEHwdnrtLuiN3MM0XOU6jspsXMp7ADR
 cZVPkRTEcXc8zY1GDZGgfENxS/xnU0UOazxeohYIoJCqaSqW9ag3nO9PnBwHgbUzH6Lj
 5pkl8F8q7GkXSBGn3iHsxKdwjTUikIPByNvlCufmEA/o68QPPLyj5uYitytnbOJ6HtCM
 rQYg==
X-Gm-Message-State: AOAM5301RJ/xVD3mu4cnKQiv5J6lS0SRPujevKEZcTJ//E84Ykts6KOe
 pGLeCzoIjY+EZkrYQFMEZJm8BA==
X-Google-Smtp-Source: ABdhPJySIMJW5hmWPoT7njkegl+GsaOq5C6AIeCmEDhhstCEEP8oYGGAuQusnmk1z4n9HHUm5oKlDw==
X-Received: by 2002:a63:7e02:: with SMTP id z2mr3680563pgc.404.1617808692510; 
 Wed, 07 Apr 2021 08:18:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w21sm5728236pjy.52.2021.04.07.08.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 08:18:12 -0700 (PDT)
Subject: Re: [PATCH 1/1] decodetree: Add support for 64-bit instructions
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <CP2PR80MB36688C896376D6D8601E1EB5DA759@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0054264c-3cf8-5e53-e29f-97dd7db47406@linaro.org>
Date: Wed, 7 Apr 2021 08:18:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB36688C896376D6D8601E1EB5DA759@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 7:59 AM, Luis Fernando Fujita Pires wrote:
> Allow '64' to be specified for the instruction width command line params
> and use the appropriate insn/field data types, mask, extract and deposit
> functions in that case.
> 
> This will be used to implement the new 64-bit Power ISA 3.1 instructions.
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> ---
>   docs/devel/decodetree.rst |  3 ---
>   scripts/decodetree.py     | 25 ++++++++++++++++++++-----
>   2 files changed, 20 insertions(+), 8 deletions(-)

Looks good.

> --- a/docs/devel/decodetree.rst
> +++ b/docs/devel/decodetree.rst
> @@ -40,9 +40,6 @@ and returns an integral value extracted from there.
> 
>   A field with no ``unnamed_fields`` and no ``!function`` is in error.
> 
> -FIXME: the fields of the structure into which this result will be stored
> -is restricted to ``int``.  Which means that we cannot expand 64-bit items.

Let's replace this FIXME with a sentence or two documenting the type used.


r~

