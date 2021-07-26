Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47203D5D87
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:43:40 +0200 (CEST)
Received: from localhost ([::1]:55098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82lX-000798-QD
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m82kH-0006Fn-Qj
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:42:21 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m82kF-0003oj-UM
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:42:21 -0400
Received: by mail-ed1-x52a.google.com with SMTP id f13so8443998edq.13
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 08:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xn17/w/cYHBEpRlaWDRS5HB25/bVhOhpdJGaS1Uhjio=;
 b=fcmCMs2Zv5oZQilxuhbAOfoxQzabTKQDu2pnD/VvFnMoqzCygjpnu5Q3yPRkzcmY36
 XTTzFtIy92b5WQofJIJo50JRoyuIEP8+jzuMzocWaC75piO44PbV4BqFYmFlelaff2ur
 CGQ3e1TcWykM7RIxudxQGy3GMEQ6PLgpYl4nnnOarIiXAmsMVrG4wdl7CdgKxPDs7XWu
 8YLyWLa6KNtjQu+SIajCePEt1e0LgSCio3CkqLfgpu3zTDtKNcFJijw1Zt4k3kMVVyd/
 XJHvS1GMJ05mq5vyvQR4lYQWNzv+Zr4NcHW6H50jh8GjzcZWdzdc/74d/bjOK7616Ljq
 7RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xn17/w/cYHBEpRlaWDRS5HB25/bVhOhpdJGaS1Uhjio=;
 b=du4h718D+KIHQ6SeRUBf6jQfMWY40Dyzx7Gs7NuZTuBON2gtSiD+C2ttOXq49Lgo8B
 gfE8U7S550yBmhOccsbkHm4cybFhtJqyMNZuu+JelBcLcgh/o+MfgcF8i/v8xZwb1Xus
 fk86AjJxbSuJiBZa/B6qncf/tOUdi7Jzu5gu3hfI2XFPFJ94uRn2rK1oyPlCQhGuniz3
 GRLBVWpp8njo8WQ0Bn/8nr1kcdIXJ4+dFtex18d32pNmtYYtksaEhvJ6aohMf/2+uTQy
 qOCw63pt04AtxrQeihRKn3bnHMBUh4a15fHnVLQz7sdVzFGd8W6ua7OTkU2pIqxoAeae
 3iTg==
X-Gm-Message-State: AOAM531R6jTkk2og3vaOC3DkkTfDvxpxEwExZF7PQcZ1N+n+9QNszBM3
 eliKtRPbWe2U33yRg3vvk7zG++qar1Y9GyFabimn2g==
X-Google-Smtp-Source: ABdhPJxoYYdWSHF6pUxT1Ub2ZDBOLoug/vS9sHe0MmKjOr0j3zgPcFqc20Or7uSxE0EfPFyvJfD/iqraaZWUwIs4AVs=
X-Received: by 2002:a50:f615:: with SMTP id c21mr5770570edn.146.1627314137732; 
 Mon, 26 Jul 2021 08:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <CAFEAcA_AKpibWQuX4gapGD+u=KCL9-er-ejPGS_cVyNbsuLJJQ@mail.gmail.com>
 <20210726150056.2sis5ssif2l3xjcf@gator>
In-Reply-To: <20210726150056.2sis5ssif2l3xjcf@gator>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 16:41:35 +0100
Message-ID: <CAFEAcA8=ve-eDuk43yNV=VKvXX=cq_NswXWayrMkbAJu2VTdbg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] target/arm: Add sve-default-vector-length cpu
 property
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 at 16:01, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Jul 26, 2021 at 01:42:45PM +0100, Peter Maydell wrote:
> > On Fri, 23 Jul 2021 at 21:34, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> > >
> > > This is intended to resolve #482.
> > >
> > > Changes for v2:
> > >   * Split out length bounding fix to new patch.
> > >   * Use byte units for sve-default-vector-length.
> > >   * Support undocumented -1 "maximum".
> > >   * Add documentation.
> >
> > I'm going to apply this to target-arm.next with the following
> > docs tweak squashed into patch 3:
> >
> > diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> > index 4ff36cc83f0..7b97df442aa 100644
> > --- a/docs/system/arm/cpu-features.rst
> > +++ b/docs/system/arm/cpu-features.rst
> > @@ -379,11 +379,14 @@ example's (1), (4), and (6) exhibit recommended
> > uses of the properties.
> >  SVE User-mode Default Vector Length Property
> >  --------------------------------------------
> >
> > -For qemu-aarch64, the cpu property `sve-default-vector-length=N` is
> > +For qemu-aarch64, the cpu property ``sve-default-vector-length=N`` is
> >  defined to mirror the Linux kernel parameter file
> > -`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
> > -is in units of bytes and must be between 16 and 8192.
> > +``/proc/sys/abi/sve_default_vector_length``.  The default length, ``N``,
> > +is in units of bytes and must be between 16 and 8192.
> >  If not specified, the default vector length is 64.
> >
> >  If the default length is larger than the maximum vector length enabled
> > -with `sve<N>` properties, the actual vector length will be reduced.
> > +with ``sve<N>`` properties, the actual vector length will be reduced.
> > +
> > +If this property is set to ``-1`` then the default vector length
> > +is set to the maximum possible length.
>
> This file is full of single backtick usage. Isn't it better to stay
> consistent? Or do we need a patch that converts all the rest now?

I just sent one of those:
https://patchew.org/QEMU/20210726142338.31872-1-peter.maydell@linaro.org/

-- PMM

