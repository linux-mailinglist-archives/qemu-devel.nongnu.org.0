Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3420C508C03
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:23:51 +0200 (CEST)
Received: from localhost ([::1]:43244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCBK-0002lg-9R
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhBf4-0000RP-8J
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:50:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhBf2-0001YL-4s
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650466227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bAK4zfsezV57hpTWenKrjAMYKqx2VHo5cKjBAuN47zY=;
 b=C7G9LrZACiCSeBSqgAPZpBtee4W/7/vd8DYLZnhUueD0bSo4WtQoD+xR6RSaNx5HRugrKu
 MoWn4EOGiqaNgpE1tuNs9vsnp1LYTjKr5hj8HmX/5x5p0BjEWO+1FnmIkbZLKUqWHD2eQj
 sF1J8pA6MMOKRx4HWGbtuvzMgYmT7BU=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-EzgtIdSLOm2pQYbgK6pGwg-1; Wed, 20 Apr 2022 10:50:24 -0400
X-MC-Unique: EzgtIdSLOm2pQYbgK6pGwg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2ec060cffa5so17408617b3.4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bAK4zfsezV57hpTWenKrjAMYKqx2VHo5cKjBAuN47zY=;
 b=1MEfhMM5gZVpsODVZ2qLqXZv6ocuxH+XuZhMHu4Ji48Antb8r0lESWNE0ZUBQOalLW
 d+BcI6ReBUDQNZfFjELKAgi2ZGysy1FCOcWAoStS/Q8XRzygqdFW0Yh7bWTfUiLUHmHO
 JIwKiDVGPZpVmOz+s7DAzL1MiB7abL7lsiY4SzTz8JOYrvZ6Tl8A+W1aylK0zwxmYyL3
 xFYSm9r3OjYkvrXpGdaMa2NittMt8jLnil2A6+r4cv5CmMb5lvDrsSE/OhO9JTLkAoDl
 WndVxNxIlM1f7pZgiz52xiJ07uom3RDhIEUIa/wuPjYiXAYjVXYCMJUEX2WXBTtFvF9/
 6Mqw==
X-Gm-Message-State: AOAM532oTBnhFuTborIl0xi0snne2qOQKh/oO/qS16yfjcxSEVq5GU6u
 Rl23QvpwnVZ6tCZNRMpKzB17Xl/BrQRZIYlZTF8RQPV5BbHeaFjdshiDAfSVS+WpomZ/DCCU7bn
 ezWv433eBOv8bZ5qolTgLXiX3jHYZJTE=
X-Received: by 2002:a5b:b08:0:b0:641:ada6:b3e2 with SMTP id
 z8-20020a5b0b08000000b00641ada6b3e2mr20238491ybp.77.1650466223514; 
 Wed, 20 Apr 2022 07:50:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwABwQSFPcSuV3u+lPkIfkMUIFDjap7vBPzgCLZpAKVHoA72b29VUtb4YUFCoyd64t4jUygLD+WuFRyxzaKBpY=
X-Received: by 2002:a5b:b08:0:b0:641:ada6:b3e2 with SMTP id
 z8-20020a5b0b08000000b00641ada6b3e2mr20238473ybp.77.1650466223339; Wed, 20
 Apr 2022 07:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-18-marcandre.lureau@redhat.com>
 <YmAUaMp7kTRaRCGY@redhat.com>
 <840f08cb-e28c-6802-96c7-b1f82dd36427@redhat.com>
 <CAMxuvax0uPB+dWGCt2_Ma22S3VZ9=OFy+J_9LFT+4ftgqzB-7A@mail.gmail.com>
In-Reply-To: <CAMxuvax0uPB+dWGCt2_Ma22S3VZ9=OFy+J_9LFT+4ftgqzB-7A@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Apr 2022 18:50:12 +0400
Message-ID: <CAMxuvax4SaY7TBAc_fWfQHv9X49WRKvCLJ+Hd5wenVGA7Nr6Vg@mail.gmail.com>
Subject: Re: [PATCH 17/41] doc/build-platforms: document supported compilers
To: Thomas Huth <thuth@redhat.com>
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Apr 20, 2022 at 6:46 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Wed, Apr 20, 2022 at 6:37 PM Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 20/04/2022 16.10, Daniel P. Berrang=C3=A9 wrote:
> > > On Wed, Apr 20, 2022 at 05:26:00PM +0400, marcandre.lureau@redhat.com=
 wrote:
> > >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >>
> > >> According to our configure checks, this is the list of supported
> > >> compilers.
> > >>
> > >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> > >> ---
> > >>   docs/about/build-platforms.rst | 10 ++++++++++
> > >>   1 file changed, 10 insertions(+)
> > >>
> > >> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platf=
orms.rst
> > >> index c29a4b8fe649..1980c5d2476f 100644
> > >> --- a/docs/about/build-platforms.rst
> > >> +++ b/docs/about/build-platforms.rst
> > >> @@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
> > >>   The version of the Windows API that's currently targeted is Vista =
/ Server
> > >>   2008.
> > >>
> > >> +Supported compilers
> > >> +-------------------
> > >> +
> > >> +To compile, QEMU requires either:
> > >> +
> > >> +- GCC >=3D 7.4.0
> > >> +- Clang >=3D 6.0
> > >> +- XCode Clang >=3D 10.0
> > >
> > > Do we need to spell out the versions explicitly ? These versions are
> > > all derived from what's available in the repos of the supported build
> > > platforms, similar to any other build deps we have. I don't think we
> > > want to start a precedent of duplicating versions in this doc for
> > > build deps we have, and there's nothing particularly special about
> > > compilers in this respect.
> >
> > I agree with Daniel - when I saw this patch, the first thought that I h=
ad
> > was: "This will be getting out of sync quickly" ...
>
> I don't have the impression we bump our compiler requirement regularly
> or lightly.
>
> > so I'd also recommend to rather not add this here.
>
> Outdated documentation is still better than no documentation. YMMV.

Another question that is difficult to answer without being familiar
with QEMU details is whether it can compile with MSVC. This
documentation would, since it is explicit about the requirement.

It is not excluded that subprojects can compile with MSVC in a near
future for example.


