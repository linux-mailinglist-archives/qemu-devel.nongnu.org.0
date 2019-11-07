Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2781BF2DF7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 13:12:19 +0100 (CET)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSgeA-0003fC-38
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 07:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1iSgd2-00036x-Op
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 07:11:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1iSgcz-0006zj-IO
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 07:11:07 -0500
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43]:36298)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1iSgcz-0006xI-EW
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 07:11:05 -0500
Received: by mail-qv1-xf43.google.com with SMTP id f12so679724qvu.3
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 04:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BKA8s1JfODN4WpwTCWOwtgTT+YzZkjzLVM4z9feXflo=;
 b=EKVQuk55NqGEBZhbV8BVxDQYjsoT81dzTmsRxPY6wkvHgR2201EEbrXM/f+4dt4b8x
 MPP/nzcAMrp6SuDo7mbSGX+LcQXh9/pd9oETm1jFw8TBDLojxjDHClV4PYzZjrVoAfzl
 csCkA+bh69AXVz2hqudiqDmMhOKR2EP2/zDBezyvS6xwXVvU6VeH4m5JKswsrvrFK8bR
 HmHUt1XUt7m8iCpGV+8+6/RH8ExPqoITwjlgKh04ScfyEKG2NEHwTyUI4FssxUMUdT+M
 pM9jt1TEN20IHzkT063k8iwpbZp2J6R173q2JvMGx6Bb28lCQmAMELV9z9q/3QBIxOjF
 EIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BKA8s1JfODN4WpwTCWOwtgTT+YzZkjzLVM4z9feXflo=;
 b=dsQtDfGowpktNkC/Zt92JbSzl2sbd3i51R0CxZjgRuOcN3ayUJG6g7zNO75QZPkgJ2
 +BIftWeY6JT/MmQTQXWUTJR/wSpVmoaHPz+0MtsWlK6hCR/cULi0T8d3gGkFe1kkot38
 afTSqgoB4M8OFsq3ejLrUqQEYapCIh09fFFYaLZ9PTVoRXUc+brYYvGU73jLUlI09ZH6
 ucPehKNaA/NkLc1VSxm7QNiD9/AiX9AFDpR476WWSdwhCCaaGZcpeGvOVO4OSLIF0CEb
 U7lBGzL1ZBu/f31p5TdlUGvGEo8loh9/NyoEyQzjyw8aybS8wfIHIwcdrWKSKUtTj6DN
 1OVQ==
X-Gm-Message-State: APjAAAWZTdKLIoovzIQ/R3zurHQEPxlAJ6MV4YIX5q+eWTeMYJFa7Q9S
 77KlFll+Kp9TdhOjdI0K6Fejz+xFzLTj+TzUBKg=
X-Google-Smtp-Source: APXvYqzsPlvpOUDn7EkcGf9rJWzzK0UmVSKgbkHC5ep6B4ucYn8RQygbhppA26x9x2LAw1qeWeDvK70JS85dMoOF3WQ=
X-Received: by 2002:a0c:87b5:: with SMTP id 50mr3064636qvj.143.1573128663596; 
 Thu, 07 Nov 2019 04:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain>
 <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
 <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org>
In-Reply-To: <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 7 Nov 2019 13:10:52 +0100
Message-ID: <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
Subject: Re: guest / host buffer sharing ...
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f43
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
Cc: geoff@hostfission.com, virtio-dev@lists.oasis-open.org,
 Alex Lau <alexlau@chromium.org>, Alexandre Courbot <acourbot@chromium.org>,
 qemu-devel <qemu-devel@nongnu.org>, Tomasz Figa <tfiga@chromium.org>,
 Keiichi Watanabe <keiichiw@chromium.org>,
 David Stevens <stevensd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 Dylan Reid <dgreid@chromium.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Dmitry Morozov <dmitry.morozov@opensynergy.com>,
 Pawel Osciak <posciak@chromium.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 6, 2019 at 1:50 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > In the graphics buffer sharing use case, how does the other side
> > determine how to interpret this data?
>
> The idea is to have free form properties (name=value, with value being
> a string) for that kind of metadata.
>
> > Shouldn't there be a VIRTIO
> > device spec for the messaging so compatible implementations can be
> > written by others?
>
> Adding a list of common properties to the spec certainly makes sense,
> so everybody uses the same names.  Adding struct-ed properties for
> common use cases might be useful too.

Why not define VIRTIO devices for wayland and friends?

This new device exposes buffer sharing plus properties - effectively a
new device model nested inside VIRTIO.  The VIRTIO device model has
the necessary primitives to solve the buffer sharing problem so I'm
struggling to see the purpose of this new device.

Custom/niche applications that do not wish to standardize their device
type can maintain out-of-tree VIRTIO devices.  Both kernel and
userspace drivers can be written for the device and there is already
VIRTIO driver code that can be reused.  They have access to the full
VIRTIO device model, including feature negotiation and configuration
space.

Stefan

