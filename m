Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6275F0C9B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:42:36 +0200 (CEST)
Received: from localhost ([::1]:55974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGHh-00066C-Rk
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGAU-0008RV-Hj
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:11 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGAS-0006R4-Se
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:06 -0400
Received: by mail-pl1-x635.google.com with SMTP id c24so4006152plo.3
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=9l6tzQ6Pz+VBkBtMS9ZzmjsOG4L1UCUcrjMNHuNJQTw=;
 b=h+tVhs5eWKECeuYepVUiigOn56vabsGMwt9/TNNcLjvHYegiA5guAWcGIVfDKejd5U
 jqi7Ek48v5MR4zb0nZVV9E59syvhQs6UurC9Wq5O64KXxTQ5Egse7SR+tE1/evqcuZ+b
 ICVR9271PSx6f/7sjkxVef3N6EMX/Au8earJet639fzVsMhSCU6H/jjYm4IDOuvpb0fS
 s03iy4s/Its3qg5JDt7+pfwuhfFBY+NFKnAqxX5fTP42BPn5YLk4lB+KdybQ+cUrINax
 yn45CzIihlFPC5nDEc1Rb/5tfrxFt4r8kKSHz/wQ2+Nk9XOlAbgaD2FQRQWJO5jCssrA
 o/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=9l6tzQ6Pz+VBkBtMS9ZzmjsOG4L1UCUcrjMNHuNJQTw=;
 b=h+oddaUHk8qWjhFDObIin2H9snLK/oNXfvFQmLPSlv1U4j9szq93XVhjgDuDUlclMb
 SumVhZ+ucb5isGH8eIkM3VG3x2iaVWsnTFEJ8Jogu0PWVti+s1+wdZpqXJyCIN5hQjXy
 jRFp5+2ur+N7Odv61bXEL90ELU0OTwtgJCt2tehQ1KxdpJBHE7kBmxQzPcQvsciFFLru
 l+bYPj4+Rm8XsdXg+1BU0w61RbhcSGsPC5ny9ilnVj5sE9u3LKXslRQKxjnWK23mEGSN
 zErnHz4atMUNMR0jn3OxAVAndRfkHxLNK2dUzow8OxCCpnjtJdQN/2gMFhr5inBSWes/
 N8Jg==
X-Gm-Message-State: ACrzQf1mQySt4h4XIrkqCA7XCVecFQFbUmRnqwpU3x3d+PnEDactaB/F
 2Re0ly14TaNVs6rBzmB0MysAXQ==
X-Google-Smtp-Source: AMsMyM6kqnczOZ0Qay8Poy8I/L7nhDDreu39y3KGaXH16JVDZfyBqZPPVKqedmn/6iCtBLMwbyfCiQ==
X-Received: by 2002:a17:902:da8a:b0:179:e022:5f6 with SMTP id
 j10-20020a170902da8a00b00179e02205f6mr8916369plx.80.1664544903065; 
 Fri, 30 Sep 2022 06:35:03 -0700 (PDT)
Received: from [192.168.74.154] ([50.200.230.211])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a17090320d300b00179f442519csm1877181plb.40.2022.09.30.06.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 06:35:02 -0700 (PDT)
Message-ID: <2a7907c0-752a-e262-7088-83958ede1916@linaro.org>
Date: Fri, 30 Sep 2022 06:34:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] win32: set threads name
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, bin.meng@windriver.com, Stefan Weil <sw@weilnetz.de>
References: <20220929134150.1377690-1-marcandre.lureau@redhat.com>
 <5d7e7c01-7739-9a04-9a4a-becb3c550885@linaro.org>
 <CAJ+F1CLNzwTOB2-wxbnJw9VaCVBFUkgC5c-nYaczL14RLVwaCg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAJ+F1CLNzwTOB2-wxbnJw9VaCVBFUkgC5c-nYaczL14RLVwaCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/22 01:08, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Sep 29, 2022 at 9:53 PM Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 9/29/22 06:41, marcandre.lureau@redhat.com <mailto:marcandre.lureau@redhat.com> wrote:
>      >   void qemu_thread_naming(bool enable)
>      >   {
>      >       /* But note we don't actually name them on Windows yet */
>      >       name_threads = enable;
>      >
>      > -    fprintf(stderr, "qemu: thread naming not supported on this host\n");
>      > +    if (enable && !load_set_thread_description()) {
>      > +        fprintf(stderr, "qemu: thread naming not supported on this host\n");
>      > +    }
>      >   }
> 
>     Comment is out of date, and I think it would be better to *not* set name_threads if not
>     supported, rather than...
> 
> 
> Comment removed.
> 
> 
> 
>      > +static bool
>      > +set_thread_description(HANDLE h, const char *name)
>      > +{
>      > +  HRESULT hr;
>      > +  g_autofree wchar_t *namew = NULL;
>      > +
>      > +  if (!load_set_thread_description() || !name) {
>      > +      return false;
>      > +  }
> 
>     ... have to re-query load_set_thread_description later.
> 
> 
> The load_set_thread_description() function is actually a "one-time" function, it doesn't 
> re-load.

You're calling it again.  That has some cost in the mutex/spinlock that's behind that 
one-time operation, when you're already making the call to set_thread_description conditional.

> Right, maybe it should warn if it failed to set the name?

After you've already printed an error in qemu_thread_naming()?  Doesn't seem useful.  Or 
did you mean in the case we think it should work, but didn't?

r~

