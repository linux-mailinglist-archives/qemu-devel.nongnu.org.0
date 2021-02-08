Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02826313B06
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:34:55 +0100 (CET)
Received: from localhost ([::1]:58338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AR3-0006mw-Us
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l93lW-0005dg-KN
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:27:35 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l93lG-0001ho-KK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:27:29 -0500
Received: by mail-ed1-x534.google.com with SMTP id y8so17417513ede.6
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 02:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hFx+wOTDcNVjbhGQu+yUzGxUhMkwCgrOP6VvbKH1Thw=;
 b=uZFomgLwoL87yFgbPOrFUZR315zVM3KPtsJGoMQFNNmMy9xaAmoCexv7yzt/rUxql6
 j1dv9M5RifU38o3L7uCfG3KQeDdfLir8Ti8vpEkMgXEDk4SKPHx/NJlMurqYX3Cf71oJ
 6YZziE0vBd66jT6pG5dQNBUyiOzuW+y6RlOQ4qOrRCtB/37gTKL8wn4KsSF0UpER7VD3
 m5LeaJECNTO1QMs8rEuE+Aa6BnucPJm5xhGe4neHazzT6ywa3dKNDJE5jdbcxzzd7eGL
 q4QbbhJdF4daWVk7chSuvgGKT/cQb4jt+531mfvaOx1JpBjyDAbbzLn3xbO3/vc4kkrE
 /75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hFx+wOTDcNVjbhGQu+yUzGxUhMkwCgrOP6VvbKH1Thw=;
 b=Wka9Nu6Gj9bFR7hmRFSi8/sLd+9113V2bzBH+iiMuc/lxIvr/nDz+52wAc3i6/jSuZ
 TOULLNo9iBrDF8qwwR5fgylEilzhOTU/ss1eFdxi2DXrHmh7rQBAzfx51Ly55/q8KQm5
 diTv/KMx9P5ytR0IZbdgNllQh2LAk90jm9S9tUAlOUUCGzJS7yKqFjuM2s9ZuwHlGwxd
 Exc03YRhdaXzUg+hF9qFdV5fIFtfLj75K54T9AoLw6/5L4DjjBvIPojGKt2q0/hAOJQp
 XwPomAYV6F9/9JwYKKA6ICPzJ+iP9AhFaZwfv+pHIVN2n8Ef0QUphgS+6PRfgClmhIhB
 z5KA==
X-Gm-Message-State: AOAM533kqXnCDyb6D2a0zQ53O3MKEYPIRKn2V93d/lKP2z/FcQ/roNZG
 hc0wKk/kQu3YD8YYhS4nUk25zncahwW/o7yvhW2IwQ==
X-Google-Smtp-Source: ABdhPJwIyeEKnkjFGcT7knw+T8tq/rjHzE9RTw7HSTIqcDGez1ukrGejOJh+7ez4m5SVSAHRtkHxAaQdXs3CowEfKCU=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr7787498edx.36.1612780035055; 
 Mon, 08 Feb 2021 02:27:15 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8=vG-2Vzrdark8VC5NANe5Fb3qGTpSFk8X94KvXszTbA@mail.gmail.com>
 <c98d4f43-5a29-afcc-fe7d-a3d92063df3a@redhat.com>
In-Reply-To: <c98d4f43-5a29-afcc-fe7d-a3d92063df3a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 10:27:03 +0000
Message-ID: <CAFEAcA8q1ewJ4F-pijt81Qc_rO0xNpy6jJY2DrW0ggTzg27aEQ@mail.gmail.com>
Subject: Re: getting the console output for s390 cdrom-test?
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 at 16:08, Thomas Huth <thuth@redhat.com> wrote:
>
> On 22/01/2021 21.32, Peter Maydell wrote:
> > Hi; I've been looking at why the s390 cdrom test has an intermittent
> > failure on my aarch64 box. Looking at some TCG debug log output
> > I think what is happening is that sometimes execution diverges from
> > a successful run inside virtio_scsi_setup() and we end up failing
> > a vs_assert(), which triggers a "Guest crashed on cpu 0: disabled-wait"
> > which then makes the qtest hang until its timeout.
> >
> > I think that vs_assert() ought to be printing some information
> > to the console about which assert fails when it happens, but
> > how do I need to tweak the qtest to get it to capture this
> > console log somewhere?
>
>   Hi!
>
> Sorry for the late reply ... did you get any further with this already?

No, I've been mostly working on other stuff. Thanks for the instructions
on how to capture stdio. This is what a success looks like:

LOADPARM=[        ]
Using virtio-scsi.
Warning: Could not locate a usable virtio-scsi device
Using virtio-blk.
Using guessed DASD geometry.
Using ECKD scheme (block size  4096), CDL
No zIPL section in IPL2 record.
zIPL load failed.
Using virtio-blk.
ISO boot image size verified

And this is a failure:

LOADPARM=[        ]
Using virtio-scsi.
target: 0x0000000000000094

! SCSI cannot report LUNs: response VS RESP=09 !

> A Heisen-bug ... ugh ... but I wonder whether it's maybe rather an issue in
> the aarch64 TCG backend, since we've never seen this on other architectures
> before?

Certainly possible; but I would tend to expect TCG backend issues
to be consistently reproducible, not intermittent like this one.

thanks
-- PMM

