Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B825831A4B5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:47:43 +0100 (CET)
Received: from localhost ([::1]:37034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdTi-0007OQ-K2
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdKl-0007uL-Ly; Fri, 12 Feb 2021 13:38:28 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdKV-000308-B3; Fri, 12 Feb 2021 13:38:27 -0500
Received: by mail-wm1-x32e.google.com with SMTP id n10so551534wmq.0;
 Fri, 12 Feb 2021 10:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FFIi3TXvMYzhbt4jBTGb8g8HO7wJ0jCnBq/XPrkq11Y=;
 b=JG2KnB4K3cGEUqbKsrKB3SP+uoTNeagqpJW2vOJVRBEgMoAu+0fCHAdNJTO86wGP5Y
 rfpgvhAw18v2NU9iE4hlATT7wuuTGtvVjHZJ9n02PUc71VSOgL+FaLMqMODmt//cm7D+
 rb7678KUSe70sDDVvY0FwdnGKZbMMHIlwSSaG9b8PSQA5xZ0K5pE4aP/EPxK2OWxWJW6
 my4le/1nmzCkzqM19XTYk0bKvtqwXC9s5qNGGteS5O0Ip7klB2EAk65sGt7f7rWP6tZr
 yMB3aOazDrTko/v/AqXHVnbHzjNciFVeyg4IEi5xvEbEFwNP0+Sb+ceevSpHNUdfjI5A
 +F8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FFIi3TXvMYzhbt4jBTGb8g8HO7wJ0jCnBq/XPrkq11Y=;
 b=dk8aY3qt/fj0jOT0sK9GMpj2g/MSH07ndOLLXyziRZAYJcdMTc9kAshXQv7hwdU8O2
 ejLHEn5Nn7A6TEzOKjVTooGXFxL5Hv01UiD2e8qrzwKJMMusVSprHBPsPv3Bgip1EI34
 fHPypPaDxuWw/pyNWt8FWNW5K5jd9XVJMACkhI2aJlKRnB4dPwmv5/9cIAI/QvxRm/21
 mew/fwG5RB8KFhNvx8btQQC7THTmlPScCQTyaSTHimTFOoAwUD30cdd8c9U9hFOEqAsa
 p54Ii+TO2Ro0SLOb+VKNIGFJk8bb1sg5lqjO4WVeRgPoYPRuNRdhVVSRgZHso+Z1sxJr
 DrXg==
X-Gm-Message-State: AOAM532X4+hcebjJf2EtNA9T7tXd+95tLOjP3ncBzsTPYtoyxXKDhVNK
 yrHmf6PJfAYJT6c8quPBHlJiRanmGKA=
X-Google-Smtp-Source: ABdhPJzT9cDjFafhPtUm/g7cE6GCsCnTTbMO5zu0+kiqgsSZWLjUPM+rZGlvnKECyRk0CvWsrYYSBQ==
X-Received: by 2002:a7b:cf19:: with SMTP id l25mr3802092wmg.85.1613155088340; 
 Fri, 12 Feb 2021 10:38:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u14sm12117300wro.10.2021.02.12.10.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:38:07 -0800 (PST)
Subject: Re: [PATCH 00/24] hw/arm: New board model mps3-an524
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <7d4db6f0-1e11-afb1-2b58-2e115a0a2dd0@amsat.org>
 <CAFEAcA_qZ-k7jZQ7NUxQ+BXQ5LtLC1ogorKaE1iwz2Mm00Xwcw@mail.gmail.com>
 <CAAdtpL5Aq_1nQhXPPEinosdoD6sUV20d-kDWTZcKhiQZtr94Fw@mail.gmail.com>
 <CAFEAcA9vvfC_DOnrzSxftXPydfUnucqN6VQtRcpP7LEm+Wy+qA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <edd96a95-f484-96d0-1b1b-7481a13e8d88@amsat.org>
Date: Fri, 12 Feb 2021 19:38:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9vvfC_DOnrzSxftXPydfUnucqN6VQtRcpP7LEm+Wy+qA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, "Daniel P . Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 8:34 PM, Peter Maydell wrote:
> On Fri, 5 Feb 2021 at 19:31, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On Fri, Feb 5, 2021 at 8:21 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On Fri, 5 Feb 2021 at 18:05, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>> On 2/5/21 5:59 PM, Peter Maydell wrote:
>>>>> (The selftest is part of the AN524
>>>>> download so it's behind a EULA click-through and we can't put it
>>>>> into an acceptance test. We might be able to get something
>>>>> based on Zephyr or Arm TFM.)
>>>>
>>>> Wondering about that... If anyone can go/click/accepts the EULA and
>>>> download artifacts, then I'd like these tests to be committed to the
>>>> repository, with a comment containing the download link, and the test
>>>> can use the skipUntil(BLOB_PATH && BLOB_HASH) syntax to assert the
>>>> binary I downloaded is the same you used for your test.
>>>
>>> I would rather not get into that. The selftest doesn't actually
>>> exercise as much of the emulation as you might think anyway.
>>
>> This was clear from the previous paragraph, I was asking about the possibility
>> to have developers/maintainers individually accept EULA to download artifacts
>> for integration testing.
> 
> Yes, and that is the thing I would rather we didn't get into.
> We should just have suitably redistributable acceptance tests
> where we can.

OK, understood.

