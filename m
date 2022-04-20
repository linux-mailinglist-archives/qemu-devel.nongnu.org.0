Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A39B508C45
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:36:31 +0200 (CEST)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCNa-0001et-JS
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhCK5-0006Bw-WE
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:32:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhCK4-0000kS-5I
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650468771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HiTuY9rjjy1563z3BQFBCeN+BrdbfsBve6ndwOn5/58=;
 b=O+jnpk9KVvMSDMNz60HdvuHCMWqQ6n1/r9r92alPCoWVcu/DkOeK5YbCYm+k25Y+H6LeoV
 bCVJkrEhzyAC+2RNePZi+nBpL4c6yNhTQR9w5G7AaPama5mKIO3MHE1ba69idLxngCnPMf
 xDVlUq88c8EVXEke2ah9LApVAxlsVic=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-0MJ4oq46P3e_vcEL4hganw-1; Wed, 20 Apr 2022 11:32:49 -0400
X-MC-Unique: 0MJ4oq46P3e_vcEL4hganw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2f17e110a9bso18876167b3.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HiTuY9rjjy1563z3BQFBCeN+BrdbfsBve6ndwOn5/58=;
 b=4eLk05KTQe5SBVFYD3tz3A0ZN9L5yf/jHq4koq0ya5pZIQvLhi1ja1kRgtVbMk1zHo
 uaQoZovH5/2LTQWafuqEeK3X3I+S1QXYhzaDHi5ea8rlm3xGbwqVJIZv+ehmxBXuUN64
 A3qc+65GWTqfPAdb4pfTBaZlyH2Gio42OYqL0F/uPBQbr9d98eCdrzGL4ulj8+zjsDFE
 n1gkunsOpqQGQ6+T4sscuc4PqFr+xkm8rqBsgvAe39Fcguw9T0kN/4pB8fgGaJaMTxwm
 rZFLoKp1Lf/ZkGtchIIIhwfWHKYIM0DhkG6yts6cGqPS5g6PmeGnBOXM5P+6z62ZggNx
 61Og==
X-Gm-Message-State: AOAM5328D9Cn75HOOBK8+s0OV7Bbiz3EIHmBg4iIPMu2rFfHBMG+o+u8
 yqlWXiNN9UNBmU8DmdoUm+vLZqZq3Klf32HvzJh2z1o2dAUyGQ5VIJ4PyqIGo5g1gmkF1BprbWX
 hrXK7R+Mieq2gmddRi4ucTvlCuASgY3g=
X-Received: by 2002:a25:8c01:0:b0:634:712d:3def with SMTP id
 k1-20020a258c01000000b00634712d3defmr20096769ybl.343.1650468769281; 
 Wed, 20 Apr 2022 08:32:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwC2Uj74bzTuv6ZMDv12SOqi+cXRtVBph5fYcw/gmHUPfSCYUWya2ihtKMc8mJ6ddK5swDtOpI3hhXDB48/X90=
X-Received: by 2002:a25:8c01:0:b0:634:712d:3def with SMTP id
 k1-20020a258c01000000b00634712d3defmr20096747ybl.343.1650468769098; Wed, 20
 Apr 2022 08:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-18-marcandre.lureau@redhat.com>
 <YmAUaMp7kTRaRCGY@redhat.com>
 <840f08cb-e28c-6802-96c7-b1f82dd36427@redhat.com>
 <CAMxuvax0uPB+dWGCt2_Ma22S3VZ9=OFy+J_9LFT+4ftgqzB-7A@mail.gmail.com>
 <CAMxuvax4SaY7TBAc_fWfQHv9X49WRKvCLJ+Hd5wenVGA7Nr6Vg@mail.gmail.com>
 <YmAlm0WXIf2n4VRX@redhat.com>
In-Reply-To: <YmAlm0WXIf2n4VRX@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Apr 2022 19:32:38 +0400
Message-ID: <CAMxuvaya0jT2PhHEryZkoW1MFKZLS0BaYz=-gqPX-Gx=6Rgp9w@mail.gmail.com>
Subject: Re: [PATCH 17/41] doc/build-platforms: document supported compilers
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Apr 20, 2022 at 7:24 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Apr 20, 2022 at 06:50:12PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Apr 20, 2022 at 6:46 PM Marc-Andr=C3=A9 Lureau
> > <marcandre.lureau@redhat.com> wrote:
> > >
> > > Hi
> > >
> > > On Wed, Apr 20, 2022 at 6:37 PM Thomas Huth <thuth@redhat.com> wrote:
> > > >
> > > > On 20/04/2022 16.10, Daniel P. Berrang=C3=A9 wrote:
> > > > > On Wed, Apr 20, 2022 at 05:26:00PM +0400, marcandre.lureau@redhat=
.com wrote:
> > > > >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > > >>
> > > > >> According to our configure checks, this is the list of supported
> > > > >> compilers.
> > > > >>
> > > > >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.c=
om>
> > > > >> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> > > > >> ---
> > > > >>   docs/about/build-platforms.rst | 10 ++++++++++
> > > > >>   1 file changed, 10 insertions(+)
> > > > >>
> > > > >> diff --git a/docs/about/build-platforms.rst b/docs/about/build-p=
latforms.rst
> > > > >> index c29a4b8fe649..1980c5d2476f 100644
> > > > >> --- a/docs/about/build-platforms.rst
> > > > >> +++ b/docs/about/build-platforms.rst
> > > > >> @@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
> > > > >>   The version of the Windows API that's currently targeted is Vi=
sta / Server
> > > > >>   2008.
> > > > >>
> > > > >> +Supported compilers
> > > > >> +-------------------
> > > > >> +
> > > > >> +To compile, QEMU requires either:
> > > > >> +
> > > > >> +- GCC >=3D 7.4.0
> > > > >> +- Clang >=3D 6.0
> > > > >> +- XCode Clang >=3D 10.0
> > > > >
> > > > > Do we need to spell out the versions explicitly ? These versions =
are
> > > > > all derived from what's available in the repos of the supported b=
uild
> > > > > platforms, similar to any other build deps we have. I don't think=
 we
> > > > > want to start a precedent of duplicating versions in this doc for
> > > > > build deps we have, and there's nothing particularly special abou=
t
> > > > > compilers in this respect.
> > > >
> > > > I agree with Daniel - when I saw this patch, the first thought that=
 I had
> > > > was: "This will be getting out of sync quickly" ...
> > >
> > > I don't have the impression we bump our compiler requirement regularl=
y
> > > or lightly.
> > >
> > > > so I'd also recommend to rather not add this here.
> > >
> > > Outdated documentation is still better than no documentation. YMMV.
> >
> > Another question that is difficult to answer without being familiar
> > with QEMU details is whether it can compile with MSVC. This
> > documentation would, since it is explicit about the requirement.
>
> Documenting that we mandate GCC or Clang is reasonable. Ideally we could
> have a list of all 3rd party deps we have in fact, I'm just not a fan of
> copying the version numbers across from configure/meson.
>

I agree, duplicating the version information is not optimal... Yet it
is better than not having it, or having to read or run configure imho.

Sorry (or not) to insist, but it would help having an explicit list of
supported compilers in the human doc (because configure/meson doesn't
rule others out, afaik, nor it really can or should)

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


