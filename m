Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A56A84F34
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 16:55:10 +0200 (CEST)
Received: from localhost ([::1]:42140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvNLJ-0006Wo-Cx
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 10:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45937)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNKf-0005oU-NM
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 10:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNKe-0002Lc-I8
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 10:54:29 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40267)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvNKe-0002L2-Ce
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 10:54:28 -0400
Received: by mail-ot1-x342.google.com with SMTP id l15so48157853oth.7
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQlSHR/U9j1ba3vM8/+lHn5288KTWqRCzbe8FSYgNqI=;
 b=OLa1kq5UQPM+B7AynEJLkel/GGLoRaxLCe35doii/kF6gsPcV1FUZkY46N0FGLd6F+
 Jjdw1srkzFJ+Hh6SBWimnPNYQrHq6YaWYoEnJbLSlmtwuBeCtOckXUMyNwcmbStPxp+t
 RAI63y5dJmYlAzpYVuW6MtgefB7YuysoiOsAaCu1IrtBxjJdApBHGTOsw9uRzm/4pgaE
 H6CtGwyVGR0p9C/hug1Mf7zHmCXMHmoclRSoBra2nG0PvIxfUjs9yX2c4LqNQmJ/kcgP
 asHcxUq9gU6BS3tNjs2dEoXf2VXiNvferauevg19M3vxpzd5l9HiWvRLo94cuadBcdHq
 3J9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQlSHR/U9j1ba3vM8/+lHn5288KTWqRCzbe8FSYgNqI=;
 b=IOIVRXoq3PV3Cgaugoq1wjlnWEy8HMxMIF2YWTEw8s9xXmRg4kFwaovTyECTIuA6uc
 ksWXOGS0HT3NuoQ0qXnKyEszdOz4VCpHJI68lQT1/7PYCdrxIXyv4p/YY9Jb44VdJABe
 4wILsMV3ZZsFjb9TPIVrFeAEwXbGwJFwt3p55i4OHz/FPTLd6TYAYxkXch/pvR3QjLAJ
 FSHTBEK+2TbBLApfeQ7WUucgH2DokXdU6sN/TieGadMdTtAEcbFJbKDJAIeD4Vk4r/6j
 ufEPRptAEML5A2e705bkdrMHPF0GLT6FapN/B1IrI3paxS+BrW4lZ+W0fekA0cHEwqXj
 ME0Q==
X-Gm-Message-State: APjAAAXCJok3GrBjuKSukP+6GysJKpWXtnLXcgD+UK2K66e3J55mILTv
 ciyq2vyi/PGTojkNjsozredr87jg8CI5+YiuxppMDg==
X-Google-Smtp-Source: APXvYqwrcIDTR5AmcleadMT7kko/6Dwtnl+uKo+a2hk9sA+IJ2/U0tv3zk4eJGIJpfjFniet0iFS4r9Bd1Uj6rR1EbM=
X-Received: by 2002:a05:6830:1653:: with SMTP id
 h19mr8591931otr.232.1565189667703; 
 Wed, 07 Aug 2019 07:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-7-damien.hedde@greensocs.com>
In-Reply-To: <20190729145654.14644-7-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 15:54:16 +0100
Message-ID: <CAFEAcA_PdOUTFAHBWxEvWLa1oP0BCMNs1zBJo-DV3OjrMLpPkA@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v3 06/33] add the vmstate description for
 device reset state
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Jul 2019 at 15:58, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> It contains the resetting counter and cold flag status.
>
> At this point, migration of bus reset related state (counter and cold/warm
> flag) is handled by parent device. This done using the post_load
> function in the vmsd subsection.
>
> This is last point allow to add an initial support of migration with part of
> qdev/qbus tree in reset state under the following condition:
> + time-lasting reset are asserted on Device only
>
> Note that if this condition is not respected, migration will succeed and
> no failure will occurs. The only impact is that the resetting counter
> of a bus may lower afer a migration.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>


> +const struct VMStateDescription device_vmstate_reset = {
> +    .name = "device_reset",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .needed = device_vmstate_reset_needed,
> +    .post_load = device_vmstate_reset_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(resetting, DeviceState),
> +        VMSTATE_BOOL(reset_is_cold, DeviceState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> -

Forgot to ask -- why don't we migrate the hold_needed flags?

thanks
-- PMM

