Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF1B122C70
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 14:00:42 +0100 (CET)
Received: from localhost ([::1]:40160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihCSv-0007TB-Hq
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 08:00:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stevensd@chromium.org>) id 1ihCRy-0006zh-Me
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 07:59:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stevensd@chromium.org>) id 1ihCRx-0008ST-NQ
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 07:59:42 -0500
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:47008)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stevensd@chromium.org>)
 id 1ihCRx-0008RO-Hw
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 07:59:41 -0500
Received: by mail-qk1-x742.google.com with SMTP id r14so7700408qke.13
 for <qemu-devel@nongnu.org>; Tue, 17 Dec 2019 04:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4bZpGkKAkvfd+jX4DG0vMQ2qfrG6ll9qDalxUKn1b3E=;
 b=YMCJELu631QRNTqwkjAcCOyFtrMLDTS5TMyx6OvxxAkDtKxhgfrna//TtU2raSRNzY
 gwQWOfT1HpZvRZBEsApA0YfgTjyjxYUXxUx9xKZoFDLhlO3noHCZIPQyYpJgt+zfy9qr
 aPs71Gjd0r2qzgILwvNDn4unYX33ibUDXggyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4bZpGkKAkvfd+jX4DG0vMQ2qfrG6ll9qDalxUKn1b3E=;
 b=moieLioJxpoBFXQsdvwMUEB3nxzCqDGoJV77P2DhHFw8SUxt7+oJW72zNS1el4FY/B
 dX1Qe+2wdXX61DPLLL4+qL47cCF6KaIEYXSJujWD4tBc7XiGH839Usm6jtTLPKwGunkg
 1H9+PFvgFgv4KEtO6eU1jpp1LdRvLNNIOPaHeqSf4JFziEKwnlrAMV0XNLN+0iHr+qDm
 yMMZlY544qw+XOHec7UYlLGvdAn6H49xon/uFBRMUqetmfSL1V0AYQfGUaZK1XdGjFPg
 JZG8Gl/qk5/rpEFQWrbz7hUjBphPgJvrT3ZcwnrCdbHUAM2towHvkQ8Ku5Lxjmoo/RcB
 Hmag==
X-Gm-Message-State: APjAAAXh8yLqzBuxXaOA0gytr0ZETDGlv+HOr+qyEqQnMLeFlJ9lJtst
 BCGKZsC0+RwVvtwsl7vrJb8UabosKWvieFQwm85ltg==
X-Google-Smtp-Source: APXvYqyb1xxZ9FokZNGah/UIpAaFRfxJfgV4qwKVLTBXmZOACLUgrXPPiNzDxSLuRgoM0J8lMuMLN3unMTrUaERb+JU=
X-Received: by 2002:a05:620a:910:: with SMTP id
 v16mr4862526qkv.194.1576587580491; 
 Tue, 17 Dec 2019 04:59:40 -0800 (PST)
MIME-Version: 1.0
References: <d65bec5074eda5f389668e28922c1609@hostfission.com>
 <CAAFQd5AWqYaNWfYQ2hepjg7OD8y8ehHn0guusAR8JYefc+BNaw@mail.gmail.com>
 <CAEUnVG77y2DrV5kLTHDy1xio+yzMGv9j=M0c4388vH_LUaiXLg@mail.gmail.com>
 <CAD=HUj40Jb2cy8EP=24coO-CPUvq6ib+01bvXHn1G9GD8KuenA@mail.gmail.com>
 <20191211092625.jzqx2ukphhggwavo@sirius.home.kraxel.org>
 <CAD=HUj7d3SWqCH=57ymy-BVd6xdJWc=WSqHAFyQXt-3MjchEAA@mail.gmail.com>
 <20191212094121.by7w7fywlzdfoktn@sirius.home.kraxel.org>
 <CAD=HUj6YYupjdxxz2mgMmE2DcKhXP-qdhRORvUNTmzcORRrLzg@mail.gmail.com>
 <20191212133048.4nbmuwhbq5z2ai6o@sirius.home.kraxel.org>
 <CAD=HUj623MyeZ7VmrYTfig9oiyNhipidpvhuuurs3VgGBgjZpQ@mail.gmail.com>
 <20191216134728.czulyb6yvrkokrqv@sirius.home.kraxel.org>
In-Reply-To: <20191216134728.czulyb6yvrkokrqv@sirius.home.kraxel.org>
From: David Stevens <stevensd@chromium.org>
Date: Tue, 17 Dec 2019 21:59:29 +0900
Message-ID: <CAD=HUj4us6_cEv40EVRLd5K5cGW7GsN10EFWifmog-pq9_RC8Q@mail.gmail.com>
Subject: Re: [virtio-dev] Re: guest / host buffer sharing ...
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
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
Cc: Geoffrey McRae <geoff@hostfission.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Zach Reizner <zachr@chromium.org>, Alexandre Courbot <acourbot@chromium.org>,
 virtio-dev@lists.oasis-open.org, qemu-devel <qemu-devel@nongnu.org>,
 Alex Lau <alexlau@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
 Keiichi Watanabe <keiichiw@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 Dylan Reid <dgreid@chromium.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Dmitry Morozov <dmitry.morozov@opensynergy.com>,
 Pawel Osciak <posciak@chromium.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > > Of course only virtio drivers would try step (2), other drivers (when
> > > sharing buffers between intel gvt device and virtio-gpu for example)
> > > would go straight to (3).
> >
> > For virtio-gpu as it is today, it's not clear to me that they're
> > equivalent. As I read it, the virtio-gpu spec makes a distinction
> > between the guest memory and the host resource. If virtio-gpu is
> > communicating with non-virtio devices, then obviously you'd just be
> > working with guest memory. But if it's communicating with another
> > virtio device, then there are potentially distinct guest and host
> > buffers that could be used. The spec shouldn't leave any room for
> > ambiguity as to how this distinction is handled.
>
> Yep.  It should be the host side buffer.

I agree that it should be the host side buffer. I just want to make
sure that the meaning of 'import' is clear, and to establish the fact
that importing a buffer by uuid is not necessarily the same thing as
creating a new buffer in a different device from the same sglist (for
example, sharing a guest sglist might require more flushes).

-David

