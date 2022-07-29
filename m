Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14858533B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 18:15:19 +0200 (CEST)
Received: from localhost ([::1]:57936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHSdz-0004D9-2e
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 12:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHSRC-0007rW-1s
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 12:02:06 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:37830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHSRA-0002Ai-5M
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 12:02:05 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id 141so8873648ybn.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 09:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=9fFYV/r1sN7qmohC6U4plWKm5VUh3yjht8jKAeFtVAQ=;
 b=CvXsKLNxppxtlFT1EHEF/7WPpsvEgif5K1T77O3MaZSBFiCY8+CROqfIAsl3f3N2FT
 GvZekNqPmg+BTN+05XfmQEE6Z3LYGdFraDwMzD43uMCl1SWHQTTeH1WLC7uu5V64rgSr
 Txs45PnjOHbZapLn/PN3tvxtMSPYwk7fHblobPMmZinsN4wlpIJhrpUgVDAF230cN11k
 4ZZ0q+GO8IiHc7cPHUiu0dL2/zC5ZobzcSpoPsf8M+bvsjwGA4cuIkky8+ANXZ6rpmuA
 khU++SYMrR7U5KWdihEpgh7/RUqOAIgZEIHJXpp10QcTRooREoVspn7zr0KNIkw4ocff
 Xg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9fFYV/r1sN7qmohC6U4plWKm5VUh3yjht8jKAeFtVAQ=;
 b=Lqd3Q1+9reVAyn5EwHh/mYtSOsPvDqGlOYwBmhS2K8V0gvZu1OhQNBniV3pWjJHmcY
 ToYXdp6M4t2ncDa/edzvPLXASdJaSbWvmw3xeveoQjTCGjFLFIPIaHcIeT6vBBy6j8qX
 o9DfFNLrsL8vuiV/WLt2qjczUyrmEldMtI+zc96CpXbjEZLtXQi23rEK9U4vi4XT2DSR
 Hio/jPO/h2xQsCSGmY+5VzmTNfi5hPCpM9Vd6Zyli1QPmsbIKrn8j4pCIwy5SAJDWtdX
 pNcxN7rAS+w4dtG607TxoiaIxdSqpgpWUlxPKOaX1hZmShTxDjCxyLgHOw39mY/ZW+40
 yaBw==
X-Gm-Message-State: ACgBeo1RGYm0d+2Rf9iNwJmhZWRVOO61Gx4UxnnDXtQJh5jlMD1plb1y
 kG2Un14A0UmCouQRfWPiQFZL/nYWWlhUTxof/aKzQQ==
X-Google-Smtp-Source: AA6agR58hRNn5YT0+aV/he0km1DXgAqhThT1GDmedc+1QZJ1hmMvCZ9jWXPPFeFiU65ihvB7bxXjzsSt4JoWVwOsjpQ=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr3058162ybq.140.1659110523004; Fri, 29
 Jul 2022 09:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190919213924.31852-1-minyard@acm.org>
 <20190919213924.31852-13-minyard@acm.org>
 <CAFEAcA88GqrqoENf8NHxeNgTjj-jutz8Kspk43L1gp_VJJdh+Q@mail.gmail.com>
 <20220729155644.GY3834@minyard.net>
In-Reply-To: <20220729155644.GY3834@minyard.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2022 17:01:23 +0100
Message-ID: <CAFEAcA-GUjTKcyvPzetyHYMoGO2ijh6o8b9f1bprEup_C9Abag@mail.gmail.com>
Subject: Re: [PATCH 12/15] ipmi: Add an SMBus IPMI interface
To: minyard@acm.org
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 "M : Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 29 Jul 2022 at 16:56, Corey Minyard <minyard@acm.org> wrote:
>
> On Tue, Jun 28, 2022 at 05:21:44PM +0100, Peter Maydell wrote:
> > On Thu, 19 Sept 2019 at 22:39, <minyard@acm.org> wrote:
> > >
> > > From: Corey Minyard <cminyard@mvista.com>
> > >
> > > Signed-off-by: Corey Minyard <cminyard@mvista.com>
> > > ---
> >
>
> Thank you for the ping.  Comments inline...

> > ...calling memcpy() with argument 1 being a pointer that points
> > one past the end of the array. Even though len will be 0 and
> > we won't memcpy() anything, this is (depending on how you choose
> > to intepret things the C standard doesn't come right out and state
> > explicitly) undefined behaviour, because memcpy() wants to be passed
> > valid pointers, even if you ask it to do no work with a zero len.
> >
> > This isn't going to be a visible bug in practical terms, but it would
> > make Coverity happy if we either (a) rejected a request with an empty
> > length or else (b) skipped the memcpy(). I don't know enough about
> > IPMI to know which is better.
>
> Hmm.  In some cases you have to accept a zero-length packet (as
> described in the comments), but if you said:
>
>   if (len > 0)
>       memcpy(sid->inmsg + sid->inlen, buf, len);
>
> would that make Coverity happy?  I was under the impression that if you
> passed zero into len, you could pass anything into the data on a memcpy.
> But apparently not; I can make this change.

Yes, putting an if() around the memcpy() will be enough to avoid
the undefined behaviour. (NB that you want braces {} on it ;-))

thanks
-- PMM

