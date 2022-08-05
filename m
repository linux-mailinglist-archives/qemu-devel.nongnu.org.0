Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F558A99F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:44:16 +0200 (CEST)
Received: from localhost ([::1]:38076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuoO-0006PH-Tj
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oJu3m-0000ZR-7x
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:56:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oJu3h-000455-QY
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659693354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/BnTdzjisRIjxJK5Ov21TPizEyyizeI6gPDN0odIhU=;
 b=HtOZcOFddbxChc1P6QX8DHiAzkgLQzt7g9fGiE8j/HU4wqLJuZswxb7V4uUq9KSqFRlGNW
 ES8yu4k7iCNhA0L7C0OyHBkZNdQIQPO2om6WUmEoneojm9qB5yg3npkHqBUqHCqv1gKQ87
 M4dstZnduEoYOGcepQzMrSBUK+33nFk=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-0HP4HaxJMYuUgUWQifEbgw-1; Fri, 05 Aug 2022 05:55:53 -0400
X-MC-Unique: 0HP4HaxJMYuUgUWQifEbgw-1
Received: by mail-oi1-f200.google.com with SMTP id
 r2-20020acac102000000b0033b5d4ad976so900738oif.8
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=s/BnTdzjisRIjxJK5Ov21TPizEyyizeI6gPDN0odIhU=;
 b=rxVFOG4peTZ7cRphZJb7WmIjZgLkW/sxTkDVP7jHyD/mS0KAKaTigYPJyWJ+NjpLsZ
 PsesdV1B4sM4zB0ujY9exwtdVstnvVkSQ7y0nty7b3onmOQe7jCSVqtFVjXeLix/tR1J
 pM0nZVCQR5dO3Ku9Q6zlSVk9Y12WVFIW6oOuZ0XR2OYPsmbBu+g0MeJMkJVBli2mJ5MP
 JxyyNe9xA29bu5iWkI2zEFvpKIJvaa/QLBjnL3YGxBy9GtR6it2FkR9tnrlM9lTGBL3i
 6q1qzzjf6QrTaXKs2OPeesakFAf/OxKm54DXuvm4Dczz1mvgO0uCsITwVdlrNyMQ9S8b
 QtCw==
X-Gm-Message-State: ACgBeo3Wdlbz8u4plKkvSLoXE5WcCuXo+0pIxc2t3YyjMTbydPpR53B6
 LmDEoiKLTSvjlSvA8IQ3uWk7FMneyx2AXqQhivyFvVoAlGMRBTYqd0KzjTrkGvBfcxPZ4CkKz4H
 GRMLfQ4IxB6hW1Yv35zVdnotCOrJjFBM=
X-Received: by 2002:a05:6830:4126:b0:61c:9d98:a511 with SMTP id
 w38-20020a056830412600b0061c9d98a511mr2286944ott.378.1659693352861; 
 Fri, 05 Aug 2022 02:55:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5IEvjThg3z7mfkXqaNzNRegW01cdTPx51NZlssX+Kc0M7gQVAmI250tDO/87kvw03TQUN9+toC0TxGfmNMKv4=
X-Received: by 2002:a05:6830:4126:b0:61c:9d98:a511 with SMTP id
 w38-20020a056830412600b0061c9d98a511mr2286937ott.378.1659693352621; Fri, 05
 Aug 2022 02:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220726083232.2567756-1-marcandre.lureau@redhat.com>
 <Yt+pabvylcNdh0wL@redhat.com>
In-Reply-To: <Yt+pabvylcNdh0wL@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 5 Aug 2022 13:55:41 +0400
Message-ID: <CAMxuvayRg_q6k_KV8LnYy2W0kbfVPZVzB-Ooz7Fzdc84fjBM6A@mail.gmail.com>
Subject: Re: [PATCH] RFC: char: deprecate usage of bidirectional pipe
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, 
 "reviewer:Incompatible changes" <libvir-list@redhat.com>, kraxel@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>
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

On Tue, Jul 26, 2022 at 12:44 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Tue, Jul 26, 2022 at 12:32:32PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > As Ed Swierk explained back in 2006:
> > https://lists.nongnu.org/archive/html/qemu-devel/2006-12/msg00160.html
> >
> > "When qemu writes into the pipe, it immediately reads back what it just
> > wrote and treats it as a monitor command, endlessly breathing its own
> > exhaust."
> >
> > This is similarly confusing when using the chardev with a serial device=
,
> > as reported in https://bugzilla.redhat.com/show_bug.cgi?id=3D2106975.
> >
> > It seems we have kept the support for bidirectional pipes for historica=
l
> > reasons and odd systems, however it's not documented in qemu -chardev
> > options. I suggest to stop supporting it, for portability reasons.
>
> Hmm, I always assumed that in this scenario the pipe was operating
> in output-only mode. Obviously not the case with the code as it
> exists, but perhaps this would be useful ?  eg its good as a serial
> console logging mechanism at least.

The current "-chardev pipe,id=3Did,path=3Dpath" option handling will first
check the presence of unidirectional "path.in" & "path.out" (although
they are opened RDWR...), and fallback on bidirectional "path".

We could allow for the presence of "path.out" alone, although this may
be a behaviour/breaking change:

diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index 7db963035e..f78bcd7daf 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -137,12 +137,12 @@ static void qemu_chr_open_pipe(Chardev *chr,
     g_free(filename_in);
     g_free(filename_out);
     if (fd_in < 0 || fd_out < 0) {
+        if (fd_out >=3D 0) {
+            goto out;
+        }
         if (fd_in >=3D 0) {
             close(fd_in);
         }
-        if (fd_out >=3D 0) {
-            close(fd_out);
-        }
         warn_report("Support for bidirectional pipe is deprecated,");
         warn_report("please use portable one-way pipes instead (%s.in
& %s.out).",
                     filename, filename);
@@ -152,6 +152,7 @@ static void qemu_chr_open_pipe(Chardev *chr,
             return;
         }
     }
+out:
     qemu_chr_open_fd(chr, fd_in, fd_out);


or we introduce a new "access=3Dwrite" option, or a new chardev type ?

>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  docs/about/deprecated.rst | 6 ++++++
> >  chardev/char-pipe.c       | 4 ++++
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > index 7ee26626d5cf..dd5ca30d527b 100644
> > --- a/docs/about/deprecated.rst
> > +++ b/docs/about/deprecated.rst
> > @@ -45,6 +45,12 @@ transmit audio through the VNC protocol.
> >  ``tty`` and ``parport`` are aliases that will be removed. Instead, the
> >  actual backend names ``serial`` and ``parallel`` should be used.
> >
> > +``-chardev pipe`` support for bidirectional pipes (since 7.1)
> > +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> > +
> > +For portability reasons, the support for bidirectional ``pipe`` will
> > +be removed. Instead, use ``file.in`` & ``file.out`` unidirectional pip=
es.
> > +
> >  Short-form boolean options (since 6.0)
> >  ''''''''''''''''''''''''''''''''''''''
> >
> > diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
> > index 66d3b8509183..7db963035e7d 100644
> > --- a/chardev/char-pipe.c
> > +++ b/chardev/char-pipe.c
> > @@ -27,6 +27,7 @@
> >  #include "qemu/main-loop.h"
> >  #include "qemu/module.h"
> >  #include "qemu/option.h"
> > +#include "qemu/error-report.h"
> >  #include "chardev/char.h"
> >
> >  #ifdef _WIN32
> > @@ -142,6 +143,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
> >          if (fd_out >=3D 0) {
> >              close(fd_out);
> >          }
> > +        warn_report("Support for bidirectional pipe is deprecated,");
> > +        warn_report("please use portable one-way pipes instead (%s.in =
& %s.out).",
> > +                    filename, filename);
> >          TFR(fd_in =3D fd_out =3D qemu_open_old(filename, O_RDWR | O_BI=
NARY));
> >          if (fd_in < 0) {
> >              error_setg_file_open(errp, errno, filename);
> > --
> > 2.37.0.rc0
> >
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


