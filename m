Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928C1491F6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 23:08:28 +0200 (CEST)
Received: from localhost ([::1]:51994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcyrb-0006Sn-Q2
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 17:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45315)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcypy-0005qG-3r
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 17:06:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcypw-0005a3-64
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 17:06:45 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34974)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcypv-0005Yv-Uo
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 17:06:44 -0400
Received: by mail-pl1-x644.google.com with SMTP id p1so4666253plo.2
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 14:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l7iZ/0QjpurbjTDRbaZMj53WIyTNhCcdnQ1fLNQeSDU=;
 b=w1e83E4wB1Hl8axmby2zfEL8F/H7MDcaCHZNdEkRGyCBWWaDVxqp/8CKHBhJbEF/yN
 3uwn8ZIuEjQnHXhx0iYyKG/QHPjYbsxtAvZ9qBE0j0msN3GOu1ioDFgjOjzf5s8H+cE6
 pPyQCBK8cnOk2pJT1zI7ljhWhe5BQAG27qxjb8S1FabQb1w/Hr/jrP9+Mj0BvwL2Rm+/
 k5n4aINpRDKX17ACJ0Q+aQOM2jqoT5hRO41FV8PHWJJOMJOKxiuDt415c7zKXKadIoXM
 45/y75YVaxO+99YKhDyzUvx+GPij3tPVFazs6/9oGtyj2TMJletn+CzGRpqmRAOTWpSH
 0NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l7iZ/0QjpurbjTDRbaZMj53WIyTNhCcdnQ1fLNQeSDU=;
 b=KeMp0ghrC2bIL8vIPx/4YdHnYIbaG1+JiPYZ2Ho6R9udMxOPNo8/z1fI9P4wVXnxJc
 0Va0md9atli8NLWP/Un2RRt9g6qrHK01pwqR4b9jwGeAaeqeyLb8GgM6zuY/8wRv+EUr
 RQ7mQnsYRX2oNnXs676s4vq0Ls/DBbFnDXlrU828PZKKnfRrKSxpolTbcG22RoVEpNfp
 +CDR+ZHUutsUxpdjaTSRYeQQH+5P2nqUxxxadaGKexMslmeXfwit9691dCAmDzzYC61a
 2NKDXhQoNjvFxPJcy/egKAGO2ojx6cJUCGGd5ZLpi1j2VTNpRmdPhy9BOLfbrUZNe0Zf
 O7/g==
X-Gm-Message-State: APjAAAXjxQsB1S18rcY3YljqMC5NuYEY3Wyaj3dakuKuqbViKB4HJBmr
 4+VPn+LIVwlOrDuEWc4CSrFeIg==
X-Google-Smtp-Source: APXvYqxsUHPAGd26z05xUdQ67KGbBXap4YUCYcDFbSKYUUX2vDtKW+87ssicuGwv8AW3g/si7aVJKg==
X-Received: by 2002:a17:902:21:: with SMTP id
 30mr108489389pla.302.1560805602365; 
 Mon, 17 Jun 2019 14:06:42 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id h12sm257777pje.12.2019.06.17.14.06.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 14:06:41 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-26-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bd131b16-2f38-4112-4e09-6a2f63908bf2@linaro.org>
Date: Mon, 17 Jun 2019 14:06:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614171200.21078-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [PATCH v3 25/50] translator: add translator_ld{ub,
 sw, uw, l, q}
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
Cc: "Emilio G. Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/19 10:11 AM, Alex Bennée wrote:
> +#define GEN_TRANSLATOR_LD(fullname, name, type, swap_fn)                \
> +    static inline type                                                  \
> +    fullname ## _swap(CPUArchState *env, abi_ptr pc, bool do_swap)      \
> +    {                                                                   \
> +        type ret = cpu_ ## name ## _code(env, pc);                      \
> +                                                                        \
> +        if (do_swap) {                                                  \
> +            ret = swap_fn(ret);                                         \
> +        }                                                               \

This feels like we should have done this at a different level.  We already have
lower-level functions that read from memory with the proper endianness.

It seems that we don't have them for *_code, but that could be fixed.  Or,
indeed, bypassed, since these could be the new official interface, deprecating
the *_code functions.


r~

