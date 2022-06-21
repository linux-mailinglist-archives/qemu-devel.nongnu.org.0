Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65F455351E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:02:15 +0200 (CEST)
Received: from localhost ([::1]:46856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fOQ-0002Bw-H6
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fDL-0002mY-VM
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:50:47 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:39502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fDJ-00085F-Ou
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:50:47 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3178acf2a92so99498027b3.6
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m7uFM9zUpIIlEWeNOend/HTHPABWG2rMqzGwE3GDRbs=;
 b=B3TRyzTPhBv54w12Ncq/w4Qzgpzd2riJSv0zCh2/YuDphk/3n79iQNKZrtXof56Vvr
 2ECUp2bOdXoEWnvzkPAluwBnh44AeD98ENVH3wD97fz6faMzzoCedjRdjwdYT90NFrMk
 gCQxXrOdCS5NL3STTrKVe4QU8QXQKbKsxBLpZRtIeoV/nT5NX2hLL6X7nhP5qK63+Ds6
 +y2czqNtEoUHkEjSCKcsUhOshOaKEzrQ7H0kfvihjUuUed1nPAnXpJj1bEIbpg42r2pm
 4YO8oohqB2jWgEleKOhcoRrIUA7RxTh7N0ZTYWs6b5iKxLRrSJi8RtVnauSq4oaVK1ON
 XDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m7uFM9zUpIIlEWeNOend/HTHPABWG2rMqzGwE3GDRbs=;
 b=v9AAiQCt6isfKgejIXptYcI68PosLm2BJoAyoEbHfcQdtO8thLxG5w/4OVq7a2aPub
 /yYXKejJ+3b5dvk9PpGOHIZeoWtUj/HT4S/WCQ28fbCJGXS46/1jaSjvWu1TegfqjiLL
 4cTjc6zG4xKMFOfF6ldcz+lh0ZcONcCyVaoiPqPlnsyTs2Mwc6xSUHn9KZvYAjMsm7dT
 EJBA9gCMvN67vEO5Z53aeTR1uZnsAMepWE1g689WnJbNKaNVlYagqWvK57CiFbonLA4n
 L4nx58J7mY0ijBH7DEI7ub2599KV+AnCkzMk6sVmd6Qk/xS+jgOA8SKWjhM0Fd+cPy6S
 Zu7g==
X-Gm-Message-State: AJIora8ZDB/Z87VAR2ygTRRQlOEKpWdJy6xJ0RWRUHq0r7IUCzCBfvtP
 rUINDkJU3KIXvusDvyb1fEX07/ItzK/2YYj+cU0Hrg==
X-Google-Smtp-Source: AGRyM1t3LtFMoZ9Bsqk+gqVaCIMFS+Y8wYtVe2GfToXa7nacKzWaMNoM05hns2kRnxZrr8EW8YWWml3jkpafzy5WUXA=
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr17906082ywf.455.1655823042919; Tue, 21
 Jun 2022 07:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220422142851.28128-1-damien.hedde@greensocs.com>
In-Reply-To: <20220422142851.28128-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 15:50:05 +0100
Message-ID: <CAFEAcA9Dy0DXshrKHLAEkGV_Zy-vRMPAhd4t+S7fSGSCPuPJ1g@mail.gmail.com>
Subject: Re: [PATCH] docs/devel: add doc about device life cycles
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Fri, 22 Apr 2022 at 15:29, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Document the 3 life cycles cases that can happen with devices.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Firstly, sorry it's taken me two months to get to this patch.
The underlying reason for this is that I'm not myself 100%
certain about how the QOM/qdev device lifecycle works and what
things should go in what lifecycle methods, so I didn't really
feel very confident about reviewing it...

To start with, I think we should definitely have some documentation
for this, and I like the structure you have here with:
 (1) the various ways devices are created and deleted
 (2) what the corresponding lifecycles are in terms of which
     methods get called
 (3) the concrete consequences for what a device should and
     should not do in each method

I'll try to get into some more detailed review below.

> diff --git a/docs/devel/device.rst b/docs/devel/device.rst
> new file mode 100644
> index 0000000000..80e3016e80
> --- /dev/null
> +++ b/docs/devel/device.rst

I think we should name the file device-lifecycle.rst -- we're
(hopefully) going to accumulate a bunch of documentation on devices
generally and we don't want it all to end up in this one file.

> @@ -0,0 +1,111 @@
> +QEMU device life-cycle
> +======================
> +
> +This document details the specifics of devices.
> +
> +Devices can be created in two ways: either internally by code or through a
> +user interface:
> +
> ++ command line interface provides ``-device`` option
> ++ QAPI interface provides ``device_add`` command

I think this bulleted list should list all the ways that devices
get created (and destroyed), so:

 Devices can be created in several ways:
  + programmatically, by the C code that implements board and SoC models
  + on the command line, via the -device option
  + via the QMP and HMP device_add monitor commands
  + temporarily as part of the introspection of device objects
    when the user asks for help on a device type or about what
    properties it implements
 In some cases, devices will also be destroyed:
  + if a device is hot-unpluggable then after an 'unplug' it will
    be destroyed
  + the temporary objects created for introspection are destroyed
    after they have been examined

 To do this, devices must implement at least some of these methods
 which are present on all QOM objects:
  + instance_init
  + instance_post_init
  + unparent
  + instance_finalize
 and these which are specific to devices:
  + realize
  + unrealize

 These methods will be called in fixed sequences by QEMU core code
 as the device is created, used, and destroyed. These sequences form
 the lifecycle of a device object. Understanding the possible
 lifecycles helps in working out which methods you need to implement
 and what code belongs in what method.


> +
> +Error handling is most important for the user interfaces. Internal code is
> +generally designed so that errors do not happen and if some happen, the error
> +is probably fatal (and QEMU will exit or abort).
> +
> +Devices are a particular type of QEMU objects. In addition of the
> +``instance_init``, ``instance_post_init``, ``unparent`` and
> +``instance_finalize`` methods (common to all QOM objects), they have the
> +additional methods:
> +
> ++ ``realize``
> ++ ``unrealize``
> +
> +In the following we will ignore ``instance_post_init`` and consider is
> +associated with ``instance_init``.
> +
> +``realize`` is the only method that can fail. In that case it should
> +return an adequate error. Some devices does not do this and should
> +not be created by means of user interfaces.

I don't think we really need to say that some of our device implementations
are buggy code :-)

> +
> +Device succesfully realized
> +---------------------------
> +
> +The normal use case for device is the following:
> +
> +1. ``instance_init``

   N. The device is configured by setting its QOM properties.

> +2. ``realize`` with success
> +3. The device takes part in emulation
> +4. ``unrealize`` and ``unparent``
> +5. ``instance_finalize``
> +
> +``instance_init`` and ``realize`` are part of the device creation procedure, whereas
> +``unrealize`` and ``instance_finalize`` are part of the device deletion procedure.

We should describe here what the difference is.

> +
> +In case of an object created by code, ``realize`` has to be done explicitly
> +(eg: by calling ``qdev_realize(...)``). This is done automatically in case of a
> +device created via a user interface.
> +
> +On the other hand ``unrealize`` is done automatically.
> +``unparent`` will take care of unrealizing the device then undoing any bus
> +relationships (children and parent).

This (realize is done by calling qdev_realize, unrealize happens via unparent)
is part of how you use a device, not how you implement one. We might want
to document that, but that should be a separate document. Let's keep this one
to how the system looks from the point of view of a device implementation.

> +Note that ``instance_finalize`` may not occur just after ``unrealize`` because
> +other objects than the parent can hold references to a device. It may even not
> +happen at all if a reference is never released.
> +
> +Device realize failure
> +----------------------
> +
> +This use case is most important when the device is created through a user
> +interface. The user might for example invalid properties and in that case

"set invalid properties", I guess.

> +realize will fail and the device should then be deleted.
> +
> +1. ``instance_init``
> +2. ``realize`` failure
> +3. ``unparent``
> +4. ``instance_finalize``
> +
> +Failure to create a device should not leave traces. The emulation state after
> +that should be as if the device has not be created. ``realize`` and
> +``instance_finalize`` must take care of this.
> +
> +Device help
> +-----------

Call this "Device introspection" I think.

> +
> +Last use case is only a user interface case. When requesting help about a device
> +type, the following life cycle exists:
> +
> +1. ``instance_init``
> +2. Introspect device properties
> +3. ``unparent``
> +4. ``instance_finalize``
> +
> +This use case is simple but it means that ``instance_finalize`` cannot assume that
> +``realize`` has been called.
> +
> +Implementation consequences
> +---------------------------
> +
> +A device developer should ensure the above use cases are
> +supported so that the device is *user-creatable*.

Do we want to document the current requirements (every device has to
support the 'device introspection' cycle, hot pluggable/unpluggable
devices have to support full creation-and-deletion, devices that are
only cold-plugged or created by board models must support creation but
may not care about deletion), or some hypothetical hoped-for future
where the baseline for all devices is that they support the full
create-and-delete?

> +
> +In particular, fail cases must checked in realize and reported using the error
> +parameter. One should particularly take care of cleaning correctly whatever has
> +been previously done if realize fails. Cleaning tasks (eg: memory freeing) can
> +be done in ``realize`` or ``instance_finalize`` as they will be called in a row by
> +the user interface.
> +
> +To this end ``realize`` must ensure than no additional reference to the device is
> +dangling when it fails. Otherwise the device will never be finalized and deleted.
> +
> +If a device has created some children, they should be deleted as well in the
> +cleaning process. If ``object_initialize_child()`` was used to create a child
> +hosted into the device structure, the child memory space will disappear with the
> +parent. No reference to such child must be dangling to ensure the child will
> +not survive its parent deletion.
> +
> +Although it is not asserted by code, one can assume ``realize`` will not be tried
> +again in case of failure and that the device will be finalized if no references
> +have been added during ``realize``.

I'm not sure what exactly this paragraph is trying to say. If our lifecycle
design says "realize only happens once" we can just document that that's
what the design is. We don't need to say whether or not something will assert().

I think there is scope for extending this last 'consequences' section to
be the place where we clearly say "Do X in instance_init; do Y in realize"
(possibly with annotations about whether nay particular case of that is
necessary or just convention).

-- PMM

