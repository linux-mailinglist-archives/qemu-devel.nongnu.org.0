Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF7371E90
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:28:06 +0200 (CEST)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcMX-0001bX-PA
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldcBe-00055I-16
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:16:51 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldcBR-0005cu-M0
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:16:47 -0400
Received: by mail-ed1-x52e.google.com with SMTP id h10so7123599edt.13
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xS3jsNGSJ6YMNiXAm5EgDOWP0PdIwLhAdyq55WpPNP8=;
 b=exRUaUb3/ruATfEgmZneRzP1XEWop3iT9AkWS9NSalvgybYfi8qGdzTfAcRzCOH02I
 3JUH1UzDHYBVTuannKaGyg4jeliHYEQ5F4XqQ9wOXAU2e0iiNoKEwQlki8GDBacRUUPM
 9BYoNKJcS9EboCTe34aLvQa06yDHmNWa3QsQi2/vapMZ7rUXB7aZ77rf0opGve1sb3WF
 +P3hHV5iY8DMxLn4wwI9vooloxA0YajYN4/HzjU1QKLcvd0As22l4KXAVX3kWGYFoclV
 l531g1+OpLEMzf+MFb1rDiBlZveQGlHhJ1hLrnqucGUsUD7q1urofYWDMuZ9q9at2NnM
 1qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xS3jsNGSJ6YMNiXAm5EgDOWP0PdIwLhAdyq55WpPNP8=;
 b=CIbq8tRZ4SLmmtoYLrLXYZBktTUxh8bAQNQBal7muUGzuQ0POTpoLyPAHtaVZ0YTGW
 12O+9qCIhS9Nw82hsM/KhA8j3+NdU6S7bJQgIGn9CLvSvy6RAVo69NQL7VXImhdDSa+f
 LS9P4Jf5sMQ3p0QGLwAQNa9azgRa/J/cSaEoyO0JHVh9FlSVWfNwLUnY1IIggeMwXtAk
 vt6o7wFaeIX7G/lnUKUFnn01Y6c/qDlUw2KAtMJnAcaK/fAV/TlnTSjRryJ1DszxAs1i
 n+CrQaFPzsl3531YkJCFxxjWjTfq5XNGXoBdZO5z2kXYQzvckUxIBF9O2e3xlg6rvy79
 34Hg==
X-Gm-Message-State: AOAM533HI8sPv9IwJPb6QcoAsBpvKAgIWl10qO7MhkVT/w6SxWybxLm8
 Qq6HTLxqTvsYcd3xt5M4PrL8UeyU/9hoUIS6AXS4QA==
X-Google-Smtp-Source: ABdhPJw9qByBwpXdgnDYxkbfshe4/sbO7T47BO+NHdb/fD3IiRIKQPnR8TYWm/bVXbcRxsZBzHA3rJ+t8nxBwPPnLsg=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr20891846edu.100.1620062195942; 
 Mon, 03 May 2021 10:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210503151849.8766-1-peter.maydell@linaro.org>
 <5fc07469-32c4-3c86-92f1-430bac6f09a3@redhat.com>
In-Reply-To: <5fc07469-32c4-3c86-92f1-430bac6f09a3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 May 2021 18:15:30 +0100
Message-ID: <CAFEAcA8K7GEDkbOkdS2518v4CXh6ZK-Op4twF5wmh8pzpRvJUQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ppc: Convert (mostly) from device_legacy_reset() to
 device_cold_reset()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 May 2021 at 17:55, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Hi Peter,
>
> +Eduardo/Markus
>
> On 5/3/21 5:18 PM, Peter Maydell wrote:
> > The old function device_legacy_reset() (which was originally
> > device_reset() and got renamed when 3-phase-reset landed) is
> > deprecated, because it has slightly odd semantics -- it resets the
> > device itself, but (unlike when a device is reset as part of system
> > reset) not any qbus it owns (and devices attached to the qbus).  The
> > replacement is device_cold_reset(), which resets the device and its
> > bus (if any).
> >
> > For a device with child bus, the two functions are identical; this
> > patchset changes the PPC code which uses device_legacy_reset() on
> > devices which have no qbus to use device_cold_reset() instead; this
> > should have no functionally visible difference.
>
> So IIUC we should be able to add this check?
>
> -- >8 --
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index cefc5eaa0a9..4e03f964a42 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -1121,6 +1122,7 @@ void device_legacy_reset(DeviceState *dev)
>      DeviceClass *klass =3D DEVICE_GET_CLASS(dev);
>
>      trace_qdev_reset(dev, object_get_typename(OBJECT(dev)));
> +    assert(DEVICE_GET_CLASS(dev)->bus_type);
>      if (klass->reset) {
>          klass->reset(dev);
>      }
> ---

No, because the codepath starting at qdev_reset_all() which
resets the whole qbus-and-devices tree calls device_legacy_reset()
to reset a single device.

There are also probably places where we call device_legacy_reset()
on devices which do have qbuses, where we need to figure out
what to do (eg if they are also manually resetting the qbuses
we could switch to using device_cold_reset(), or perhaps they
aren't resetting the qbuses and this is technically a bug.
Either way, those callsites are harder to convert.

thanks
-- PMM

