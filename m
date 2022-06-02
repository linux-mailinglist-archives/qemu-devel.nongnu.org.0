Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A77653C064
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 23:33:18 +0200 (CEST)
Received: from localhost ([::1]:33624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwsRR-0004ue-91
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 17:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nwsQ0-0003S1-4S
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:31:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nwsPw-0001ks-Lz
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654205503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hw4MgKQNblF9l4pE31H16oHL4jg05yW+PrT3Pnr9MLY=;
 b=e4DfR8sTMMrgjzHMT+koP1UZiA0tpl1PYm9INwBIbR99RHCXdcbkp+/CANbCKn7ANy4VSQ
 SVMAyEBYmFr/O0fpM81+Z9eCxAKS5SSVFEW23XaZ5kn4Rlq8G4tx7tascriH0pqn04YnoY
 SqrnXutMGDHn2A3mBOlt+SjfpQT0xsg=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-7Y7oDSIDMjG0smPaLXsYHA-1; Thu, 02 Jun 2022 17:31:42 -0400
X-MC-Unique: 7Y7oDSIDMjG0smPaLXsYHA-1
Received: by mail-io1-f71.google.com with SMTP id
 y12-20020a5e920c000000b006657a63c653so3369743iop.11
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=hw4MgKQNblF9l4pE31H16oHL4jg05yW+PrT3Pnr9MLY=;
 b=1CQbOSTG1N4ZNcKDzo/xm40y3VGhvYWI92Dm61Bxt7ZglgFkoQQwAeyjRfAh6r3+LZ
 iKqJ3WVob7Nrc2X3KlA0O3wBMoACmvH1dAPQGIDCbBDd2DL1FVc4tQXn4LhrtuDa1nLR
 tNOH1eMzl2IScz73R1OEQPNKZd7mNzzmvCZ9d+6etU1/UIgHRECOP/iyKA5oikBfosP0
 qbAA2sxM3ElvJDt3MhX1QWjXx07rf6nj36di0wJebwVw7nMjvx2dyeFEUURdmqRD3nUk
 A43lLDYTbjchirkw8cmZXroGG6YT3rqaFryeGIfPPXwCu4MVbJY9PmDIb1keXAKhs3Ig
 W4gQ==
X-Gm-Message-State: AOAM531uvCcYyr9lGJX7L+Vukcr6hY5eoW16nwDHuWNfdCT9XT7OlGea
 yWBIoma1yMjAkCJWr7XKilXnajqYVYmmhRKAhUX7naUOofSxRKedci6IcM1Bb8oZjE2BMi3+Qjk
 pqc89AMD34ABE0hE=
X-Received: by 2002:a05:6638:f95:b0:314:58f9:5896 with SMTP id
 h21-20020a0566380f9500b0031458f95896mr4125493jal.228.1654205500427; 
 Thu, 02 Jun 2022 14:31:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMks+/qH2dHQbFrGhkKzNRzqVt+GhjhbFehqxIgKXi7DRT5jhG43dYTFUyx0A+u71ow5wEkQ==
X-Received: by 2002:a05:6638:f95:b0:314:58f9:5896 with SMTP id
 h21-20020a0566380f9500b0031458f95896mr4125484jal.228.1654205500193; 
 Thu, 02 Jun 2022 14:31:40 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 c3-20020a056e020bc300b002d3a8969dd4sm1891064ilu.28.2022.06.02.14.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:31:39 -0700 (PDT)
Date: Thu, 2 Jun 2022 15:31:38 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Eric Auger
 <eric.auger@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>
Subject: Re: [PULL 0/2] VFIO fixes 2022-02-03
Message-ID: <20220602153138.1624ddb5.alex.williamson@redhat.com>
In-Reply-To: <6ae31bd1-2890-968c-a9b3-5ad4633d8bfd@redhat.com>
References: <164392758602.1683127.4327439310436541025.stgit@omen>
 <CAFEAcA-CX6hPOEEr_Yjcd1=4AHfkYgnkQ_ruUJ4mFwBYz1fLQA@mail.gmail.com>
 <20220207085045.1de46df1.alex.williamson@redhat.com>
 <6ae31bd1-2890-968c-a9b3-5ad4633d8bfd@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 7 Feb 2022 17:20:02 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 07/02/2022 16.50, Alex Williamson wrote:
> > On Sat, 5 Feb 2022 10:49:35 +0000
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> >  =20
> >> On Thu, 3 Feb 2022 at 22:38, Alex Williamson <alex.williamson@redhat.c=
om> wrote: =20
> >>>
> >>> The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98bbb=
3b359f:
> >>>
> >>>    Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-pu=
ll-request' into staging (2022-02-02 19:54:30 +0000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>    git://github.com/awilliam/qemu-vfio.git tags/vfio-fixes-20220203.0
> >>>
> >>> for you to fetch changes up to 36fe5d5836c8d5d928ef6d34e999d6991a2f73=
2e:
> >>>
> >>>    hw/vfio/common: Silence ram device offset alignment error traces (=
2022-02-03 15:05:05 -0700)
> >>>
> >>> ----------------------------------------------------------------
> >>> VFIO fixes 2022-02-03
> >>>
> >>>   * Fix alignment warnings when using TPM CRB with vfio-pci devices
> >>>     (Eric Auger & Philippe Mathieu-Daud=C3=A9) =20
> >>
> >> Hi; this has a format-string issue that means it doesn't build
> >> on 32-bit systems:
> >>
> >> https://gitlab.com/qemu-project/qemu/-/jobs/2057116569
> >>
> >> ../hw/vfio/common.c: In function 'vfio_listener_region_add':
> >> ../hw/vfio/common.c:893:26: error: format '%llx' expects argument of
> >> type 'long long unsigned int', but argument 6 has type 'intptr_t' {aka
> >> 'int'} [-Werror=3Dformat=3D]
> >> error_report("%s received unaligned region %s iova=3D0x%"PRIx64
> >> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> ../hw/vfio/common.c:899:26:
> >> qemu_real_host_page_mask);
> >> ~~~~~~~~~~~~~~~~~~~~~~~~
> >>
> >> For intptr_t you want PRIxPTR. =20
> >=20
> > Darn.  Well, let me use this opportunity to ask, how are folks doing
> > 32-bit cross builds on Fedora?  I used to keep an i686 PAE VM for this
> > purpose, but I was eventually no longer able to maintain the build
> > dependencies.  Looks like this failed on a mipsel cross build, but I
> > don't see such a cross compiler in Fedora.  I do mingw32/64 cross
> > builds, but they leave a lot to be desired for code coverage.  Thanks, =
=20
>=20
> The easiest way for getting more test coverage is likely to move your qem=
u=20
> repository from github to gitlab - then you get most of the CI for free,=
=20
> which should catch such issues before sending pull requests.

Well, it worked for a few months, but now pushing a tag to gitlab runs
a whole 4 jobs vs the 124 jobs that it previously ran, so that's
useless now :(  Thanks,

Alex


