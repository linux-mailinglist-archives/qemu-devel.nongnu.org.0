Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BC5346DA2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:59:50 +0100 (CET)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOq05-0000iF-GE
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOpyo-00089E-Qx
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:58:30 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOpyl-0005yC-Q3
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:58:30 -0400
Received: by mail-ej1-x62b.google.com with SMTP id r12so29785880ejr.5
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 15:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=700VG809tO+QXnuKGpCvb8xGCKQ/ebYKoWYCFs1VT0U=;
 b=SDl+6R3nuDFY1k9FA3cICUtK2Q8oxjpE7dxaf5OA9X+cZAr7f49roqp2ubD66oml7I
 ORHBlrSrz00pbYHZoRzX/zShjFb5UEfoU5xIr2ujWrb2P8M5d+J3ldeKNM11o4FoQ0fq
 gFrSGK+h2pufbsTW12GFks3PD7/M/wCVzyH78WUGTyvpfVRf8KI1Pnw5rAlx5J0f1ZQI
 nIyO/rzh0bwR8PGmVpS1aHs4+I1gYjH+cm9Klzz4BMqVnT7Ly0jaRUp27RkJBOWjyfT7
 6ZZ6WlwGiZhUnt2rB0eWerwF/Ko7vDN8wVvpCiK3txRiBACQCRQ06mQ8Y/e/Q5XAtff4
 qsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=700VG809tO+QXnuKGpCvb8xGCKQ/ebYKoWYCFs1VT0U=;
 b=JHHvp4lGPxDDOUMGypo2mbRH/wfJp9px7Br0HM0bosqeSzzAdIe6za1YABC4Qlhp1X
 ojstgZNTE1CdMNZabOX/4XjwueF1eoNKLvNNqUTscUt8bKBsmVtGnEI5ez29BqZx+FuL
 8cpwTcpJj2QzeSteuF6fQ0Wakp7dL8QM76fjYa71ayHTB+atn4S+Fs9EfMsyDVG9hcl5
 AxbqZEZMIWrNCUSAaPaJP6FvQraEeP+qtGDYmSfaAXy2tSqSGQnpMG1AvhznE6cunIBL
 k8TNAVyjv36oLYol+F/t3F7tt/KjOOCWvdP/J3gUUkqyn5z6n6vrL4YAFubv1GLSr1uO
 82Aw==
X-Gm-Message-State: AOAM531A25yfZUAs48Gf0SrqJmPahPSdQU5OZP8k8V9zMaVrLx2QTupo
 qVaG3k8HNGSdZyx+wba3I1ayqK1s2nUBgPYwnZpMXA==
X-Google-Smtp-Source: ABdhPJzC9O2BobPs1EzsA/O6d+e8HIpZfL+Ppr1EFI+6XarlHnrKWaz3DUyZqeEoDx3O+jnbFsQI/kTY5n3fgoHeCKw=
X-Received: by 2002:a17:906:1dd3:: with SMTP id v19mr528131ejh.4.1616540306068; 
 Tue, 23 Mar 2021 15:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
 <72851037-b283-c4c1-fbeb-da86f0527627@ilande.co.uk>
In-Reply-To: <72851037-b283-c4c1-fbeb-da86f0527627@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 22:57:56 +0000
Message-ID: <CAFEAcA-8M7PKiM9tOXuVKMwMRF6Q02FbyQbU-P60wQqgcedrKg@mail.gmail.com>
Subject: Re: Crashes with qemu-system-ppc64
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 at 21:21, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
> I'm not sure what the right solution is here. In my mind there hasn't really been any
> difference between TYPE_DEVICE and TYPE_SYS_BUS_DEVICE other than the APIs that
> expose the memory regions and IRQs are different, but clearly platform bus
> expects/defines a different behaviour here.
>
> Probably the quickest solution for now would be to change the DBDMA device so that it
> is derived from TYPE_DEVICE rather than TYPE_SYS_BUS_DEVICE and make the relevant
> changes if everyone agrees?

You want to be at least cautious about doing that. TYPE_DEVICE objects
don't get reset usually, because they are not part of the qbus hierarchy
(all TYPE_SYS_BUS_DEVICE devices live on the sysbus and get reset when
the sysbus is reset). So you would need the (currently nonexistent)
reset function of the containing macio device to manually reset any
TYPE_DEVICE children it has. (This is one of the areas where reset is
a mess, incidentally: logically speaking if you have a PCI device then
you want its children to all get reset when the PCI device itself is
reset; as it stands that doesn't happen, because its sysbus children
are on the sysbus, and a pci-bus-reset won't touch them.)

I forget how the platform bus stuff is supposed to work, but something
should be arranging that it only happens for a pretty restrictive subset
of devices -- in general it should certainly not be firing for random
sysbus devices that are part of something else.

It's a pretty old commit (from 2018, one of Igor's), but I wonder if
this was broken by commit a3fc8396352e945f9. The original design of
the platform bus was that the "grab unassigned IRQs and MMIO regions"
hook got run as a machine-init-done hook. That meant that by definition
the board code had finished setting up all its sysbus devices, and
anything still unconnected must be (assuming not a bug) something the
user requested via -device to be put on the platform bus. But in
commit a3fc8396352e945f9 we changed this to use the hotplug-handler
callbacks, which happen when the device is realized. So it stopped
being true that we would only find loose MMIOs and IRQs on the user's
sysbus devices and now we're also incorrectly grabbing parts of
devices that are supposed to be being wired up by QEMU code before
that code has a chance to do that wiring.

There must still be something causing this not to happen literally for
every sysbus device, or we'd have noticed a lot earlier. I'm not sure
what's specifically different here, but I think it is that:
 (1) we only create the platform bus itself as pretty much the
     last thing we do in machine init. This (accidentally?)
     means it doesn't get to see most of the sysbus devices in
     the board itself
 (2) macio-oldworld is a pluggable PCI device which happens to
     use a sysbus device as part of its implementation, which
     is probably not very common

I think the long term fix is that we either need to undo
a3fc8396352e945f9 so that we only run after all other device
creation code has run and the unassigned IRQs and MMIOs really
are just the loose ends, or alternatively we need to make the
hooks much more restrictive about identifying what devices are
supposed to go into the platform bus.

Second note: does it actually make sense for a user to create
a macio-oldworld device and plug it into anything? It's a PCI
device, but is it really a generally usable device rather than
a specific built-into-the-board part of the g3beige machine ?
If it isn't actually useful for a user to create it on the command
line with -device, we could sidestep the whole thing for 6.0 by
marking it dc->user_creatable = false ...

thanks
-- PMM

