Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5675D3DFD37
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:45:51 +0200 (CEST)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCX8-0003oQ-Dy
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBCVr-0002j5-Ho
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:44:31 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBCVp-0003p4-RA
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:44:31 -0400
Received: by mail-ed1-x531.google.com with SMTP id x14so2487287edr.12
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=te/6cpwsUXweILBmyDepUk4HCtd0+2tG9ho56Q+8gqI=;
 b=E1T8A1POW/279zCWw2NcVOuL1EJt3dwn/SNQYRuBCLWDIoEIh7/wUmWLdUTAvjo83r
 LTDyo/7wXEL3Bf950O0IHRfUi1MllH/ztYlAiHgH1Amv2rZ8xdDfJo7/0jhKeHmSvJLL
 uF+02f88+Cpgs7yxoDSsffMZsT8gWexd6S1HJiFJZSCOSuAX8XtOzicZ1toMnf83ViAh
 sUDSKMy2xda8iRxeiDEZeMZy3YYVTwpirxZilbntOlsLi/7WhCGGGcItmF3cdbnaK2dl
 lAp7Le/uSGPXYLunS69anF3tUbXngwwXe0irY2qTzIePPwaEWVXnZiF1Gb38dtIf0UeJ
 5/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=te/6cpwsUXweILBmyDepUk4HCtd0+2tG9ho56Q+8gqI=;
 b=pxUc6jxIaK5RuFUHRgYzjLz1s8/oviYXrMe5mwui+ebZkNzzqI8uEc1R6YHGxqhQ2V
 0AR++7A0hk3utG4yow1JQ3h9TujflVJOGbRxZguuFAxn+bvKhrJRT8epIY3fGHQoo5/q
 tZAK8RJG7ixdH5pdg97kMeclXI6PubuRA01KKdVB7YUrb0V9M7S9j7pm01Bz4kyI9/mo
 owtxP+JnsMiYVjkdDmsBzykNntrTeAf6wfwm3wiCmwBYITNDNau6jVsKmsYNS6XbBkrG
 jMQBDlqALkduMvmWzXJ/Yk+4US/HUxK0r2ZLgMudTk7bEMxn+IaGgHmu+bn+AtLVDOVM
 tREQ==
X-Gm-Message-State: AOAM5319XnaOEetCmfPPce+uxS2JnLX3eL1meS+LJT/AXuW7AVQgqjuK
 ZqWNDRN94F8aSGjJHZRQpwtApnICPsI+L/H9rE+6Hw==
X-Google-Smtp-Source: ABdhPJzTUgXvHfRxujS72dFvAO8FoupZhEKiotE92bNVoJzKMzncsSFm9WRst9b8pu/sW+hAV8BvysjKFOohRoQseE8=
X-Received: by 2002:aa7:d30e:: with SMTP id p14mr30451828edq.204.1628066668247; 
 Wed, 04 Aug 2021 01:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210731062741.301102-1-pbonzini@redhat.com>
 <20210731062741.301102-5-pbonzini@redhat.com>
 <CAFEAcA95XPt-2oeKM1gCCRDOjAyf4m0vkoQNGwLZk4swo4gDAA@mail.gmail.com>
 <a0cf06ce-55ae-fe35-64ef-f3d66c2708c0@redhat.com>
 <87tuk5ip48.fsf@dusky.pond.sub.org>
In-Reply-To: <87tuk5ip48.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Aug 2021 09:43:44 +0100
Message-ID: <CAFEAcA_67EjjZDJE2tHZJ2o8azp-VKMX1=u-v-YUJz9XF38L7A@mail.gmail.com>
Subject: Re: [PATCH 4/6] coverity-model: clean up the models for array
 allocation functions
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 Aug 2021 at 09:35, Markus Armbruster <armbru@redhat.com> wrote:
>
> Paolo Bonzini <pbonzini@redhat.com> writes:
>
> > On 02/08/21 14:36, Peter Maydell wrote:
> >> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> >> The real g_malloc_n() returns failure if the multiplication
> >> would overflow;
>
> Really?  Its documentation:
>
>     This function is similar to g_malloc(), allocating (n_blocks *
>     n_block_bytes) bytes, but care is taken to detect possible overflow
>     during multiplication.
>
> There's also g_try_malloc_n():
>
>     This function is similar to g_try_malloc(), allocating (n_blocks *
>     n_block_bytes) bytes, but care is taken to detect possible overflow
>     during multiplication.
>
> I read this as g_malloc_n() can return null only for zero size, and
> crashes on error, just like g_malloc_n().  g_try_malloc_n() behaves like
> g_try_malloc_n(), i.e. it returns null on failure.

Yeah, I misspoke -- I just meant to say "treats multiply overflow
like an allocation failure", not that it returns NULL.

> >>                 I guess Coverity currently doesn't have any
> >> warnings it generates as a result of assuming overflow
> >> might happen?
> >
> > I couldn't find any Coverity-specific way to detect overflow, but
>
> Does it need one?
>
> Quick peek at Coverity 2012.12 Checker Reference:
>
>     4.188. INTEGER_OVERFLOW

> The example that follows shows a memory allocation where the size is
> computed like TAINTED * sizeof(MUMBLE), where TAINTED is a "tainted
> source", and the allocation's size is a "tainted sink".

My point was that we *don't* want Coverity to report INTEGER_OVERFLOW
errors based on the way our g_malloc_n() model is written like this:
  __coverity_alloc__(nmemb * size)
That expression in our model *can* overflow. We know the real g_malloc_n()
cannot overflow, but we don't do anything to tell Coverity that, so it's
possible that (maybe in future) it will report false positives to us
based on analysis that assumes possible overflows in the multiplication.

thanks
-- PMM

