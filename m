Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949AC4AA175
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:56:28 +0100 (CET)
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5d5-0001hw-NH
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:56:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nG5RB-000721-M4
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:44:09 -0500
Received: from [2607:f8b0:4864:20::1029] (port=54261
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nG5R9-0007Pv-JU
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:44:09 -0500
Received: by mail-pj1-x1029.google.com with SMTP id h12so6658515pjq.3
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z5eWaiymRf1+QJs4etrhxAeQXkns4PBnJkA1JTWyOkQ=;
 b=g+tY1q/VKfoc7graf/3gBh2C9/BKuAdAC7NhrVHrh+90rb1+sL9ZUbHdb51g2QaOSS
 xA8jlAkoSt6FxqtOjd5gTnBrD4iZsJSjhuqefqBpzp17/kfER/BRemSU4HLHLbcgiaMh
 j0UuMAzasNcAHTHpHnEpdCKBKbkX9EUlaUjAkakL1tqi7o0JyDEjSDYmS3Ultv/jvrde
 SBa6lR5RJskLSBDST60IE0EPgsjGzTc+NI3KQcIab8KXEsHsISU16pTrSlv1VeggrwDr
 KcgT+Mc5xrEK1o84X7f2aPQKqZlh+6YBP3j189Y5/8WPgjoVl/m0FemUziQM0k2GIjua
 rr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z5eWaiymRf1+QJs4etrhxAeQXkns4PBnJkA1JTWyOkQ=;
 b=wkz8TGp7L3OfEMzni167DpybMjxO6P6+1QCm1n1snRALl9xw+hZQ0/Q1AUrD8gDPiS
 Z9iJvr9qy+J4/lT7RZZejgjT/CuCDT1eRLK86Tz5Qz3zHQKc2ruJkXeoua69YIvX4UVZ
 6TQ9EBGm0Fd2eF5szwUuJDrqzZCgKZMIIbi298UKsnNXWoNAcNzgW1k7NJzbUfXiq2Xl
 NUFyQZTTM2f4Q0EofCjG1+kbEQhWCEXJod9FtH1G5pqXI3obP3Jmd4Kzs+O+2aDFXVkJ
 erasVXH+sVGKAKGrnrrCFTqPeI81AmH9jCzYei76Jqver3e3erP+xnmBQwouingjg7LM
 8Uxw==
X-Gm-Message-State: AOAM531UYPx/O90709CSe3Ppy0ygyv/CKjJjwO56PSdNIAPQIir2KPx8
 KVTKRt2AmTpVnE2iy9zfeM7ELg==
X-Google-Smtp-Source: ABdhPJwWcazQnw1JffofusJV9pzo/WebFcwQrUxhAaGcmzrO1lKm/jhmiSli6cg3XPrEHZTM7iLYyg==
X-Received: by 2002:a17:90b:4a83:: with SMTP id
 lp3mr5080032pjb.35.1644007446038; 
 Fri, 04 Feb 2022 12:44:06 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:d2cd:dac2:7e7f:5850?
 ([2001:8003:3a49:fd00:d2cd:dac2:7e7f:5850])
 by smtp.gmail.com with ESMTPSA id a9sm2271417pgb.56.2022.02.04.12.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 12:44:05 -0800 (PST)
Message-ID: <70c374d8-39b8-6799-3652-ad2571a7c0b5@linaro.org>
Date: Sat, 5 Feb 2022 07:44:00 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 4/5] tcg/sparc: Add tcg_out_jmpl_const for better tail
 calls
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220204070011.573941-1-richard.henderson@linaro.org>
 <20220204070011.573941-5-richard.henderson@linaro.org>
 <CAFEAcA9rfc5ycQCki=qpP-HKQ1S20X0ZM-TxJKX42-8nQ-wmMA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9rfc5ycQCki=qpP-HKQ1S20X0ZM-TxJKX42-8nQ-wmMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/22 05:34, Peter Maydell wrote:
> On Fri, 4 Feb 2022 at 07:54, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Due to mapping changes, we now rarely place the code_gen_buffer
>> near the main executable.  Which means that direct calls will
>> now rarely be in range.
>>
>> So, always use indirect calls for tail calls, which allows us to
>> avoid clobbering %o7, and therefore we need not save and restore it.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> As an aside: I found it a bit confusing that tcg_out_mov()
> takes a 'type' argument but ignores it, whereas tcg_out_mov_delay()
> doesn't take a 'type' argument at all.

Mm.  tcg_out_mov() is common to all tcg backends, and some hosts do use the type argument. 
  I didn't add one to tcg_out_mov_delay() because sparc didn't need one.


r~

