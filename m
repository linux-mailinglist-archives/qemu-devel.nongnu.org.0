Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C8A3CB2CF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 08:43:06 +0200 (CEST)
Received: from localhost ([::1]:60468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4HYv-0002sK-8W
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 02:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4HXs-0002CP-CX
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 02:42:00 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4HXq-0000X7-Mc
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 02:42:00 -0400
Received: by mail-ed1-x531.google.com with SMTP id w14so11529113edc.8
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 23:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nji49/e5yN89pNS3TqtNJTGh4an+VurRRzsN0m+FOpg=;
 b=gi1uCXiUO3u5ocBddQdM744n1qlq9/Dc4odtZeulTSskdax71Z4ACTd/8nmUfXHL/s
 Mf6S3DfJ+OX71VO55bvLcuGPxzZZsB/SmJ953KkHsX7zNU35jWUU7BkQ/V+AvRZzo4CL
 B4FNMJ7T7JvFa9hNxsK8LIb3kK/AKpaVu39AVeFqc7MYqY8iFylSwUAKWdpqnIXJg8Oe
 ITgeEB9XtehkwN7hGfuS+GAftDADSplH+PGWHIwJRbU6yw9pKeEXflkWHlLNd9yUCnGg
 33maAEJ2aImi/6iLEduAFTDK1+SRMh49Aex3stduSu0nhhbAWBDf/N7oLOeS2iYtnpg6
 lDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nji49/e5yN89pNS3TqtNJTGh4an+VurRRzsN0m+FOpg=;
 b=Wd++SOWBQzZ9muLS4/n3anmmwtouT6WKGBm1fVaYmxh2kH7tgk3WndFgkoDRUcjv3Q
 TJpdakm9bSf5biJZqiqivvH7QyVPhmhWDHAkDKPX191UTIL5UqBp1LO/6lhxHzdZAcv9
 +u2nEn31lbrk+SXI6JSHlNE3Rq8zFLdR6LVTQ93w3VJdIWGFPJAd/7goy0nQm647ZZUf
 LeJIZgJu56cUe7OPFhNvu+DTloYnbCZg89aZzv5tjdZShFU0TB6p1gicUtRT9bhdRpOH
 QM8VHYwmjO7AVZRnm3nGpJku2K2Kd55NdaPS3dpNiLMGGDpPpYylzhHTn4XkyZmvQcTO
 CYow==
X-Gm-Message-State: AOAM5315YUvjUd9U1UnFwdYYahnMsEsq1udk2UShJL46/rWVbitFsNBz
 iX9eBDZ/1XpKi06wLC3Ctgi8rbCDxTm/4i7X3NTJ0Q==
X-Google-Smtp-Source: ABdhPJybp7dh2TP2xupouvwWU8OOKiIYVdLFNX4z/XqzAalN4gu0DhYbUsoGJyPVQKyJVMorytvcX9K0iewwIzJhLHs=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr12299755eds.204.1626417716952; 
 Thu, 15 Jul 2021 23:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210713220946.212562-1-mst@redhat.com>
 <CAFEAcA_ykJOv0s_44VKWFa3ti9pVD_u_3_G1MpAFdLRZ9oPH5w@mail.gmail.com>
 <20210715172049-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210715172049-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 07:41:16 +0100
Message-ID: <CAFEAcA8g+gJRX8CxhQ193PjcU8Ypsg1JDXou1RZaXmOyS5btPw@mail.gmail.com>
Subject: Re: [PULL 00/23] pc,pci,virtio: lots of new features
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Jul 2021 at 22:21, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Jul 14, 2021 at 09:31:21PM +0100, Peter Maydell wrote:
> > On Tue, 13 Jul 2021 at 23:10, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292:
> > >
> > >   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' into staging (2021-07-13 14:32:20 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > >
> > > for you to fetch changes up to cf171f90d5e41730ad3e0ce23f1990f34b7e63ef:
> > >
> > >   vhost-vsock: SOCK_SEQPACKET feature bit support (2021-07-13 16:59:12 -0400)
> > >
> > > ----------------------------------------------------------------
> > > pc,pci,virtio: lots of new features
> > >
> > > Lots of last minute stuff.
> > >
> > > vhost-user-rng.
> > > vhost-user-i2c.
> > > vhost-vsock SOCK_SEQPACKET support.
> > > IOMMU bypass.
> > > ACPI based pci hotplug.
> > >
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > This seems to produce a new meson warning:
> >
> > Configuring 50-qemu-gpu.json using configuration
> > Configuring 50-qemu-virtiofsd.json using configuration
> > Configuring 50-qemu-rng.json using configuration
> > ../../tools/vhost-user-rng/meson.build:7: WARNING: The variable(s)
> > 'libexecdir' in the input file
> > 'tools/vhost-user-rng/50-qemu-rng.json.in' are not present in the
> > given configuration data.
> > Configuring 50-edk2-i386-secure.json using configuration
> > Configuring 50-edk2-x86_64-secure.json using configuration
> > Configuring 60-edk2-aarch64.json using configuration
> >
> > (the build then seems to go on to complete OK).
> >
> > -- PMM
>
>
> I sent an email about a fix. Do you prefer PULLv2 then?

Same tag, right? I've put this back on my list, but I'm still
working through a backlog of other pullreqs before I get back
to this one.

-- PMM

