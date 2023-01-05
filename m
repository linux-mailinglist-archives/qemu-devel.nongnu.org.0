Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212FE65F580
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:06:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDXQI-0007Mk-OW; Thu, 05 Jan 2023 16:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDXPw-0007GI-DK
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:04:57 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDXPu-0008Bo-Mn
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:04:52 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so3219669pjk.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qPiP3Ts0DBAWErWMEC4RLT6d8PuqjKi+0FQ8gfHr7tc=;
 b=Bljl6vkcj9IOVRAAObuFkmkoIS5mXwAHux+og86Z69tKWmcbWqIQA1uqzWcMHYB1oN
 EsSPtTDjGD0b88K/jaQMvRtVaRZAatCaMUC2XLn2st7LiT+li/69gmH1dTks0WwKtFG1
 iNipGELnP05Y7JjuhoNctLXHaK4hEuVAJlCoAdLYytSCSQOp1MDvj4z1Vr6cbANqu6ye
 cWMYNZoMyaVWxmODkgiXqOKFXnccMpXz3ztcJql2b/diwDRK/CMAEpMFNwDJrC/duzoR
 Wrh6lFhWEqoMsX48g0ztGwrHIz5u/IFpnPSRXfxTuPc3IDH611mNjllz6cZP09UyqW7x
 kNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qPiP3Ts0DBAWErWMEC4RLT6d8PuqjKi+0FQ8gfHr7tc=;
 b=JxgAINOoD7wJ6ePd9jiKPtSnVBMQl6y3+LoyGR77uTiL1Ol1gS5F5Z1KB1Amb4bgx1
 Ixi/tmxrdupM9FUT5E4g/9C1iVl2L6e5ZvN0LWh8KI/8N7czcosT/Nspsp5QjTfoZapV
 XYZHIzGj0Z8EDquR7+XuCXwXIpMCpJZ31OBl4ooZJ1Kt747/3KuebgmyQVR5QXJPRhCK
 b0bupMe9zLSeBw7s5nnND/l7Q/EzPumym6TtQ8lA5saU108wXPM32B01t0F7gtZbqtsj
 nhDoh7LRF1hWRQ6hbX9+A7EXMZKBqtumOn4KYhZ4+83poJtvAd9/tf5H74An0dHQVxHQ
 kKHg==
X-Gm-Message-State: AFqh2kqnS32ItXCJOWbUa0bK4DVah9ch/ToCFqiGy2y0JFFYVQrzeDmW
 ByLL8yPWgCtBUE2am+c4TBNC9BXIFT/cc440UobrQw==
X-Google-Smtp-Source: AMrXdXv2xpq6ikzRTT9FgDNOg/Vq5EXa9XYBWQx0viWP7aZAw+93k5A61qC92pJJ7o+IuFrILqAIvspJQKHv+XrJ2mc=
X-Received: by 2002:a17:902:9890:b0:189:b0a3:cf4a with SMTP id
 s16-20020a170902989000b00189b0a3cf4amr2427457plp.60.1672952688997; Thu, 05
 Jan 2023 13:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105045619-mutt-send-email-mst@kernel.org>
 <20230105113111-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230105113111-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 21:04:37 +0000
Message-ID: <CAFEAcA8Dr_vT2YrrrapL5vAtL5baGxPpk0busNPU-vutJcA10A@mail.gmail.com>
Subject: Re: [PULL 00/51] virtio,pc,pci: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 5 Jan 2023 at 16:32, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jan 05, 2023 at 04:56:39AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Jan 05, 2023 at 04:14:20AM -0500, Michael S. Tsirkin wrote:
> > > The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:
> > >
> > >   .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > >
> > > for you to fetch changes up to 6529cb46fa76bb4b4f217d6fcc68b61b543062c4:
> >
> > 7c77271205339d3b161bdf925f5ead799b582e47 now - I dropped one patch
> > as v2 is forthcoming.
>
> And now it's c46dcec9f699508e811cb6a140250d07486b0e41 as I replaced that
> patch with it's v2. Sorry about the back and forth, but it seemed
> important :(
>
> >
> > >   vhost-scsi: fix memleak of vsc->inflight (2023-01-05 04:07:39 -0500)
> > >
> > > ----------------------------------------------------------------
> > > virtio,pc,pci: features, cleanups, fixes
> > >
> > > mostly vhost-vdpa:
> > >     guest announce feature emulation when using shadow virtqueue
> > >     support for configure interrupt
> > >     startup speed ups
> > >
> > > an acpi change to only generate cluster node in PPTT when specified for arm
> > >
> > > misc fixes, cleanups
> > >
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >
> > > ----------------------------------------------------------------
> > >
> > > Note: linux-user build is failing for me on master, I just
> > > disabled it for now as nothing I'm doing should affect linux-user.
> > > Didn't debug yet.

Compile failures on freebsd in the bsd-user build:

https://gitlab.com/qemu-project/qemu/-/jobs/3561556072
https://gitlab.com/qemu-project/qemu/-/jobs/3561556071

Probably something in Markus' include-file cleanup, I suspect
some file is missing its osdep.h include.

thanks
-- PMM

