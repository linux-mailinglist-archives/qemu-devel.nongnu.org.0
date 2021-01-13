Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BFF2F4C3D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:31:21 +0100 (CET)
Received: from localhost ([::1]:55364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgF2-0002Nz-1U
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzgBv-0001Av-Fb; Wed, 13 Jan 2021 08:28:03 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:37394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzgBt-00046s-6p; Wed, 13 Jan 2021 08:28:03 -0500
Received: by mail-yb1-xb30.google.com with SMTP id z1so2150848ybr.4;
 Wed, 13 Jan 2021 05:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GsOJlZDnOmaLHm617iqZrqPSsYXYDwDHCB+ZhkydkIU=;
 b=duqbQgJywsdK6PGXC8LkIQ2sblz2UdLXIAMCNx3LTgdxxtHW8Tr2DIWtRRYsoXW8ex
 Rk070r2rxnZKFg5RJPuOG2gHP2uovFsB0rrIPR2UjeIU6vnEFgd4Dw7N31iXokH0FB3h
 xU4KIt/rlmwH4e69xwQbB/PyHnwhkxL/4JLUFZrAsvrqdzYxwDT3nFRLwQEQmhBOA7Lb
 GzNk3xZ7fqnJ+koG2awBCaoh9hfw372BTQ5RTELzmcipdhxZG5doF1/1QuGejok1PbkH
 GYEAZKt/+1sNFAVDAtCRR2fgFlgNjVndwJtTlNoKGZ0PE9dNaacs48/EYibFaNutgIyi
 eRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GsOJlZDnOmaLHm617iqZrqPSsYXYDwDHCB+ZhkydkIU=;
 b=ZB+T2vndPIQ33DBNnA6EBVtiMO2nDQ097u4aGF2u7z2LAjv/lU62hnLy/977Bq8nnt
 9HoTkuZGPc7WP9tjfaAoBQeZjgjTZD5/69cqX060Kydn7rORE7ld4IdGs/zYyngXU46C
 imq/IgGLD+hrKQ4y+7YfzB0qS1xYm6+fs2C5v55e1JqWov8CRaC8HIUXOVCPMsR5WC8p
 6mKkupddZ1KrbRdS0Bm4AUXNIYxzwzMAomo1UBKygV6tdG57WmwycwHUxD+rt9fNgtOc
 ycotChnlwZoKhKdISWwg80Op8L35XXwkB8Mf3NLr0mOf7HL54QnKgHa3kfDaIode+bab
 gsXg==
X-Gm-Message-State: AOAM533ldSMzPPq0LtSorR6nFj4O3NSaFB3tN9Ehng01gUm1cxnYkxPd
 TwO+K+PMbPlJm1Lc6ktXeR5VJ7bsL0gN999IlzY=
X-Google-Smtp-Source: ABdhPJxVgTgwprohUW1/gVUjhfCbS1cXOV+QRMeqkLuv1ynJ4kIMCKkE4MBuTtK6azc37eXV1qjFgytZRH7lozeMVXc=
X-Received: by 2002:a25:5a43:: with SMTP id o64mr3407039ybb.387.1610544479772; 
 Wed, 13 Jan 2021 05:27:59 -0800 (PST)
MIME-Version: 1.0
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <CAEUhbmVmqYzCg0Edirp4UFhLpGGWbm5jFiTjOw=0=EhnSMsz3g@mail.gmail.com>
 <74a2566b-cd32-743f-8088-c59e992be755@amsat.org>
In-Reply-To: <74a2566b-cd32-743f-8088-c59e992be755@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 13 Jan 2021 21:27:48 +0800
Message-ID: <CAEUhbmU4wDdjY+nEiqHFpFsa6H1vJVpAitSjKt1+p1POEAONEQ@mail.gmail.com>
Subject: Re: [RFC PATCH v6 00/11] hw/ssi: imx_spi: Fix various bugs in the
 imx_spi model
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Wed, Jan 13, 2021 at 3:53 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Ben,
>
> On 1/13/21 4:29 AM, Bin Meng wrote:
> > On Wed, Jan 13, 2021 at 2:35 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>
> >> Hi,
> >>
> >> As it is sometimes harder for me to express myself in plain
> >> English, I found it easier to write the patches I was thinking
> >> about. I know this doesn't scale.
> >>
> >> So this is how I understand the ecSPI reset works, after
> >> looking at the IMX6DQRM.pdf datasheet.
> >>
> >> This is a respin of Ben's v5 series [*].
> >> Tagged RFC because I have not tested it :)
> >
> > Unfortunately this series breaks SPI flash testing under both U-Boot
> > and VxWorks 7.
>
> Thanks for testing :) Can you provide the binary tested and the command
> line used? At least one, so I can have a look.

Sure, will send you offline.

>
> >> Sometimes changing device reset to better match hardware gives
> >> trouble when using '-kernel ...' because there is no bootloader
> >> setting the device in the state Linux expects it.
> >>
> >
> > Given most of the new changes in this RFC series are clean-ups, I
> > suggest we apply the v5 series unless there is anything seriously
> > wrong in v5, IOW, don't fix it unless it's broken.
> >
> > Thoughts?
>
> Up to the maintainer :)
>
> The IMX6DQRM datasheet is available here:
> https://community.nxp.com/t5/i-MX-Processors-Knowledge-Base/i-MX-6DQ-Refe=
rence-Manual-IMX6DQRM-R2-Part-1/ta-p/1115983
> https://community.nxp.com/t5/i-MX-Processors-Knowledge-Base/i-MX-6DQ-Refe=
rence-Manual-IMX6DQRM-R2-Part-2/ta-p/1118510

Regards,
Bin

