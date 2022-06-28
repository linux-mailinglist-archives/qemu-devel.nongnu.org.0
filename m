Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49CB55C056
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:44:18 +0200 (CEST)
Received: from localhost ([::1]:39430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68he-0006Fn-1g
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o68fU-0005Pk-MB
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:42:04 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o68fS-0004Md-D3
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:42:04 -0400
Received: by mail-ed1-x52d.google.com with SMTP id o10so16978141edi.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9Ukvx3xRAYj3WesJAp2UfTx8ZcWu12cR586ZqdVbdCQ=;
 b=pSJdTsArhDuiISarHYGXp8r9TTyqXBv+rCNemDmjQ5YwtfJH+q2Jm2eZE2Vgkh+WnY
 sStY5+o7u+ldznlSTyVn7SvXEBtcvo1/Di1m1ySrhGzML2Z+CxhVRb/36WlY1U2EmDFt
 aj7Gx2BURZ1w+0n+Gzn2CAXiYF//nU3y5Bi+C4iyPUY7ci5zYWkJeU73IzOnOY7cBcWA
 kl6sFMsV/vt3yrPIbI19AIvx96Xtx3Qp1I2m3X5ZT2VydsUMYlQI532ksfvWa3b0K3by
 cfMb3wQy8i91pmlamBkomHCrSL2o76/yp7URclRiXraw1gyXfqB6ueYhK5UvnqFLamS7
 /jlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9Ukvx3xRAYj3WesJAp2UfTx8ZcWu12cR586ZqdVbdCQ=;
 b=izufF0C369z3qdpk7EEJ2SvDz600rWRY4iDgDQtVE4Fnt68bdRh0uOwNbQ3ECRtbeX
 BtVMDrfwiw2jZ1lXA7+mKPWNioGm/OYb5jF0a4oftJ7sit0qUoYm8X/qB4zjqrERt4T8
 pG1up0R9xhU1/ekopCt0umPxO/DysSKy1QsdnaGVhj5jUB8IRiC2N1FHYPevRNn59XCg
 MYL3cm9SVXTKvwyBE/Lj18OJyqFuY+vnQFhXmtf+ymSg6x/q8MNEQElYUd4JZc5p1aW5
 qxIsu83sVlTFK87P/KqGm/WYanMUcmDmZcsH0k8myX+MaQhblHy4G4WAQK0vyzXXlCcb
 NFgA==
X-Gm-Message-State: AJIora9zalOjHRQxj7+VBESloJEP1dLyjhC5PGGIg0JjUzRhET3T9i75
 rRVOaTcpWlyeCikTvJkKTNgQ5g+NOH/FKOmKDuw23g==
X-Google-Smtp-Source: AGRyM1uiW65mYw6wg3fDQ/OWtI5gx4kK8CRR/ra9tnBNHnmh2h7RjD36gzm5D+CHq0pUOrWdEVSjxogiLR6kVtd/LE8=
X-Received: by 2002:a05:6402:26d5:b0:435:aba2:9495 with SMTP id
 x21-20020a05640226d500b00435aba29495mr22456532edd.133.1656412920756; Tue, 28
 Jun 2022 03:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com> <20220628060510-mutt-send-email-mst@kernel.org>
 <YrrVZkjZMEivmrKP@redhat.com>
In-Reply-To: <YrrVZkjZMEivmrKP@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 16:11:49 +0530
Message-ID: <CAARzgwzOHvTVh9gaFU0dQXK2xgEAoHD0=hXGVFw=rr5tDmhPBQ@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 3:48 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Jun 28, 2022 at 06:07:13AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Jun 28, 2022 at 11:04:30AM +0100, Daniel P. Berrang=C3=A9 wrote=
:
> > > If it is actually booting a real guest image (from biosbits) and inte=
racting
> > > with it, then it does feel like the scope of this testing is more app=
ropriate
> > > to QEMU's avocado framework than qtest, especially given the desire t=
o use
> > > python for it all.
> > >
> > > With regards,
> > > Daniel
> >
> > I feel avocado is directed towards booting full fledged guest OS.
>
> That's essentially what this is doing - its a custom guest OS rather

Daniel, there is no OS :-) Like there is no kernel image, no
persistent real file system (there is a fake one called pyfs), no
packages, nothing. Its very minimalistic image narrowly targeted for
one thing alone - to test the bios.

> than a common distro IIUC
>
> > It makes it much easier to figure out guest issues but it also
> > prone to false positives and is harder to debug as a result.
> > Booting a minimal image like this shouldn't require that.
>
> Well avocado is as reliable as the tests you write for it. The problems
> are largely around the images being used in avocado. If the biosbits
> testing system is reliable, then avocado will be too, and if they not
> reliable, then it will affect qtest too.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

