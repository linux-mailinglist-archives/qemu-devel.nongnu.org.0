Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54ED57E29A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 15:53:04 +0200 (CEST)
Received: from localhost ([::1]:43692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEt5S-0003Hk-6j
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 09:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEsxd-0008Qg-Je
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:44:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEsxb-0004jJ-TK
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658497495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1WLUbgUFxfV4YM/thJrxqvegN+at0TXDzLoCt4FsVYo=;
 b=Ij9L0fF113TouoaaZpXPlVaPTemjAvG3Bk67gDlXSuCDjvXnQyE8LC4C00wB1TyR9/GSau
 zwyLNvDyp9J42+157sOAQT8IKPv58lsqRB3iuGCjhhhppFVgviL2+W/mOpYlBwqpnr9BUp
 u4LYeAtKYZa+mxZSD4doUHKI7NX2q48=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-EejIbIMBOFuFGRjEe-5e0w-1; Fri, 22 Jul 2022 09:44:54 -0400
X-MC-Unique: EejIbIMBOFuFGRjEe-5e0w-1
Received: by mail-il1-f200.google.com with SMTP id
 g8-20020a92cda8000000b002dcbd57f808so2798107ild.4
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 06:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1WLUbgUFxfV4YM/thJrxqvegN+at0TXDzLoCt4FsVYo=;
 b=lDV+9hzF/R7SwD6yYhSwjfSkqXiHif7FadgmwzfQXeu1FOG3N3QsZYx4Q+GZs5JOiy
 VfVQ0ncmPUpiCHvWQNXiG4PxqTzR5OswvzJbHQyjXUaEPUeFoBPd/8NFk/PJfBdm0b10
 MfBB1L4P15JQnaAztttvjHv1SAeNDlien/lTgvcLaddCZmufif5ArojTVxoa4CtX1eFy
 4Xc7i/omZQQQdfkALBT+J2eC3CnzUtv3TU22uSjvW+jkLrUjWct+4dScKOR0q2KzuCMT
 0EZKV1tvAwkCQaihZiiG8SJbaY3lZCD84mipijwT3ySof8IkQ+C2X2+mT6nNp/aiNdVK
 CqvQ==
X-Gm-Message-State: AJIora+5X8GAX0zlq92IP3fU9vxVHaK/p3eSyCwwFU4s7UFL/+nWoVBE
 yZm/NJO+tKG8Q2DNIMUMaVH+QfcjFAWOyjXI/nT5TnOMw42daXm23vkSdGtG2Q9fg8smoKEp50i
 P31xpr66dHrJMzCvPY/JGBqMJytIcWic=
X-Received: by 2002:a6b:5915:0:b0:67b:dbd6:3e04 with SMTP id
 n21-20020a6b5915000000b0067bdbd63e04mr293588iob.8.1658497493451; 
 Fri, 22 Jul 2022 06:44:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1texJuNw/gPdSPv0vKO9OfXie+mv+Ql+cCd/eKAYFX/M8rJ+rUoQtnyBF7ZiUTGCyZOEuLvYStdvY080nDZGo4=
X-Received: by 2002:a6b:5915:0:b0:67b:dbd6:3e04 with SMTP id
 n21-20020a6b5915000000b0067bdbd63e04mr293578iob.8.1658497493192; Fri, 22 Jul
 2022 06:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <e4c8ced1-3ef4-8956-ead5-91110d3cb38c@ilande.co.uk>
 <20220616120715.uksbwjynvb6usjhu@sirius.home.kraxel.org>
 <b93a1312-2272-d7b4-5a45-d04a7fd35840@ilande.co.uk>
 <20220617095558.xggyv6qk7igofii4@sirius.home.kraxel.org>
 <CAMxuvawyO4uViOTUpji553dkqzRmvoL3YbDXXjd3Ca8SMmWxoA@mail.gmail.com>
 <CABLmASGnjbqwueo9T-Ed7x3srS9BME+C18vSfOP955cZtf=i6w@mail.gmail.com>
In-Reply-To: <CABLmASGnjbqwueo9T-Ed7x3srS9BME+C18vSfOP955cZtf=i6w@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 22 Jul 2022 17:44:42 +0400
Message-ID: <CAMxuvayg9S3Z8UL8gGLF+6p=j2sFi58RZpTFNB8NcQbzmx_u9Q@mail.gmail.com>
Subject: Re: Corrupted display changing screen colour depth in
 qemu-system-ppc/MacOS
To: Howard Spoelstra <hsp.cat7@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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

Hi

On Fri, Jul 22, 2022 at 4:28 PM Howard Spoelstra <hsp.cat7@gmail.com> wrote=
:
>
>
>
> On Fri, Jun 17, 2022 at 2:38 PM Marc-Andr=C3=A9 Lureau <marcandre.lureau@=
redhat.com> wrote:
>>
>> Hi
>>
>> On Fri, Jun 17, 2022 at 1:56 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>> >
>> >   Hi,
>> >
>> > > > Can you try ditch the QEMU_ALLOCATED_FLAG check added by the commi=
t?
>> > >
>> > > Commit cb8962c146 drops the QEMU_ALLOCATED_FLAG check: if I add it b=
ack in
>> > > with the following diff on top then everything works again:
>> >
>> > Ah, the other way around.
>> >
>> > > diff --git a/ui/console.c b/ui/console.c
>> > > index 365a2c14b8..decae4287f 100644
>> > > --- a/ui/console.c
>> > > +++ b/ui/console.c
>> > > @@ -2400,11 +2400,12 @@ static void vc_chr_open(Chardev *chr,
>> > >
>> > >  void qemu_console_resize(QemuConsole *s, int width, int height)
>> > >  {
>> > > -    DisplaySurface *surface;
>> > > +    DisplaySurface *surface =3D qemu_console_surface(s);
>> > >
>> > >      assert(s->console_type =3D=3D GRAPHIC_CONSOLE);
>> > >
>> > > -    if (qemu_console_get_width(s, -1) =3D=3D width &&
>> > > +    if (surface && (surface->flags & QEMU_ALLOCATED_FLAG) &&
>> > > +        qemu_console_get_width(s, -1) =3D=3D width &&
>> > >          qemu_console_get_height(s, -1) =3D=3D height) {
>> > >          return;
>> > >      }
>> > >
>> > > > Which depth changes triggers this?  Going from direct color to a
>> > > > paletted mode?
>> > >
>> > > A quick test suggests anything that isn't 32-bit colour is affected.
>> >
>> > Hmm, I think the commit should simply be reverted.
>> >
>> > Short-cutting the qemu_console_resize() call is only valid in case the
>> > current surface was created by qemu_console_resize() too.  When it is
>> > something else -- typically a surface backed by vga vram -- it's not.
>> > Looking at the QEMU_ALLOCATED_FLAG checks exactly that ...
>>
>> Oh ok, it might be worth adding a comment to clarify that. By
>> reverting, we are going back to the situation where
>> qemu_console_resize() will create a needless surface when rendering
>> with GL. As I tried to explain in the commit message, it will need
>> more changes to prevent that. I can take a look later.
>>
>
> Hi Marc-Andr=C3=A9,
>
> I wondered whether you've had a chance to look at this?
>

No, it's not clear to me how to reproduce it. Someone that can
actually test it should send a patch with some comments to explain it.

thanks


