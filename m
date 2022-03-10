Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7874D4FFF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:12:37 +0100 (CET)
Received: from localhost ([::1]:35062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSML6-0006sC-93
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:12:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSMK2-0006Bw-7a
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:11:30 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=39661
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSMJz-0002cM-9C
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:11:29 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id x200so12169913ybe.6
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 09:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hGIIHA+tWoY5Z4usNa5VKY1OGu6t8wWh5CeTN/R/Olc=;
 b=pqVTfvlXuVDa8Cn1hfLVuS80ukrwB16+Ct2ftdVc5c4Mon+gdSeY07rIuhAK1IF5Es
 O3PMA7B65dZQef1AzLp6u6AIC47A2w3OX+55NcC/YxsLyBP8sTOXzD2X5kp8mgCiz1+f
 DPVmgxPIuXWkF7uONbmacudhzU0USRVjcQ1/yuxK6ncqtgHQvlPdV9SUsyUgK5UTCIO9
 IVUzvHShq9ErEvaE4Q11V+Z9cc+cD2DuwD8BNR3BivS1OwDjYHPlVgVRtT9rOrKIGTEs
 fCZ0RpG9oV4j9KQN1I85Bjvy7/QyQOqehDUxcQrQZRk8aNfuNe/573gVt7L4XJYSsXyL
 MPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hGIIHA+tWoY5Z4usNa5VKY1OGu6t8wWh5CeTN/R/Olc=;
 b=DtjH8jCJipYEYACUH5g/2FUiCqPBRtKAWcE2TVK07QgMcKGqCzcph7z7BjSG7E2ByP
 BpMsw04FOPy2pjj0Xma+ajy6za7clnQ+k7qTjJ1Kc+9VFNc3RNwCfiAzZJ7mkeIiG1Xb
 W6uz+LhyB1h5J7N1/GSSXvW4Cz2Urms4T+16B2li7e4jsAErTOOXhpLd1/9CpIR1PLq3
 sY4LU/nzo+YU0s57MK41P8CeT6AWICD5J8oSTfPbYzXwbVAMWjT4VS1tY+qHAdQ7V0U4
 kSxRxDicqs+aqPoYoKwaoJQsVjMDoL2GsZ4K/iC3FkaMvkwhPaARXbJzLvPylGoFSkIM
 /Wnw==
X-Gm-Message-State: AOAM530RFkfayE7MpTm3pgdmHY1yHgMXO2D9sxMEN9AxYqzheMRt0/FO
 O9Sl65HdZkFmrrTQHOnLjBtja3iyiFxKD/d5oHECeCJPJ2xYkzsb
X-Google-Smtp-Source: ABdhPJxZU1vSdv/Kypl1+OY9Dy6MnyWyYpseHzJ4f+IPpUghYlM24ifJdeM2tO9AjWHn1klfuzzx+oJ7T89J7uFJn7A=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr4736495ybq.479.1646932285908; Thu, 10
 Mar 2022 09:11:25 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
 <4eb4bb05-814b-c28c-c2f4-0f5f5582301b@redhat.com>
 <CAFEAcA-Wg5LKVRQ4dKX6Hsyb=1VVxfGBDB_=Q6iCxycJzLPRhg@mail.gmail.com>
 <CAFEAcA8ytELEkGfwCV3WEZYCCtYdyG9_2uANk8UXGV-=iOnfqw@mail.gmail.com>
 <20220310163610.7f782922@redhat.com>
 <CAFEAcA8Nvr-7QYHv2-K+zN37i=ZXa8_Skb53PaTJzSdhXaBq3g@mail.gmail.com>
 <20220310173053.5eb97f20@redhat.com>
In-Reply-To: <20220310173053.5eb97f20@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 17:11:14 +0000
Message-ID: <CAFEAcA_-VhULZ5v4VeA-NYgSgCdk3HgvfQQg8UzCbCvEY4433g@mail.gmail.com>
Subject: Re: QEMU device refcounting when device creates a container MR
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 at 16:30, Igor Mammedov <imammedo@redhat.com> wrote:
>
> Do On Thu, 10 Mar 2022 16:05:24 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Thu, 10 Mar 2022 at 15:36, Igor Mammedov <imammedo@redhat.com> wrote:
> > >
> > > On Wed, 9 Mar 2022 16:56:21 +0000
> > > Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > ...also, in the device-introspect-test where I see this problem,
> > > > unrealize is never going to be called anyway, because the device
> > > > is only put through "instance_init" and then dereffed (which
> > > > does not result in instance_finalize being called, because the
> > > > refcount is still non-zero).
> > >
> > > question is why introspected device is deferred instead of being
> > > destroyed if it's no longer needed?
> >
> > ...because the reference count is not zero.
> >
> > What is supposed to happen is:
> >  * device is created (inited), and has refcount of 1
> >  * introspection code does its thing
> >  * introspection code derefs the device, and it gets deinited
> >
> > This bug means that when the device is inited it has a refcount
> > that is too high, and so despite the code that creates it
> > correctly dereffing it, it's still lying around.
>
> looks like ref count leak somewhere, instance_finalize() take care
> of cleaning up instance_init() actions.

If you read the rest of the thread, we know why the refcount
is too high. And instance_finalize *is never called*, so it
cannot clean up what instance_init has done.

> Do you have an example/reproducer?

Yes, see the thread -- device-introspect-test shows it.
(You can put printfs in ehci_sysbus_init and ehci_sysbus_finalize
and see that for some devices we don't ever call finalize.)

-- PMM

