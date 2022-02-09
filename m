Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602014AF901
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 19:09:36 +0100 (CET)
Received: from localhost ([::1]:51638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHrPK-0004zd-Kf
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 13:09:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHqXc-0004O4-4K
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:14:05 -0500
Received: from [2a00:1450:4864:20::32a] (port=45886
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHqXa-0001M1-6U
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:14:03 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso2096741wms.4
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 09:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ol5xIWb4le+TN0NwyXVvTG6IaJssEMYhOhJ3B8ofgvQ=;
 b=De1V2cK9htwM5KontK+F2M4FWEgnk4shzRaT71lAdG0e3L7s8nUO97aUVLxMy9lN/0
 UGGGMtNqgdvujZUKYNNbfzBeivtuNwt90uKuiktQMhKjDBvAHbvxATKVHIKr2zGEGvXB
 7c83QcU5wRQsNKmx7Z5+Q8p+rSHgtc7vRR9yJnRaxGTf4o6QV4dNjb8FoDRxQDytYl11
 Gaz+4HVEk8aVep5fIMZhhvGfVejVmyKUHtjaVp+XHLFgUy98PJl3oZulQPyfCY9nL3UA
 RpeZbN8RNszfhkLKeqP+xpxbysiwA4Qq8jboGmk+XhCXYxiqjAvb3ZcCdl9IgXV5SFw4
 RR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ol5xIWb4le+TN0NwyXVvTG6IaJssEMYhOhJ3B8ofgvQ=;
 b=pu3fusmhrfjpCEGpn8yo/GO2Ozwo8XmhATJ9+rMS4F9QhDQXliIqMRcxwkBEo5Z6Az
 obbSQ9NMOmr39qKlfMFn/RbDLlPLpQho7r2y3LqVooEADRJ2zh2ADXbVz3qu9CHMKQg2
 Vol1LnVcciQU4fpv0kmn7qfa/eEfH7DjbSLH/IMlCaBKRHZfPKl/qa7uyaVDuztRrZyV
 d4pjpy73Pq8C8YvU9ISeHaMaxA5uFVyahbaBT5RaJGar1UzrnLENluKIvyJ1xdrg9ZGn
 qSfNM+n52O1betxoNlXBrLXNfWbh8ggtLycSkpmvY8J4mMQoSZCwmATB+gAMzkSl79jS
 Tu0A==
X-Gm-Message-State: AOAM531q85T4sTcaW9dz6nvWIAeG7G+evZ3kUNbh3DD6pkfL4imeF5b2
 olkJrz0ByIPJ5sOM0YFKOP8mJNo1MRkBGklBfuUKQw==
X-Google-Smtp-Source: ABdhPJyc6/6xP6b0YuuJP/iFPHsGq9HaW0ld4TzmxrBFs1T6bzENe44P5a5vP6hrDLidcHz5FeEmtc6vLOz/Ww/nLxU=
X-Received: by 2002:a05:600c:4f0b:: with SMTP id
 l11mr3631819wmq.126.1644426839318; 
 Wed, 09 Feb 2022 09:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-2-alex.bennee@linaro.org>
 <CAFEAcA8TCTEBnjibsUTyqRXL0tWXGUih-TATNLHuWW-5=VQHLA@mail.gmail.com>
 <87sfssdms7.fsf@linaro.org>
In-Reply-To: <87sfssdms7.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 17:13:48 +0000
Message-ID: <CAFEAcA-bVhgyD88eD+LM0F+TLMgSRR0k0rz1TjG82k4KPkhz=g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Keith Packard <keithp@keithp.com>, qemu-arm <qemu-arm@nongnu.org>,
 Andrew Strauss <astrauss11@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Feb 2022 at 16:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 23 Jun 2021 at 14:47, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >> +static gint sort_secs(gconstpointer a, gconstpointer b)
> >> +{
> >> +    RomSec *ra =3D (RomSec *) a;
> >> +    RomSec *rb =3D (RomSec *) b;
> >
> > /*
> >  * Sort into address order. We break ties between rom-startpoints
> >  * and rom-endpoints in favour of the startpoint, by sorting the 0->1
> >  * transition before the 1->0 transition. Either way round would
> >  * work, but this way saves a little work later by avoiding
> >  * dealing with "gaps" of 0 length.
> >  */
> >
> >> +
> >> +    if (ra->base =3D=3D rb->base) {
> >> +        return ra->se > rb->se ? -1 : 1;
> >> +    }
> >> +    return ra->base > rb->base ? 1 : -1;
> >
> > This has forgotten the "equality" case, which you will
> > see if two blobs start at the same address (at least in
> > theory; at the moment the rom blob loader will try to
> > reject overlaps, though it might not do so forever).
>
> I'm confused what you mean by equality case. If both RomSecs have the
> same base and the same se flag we need to pick one of them. Are you
> saying when ra->se =3D=3D ra->sb we should take ra?

I'm saying that a sort comparison should give a consistent answer.
At the moment if you pass it two items A and B which happen to
have the same base and se values, then if you call sort_secs(A, B)
it will claim "B is greater than A", but if you call sort_secs(B, A)
it will claim "A is greater than B". The GCompareFunc API provides
a way to say "these are the same" -- return 0.

-- PMM

