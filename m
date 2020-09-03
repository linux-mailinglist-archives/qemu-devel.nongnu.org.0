Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6580825C049
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 13:26:09 +0200 (CEST)
Received: from localhost ([::1]:39034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDnNY-00014f-G9
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 07:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kDnM0-0007ir-EF
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 07:24:32 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kDnLy-0007tH-LX
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 07:24:32 -0400
Received: by mail-oi1-x242.google.com with SMTP id x19so2762965oix.3
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 04:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=St9MZx/EfqmLNHCoBSrRYeKBxvrNhLYvuCsb+sSs/Bc=;
 b=nV5izIHqmSND2yGX758uYDicmmwWvuHr0uqaGbVhFxk8zxkErbMCcXXIRjH6QkRr5Z
 fOCgX3hhmk01+N9Q0zQ2gdgVMacY3tVD2uyhfkTCJ+5BVB5kX/4476EoStKxDecRQZ1P
 QlX7bgdB4QViR4rIqsDwdGUJKFt4ppObnquIASKmQZ40/+7cBEBT8ei2mL1UXtiT3qc8
 ju8QTJ5uAr6RN1s2HreqDYc0olBJme8JsIA0S1lSxGMGze2Y9zeQS2sId8XRl80MLo6z
 3XE9iXJVwA7l3nKclas+QUCAZCqjgI7qoCWmB4as0zIG4YuUzIWNl7sAQBFo7dROHkCg
 Mphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=St9MZx/EfqmLNHCoBSrRYeKBxvrNhLYvuCsb+sSs/Bc=;
 b=kpMI5a/kzmOrFAhVzpekWAUy0bC2dYZ04wFpk4Ig4vWfrY8F5liHs3hkFSbhOtEboF
 kery3BjdcuP2CzcRBDRBDLxYpxjb+J34i+9eiVlvTAZAC/EZMrYxn14a9Jef6/BAPN3l
 lkaFGXaenpb5eaKNVnhXdAhLBeczULKv1M1eP69utQ0a6gG5FPjTSyjfWu8M84Uewvzr
 DdSI4Ah79AeDDFchkRvItbJFT3dqgCEUbufTjAbG8awDTKMXVmIU/H7O+aN8XHWTWRX/
 5Uv+pofPGrJwt0Nt/4Ab2MXPhp3Qpd1NqAxB4FnP/hgUsUASJ3gE246kqWe7OIn+0cYt
 Wz6w==
X-Gm-Message-State: AOAM5325CVZ8GBSt64pBjrNT/JzxUCISinK9Jta4Y5k1smL3bIk+lYqG
 Ado/urEnT9YN1wxzA6rNXjj9blNqljoxZOLgU18=
X-Google-Smtp-Source: ABdhPJxJ5J+TnStDKNd3PkVieHJNVBrmPfmbBop6/ZtHttAKS72AeJNFs8GzcIs6F7VqCwu6Yb9RIsFlKYRktSmjoqQ=
X-Received: by 2002:aca:c0c1:: with SMTP id q184mr1787224oif.56.1599132269425; 
 Thu, 03 Sep 2020 04:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200902162206.101872-1-liq3ea@163.com>
 <b840aab8-542d-af43-43e5-0a07f442b5d5@redhat.com>
 <CAFEAcA9mvMaR5MJJ74Vv63TG6frWnMeSZA19Zxv8TUceudPUTQ@mail.gmail.com>
 <CAKXe6SLYgkiTAYa81nppHUMEzoeGy3988OmrzZyw8-VY8ajE3w@mail.gmail.com>
 <CAFEAcA9TEpfBmfOOtpfR9JCAFkMF0fy20L=DBVDTFaLp6J3Lfg@mail.gmail.com>
In-Reply-To: <CAFEAcA9TEpfBmfOOtpfR9JCAFkMF0fy20L=DBVDTFaLp6J3Lfg@mail.gmail.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 3 Sep 2020 19:23:53 +0800
Message-ID: <CAKXe6SKgVo5HBL2Uf8AscEn5ohZOJZGLMmT3NZL5cEbcQzgivg@mail.gmail.com>
Subject: Re: [RFC 0/3] try to solve the DMA to MMIO issue
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=liq3ea@gmail.com; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@163.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2020=E5=B9=B49=E6=9C=883=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=887:19=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On Thu, 3 Sep 2020 at 12:11, Li Qiang <liq3ea@gmail.com> wrote:
> >
> > Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2020=E5=B9=B49=E6=9C=
=883=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:53=E5=86=99=E9=81=93=EF=
=BC=9A
> > >
> > > On Thu, 3 Sep 2020 at 04:55, Jason Wang <jasowang@redhat.com> wrote:
> > > > I think we still need to seek a way to address this issue completel=
y.
> > > >
> > > > How about adding a flag in MemoryRegionOps and detect the reentranc=
y
> > > > through that flag?
> > >
> > > This won't catch everything. Consider this situation:
> > >   Device A makes DMA access to device B
> > >   Device B's write-handling causes it to raise an
> > >    outbound qemu_irq signal
> > >   The qemu_irq signal is connected to device A
> >
> > Here mean device A is an interrupt controller?
>
> No. Any device can have an inbound or outbound qemu_irq line.
> We use them not just for actual IRQ lines but for any
> situation where we need to pass an on-or-off signal from
> one device to another.

Could you please provide some example, I haven't noticed this before. Thank=
s.

>
> > This is special case I think.
>
> It's an example of why looking purely at MMIO is not
> sufficient. We should prefer to see if we can come up with
> a design principle that works for all between-device
> coordination before we implement something that is specific
> to MMIO.

So first we may be define a clean boundary/interface between device
coordination?

Thanks,
Li Qiang

>
> thanks
> -- PMM

