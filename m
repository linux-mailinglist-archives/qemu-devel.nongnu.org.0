Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D0340B414
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:02:54 +0200 (CEST)
Received: from localhost ([::1]:48030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQAtZ-0005pP-Jt
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQAKb-0005o1-0H
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:26:45 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQAKZ-0006CF-4j
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:26:44 -0400
Received: by mail-wr1-x436.google.com with SMTP id g16so20916440wrb.3
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 08:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hqxY01za7pDN5vT/oqdvHAnYW9DCzMw1oNFVVXWq/nc=;
 b=JKAIbNIQWg0/hoDHHDWImXIfIPCCmciembX7C4vYg5wtev7oKgN0HVnk5IFf3AMc0R
 GgQWBeRgxArHyY1S3W/mv6webYJQdnz2ll6KGK6YGNSbTo9d9s9ZLhTLhvF4G/M/nzNK
 T+JAmkquR07ED/+b/UCzTOTL5GdSnGiuJeYJ+eK/GF6zw2P/qRkbQsR0zXHlyfJAHrD1
 3bR/3sHV9Rgur9klJxixOw6WzSf1W6tV7vAO77vvolD+8Y/sdgEKw45uAbhjbyRP0y9W
 cY8DY3NmraoNWLcMB6GlDT1ucp6+wqncddyL8PHEDyD3FiLIdVM2JjA1oDT+3wUC5C2/
 SS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hqxY01za7pDN5vT/oqdvHAnYW9DCzMw1oNFVVXWq/nc=;
 b=yX+NyFftN4s6PjsJs4NoAXIjqe2PmMcJ+18IhEoKEsuvP0+NrJHbNC9OfzJgjb89me
 JMxaSzb7AZ4Wfs6fsPjto34W944rfexqJ+PLlTZVIzmVT2OA7Sb+n+wll8O7CoCIuzsx
 C4rDdZeRg1aV3wveAPkq1Hg7NyVerecuuss52M6mUA2eTRGr37eX7Chkhz6F6CWUKxcN
 y0qOfHGX6T7YO8FMj5NbAC6ynRh3d8XDh7DBHyALwcP8Arxqx0ExrMdj4DWUvrXQB3rE
 DE5eLiM1Hs8PIfhzdFuKoc6TzLDSHyQn9a0USGsP7g1N81xGHYOh4Gp9/IWkMqFcumFO
 LR2g==
X-Gm-Message-State: AOAM532mG2zQT1Bed3T4otoli9WXRWtYR0Ltsvjo9y8O22T+0Hkl0Jba
 Kj/aynaJd2KphdAwqwDuCwnSPM6YTJ/7tYPGCGWJbA==
X-Google-Smtp-Source: ABdhPJzQbu6XnSklpWGtJnRsEQWoEYBii5wVZzahg7Ww4ZMSofyq6p2GLRx+/fFCPQPxgC9ZAO2jUJBvgQ4OryMGlo4=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr19801638wrs.149.1631633200422; 
 Tue, 14 Sep 2021 08:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8Q2XEANtKfk_Ak2GgeM8b_=kf_qduLztCuL=E_k36FWg@mail.gmail.com>
 <87czq0l2mn.fsf@dusky.pond.sub.org>
In-Reply-To: <87czq0l2mn.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 16:25:49 +0100
Message-ID: <CAFEAcA-1cGjt54XDEmKiDctySW4zdQptoc2taGp0XxMOtKvGCw@mail.gmail.com>
Subject: Re: ensuring a machine's buses have unique names
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Aug 2021 at 15:08, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > What's the right way to ensure that when a machine has multiple
> > buses of the same type (eg multiple i2c controllers, multiple
> > sd card controllers) they all get assigned unique names so that
> > the user can use '-device ...,bus=some-name' to put a device on a
> > specific bus?

> Another one used to be isapc.  It's not anymore.  I believe it's due to
>
> commit 61de36761b565a4138d8ad7ec75489ab28fe84b6
> Author: Alexander Graf <agraf@csgraf.de>
> Date:   Thu Feb 6 16:08:15 2014 +0100
>
>     qdev: Keep global allocation counter per bus

> Note that the automatic bus numbers depend on the order in which board
> code creates devices.  Too implicit and fragile for my taste.  But it's
> been working well enough.

I had a bit of a look into this. I think the problem here is that
we created a family of easy-to-misuse APIs and then misused them...

The qbus_create() and qbus_create_inplace() functions both take
a 'const char *name' argument. If they're passed in NULL then
they create an automatically-uniquified name (as per the commit
above). If they're passed in a non-NULL string then they use
it as-is, whether it's unique in the system or not. We then
typically wrap qbus_create() in a bus-specific creation function
(examples are scsi_bus_new(), ide_bus_new(), i2c_init_bus()).
Mostly those creation functions also take a 'name' argument and
pass it through. ide_bus_new() is an interesting exception which
does not take a name argument.

The easy-to-misuse part is that now we have a set of functions
that look like you should pass them in a name (and where there's
plenty of code in the codebase that passes in a name) but where
that's the wrong thing unless you're a board model and are
picking a guaranteed unique name, or you're an odd special case
like virtio-scsi. (virtio-scsi is the one caller of scsi_bus_new()
that passes in something other than NULL.) In particular for
code which is implementing a device that is a whatever-controller,
creating a whatever-bus and specifying a name is almost always
going to be wrong, because as soon as some machine creates two
of these whatever-controllers it has non-unique bus names.

It looks like IDE buses are OK because ide_bus_new() takes no
name argument, and SCSI buses are OK because the callers
correctly pass in NULL, but almost all the "minor" buses
(SD, I2C, ipack, aux...) have a lot of incorrect naming of
buses in controller models.

I'm not sure how best to sort this tangle out. We could:
 * make controller devices pass in NULL as bus name; this
   means that some bus names will change, which is an annoying
   breakage but for these minor bus types we can probably
   get away with it. This brings these buses into line with
   how we've been handling uniqueness for ide and scsi.
 * drop the 'name' argument for buses like ide that don't
   actually have any callsites that need to pass a name
 * split into foo_bus_new() and foo_bus_new_named() so that
   the "easy default" doesn't pass a name, and there's at least
   a place to put a doc comment explaining that the name passed
   into the _named() version should be unique ??
 * something else ?

thanks
-- PMM

