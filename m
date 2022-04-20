Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A6F508BDA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:12:33 +0200 (CEST)
Received: from localhost ([::1]:38382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhC0O-0004u4-KD
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhBmb-00084i-KJ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:58:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhBmZ-0002wk-6L
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650466694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Laq/3aBF++1gY0TlVpEeKloB/2C7D5af6b+jPpcFbgk=;
 b=fRhxyhCThZoEm6OyasVitoUJbu7dWFUQJy9tweyV+64i4i9JTZIsSOZJeYCkt4OyVcVJM1
 ckFTZEFJJ/CU5BFGFyGzHs62SpYLFcuZMSh2CAgOmZRokr4ELf6SMbg4T0jL5YTlMCEJx5
 cWRoa4ZIuvwyspz5TkyyMfGdh0vqTbI=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-6a4Z0sZ-PfC6n1yvsQNUkw-1; Wed, 20 Apr 2022 10:58:11 -0400
X-MC-Unique: 6a4Z0sZ-PfC6n1yvsQNUkw-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-2ebfdbe01f6so17315087b3.10
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Laq/3aBF++1gY0TlVpEeKloB/2C7D5af6b+jPpcFbgk=;
 b=KCzA2Xyek13rp1BM0r3pX3IrRUhjqJjTaLMEICuKV/jdfNS0I6mdf8n4spPkT8R9n7
 i6gVKhWo8fNDNh5Z8aJDSQP/7k2pZ3fu8KZhezPRJdi25PyeiKMXpdUOnO8fYKwZImqH
 RAbk0k7V9rQmpRruD4/ZRMQ3qo5Ic1dcootRsiDKuTHyvio9LitiJElAR+jP9q/VHazS
 FTSQvFOwvVugWqTd7OqHPzbJBT46Yn2kfLYv9wBHlr0Ztak4VLt0bPbFU9yEsIV6ELUn
 Kj3i9Ffx8gaOpMlC7xbcX3uq6HzPDIj0IyA0+KAWIwsnlDc0C8kMAjd+sJPLBgI5v5kt
 S2qw==
X-Gm-Message-State: AOAM5336/oFRIgh6djOKjguZ+FMcQgBalI3NzwVXwKHYm+8t8ZAtGbBB
 iMNj4LJYP4QMLYvVUfkip3KqUUYiTDL7sYppF4kldVxdeubIMU0E9HzWumZndsU2uSzSXd2xEl3
 z6fz/g9KlxBGkNeOZbFnprfvAKDTRBxU=
X-Received: by 2002:a25:8c01:0:b0:634:712d:3def with SMTP id
 k1-20020a258c01000000b00634712d3defmr19910082ybl.343.1650466690802; 
 Wed, 20 Apr 2022 07:58:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT0vxaO4ggZEldBVYTf4XGsGBuWwU/r27p1aDTg1oiIv53vy9Z8WO1ZKB2hnZV9AKMt8SxTGPY7tYS7XvlUAs=
X-Received: by 2002:a25:8c01:0:b0:634:712d:3def with SMTP id
 k1-20020a258c01000000b00634712d3defmr19910065ybl.343.1650466690592; Wed, 20
 Apr 2022 07:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-18-marcandre.lureau@redhat.com>
 <YmAUaMp7kTRaRCGY@redhat.com>
 <840f08cb-e28c-6802-96c7-b1f82dd36427@redhat.com>
 <CAMxuvax0uPB+dWGCt2_Ma22S3VZ9=OFy+J_9LFT+4ftgqzB-7A@mail.gmail.com>
 <fec475b9-b1c9-e9bf-5e90-6c4b0c73d4e6@redhat.com>
In-Reply-To: <fec475b9-b1c9-e9bf-5e90-6c4b0c73d4e6@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Apr 2022 18:57:59 +0400
Message-ID: <CAMxuvaw7JSjbPmBBMzavae=+cyX=3OB37i09vV5esKBkbOZFOA@mail.gmail.com>
Subject: Re: [PATCH 17/41] doc/build-platforms: document supported compilers
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Apr 20, 2022 at 6:53 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 20/04/2022 16.46, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Apr 20, 2022 at 6:37 PM Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 20/04/2022 16.10, Daniel P. Berrang=C3=A9 wrote:
> >>> On Wed, Apr 20, 2022 at 05:26:00PM +0400, marcandre.lureau@redhat.com=
 wrote:
> >>>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>>>
> >>>> According to our configure checks, this is the list of supported
> >>>> compilers.
> >>>>
> >>>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>>> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> >>>> ---
> >>>>    docs/about/build-platforms.rst | 10 ++++++++++
> >>>>    1 file changed, 10 insertions(+)
> >>>>
> >>>> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platf=
orms.rst
> >>>> index c29a4b8fe649..1980c5d2476f 100644
> >>>> --- a/docs/about/build-platforms.rst
> >>>> +++ b/docs/about/build-platforms.rst
> >>>> @@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
> >>>>    The version of the Windows API that's currently targeted is Vista=
 / Server
> >>>>    2008.
> >>>>
> >>>> +Supported compilers
> >>>> +-------------------
> >>>> +
> >>>> +To compile, QEMU requires either:
> >>>> +
> >>>> +- GCC >=3D 7.4.0
> >>>> +- Clang >=3D 6.0
> >>>> +- XCode Clang >=3D 10.0
> >>>
> >>> Do we need to spell out the versions explicitly ? These versions are
> >>> all derived from what's available in the repos of the supported build
> >>> platforms, similar to any other build deps we have. I don't think we
> >>> want to start a precedent of duplicating versions in this doc for
> >>> build deps we have, and there's nothing particularly special about
> >>> compilers in this respect.
> >>
> >> I agree with Daniel - when I saw this patch, the first thought that I =
had
> >> was: "This will be getting out of sync quickly" ...
> >
> > I don't have the impression we bump our compiler requirement regularly
> > or lightly.
>
> "quickly" in the sense of that it will be out of sync once somebody bumps
> the version check in the "configure" script - since I doubt that it will =
be
> remembered to update this document here as well.
>
> >> so I'd also recommend to rather not add this here.
> >
> > Outdated documentation is still better than no documentation. YMMV.
>
> Well, no. In this case, it might rather create wrong expectations for the
> users if they read that their compiler is still supported, but the config=
ure
> script refuses it.
>
> Anyway, if you feel like we need more information for the users about
> supported systems and compiler versions, feel free to update this page he=
re
> instead, it has also fallen behind already quite a bit:
>
>   https://wiki.qemu.org/Supported_Build_Platforms

Unfortunately, that page is not helpful to answer the question which
compiler is required. And given it's construction, it is by nature
always obsolete :)

Furthermore, nowadays, we should have reference documentation in the
repo, not on the wiki.


