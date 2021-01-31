Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8CD309E04
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 18:27:01 +0100 (CET)
Received: from localhost ([::1]:59366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6GV1-0003sz-Kj
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 12:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jannik.glueckert@gmail.com>)
 id 1l6EYm-0000vF-3T
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 10:22:46 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:33390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jannik.glueckert@gmail.com>)
 id 1l6EYj-0002Iv-L4
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 10:22:43 -0500
Received: by mail-io1-xd2f.google.com with SMTP id q7so703259iob.0
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 07:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jxuwAdTKG11wn9IvRpLtBO2+IYYeIqKwDGrbmUatWIE=;
 b=KVqitX3AVvQaSb0dazCzg4elE3jI687ILxFcOGC8C1U+3yaSMSJ5b9WivDC6P1THT/
 wzVadWwvvCtpr+oAN3a7v4AHI3YDhzsNpOFHfCwSRURMxISjso0NpOHJVIhKpOxhcR9U
 twgh1Wk/OjLmvzaodlOgMlKmpl7oBD0JR00l3HAXnm0Ah/GhB9IToPfsyPljatknymzO
 7XQdfBQIvfDk4nHBYqu0oYiHrI8tSlNn4LKWV8RwpmFGrdz3xrLr+08YLlIHdpA1fmxW
 6clQBf+XqB1RYLOpcahHJgKhfpwgZCbPW5h4Z5NADUbgXtEer+OKAwDRxooQpn8ayK0/
 t6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jxuwAdTKG11wn9IvRpLtBO2+IYYeIqKwDGrbmUatWIE=;
 b=kSNSAdxFJ5iMU2rhwqDjI6QZ1H8aFAo8coCwR+/Nt4caap97VDvghzsKpqQ7jwostx
 g3mj0HhuzOlSq0G1G5n5bIR15J8zP5WnmBljWDhmGJc3GuAr1jJ3y6tX+G+8Ci0KeSRZ
 4q81DTgAzHm9lvLi4qZguKUzpBP/yBZQQhuL38dxLiU+qzDsEkFr5ZIU7UhaYb7wtgTR
 W6YYoCD6LOGzFyIifdEN6xG0v6xhvGfhPKdqa86k0meqRxEPTKRyVcrVHtcEzq/Zv06y
 vczEhIn3fC5c1FQ+7GNh6QqZgIeeTIFxNoJHU1XXSBwlr9c4P+kY5aqm0gYOiKjgNU6g
 7Y/g==
X-Gm-Message-State: AOAM5314vEZyXjFohbNtqd2bzTqo5kg/Ro4Ie/15eqQt17PgrWVTmQUG
 +xDmmvbUXUChWJhWuIUEHmaOJcR6moZNjlCuCmY=
X-Google-Smtp-Source: ABdhPJzHVfratUPOQa6JC8iWmKg7tPqHyDUJ8VBIdWIRmZsCodKemJCCBG5PBKU5dq1FntELZH5zRDImnaIoW2ATOd4=
X-Received: by 2002:a02:b78e:: with SMTP id f14mr11095053jam.97.1612106559961; 
 Sun, 31 Jan 2021 07:22:39 -0800 (PST)
MIME-Version: 1.0
References: <20210131143434.2513363-1-slyfox@gentoo.org>
 <dbd1e6a4-ccaa-9d30-f537-7572b87e8412@redhat.com>
In-Reply-To: <dbd1e6a4-ccaa-9d30-f537-7572b87e8412@redhat.com>
From: =?UTF-8?Q?Jannik_Gl=C3=BCckert?= <jannik.glueckert@gmail.com>
Date: Sun, 31 Jan 2021 16:22:28 +0100
Message-ID: <CAFqe=zL=T_MXTyY_0F6DapgAOPODpXqnNqFOO00iXi3g=xzQ1g@mail.gmail.com>
Subject: Re: [PATCH] pc-bios/descriptors: fix paths in json files
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=jannik.glueckert@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 31 Jan 2021 12:25:02 -0500
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Sergei Trofimovich <slyfox@gentoo.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Jannik, can you send a Signed-off-by line so we can accept
> your patch? See:
> https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a=
_Signed-off-by:_line

Sure! I hope this is right, I'm not exactly experienced with mailing
list development.

Signed-off-by: Jannik Gl=C3=BCckert <jannik.glueckert@gmail.com>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> > Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> > ---
> >  pc-bios/descriptors/meson.build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meso=
n.build
> > index ac6ec66b00..29efa16d99 100644
> > --- a/pc-bios/descriptors/meson.build
> > +++ b/pc-bios/descriptors/meson.build
> > @@ -9,7 +9,7 @@ if install_edk2_blobs
> >    ]
> >      configure_file(input: files(f),
> >                     output: f,
> > -                   configuration: {'DATADIR': qemu_datadir},
> > +                   configuration: {'DATADIR': get_option('prefix') / q=
emu_datadir},
> >                     install: get_option('install_blobs'),
> >                     install_dir: qemu_datadir / 'firmware')
> >    endforeach
> >


Am So., 31. Jan. 2021 um 15:56 Uhr schrieb Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com>:
>
> On 1/31/21 3:34 PM, Sergei Trofimovich wrote:
> > Before the change /usr/share/qemu/firmware/50-edk2-x86_64-secure.json
> > contained the relative path:
> >             "filename": "share/qemu/edk2-x86_64-secure-code.fd",
> >             "filename": "share/qemu/edk2-i386-vars.fd",
> >
> > After then change the paths are absolute:
> >             "filename": "/usr/share/qemu/edk2-x86_64-secure-code.fd",
> >             "filename": "/usr/share/qemu/edk2-i386-vars.fd",
> >
> > The regression appeared in qemu-5.2.0 (seems to be related
> > to meson port).
> >
> > CC: Paolo Bonzini <pbonzini@redhat.com>
> > CC: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
> > CC: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> > Bug: https://bugs.gentoo.org/766743
> > Bug: https://bugs.launchpad.net/qemu/+bug/1913012
> > Patch-by: Jannik Gl=C3=BCckert
>
> Thanks Jannik and Sergei to fix this issue, I noticed
> the LP#1913012 and planned to look at it tomorrow :)
>
> Jannik, can you send a Signed-off-by line so we can accept
> your patch? See:
> https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a=
_Signed-off-by:_line
>
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> > Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> > ---
> >  pc-bios/descriptors/meson.build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meso=
n.build
> > index ac6ec66b00..29efa16d99 100644
> > --- a/pc-bios/descriptors/meson.build
> > +++ b/pc-bios/descriptors/meson.build
> > @@ -9,7 +9,7 @@ if install_edk2_blobs
> >    ]
> >      configure_file(input: files(f),
> >                     output: f,
> > -                   configuration: {'DATADIR': qemu_datadir},
> > +                   configuration: {'DATADIR': get_option('prefix') / q=
emu_datadir},
> >                     install: get_option('install_blobs'),
> >                     install_dir: qemu_datadir / 'firmware')
> >    endforeach
> >
>

