Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474592CD443
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:06:05 +0100 (CET)
Received: from localhost ([::1]:52126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmR2-0008M9-9C
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkmNm-00055Y-Mc
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:02:43 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkmNk-0004hy-Vd
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:02:42 -0500
Received: by mail-ed1-x52c.google.com with SMTP id b2so1639479edm.3
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 03:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JyH7p7tcfc9R/bG+EXYjdUOmD8KvF6LsSmuXPPT951U=;
 b=HRoia6I/Mnc8/lSCXIoFFt8RE4zjcUVld33ksYGlvfVmx5Cs36gnSIrCS6RY+IL/AT
 OvyZ9VP67ge2AkzUqOuNmcDu1sd5KahFUIR+LuePj55Tm+GOOa1Sk/uRDQ0Pzqoehitp
 FfuVXUuBTky+45kiASSX1iG7MWxkGUxj452HYJyjdjbPMH8yhBvKlucvO1RWc7U+3IEv
 PdeG0jm8tBGaMUAc5tKlj2Y6rl0er0RDhgD2UgGF24Fn1gVgei+eYNwIg2oDGeRab7i2
 ZVpb5xUShbbmcnM59sMk04VZ2JMIw5Y/oPcgtyEAArYIWrEelo+o3jGfyCgtrm1kZpm5
 IFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JyH7p7tcfc9R/bG+EXYjdUOmD8KvF6LsSmuXPPT951U=;
 b=t0z8CuY6We933E4/RNLcLAG5q7S89vhj6cK5QX2R9+CuDnW1iJWchrLeLZb7yI0sDn
 3KxFl4vHQkGxL0Ha8A7AXiwkBtI2SJ7PHehPC1C9E7eZvxQe7E6XUwHIz9mZYvAZB34F
 JnknXchVWmbRyqVtNLizfSKuFzOv3Pi0hWLn4YlnGwn8oDJWotMqv+6VgWixmtvmHjcZ
 29hTzPvFnsTkFmttPQOdcHbJImEpDlerbYjY4FjVe+T0Bl+ivY8A1Fo2VFSCUFUulge1
 tAYu+EBbVHFZdi/FqMiElOC3+HO+ny+itXkaJVnhRPMSCSWWU9nMvqOYEyfhAD65h1je
 S7jQ==
X-Gm-Message-State: AOAM533upaN6BEzgEw5q6h/XddQdECamTg3w/eVpBgrdAAaqlA3sIGmI
 isX64Tz1V5jYxNucuiSNu/5EwOPqZ2YFnhF+GAXE5g==
X-Google-Smtp-Source: ABdhPJxlBEAVplc2eEmmeBfhE2UQ3cSSB30Vx6MTXVw/B6Ubpqe8/G2e3oJNGX48JWdMGz1Wfc5Dc6bFv83Gh6xe2fM=
X-Received: by 2002:a50:fe88:: with SMTP id d8mr2295763edt.36.1606993359234;
 Thu, 03 Dec 2020 03:02:39 -0800 (PST)
MIME-Version: 1.0
References: <20201202101655.122214-1-mst@redhat.com>
 <CAFEAcA8N1Qh0gUX8oTTPOEuq_+DRzJ+9V1RqKzVhXN+4aoBZGw@mail.gmail.com>
 <20201203054505-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201203054505-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2020 11:02:28 +0000
Message-ID: <CAFEAcA81DAGk7TPLKpExJ40cipRXB9L1wXz7_3=0xLkcPWJgEg@mail.gmail.com>
Subject: Re: [PULL 0/6] pc,vhost: fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Thu, 3 Dec 2020 at 10:59, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Dec 03, 2020 at 10:20:03AM +0000, Peter Maydell wrote:
> > On Wed, 2 Dec 2020 at 11:03, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > Patch 5 gave me pause but we do need patch 6 as
> > > it's a guest triggerable assert, and it seemed
> > > cleaner to just take the whole patchset than cherry-pick.
> >
> > Is this only "fixes a guest triggerable assert"?
>
> My understanding is that without the patches a rhel7 guest triggers
> the assert if started with vtd enabled and virtio-net with
> iommu_platform=on.
>
> https://bugs.launchpad.net/qemu/+bug/1885175

Bug reported in June ? Is this a regression since 5.1, or
was it this way in 5.1 as well?

thanks
-- PMM

