Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721205D730
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 21:49:41 +0200 (CEST)
Received: from localhost ([::1]:56738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiOma-0001Np-Me
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 15:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33242)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hiNdz-0006tX-NJ
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 14:36:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hiNdx-0001de-9g
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 14:36:43 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:42100)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hiNdv-0001IT-4R
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 14:36:41 -0400
Received: by mail-oi1-x232.google.com with SMTP id s184so13919487oie.9
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2019 11:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ow3MJh325SbNuuL1Un+IJ50dcu9AxKzZwxmCVd5EudY=;
 b=n5eA1MnY55kWEc8c4ruIJHKrLa4dPFYYd01mKpMzJGLlIoDm7LFLul3VTOgZWU/8/I
 y5N9p+fXZ/cBMRmBVAZQ5t7qJMNPOO6Glk8D/AB2SpwHd7951ldOsrZs43CXiGNKWdRb
 Q/CeatBUZx5sEjLCMNwFiUqh9Ok9GuO7elrSY0uSQf9P61WxOumwFEb4p3wXEA06NwrF
 pKsVnJxMz1AuRssatIf6lyusCLm28tI/A1/eQyv1XSfjrBaMilZQ0FH+uTiZImLhxjU8
 HwlZO0G+13wfrp9fEqPrIGs8aTdkkBpE3JsBZNQdFeXL2fYNRJIkZSIKYSzWWJQG/NZn
 QHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ow3MJh325SbNuuL1Un+IJ50dcu9AxKzZwxmCVd5EudY=;
 b=jUYd1MLAkIMKJNArXKzvIurZe90wsOdQGNCz/prDaqkOZr/30D+Or3fIV3lD5kk/aP
 sJ9yerrxhdsbdgeSrXmGRv0Um4QZ+ebp+/Ps5dA8fketdqsInbUl4lC1m00rhA/QNvRV
 T3C04143jVw02kCsJMW6iMAh8Zr5u8I8OmXnMBvJQhDWdvp3b0a4p7I3hESPJsorJUBN
 G3byAWv+vJqPgmmyWbyWwCLQRZj4BczfmoLCpwPe4+cRVslAjR7emKQ/GCyxj72eVPct
 2O7kSy/GKa9oERYehU5tJOM/EY1grqr78qN8bei0GQQ07PtIbSJga42BnmSGi5VBVrwo
 6gow==
X-Gm-Message-State: APjAAAUjPBX6ySNf3prWdJUpMcViMOFx7dAqlO/MRt8JSVSrjA7BDM48
 Sng0bm0ytV/gP6Oky34kdpgc1mNw0wdqtutcFAjVZA==
X-Google-Smtp-Source: APXvYqxv6NM/n7H5jpgKvJoWMT5Gk2+HG7C0KThSDZWVOHYvlcAV493Mlu6QY57mh8Di2SlIxCkESeiRibSwDDjOSI0=
X-Received: by 2002:a05:6808:d4:: with SMTP id
 t20mr4105055oic.170.1562092582893; 
 Tue, 02 Jul 2019 11:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190701111722.32068-1-cohuck@redhat.com>
 <20190701111722.32068-5-cohuck@redhat.com>
In-Reply-To: <20190701111722.32068-5-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jul 2019 19:36:12 +0100
Message-ID: <CAFEAcA-3XBMac8R=m80KaE6kbnrfBjk=qQ6YPDnuWinh=Mi3Yg@mail.gmail.com>
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::232
Subject: Re: [Qemu-devel] [PULL 4/6] vfio-ccw: use vfio_set_irq_signaling
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
Cc: Eric Farman <farman@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Jul 2019 at 12:17, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Use the new helper.
>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Eric Farman <farman@linux.ibm.com>
> Message-Id: <20190617101036.4087-1-cohuck@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Coverity complains about this patch (CID 1402783), though
it's arguably a bit of a false-positive.

> +    if (vfio_set_irq_signaling(vdev, VFIO_CCW_IO_IRQ_INDEX, 0,
> +                               VFIO_IRQ_SET_ACTION_TRIGGER, fd, errp)) {
> +        qemu_set_fd_handler(fd, NULL, NULL, vcdev);
>          event_notifier_cleanup(&vcdev->io_notifier);
>      }

Here we check "did vfio_set_irq_signaling() fail" by looking
at its return value...

>
> -    g_free(irq_set);
> -
>  out_free_info:
>      g_free(irq_info);
>  }
>
>  static void vfio_ccw_unregister_io_notifier(VFIOCCWDevice *vcdev)
>  {
> -    struct vfio_irq_set *irq_set;
> -    size_t argsz;
> -    int32_t *pfd;
> -
> -    argsz = sizeof(*irq_set) + sizeof(*pfd);
> -    irq_set = g_malloc0(argsz);
> -    irq_set->argsz = argsz;
> -    irq_set->flags = VFIO_IRQ_SET_DATA_EVENTFD |
> -                     VFIO_IRQ_SET_ACTION_TRIGGER;
> -    irq_set->index = VFIO_CCW_IO_IRQ_INDEX;
> -    irq_set->start = 0;
> -    irq_set->count = 1;
> -    pfd = (int32_t *) &irq_set->data;
> -    *pfd = -1;
> -
> -    if (ioctl(vcdev->vdev.fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
> -        error_report("vfio: Failed to de-assign device io fd: %m");
> +    Error *err = NULL;
> +
> +    vfio_set_irq_signaling(&vcdev->vdev, VFIO_CCW_IO_IRQ_INDEX, 0,
> +                           VFIO_IRQ_SET_ACTION_TRIGGER, -1, &err);
> +    if (err) {
> +        error_reportf_err(err, VFIO_MSG_PREFIX, vcdev->vdev.name);
>      }

...but here we look at the err parameter. This makes Coverity
unhappy because its heuristic says "we check the return value
from the function 8 times out of 10 so it's probably a bug
that we don't do that here". We could make it happy by using
the same way of checking for failure in both cases.

thanks
-- PMM

