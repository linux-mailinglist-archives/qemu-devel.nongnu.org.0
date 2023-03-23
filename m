Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAB46C6B4D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 15:42:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfM8B-0002lr-D4; Thu, 23 Mar 2023 10:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pfM89-0002lh-Qp
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 10:41:29 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pfM87-0003zI-UB
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 10:41:29 -0400
Received: by mail-lf1-x12d.google.com with SMTP id g17so28072615lfv.4
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 07:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679582485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJ3CX+miA+pwELeJ1aAondBCo6B9Tztq6oT8H+OGsls=;
 b=I9acvnsaCZDa3U7BC8FH/B95iYQYq/1/AioUBSiiz5E3+4/LAEEE/NMojWnq57Y6Bl
 0qU03ENEoC0KYWI9xZRzMR3sdpLcV0hkblXb13wNgA2616D2M5yGiDdb+f+WxMvYBGf/
 Kqe6wiIYgR/s+IlajO2zGD24m2e+pR86synJn3sAGWBrGSCYQhuJKQk6Si4gS2u9ZYjT
 gcO+yNnh4pQOwJHUul77V4oQJtb0DFM8/hECDB5LI+LBmaLP4jJ7D8Kz4x8E9mOuafAf
 WQawgiNU2sU6nQSN95vnYGVZox/x5X4tgPLgp0w0Wi4VvFCVOUqGmWrhDkOWar5gJS8s
 yyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679582485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJ3CX+miA+pwELeJ1aAondBCo6B9Tztq6oT8H+OGsls=;
 b=sG6B0CnCGJU7ttGApz3NYhyk5Bf5gaCLqTl3VGureZU2kyxe6KO4E3FdVocpqCp3Hu
 3GgDoJmKXWcBn2EiVB5DluUf0cFThTac/Ol544JeLecbDuJPJs+bhrx7D2VwBDdrXSO/
 c876uUevXOk+RKB98GUvpr2N/Ve9kuJ0FT9Wa5OdQipNffakgY2Bz7XCX9p4R3w9WpsT
 /80dtZ2ytPQe2QrZU1DqYLet3ofuL6jbrNtumVjkZiFsuGc8CpT1vUO2DWWJvfF8/oqB
 ygyZwmT5w8jvVV6cYoQKz+WcVRWJG3LAyM3TAuPxu6XNTrk0w3D6vlTS6ZWmT9+tTO8N
 QRKw==
X-Gm-Message-State: AO0yUKUsAUu0yAazJBBrjIHOzDxkm6ASRn6lIkZUfTQGh0C3oiDFa9s4
 iJaFrffWTLkUmJSkJPFCxqEumzL9ttZCyYj1sUs=
X-Google-Smtp-Source: AK7set9XGVwI2D6Colyuve4VmNezXPJME1O/PhhwnIsy2jKzm/mVTCyrDtdaDLuH2ebHC3YE7o2bVfYKLdbJheJLhD0=
X-Received: by 2002:ac2:5334:0:b0:4ea:e5b5:9670 with SMTP id
 f20-20020ac25334000000b004eae5b59670mr3147807lfh.11.1679582484987; Thu, 23
 Mar 2023 07:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230320160856.364319-1-ernunes@redhat.com>
 <IA0PR11MB71850EDD187027261A5D260BF8819@IA0PR11MB7185.namprd11.prod.outlook.com>
 <a38996cb-1ca9-6bfd-3fb8-2ba037243472@redhat.com>
 <IA0PR11MB7185E1E1B14D97797D672C2EF8879@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7185E1E1B14D97797D672C2EF8879@IA0PR11MB7185.namprd11.prod.outlook.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 23 Mar 2023 18:41:13 +0400
Message-ID: <CAJ+F1CK28C4EL=abcJWo3TOZqsMxdTnrbE0Y40Jabn-vFXaBbg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ui/gtk: use widget size for cursor motion event
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Erico Nunes <ernunes@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Erico

On Thu, Mar 23, 2023 at 9:02=E2=80=AFAM Kasireddy, Vivek
<vivek.kasireddy@intel.com> wrote:
>
> Hi Erico,
>
> > >
> > >>
> > >> The gd_motion_event size has some calculations for the cursor positi=
on,
> > >> which also take into account things like different size of the
> > >> framebuffer compared to the window size.
> > >> The use of window size makes things more difficult though, as at lea=
st
> > >> in the case of Wayland includes the size of ui elements like a menu =
bar
> > >> at the top of the window. This leads to a wrong position calculation=
 by
> > >> a few pixels.
> > >> Fix it by using the size of the widget, which already returns the si=
ze
> > >> of the actual space to render the framebuffer.
> > >>
> > >> Signed-off-by: Erico Nunes <ernunes@redhat.com>
> > >> ---
> > >>  ui/gtk.c | 8 +++-----
> > >>  1 file changed, 3 insertions(+), 5 deletions(-)
> > >>
> > >> diff --git a/ui/gtk.c b/ui/gtk.c
> > >> index fd82e9b1ca..d1b2a80c2b 100644
> > >> --- a/ui/gtk.c
> > >> +++ b/ui/gtk.c
> > >> @@ -868,7 +868,6 @@ static gboolean gd_motion_event(GtkWidget *widge=
t,
> > >> GdkEventMotion *motion,
> > >>  {
> > >>      VirtualConsole *vc =3D opaque;
> > >>      GtkDisplayState *s =3D vc->s;
> > >> -    GdkWindow *window;
> > >>      int x, y;
> > >>      int mx, my;
> > >>      int fbh, fbw;
> > >> @@ -881,10 +880,9 @@ static gboolean gd_motion_event(GtkWidget
> > *widget,
> > >> GdkEventMotion *motion,
> > >>      fbw =3D surface_width(vc->gfx.ds) * vc->gfx.scale_x;
> > >>      fbh =3D surface_height(vc->gfx.ds) * vc->gfx.scale_y;
> > >>
> > >> -    window =3D gtk_widget_get_window(vc->gfx.drawing_area);
> > >> -    ww =3D gdk_window_get_width(window);
> > >> -    wh =3D gdk_window_get_height(window);
> > >> -    ws =3D gdk_window_get_scale_factor(window);
> > >> +    ww =3D gtk_widget_get_allocated_width(widget);
> > >> +    wh =3D gtk_widget_get_allocated_height(widget);
> > > [Kasireddy, Vivek] Could you please confirm if this works in X-based =
compositor
> > > environments as well? Last time I checked (with Fedora 36 and Gnome +=
 X), the
> > > get_allocated_xxx APIs were not accurate in X-based environments. The=
refore,
> > > I restricted the above change to Wayland-based environments only:
> > > https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03100.htm=
l
> >
> > Yes, I tested again and it seems to work fine for me even with the gtk
> > ui running on X. I'm using Fedora 37.
> [Kasireddy, Vivek] Ok, in that case, this patch is
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>
> >
> > I was not aware of that patch series though and just spent some time
> > debugging these ui issues. It looks like your series was missed?
> [Kasireddy, Vivek] Yeah, not sure why my series was missed but in
> retrospect, I probably should have separated out bug fix patches
> from new feature enablement patches.
>
> >
> > I'm still debugging additional issues with cursor position calculation,
> > especially in wayland environments (and in particular with
> > vhost-user-gpu now). Do those patches address more cursor issues?
> [Kasireddy, Vivek] They do address more cursor issues but not sure how
> helpful they would be for you as most of them deal with relative mode +
> Wayland environment. However, there is another one that deals with
> cursor/pointer in absolute mode + multiple monitors:
> https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03097.html
>

Should we queue the 2 patches from this series? (note that they were
not correctly handled by patchew, probably because you dropped the
cover letter).

For me -display gtk is unusable on hidpi & wayland anyway, because the
cursor position given to the guest does not match the dimensions given
for the monitor.

Also relative mouse support is broken as well (mouse wrapping and
confinement/grab is not supported by gdk/gtk on wayland).

I am not actively looking at these problems, they are "solved" with
spice (use -display spice-app). And I am also regularly working on a
gtk4/rust widget, using -display dbus
(https://gitlab.gnome.org/malureau/rdw). There is also
https://gitlab.gnome.org/chergert/libmks as a gtk4/C alternative. I am
not sure we should keep maintaining the gtk3 backend going forward.
And as a Gtk4/-display dbus client mature, I hope we can offer a
better alternative than ui/sdl or ui/cocoa on other platforms as well.


--=20
Marc-Andr=C3=A9 Lureau

