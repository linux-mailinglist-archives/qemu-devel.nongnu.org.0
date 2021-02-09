Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F563154EC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:23:01 +0100 (CET)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Wj6-00054j-PO
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Wdv-0008Ns-4r
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:17:42 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Wdo-00022E-3L
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:17:38 -0500
Received: by mail-ed1-x52c.google.com with SMTP id t5so24757215eds.12
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 09:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cM2Y1h9GUdKJSjge9tewzMt/ubc0DGEUW4JkwUpzGGk=;
 b=ZWw/bnlvh2d1sg9AiD/xzntDN36JdVWQlk9hpos7tafvdPJ5TcOl2KaQE4NtZ6HT7J
 ViTCLQNnBZsoX+OUq6A5Ueq9Uwb/R2txcglKCAefNipx2BbmLIJavoCfBKASsc8OyJNT
 9htCfqodtvuS4WLN70Ndf0SRDKm4HmGoOk3tSbmBy4QhfyBOOYoGnXnuc24NY2j9CMsq
 Ab0wNnsR9AWB8UsxU8WZT6db3kZBQFu01l16uJq8Tfv89gctTn6+xGpURxW9WP9eZjvC
 K4aLW3tSlSI4oCpzTubp0OLSx4f0DcjpUVmxIECEx/4w+Sg++B9vR2nHlLS73M88yI2N
 4t/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cM2Y1h9GUdKJSjge9tewzMt/ubc0DGEUW4JkwUpzGGk=;
 b=RwagSxyXXB367yP+T20mvXase0xoBdEdHdjBQXFTWDWvP6ExiRwTXL64eb9GZQ35qY
 RBeT2aZ06nJ5n71cL+S7/76d5gHhCzGGmEcbY2ASrgKxxHINt8Arhw4HQsqTwbLjhIs1
 9qTHL5WIYdA55xHBsJ7+bNa1CrMPgW+yrihPInMVQWzmHDBClfQ14Nu96tDEVGS9JgOH
 K50JPe90ly/9trIZ03CAJRes5CdXE335ujpOF+Za8m7JuOzgXNj6mJbvvvCDdRrq332L
 tFZ8YQV3SGMuUe5wd011ToBEn+hm58SfaGALwfjXJrGUHolPwme/M0EGE9NJQRJfAiuG
 teaQ==
X-Gm-Message-State: AOAM531sZ1yvd52op3/r01obX4+Lm+q+DXJjPceUmNOykB9OnlETdY8j
 7vfhsTqEzs3nA7/Ty1U8nfaxI80QJMNKaloYnn021A==
X-Google-Smtp-Source: ABdhPJzugIsveP1FQWseJG4/lX+j7xhH1fAkbth066eQRjFfaIuXAYV8q/30fPore4atQizAriRE7OinU3URfhgRzfA=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr23967838edd.52.1612891050252; 
 Tue, 09 Feb 2021 09:17:30 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8=vG-2Vzrdark8VC5NANe5Fb3qGTpSFk8X94KvXszTbA@mail.gmail.com>
 <c98d4f43-5a29-afcc-fe7d-a3d92063df3a@redhat.com>
 <CAFEAcA8q1ewJ4F-pijt81Qc_rO0xNpy6jJY2DrW0ggTzg27aEQ@mail.gmail.com>
 <5213f033-19dc-bc40-bfd7-10b8c676539b@redhat.com>
 <CAFEAcA-va8hY3tHrhK_UV0bniF=VhietM2Y8ovZt57wWkg8f_w@mail.gmail.com>
 <CAFEAcA_JLx6NAd_YPzKy6iXWqP_c1jkW42bscK+Q=zKN4xAbzQ@mail.gmail.com>
 <20210209181009.7f2cb328.cohuck@redhat.com>
In-Reply-To: <20210209181009.7f2cb328.cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2021 17:17:19 +0000
Message-ID: <CAFEAcA_u7eKMyKKLf1sdMOgW7OPRt9hXiv5aDkfyfJcOfM6XFA@mail.gmail.com>
Subject: Re: getting the console output for s390 cdrom-test?
To: Cornelia Huck <cohuck@redhat.com>
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
Cc: Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Feb 2021 at 17:10, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Tue, 9 Feb 2021 14:58:53 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > This change significantly reduces the frequency with which I see
> > the hang; but it doesn't get rid of it altogether. Also I couldn't
> > really figure out from the virtio spec exactly where barriers
> > were required: I think I would need to read the whole thing in
> > more detail rather than trying to fish out the information by
> > just reading small pieces of it.
>
> The Linux virtio-ccw code uses 'weak barriers', i.e. the heavy bcr15
> should not be needed. We might well miss other (lightweight) barriers
> in other parts of the code part, though.

Is that the version the Linux kernel has as
  /* Fast-BCR without checkpoint synchronization */
  #define __ASM_BARRIER "bcr 14,0\n"

?

> > But some of the ordering of
> > operations the spec describes doesn't match how the s390-ccw
> > BIOS code is doing it at all (eg the spec says that when feeding
> > a batch of descriptors to the device the driver isn't supposed to
> > update the flags on the first descriptor until it's finished
> > writing all of the descriptors, but the code doesn't seem to
> > try to do that). So I think the code could use an overhaul from
> > somebody with a better understanding of virtio than me...
>
> Yeah, the bios virtio code could probably use some love.
>
> I'm wondering how much memory ordering on the host platform influences
> things. I doubt many people try to run an s390x guest on an aarch64
> host...

Yes, you won't see this bug unless you're running QEMU on a
host that's pretty enthusiastic about reordering memory
transactions (and you'd never have seen it at all back when
we ran the iothread actions synchronously with the emulated
CPU, which we probably did back in 2013 when the s390-ccw
virtio code was written...) I haven't tested other aarch64
hosts but I would be unsurprised to find that whether you
could repro it and how frequently depended on the particular
h/w implementation.

thanks
-- PMM

