Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8430491B7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 22:53:43 +0200 (CEST)
Received: from localhost ([::1]:51906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcydL-0006T5-4b
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 16:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41771)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcybi-00061b-NK
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:52:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcybh-0004xn-Rx
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:52:02 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45439)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcybh-0004xJ-LQ
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:52:01 -0400
Received: by mail-pf1-x442.google.com with SMTP id r1so6295710pfq.12
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 13:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XUEbgF2AKRB9F0QGH8AzF6bi3J0OLpzXnxg0wzura/A=;
 b=DE9oQz8N9irNrSI+kAmh4O3hFPXDiNL+nAQ5vY0UOg7tzKA0tOZjLgW2V2JIzWNhcC
 rkF0G9mGn7laRNqmB0GCgPXV07eynT7xzKneHsZIBIklDfHccwJKFwojwkrGmU2N9MsS
 CVNbC9RXFoMDNWJrkAqyC7s9yb3tx6ZBwsIBdB22T/HkAh/YZgJZIRTn/o09TWoYuHLn
 V64WwBwJIyU5bnWQdCIfaZCRl3PqIvMDLm5ZwvgBFkOP3KxxBBnzR+249s5UviBYSx/w
 bhrs09K1kRwgdMvuTKjM0n0g2SE/uhban9tuuEP5nBO151NqixBO5kqB1uEdKFQQWFqN
 aUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XUEbgF2AKRB9F0QGH8AzF6bi3J0OLpzXnxg0wzura/A=;
 b=JQFPymJQH5IWChtkiLz0zmBtyS9HTKZDoWEQvg7Ht7LT52c/iS/d6T5TiIzFGJh4eZ
 z3dxCUqdbZZlcpoBdU2M7ygDeA4PPmk+ML/OgqPdyMVlwRjwshSignrBG20hHRe9kXdK
 RvY0zHZjAWI1mfmgtWa4KlUg0PiJIrG3FbVvXHP1DhyOeYEhPkk7rSW2GbwgvdVQBx4h
 IMi2VnADCtpNoKrjVZzAQj69ofb/QfT94q7QRGw6xYnzZTc4tax5Fvu2b3ScAgAVL3Z2
 v0T4cXG7vYC0VhIN7JF9Gipjg632RRvztFucfnwiPAIPKPihivOG7S6bRH/+wg8C+qA+
 LAcA==
X-Gm-Message-State: APjAAAXd2odhKf/evwOBxUdKlpyKiFlocymyqMXZlDXF5YbZPpj52urG
 EINs306bVOCv2GUsIuanbkmgfifd1dk=
X-Google-Smtp-Source: APXvYqw4oeZd5sSC9K+P5Z79TdJIfWjLH/fp2mU8XwDIu65+TAkmtCwYY0mJLpHJ1SXqzA88X0GUjQ==
X-Received: by 2002:a17:90a:9b88:: with SMTP id
 g8mr997856pjp.100.1560804720418; 
 Mon, 17 Jun 2019 13:52:00 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id z4sm12725022pfa.142.2019.06.17.13.51.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 13:51:59 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-20-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <49562bfe-16ac-6f5a-ee70-20886a5dc4c5@linaro.org>
Date: Mon, 17 Jun 2019 13:51:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614171200.21078-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-devel] [PATCH v3 19/50] tcg: let plugins instrument
 memory accesses
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/19 10:11 AM, Alex Bennée wrote:
> +static inline void set_hostaddr(CPUArchState *env, TCGMemOp mo, void *haddr)
> +{
> +#ifdef CONFIG_PLUGIN
> +    if (mo & MO_HADDR) {
> +        env_tlb(env)->c.hostaddr = haddr;
> +    }
> +#endif
> +}
> +

Even if we weren't talking about recomputing this in the helper, would an
unconditional store be cheaper?


r~

