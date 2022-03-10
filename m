Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3F24D485A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:47:45 +0100 (CET)
Received: from localhost ([::1]:51308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJ8q-0007oB-HS
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:47:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSJ6x-0005Wi-DL
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:45:47 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=42947
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSJ6u-0007vj-41
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:45:46 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id u10so10927549ybd.9
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 05:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hH9foalSKFuWl3KHVEZIy9pWx5MX0A06H/DGW+P9mZA=;
 b=IEb3fh2zsWAp7MPqpNAKY0EJR5NjEUBv0841hLvb9rQ2oghr9FELNtwAl5qvVkwq/Y
 v7kWGv+9Wd7DDziItEabZG10XUdDyvuDLZLk0/3pY6e3XtWZQCL+ZHJWJkXq+HEeeZlY
 u56x/VKPO9IP0ogJWX80bCxZ8pnmKq/D4EI0bqBtbYpMjCJaiyzuyAa0xzaJhnzuWWDx
 N+/yjw1zjORUFQbUkHAllznso2jTt2UNb4rjbcoIFukLzK1qtZZBbbqqsxjlxOJNb9g8
 n/0rIPtH/MvC9T3Kzf+8a8jK/2l/WOdm2Ia6L/yPBrorNswkxq7u2+7vMdACmYyKktiA
 k19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hH9foalSKFuWl3KHVEZIy9pWx5MX0A06H/DGW+P9mZA=;
 b=JfKzoolsNLi8TpGyWWWNwDT6fmbD0HsmS5RXwuy0A8CZpiOjANxQO5Vk/KjIQ1lHHM
 gKkjLaEw7SAyD3YG/dwG8y4BW7MF/OIsJwlCnM3FioL/T4q2pvt3ZMUmeiQQ9nY3fKem
 0RPw4pFpHB2jkSV33KxffTH/c6NPMsT9byVgTJwYQMQg7M6sHEYeqKjyYSIBPG1ssny5
 pWBTRBwhQXDwBcvOjL9eLZtqUyhBAZbOOo9cF9x1p0CWfx+eqaR4w19+ZQkWXY2uSjux
 pnOBZp/vqHPUAEYngPlS3RtkWBdlXXS9pRbBCdSGqoOEcG61ybY7x64Hp6Hwx1P0pQnW
 9dBg==
X-Gm-Message-State: AOAM5318lVQ0bktk2v3GziH3Kkhi00pBVRJu2umwGZBqCuOtMJVmJiYS
 WTZZyN3Q/favX01gPT+LBhydeuHs7ByVR7quewi9Ig==
X-Google-Smtp-Source: ABdhPJxVshzLO7lnGoIVSlkHsg/DPa/GMn3fvWqjDpE6Gf29V6pi19irZmh0Aa1RLeVgnopFQL7xCjzEOAN9u1mQ9uM=
X-Received: by 2002:a25:d181:0:b0:629:1919:d8e5 with SMTP id
 i123-20020a25d181000000b006291919d8e5mr3842075ybg.85.1646919942922; Thu, 10
 Mar 2022 05:45:42 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
 <c7f6ffef-8ce1-6ee1-9ad7-a90ed1b54122@gmail.com>
 <Yin67GyJWDn5N1ov@xz-m1.local>
In-Reply-To: <Yin67GyJWDn5N1ov@xz-m1.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 13:45:31 +0000
Message-ID: <CAFEAcA_tfxE2kRtbLraXS3+fW8D7UNNJ2QkGSSvLReqt2G=KjQ@mail.gmail.com>
Subject: Re: QEMU device refcounting when device creates a container MR
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 at 13:19, Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Mar 09, 2022 at 11:40:15AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Cc'ing David / Peter
> >
> > On 9/3/22 11:33, Peter Maydell wrote:
> > > Hi; does anybody know how device reference counting is supposed
> > > to work when the device creates a "container" MemoryRegion which
> > > it then puts some of its own subregions in to?
> > >
> > > As far as I can see when you do memory_region_add_subregion it
> > > increases the refcount on the owner of the subregion. So if a
> > > device creates a container MR in its own init or realize method
> > > and adds sub-MRs that it owns to that container, this increases
> > > the refcount on the device permanently, and so the device won't
> > > ever be deinited.
> > >
> > > As a specific example, the usb-chipidea device does this in its
> > > init method, so if you run the arm device-introspect-test under
> > > leak-sanitizer it complains about a memory leak that happens
> > > when the device is put through the "init-introspect-deref" cycle.
>
> I'm not extremely sure about this, but.. does it mean that the device may
> better put any of the add-subregion operations into realize() rather than
> instance_init()?  Then in the unrealize() of the devices we should do
> proper del-subregion to release these refcounts.

That would be one option. In the specific case of chipidea it would
alter the ordering in which the container gets set up, which is
currently:
 * chipidea's MRs added to container (in chipidea instance_init)
 * usb-ehci's MRs added to container (in usb_ehci_realize)
Because chipidea is a subclass, moving its "add MRs to container"
to its own realize would put them after the addition of the
usb-ehci MRs. I haven't checked yet whether this would change
the semantics. (If it does, we can probably fix it by using
explicit priorities, which we should anyway if the various
sub-region MRs overlap.)

We don't document anywhere that this must be done in realize
and not instance_init, though.

> Otherwise indeed I don't see a good way to destroy the device anymore,
> because the assumption is after device initialized, only with that will t=
he
> object_unref() continue to work on the device..

The other theory I had was "maybe if you put an MR into another
MR and they both have the same owner then don't bump the refcount"
but I haven't thought that through at all.

> That means, perhaps in object_init_with_type() we should make sure the
> object refcount=3D=3D1 after the ->instance_init() call?

That's probably a useful invariant, which I bet we don't
currently get right for every object :-)

-- PMM

