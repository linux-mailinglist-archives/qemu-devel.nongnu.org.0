Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0DE1F02A9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 23:53:56 +0200 (CEST)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhKHi-0004ZB-BM
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 17:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhKGI-0003EK-A2
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 17:52:26 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhKGH-0003iC-CY
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 17:52:26 -0400
Received: by mail-pf1-x442.google.com with SMTP id z64so5587062pfb.1
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 14:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zSLKXy5JsOmswRxzlrqRo9GPBriTWrISrI1Ld+8RN4E=;
 b=e4taX+HGmoQCAXlkq9+CGPtxB1wZpfKYrsShB+egZhzKBdUVjfIIlrB7F5YAIaxtU8
 R1dw8kqurn82vcH0SHk/Q0UkD625vrLjcPFeSHVgNT+FnBXCF8GLVPPpIU8I/ZFF6SvI
 SbCWNFkGdAkdH8Q39R5dKV3hTj4thlR887l2VohgzsYBsWXwMJeP5C4v5HlKw4I5LN/Y
 1BsQZcl7WXryQq17Qcd/FfbRgw2vnobpUEb7XO0WLMt1P7d2gLd9LChGSBRz558X5PWQ
 Uku4/sURSrq0oaaKOxqs4FdRB+RY3Z0ErUm/VBE18/uqaq6dIP3l1ZffIfBKot19KYPG
 oVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zSLKXy5JsOmswRxzlrqRo9GPBriTWrISrI1Ld+8RN4E=;
 b=P3fYOX1+YsA/NpsC1I9H8xNoCJPaBQkqr6NHpYgNarbXug7upN2MH42X5RjJ0Kh2Uc
 4aT5IC3fUtvkIOhXJ84u5SkSFq9TeVyvFNT6CnZvEVtiEvkePCn1zGafWPPvxY575sWS
 oSIxVvu3n+yQq8krN1Hj8r/ELkdpjjwknDk9aAadSR1oSK3wpObp9uqfVNQ6dykEgcHd
 aMI8RTTzWijcQMw6RDs+jk9RktsDM3sAS1orTIILL8NRzOwQMdNFiVd4EslPgWlO4BmR
 UtzyRtShRflrxaXCDMHnhRW9GH2+izdiUHCEeB/739zCSLFq09rKgdN8oA/sffb/M4P1
 iVZQ==
X-Gm-Message-State: AOAM531IU4ITMIY/IZRaJ7IJcmUnVIbKsiJ8idVa+033az4TR1YfwuTx
 X4URVJPKfmlFLBCCrkASa2m6fHTPHUA=
X-Google-Smtp-Source: ABdhPJwiEIi2AePoCuh4h0syP4gI9Asz62sT5oUbGWzq94tUis+ksbxqFdpKTkm9T6mLIt1goydf1g==
X-Received: by 2002:a65:40c3:: with SMTP id u3mr11628989pgp.305.1591393944160; 
 Fri, 05 Jun 2020 14:52:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i10sm403317pgq.36.2020.06.05.14.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2020 14:52:23 -0700 (PDT)
Subject: Re: [PATCH v7 06/11] Makefile: Remove dangerous EOL trailing backslash
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200605175821.20926-1-philmd@redhat.com>
 <20200605175821.20926-7-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba1d8528-c7c9-c66e-79c1-8ca0431eb02f@linaro.org>
Date: Fri, 5 Jun 2020 14:52:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200605175821.20926-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/5/20 10:58 AM, Philippe Mathieu-Daudé wrote:
> One might get caught trying to understand unexpected Makefile
> behavior. Trailing backslash can help to split very long lines,
> but are rather dangerous when nothing follow. Preserve other
> developers debugging time by removing this one.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


