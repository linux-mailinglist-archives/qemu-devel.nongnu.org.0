Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114095A588C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 02:50:32 +0200 (CEST)
Received: from localhost ([::1]:46380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSpSY-00022W-NJ
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 20:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1oSpPH-0000ct-HJ
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 20:47:11 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:33978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1oSpPE-0004Gv-9d
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 20:47:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9BEFBB81091
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 00:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654C2C433C1
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 00:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661820417;
 bh=yoX1CfVS0LbXA4j7rU9G6987OMDa3/oYInsEeO8j04w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Wpf73274K9hr15+/JwwaaxKULijoKEBqj81+RGZ6RznShy5DU2498gfdwMV+lo/cw
 3N4G6+qpRjBKhXvckeK1s5baUrIhie4bvtzmceAcI693S0kmKW2u9MQTGBtEyLQURv
 FxfiiBnX6gGYFI9yAVqKZVC/vXe3w9Hnul9gX9AY/MzISRMaag8YjWBeegWtt5wKWW
 zHI67vGonD2cCI9K6vBy4mYV9W0AIkJi8w96vZU/UASyflcaLUsEFDsO0IB4TLBfyn
 dhZlHqGvZun0kpT7a7Y6hNkQc7F7ye1lD60r0lmMNgQb5w0mGIhxfkwL8PYgjpa2zL
 k42AdWFxH00+A==
Received: by mail-vs1-f46.google.com with SMTP id o123so10025413vsc.3
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 17:46:57 -0700 (PDT)
X-Gm-Message-State: ACgBeo07ux7XXnXbZXq1BEMB7EjgUVF9E3qIJw0BlkuZe61aqLkd/xm8
 kkdauUsKyCQHaMJggx9wIk28mVWMHm3Zt+9s96I=
X-Google-Smtp-Source: AA6agR7Mvuqdy1YNKrceLBPcL6bhCaUpa7psA04jIC8SXMnVtjehMYb8adXyO4CbzZ/7P69l2YAFmEatrT+ucpyTZQA=
X-Received: by 2002:a05:6102:30bc:b0:390:da09:3a8c with SMTP id
 y28-20020a05610230bc00b00390da093a8cmr2538134vsd.84.1661820416344; Mon, 29
 Aug 2022 17:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-16-alex.bennee@linaro.org>
 <9f5c9c75-e4d7-b262-73ec-d9727ac372e4@amsat.org>
In-Reply-To: <9f5c9c75-e4d7-b262-73ec-d9727ac372e4@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 30 Aug 2022 08:46:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H65xV4zbwsvQhjS4CbkRRtV+GQVi_xOFm429cErDAJaaw@mail.gmail.com>
Message-ID: <CAAhV-H65xV4zbwsvQhjS4CbkRRtV+GQVi_xOFm429cErDAJaaw@mail.gmail.com>
Subject: Re: [PATCH v1 15/25] Deprecate 32 bit big-endian MIPS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, fam@euphon.net, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, stefanha@redhat.com,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=145.40.68.75; envelope-from=chenhuacai@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Tue, Aug 30, 2022 at 7:39 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Alex,
>
> (+Aleksandar/Huacai)
>
> On 26/8/22 19:21, Alex Benn=C3=A9e wrote:
> > It's becoming harder to maintain a cross-compiler to test this host
> > architecture as the old stable Debian 10 ("Buster") moved into LTS
> > which supports fewer architectures. For now:
> >
> >    - mark it's deprecation in the docs
> >    - downgrade the containers to build TCG tests only
> >    - drop the cross builds from our CI
> >
> > Users with an appropriate toolchain and user-space can still take
> > their chances building it.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >   docs/about/build-platforms.rst                |  2 +-
> >   docs/about/deprecated.rst                     | 13 ++++++
> >   .gitlab-ci.d/container-cross.yml              |  1 -
> >   .gitlab-ci.d/crossbuilds.yml                  | 14 -------
> >   tests/docker/Makefile.include                 |  5 +--
> >   .../dockerfiles/debian-mips-cross.docker      | 40 +++++-------------=
-
> >   6 files changed, 27 insertions(+), 48 deletions(-)
> >
> > diff --git a/docs/about/build-platforms.rst b/docs/about/build-platform=
s.rst
> > index 26028756d0..1ca9144a7d 100644
> > --- a/docs/about/build-platforms.rst
> > +++ b/docs/about/build-platforms.rst
> > @@ -41,7 +41,7 @@ Those hosts are officially supported, with various ac=
celerators:
> >        - Accelerators
> >      * - Arm
> >        - kvm (64 bit only), tcg, xen
> > -   * - MIPS
> > +   * - MIPS (LE only)
> >        - kvm, tcg
> >      * - PPC
> >        - kvm, tcg
> > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > index 91b03115ee..22c2f4f4de 100644
> > --- a/docs/about/deprecated.rst
> > +++ b/docs/about/deprecated.rst
> > @@ -213,6 +213,19 @@ MIPS ``Trap-and-Emul`` KVM support (since 6.0)
> >   The MIPS ``Trap-and-Emul`` KVM host and guest support has been remove=
d
> >   from Linux upstream kernel, declare it deprecated.
> >
> > +Host Architectures
> > +------------------
> > +
> > +BE MIPS (since 7.2)
> > +'''''''''''''''''''
> > +
> > +A Debian 10 ("Buster") moved into LTS the big endian 32 bit version of
> > +MIPS moved out of support making it hard to maintain our
> > +cross-compilation CI tests of the architecture. As we no longer have
> > +CI coverage support may bitrot away before the deprecation process
> > +completes. The little endian variants of MIPS (both 32 and 64 bit) are
> > +still a supported host architecture.
>
> For completeness we should update meson.build to consider
> host_machine.endian() and adapt this section:
>
>
>    if not supported_cpus.contains(cpu)
>      message()
>      warning('SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELEASES!'=
)
>      message()
>      message('CPU host architecture ' + cpu + ' support is not currently
> maintained.')
>    ...
>
> This can be done later, and I might be able to do so in few weeks,
> so meanwhile (with Thomas comment addressed):
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

