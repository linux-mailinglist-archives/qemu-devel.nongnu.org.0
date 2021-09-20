Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D1E4110D8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 10:20:05 +0200 (CEST)
Received: from localhost ([::1]:38462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSEWy-0004Xe-5B
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 04:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSERo-0005Fg-E5
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:14:44 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:44790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSERi-0007o2-J9
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:14:44 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 f62-20020a1c1f41000000b0030b42643f72so6429046wmf.3
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 01:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nFZoEBqVVgcZagv00xcAj9jVWGZZXZ05XEYJlFzyQw8=;
 b=qi2BWgEmcWaD1p62Znp0upi2vYhYPQ9cY3rcnmqNlILb1GqE9q0w2nnpi3o+r5R2c3
 /CiiqGEIPt7ph8QCqv4AQnvmmkNyvghIxABLhR84qb2Pjkt03zq6EreXhJ1iPt6vHR86
 MFdDQ+y95W+CKKJ4kSBtB7H2hN5+VRooU6ILnthsEytFoeGdw/CRcIDiafTujKqit8+C
 aNPGdKCjWWZyJLIbboJThgg6N8YLL58MjCIMvopER5aORua0O20F6RF4Z2In1cMv2hg1
 oyTYT/Bitiy2dnXPDAUXt2Zz/z/iA4xUf10z9MJxSAcun50NIx+ktz9PDPBf2EEnS1t3
 z1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nFZoEBqVVgcZagv00xcAj9jVWGZZXZ05XEYJlFzyQw8=;
 b=5fy5jY6U7dl+xP3sRgdn9gzRSZCBgi8Egh+TxxFg1WAGRkLTEnENgNxkqc1V9ML5fX
 6vIYJnhjJPFlA6xIepfG0kr4LdYnngvczKELYsgyWHu+0JQ7E921cFq16dh2R2Xt+Ogi
 XTIjQ9+ZBi94YIe+nOT1blrbBE0vuZEjZeAB6mH8Nt50nfnXydYJiMGZoOa+h/lxGf4i
 NDZT9cYHHh3x2ReBb/6CfRr9avPwD3t3+mHLwZGaQZtv4unTN5Csz6PinUZhnFQ00g+r
 m+MqacCnzzKpjSiurt2QFNbsb1+ZowPq2dT6tcjGI3queIzb03l5UBAj8PA/JhFGb5QZ
 i/3Q==
X-Gm-Message-State: AOAM532o+Xh3MTCN6RVQsNzftgWHkpe//3Hrmdqc64v+lR5h1KzymWKw
 9/6TBAQgpIi2yse4/MIAaoAXEnArD5N+7wXfexXVXg==
X-Google-Smtp-Source: ABdhPJxg3202jlUgTua79McG+Ci3yKMRZhuZoHcmJcmjUNGfXdoEIadBMqo9Jy2GMCnvCBQVjaCTs7C6uCXEC29a1j0=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr28501663wmh.126.1632125676722; 
 Mon, 20 Sep 2021 01:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <YURYvaOpya498Xx2@yekko> <87k0jfh88i.fsf@redhat.com>
 <CAJ+F1CJJvqVQrG5iPXV2s7oLbduHfAhHs0pHdZ8XbxLkNi42VQ@mail.gmail.com>
 <YUR2BjppxkBo8mD0@yekko> <dc2df310-ee28-a912-3aad-4d3e38974182@linaro.org>
 <YUgC8HThCulgUFcB@yekko>
In-Reply-To: <YUgC8HThCulgUFcB@yekko>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 09:13:44 +0100
Message-ID: <CAFEAcA8kd9h32eoXaFVQjvf1hzOhw6Bky_Nkfa5vhsPw=zG45w@mail.gmail.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Sergio Lopez <slp@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sept 2021 at 06:07, David Gibson <david@gibson.dropbear.id.au> w=
rote:
> On Sat, Sep 18, 2021 at 01:01:35PM -0700, Richard Henderson wrote:
> > We dropped host support for sparcv8 (true 32-bit) a long time ago.
> > We only support sparcv9 in ilp32 (sparcv8plus) and lp64 (sparc64).
>
> We really need to update
> https://qemu-project.gitlab.io/qemu/about/build-platforms.html
> to clarify this then.  I don't really know what the procedures are for
> updating the website.

It's automatically updated by building the documentation from current
head-of-git, so the answer is "submit a patch to change
docs/about/build-platforms.rst". (That's a pretty new file, and
the stuff about CPU architectures has gone in only very recently,
so it's not unsurprising if Marc-Andr=C3=A9 and I got some things wrong:
we were just looking through tcg/ to see what it seemed to have
support for.)

The structure of the build-platforms page currently assumes that
"supported host CPU architectures" and "supported host OSes" are
basically orthogonal, because historically the nature of QEMU has
been that this is more-or-less true. If we want to try to be more
specific about that then we'd need to re-jig things.

-- PMM

