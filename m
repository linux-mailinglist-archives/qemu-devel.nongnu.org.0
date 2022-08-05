Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C521C58A8F3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:42:21 +0200 (CEST)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJtqT-0001nG-Cg
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oJtkp-0004Uy-4Y
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:36:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oJtkm-00016u-Kl
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659692180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jO5dOwlHO6OEbgl4xy5e2woHhtaWy2diPYqL7jgWXgc=;
 b=KbNqai1liWEydRRmJmYMCpjHJWGKyZOcT6YQgjC77tBf98sPG250n8MTG/lUZGJwM32GMa
 Nk21S5W+yb9jySRehrKx+bgz8au6rChRNrI9daDPmlcM7Z/1zlcgKhzdSt68i9c5I3SHx+
 sF7yYPZT6kOU+azv7r/4LZSQ7s+bCAo=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-X5jDcAPdMVCR1uNk2FXNpw-1; Fri, 05 Aug 2022 05:36:19 -0400
X-MC-Unique: X5jDcAPdMVCR1uNk2FXNpw-1
Received: by mail-oi1-f200.google.com with SMTP id
 i2-20020aca0c42000000b003400856cd82so882657oiy.15
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=jO5dOwlHO6OEbgl4xy5e2woHhtaWy2diPYqL7jgWXgc=;
 b=Zqhx6QH+cx/YMT12yvkzcONHhIZh/l8XdAJWYuvBCsNl/xn0ngP+gmymRLB8gCglov
 +9eBe8Z0WBZ0tdA3o3KWoOKk9M+b6Sscct0WUyvinX9cJX4DlVTt1cEcTDozbBBxnIrN
 0BI4TBa2rCV3dDIrXmjORzmjP2QSIovmHHYPPhAniOwbQYlaueVL/AbM9xqe50DHN9lt
 aL2y5YLDVjsrRLBTVE0SRLAUlUJkD8LKtzO+ko+R7Sga6ec+VioXT+FVfzXlafkCw/zk
 hr+eW1YKjbzA+Y5eW2WI+P+CORPiSfAaZzINMeZ4CiiPc+ymHbmHm48c89PWcPrmjm3r
 KMvA==
X-Gm-Message-State: ACgBeo2DsDzWxzm7GWwBdz+CZfR29crX0eQepcFGH5TcC2MMOGAFvzMj
 /bS0Y1q2OynmnhO7zVrtC2dz//iOFeLagRpOqeDtAaod2LyGEmHRGOXuu5WER5q6a0gLqi2/tL5
 31wchvJFl0mwBfXjQZMcqMJ4QTZxIYF4=
X-Received: by 2002:a05:6808:1c06:b0:33a:9b3b:b3ce with SMTP id
 ch6-20020a0568081c0600b0033a9b3bb3cemr2632100oib.53.1659692178565; 
 Fri, 05 Aug 2022 02:36:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6hQ5rRWFxDen0VvALDSNVy5UhFRRHrdMBzgiHY0yb/8I8I6qCqRjof3sAJkvWO+OkhAxdFiqK7Np+l9TBk0Po=
X-Received: by 2002:a05:6808:1c06:b0:33a:9b3b:b3ce with SMTP id
 ch6-20020a0568081c0600b0033a9b3bb3cemr2632093oib.53.1659692178274; Fri, 05
 Aug 2022 02:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220725115815.2461322-1-marcandre.lureau@redhat.com>
 <291cacc9-ac68-4a3e-edc0-fb226bdceaf3@ilande.co.uk>
 <ac00cbb9-e225-a7fa-ec43-d763fb985060@ilande.co.uk>
In-Reply-To: <ac00cbb9-e225-a7fa-ec43-d763fb985060@ilande.co.uk>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 5 Aug 2022 13:36:07 +0400
Message-ID: <CAMxuvazx5GGUzo0n_TcgA0FxkFmaecVdAXY4mutRFW+M+CrJdQ@mail.gmail.com>
Subject: Re: [PATCH] ui/console: fix qemu_console_resize() regression
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, kraxel@redhat.com
Cc: qemu-devel@nongnu.org
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

On Thu, Aug 4, 2022 at 12:11 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 25/07/2022 17:35, Mark Cave-Ayland wrote:
>
> > On 25/07/2022 12:58, marcandre.lureau@redhat.com wrote:
> >
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> The display may be corrupted when changing screen colour depth in
> >> qemu-system-ppc/MacOS since 7.0.
> >
> > Is it worth being more specific here? Whilst MacOS with its NDRV driver=
 exhibits the
> > issue, it's really only because MacOS has separate selections for depth=
 and
> > resolution which allows one to be set without updating the other. I did=
 a quick play
> > with the Forth reproducer, and even with current git master the issue g=
oes away if
> > you also change the width/height at the same time as the depth.
> >
> >> Do not short-cut qemu_console_resize() if the surface is backed by vga
> >> vram. When the scanout isn't set, or it is already allocated, or openg=
l,
> >> and the size is fitting, we still avoid the reallocation & replace pat=
h.
> >>
> >> Fixes: commit cb8962c1 ("ui: do not create a surface when resizing a G=
L scanout")
> >>
> >> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> ---
> >>   ui/console.c | 6 ++++--
> >>   1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/ui/console.c b/ui/console.c
> >> index e139f7115e1f..765892f84f1c 100644
> >> --- a/ui/console.c
> >> +++ b/ui/console.c
> >> @@ -2575,11 +2575,13 @@ static void vc_chr_open(Chardev *chr,
> >>   void qemu_console_resize(QemuConsole *s, int width, int height)
> >>   {
> >> -    DisplaySurface *surface;
> >> +    DisplaySurface *surface =3D qemu_console_surface(s);
> >>       assert(s->console_type =3D=3D GRAPHIC_CONSOLE);
> >> -    if (qemu_console_get_width(s, -1) =3D=3D width &&
> >> +    if ((s->scanout.kind !=3D SCANOUT_SURFACE ||
> >> +         (surface && surface->flags & QEMU_ALLOCATED_FLAG)) &&
> >> +        qemu_console_get_width(s, -1) =3D=3D width &&
> >>           qemu_console_get_height(s, -1) =3D=3D height) {
> >>           return;
> >>       }
> >
> > The criteria listed for the short-cut in the commit message are quite h=
andy, so is it
> > worth adding a comment along the same lines as a reminder? Or is this l=
ogic touched
> > so rarely that it isn't worthwhile?

I don't know how often it will change, but it seems a bit fragile to
me. I can add the commit comment along.

> >
> > Regardless of the above, thanks for coming up with the patch and I can =
confirm that
> > it fixes both the Forth reproducer and the changing of the Monitor colo=
ur depth in
> > MacOS itself:
> >
> > Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
> Hi Marc-Andr=C3=A9,
>
> Are you planning to submit this as a fix for 7.1? I think it would certai=
nly qualify
> as a bug fix, and would likely affect users other than just qemu-system-p=
pc/MacOS.

Gerd, could you review the patch and let me send a MR ? (or do you
have other UI patches queued already and take it?)


