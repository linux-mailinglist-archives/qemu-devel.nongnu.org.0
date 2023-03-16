Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC966BCF4E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:21:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcman-0002lz-Ac; Thu, 16 Mar 2023 08:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pcmah-0002ie-33
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:20:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pcmae-00080V-TC
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678969215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hOyi0X2VOrc5XtCJHAVuYsu2fDWWnJ1HSUIciVV7TWU=;
 b=WYfS3brYrfBtfC0TjRoz/WqMHiVZ3ddeMzftIIy667A6bzGD2Ds7ifzJUVzniq5FDWzdKl
 FONyd9cz3ZsYHg1q1n7jr4/zta1j/ZVNa7wtPTiB/QPo7ZpLo6rYwTb8z4jaFrFF3NGQ1I
 Z3SXj8CJfSqMDS4zoyPR2gvmmi9Ny2g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-ND4WokQOPM6HBe_ldlT0Dw-1; Thu, 16 Mar 2023 08:20:11 -0400
X-MC-Unique: ND4WokQOPM6HBe_ldlT0Dw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4077388B767;
 Thu, 16 Mar 2023 12:20:11 +0000 (UTC)
Received: from localhost (unknown [10.33.36.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D265243FBE;
 Thu, 16 Mar 2023 12:20:10 +0000 (UTC)
Date: Thu, 16 Mar 2023 13:21:28 +0100
From: Sergio Lopez <slp@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 4/4] ui/gtk: enable backend to send multi-touch events
Message-ID: <20230316122128.fwhl2dsu5uyomgwf@mhamilton>
References: <20230218162216.46944-1-slp@redhat.com>
 <20230218162216.46944-5-slp@redhat.com>
 <CAJ+F1C+An6Mbi0DdXVQ2z-VjEUZDkBGVwzo633N_Eeqr53CdHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cewm54m2z6qumi7l"
Content-Disposition: inline
In-Reply-To: <CAJ+F1C+An6Mbi0DdXVQ2z-VjEUZDkBGVwzo633N_Eeqr53CdHA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


--cewm54m2z6qumi7l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 19, 2023 at 12:28:22PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi Sergio
>=20
> On Sat, Feb 18, 2023 at 8:23 PM Sergio Lopez <slp@redhat.com> wrote:
> >
> > GTK3 provides the infrastructure to receive and process multi-touch
> > events through the "touch-event" signal and the GdkEventTouch type.
> > Make use of it to transpose events from the host to the guest.
> >
> > This allows users of machines with hardware capable of receiving
> > multi-touch events to run guests that can also receive those events
> > and interpret them as gestures, when appropriate.
> >
> > An example of this in action can be seen here:
> >
> >  https://fosstodon.org/@slp/109545849296546767
> >
> > Signed-off-by: Sergio Lopez <slp@redhat.com>
>=20
> > ---
> >  ui/gtk.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >
> > diff --git a/ui/gtk.c b/ui/gtk.c
> > index fd82e9b1ca..bf1e7f086d 100644
> > --- a/ui/gtk.c
> > +++ b/ui/gtk.c
> > @@ -130,6 +130,13 @@ typedef struct VCChardev VCChardev;
> >  DECLARE_INSTANCE_CHECKER(VCChardev, VC_CHARDEV,
> >                           TYPE_CHARDEV_VC)
> >
> > +struct touch_slot {
> > +    int x;
> > +    int y;
> > +    int tracking_id;
> > +};
> > +static struct touch_slot touch_slots[INPUT_EVENT_SLOTS_MAX];
> > +
> >  bool gtk_use_gl_area;
> >
> >  static void gd_grab_pointer(VirtualConsole *vc, const char *reason);
> > @@ -1058,6 +1065,74 @@ static gboolean gd_scroll_event(GtkWidget *widge=
t, GdkEventScroll *scroll,
> >  }
> >
> >
> > +static gboolean gd_touch_event(GtkWidget *widget, GdkEventTouch *touch,
> > +                               void *opaque)
> > +{
> > +    VirtualConsole *vc =3D opaque;
> > +    struct touch_slot *slot;
> > +    uint64_t num_slot =3D (uint64_t) touch->sequence;
>=20
> Perhaps use GPOINTER_TO_UINT?

Yes, this looks better.

> > +    int update;
> > +    int type =3D -1;
> > +    int i;
> > +
> > +    if (num_slot >=3D INPUT_EVENT_SLOTS_MAX) {
> > +        return FALSE;
> > +    }
>=20
> Hmm, a pointer < INPUT_EVENT_SLOTS_MAX ?
>=20
> This seems to work because the wayland GDK backend uses presumably
> evdev slot id + 1.. We may want to have some slot id mapping, or at
> least report some warning for discarded events.

It's weird, but it's definitely not a real pointer either. GDK is basically
wrapping up the MT event slot in touch->sequence, which is a pointer:

gdk/wayland/gdkdevice-wayland.c:297:
#define GDK_SLOT_TO_EVENT_SEQUENCE(s) ((GdkEventSequence *) GUINT_TO_POINTE=
R((s) + 1))

gdk/wayland/gdkdevice-wayland.c:2434:
  event->touch.sequence =3D GDK_SLOT_TO_EVENT_SEQUENCE (touch->id);

I think it makes sense to convert it the other way around here. In v2, I al=
so
added a warning in case num_slot >=3D INPUT_EVENT_SLOTS_MAX.

> > +
> > +    slot =3D &touch_slots[num_slot];
> > +    slot->x =3D touch->x;
> > +    slot->y =3D touch->y;
> > +
> > +    switch (touch->type) {
> > +    case GDK_TOUCH_BEGIN:
> > +        type =3D INPUT_MULTITOUCH_TYPE_BEGIN;
> > +        slot->tracking_id =3D num_slot;
> > +        break;
> > +    case GDK_TOUCH_UPDATE:
> > +        type =3D INPUT_MULTITOUCH_TYPE_UPDATE;
> > +        break;
> > +    case GDK_TOUCH_END:
> > +    case GDK_TOUCH_CANCEL:
> > +        type =3D INPUT_MULTITOUCH_TYPE_END;
> > +        break;
> > +    default:
> > +        fprintf(stderr, "%s: unexpected touch event\n", __func__);
> > +    }
> > +
> > +    for (i =3D 0; i < INPUT_EVENT_SLOTS_MAX; ++i) {
> > +        if (i =3D=3D num_slot) {
> > +            update =3D type;
> > +        } else {
> > +            update =3D INPUT_MULTITOUCH_TYPE_UPDATE;
> > +        }
> > +
> > +        slot =3D &touch_slots[i];
> > +
> > +        if (slot->tracking_id =3D=3D -1) {
> > +            continue;
> > +        }
> > +
> > +        if (update =3D=3D INPUT_MULTITOUCH_TYPE_END) {
> > +            slot->tracking_id =3D -1;
> > +            qemu_input_queue_mtt(vc->gfx.dcl.con, update, i, slot->tra=
cking_id);
> > +        } else {
> > +            qemu_input_queue_mtt(vc->gfx.dcl.con, update, i, slot->tra=
cking_id);
> > +            qemu_input_queue_btn(vc->gfx.dcl.con, INPUT_BUTTON_TOUCH, =
true);
> > +            qemu_input_queue_mtt_abs(vc->gfx.dcl.con,
> > +                                     INPUT_AXIS_X, (int) slot->x,
> > +                                     0, surface_width(vc->gfx.ds),
> > +                                     i, slot->tracking_id);
> > +            qemu_input_queue_mtt_abs(vc->gfx.dcl.con,
> > +                                     INPUT_AXIS_Y, (int) slot->y,
> > +                                     0, surface_height(vc->gfx.ds),
> > +                                     i, slot->tracking_id);
> > +        }
> > +        qemu_input_event_sync();
>=20
> Shouldn't you sync at the end of the loop? (otherwise you get several
> SYN_REPORT, no?)

You're right, fixed in v2.

Thanks!
Sergio.

> > +    }
> > +
> > +    return TRUE;
> > +}
> > +
> >  static const guint16 *gd_get_keymap(size_t *maplen)
> >  {
> >      GdkDisplay *dpy =3D gdk_display_get_default();
> > @@ -1977,6 +2052,8 @@ static void gd_connect_vc_gfx_signals(VirtualCons=
ole *vc)
> >                           G_CALLBACK(gd_key_event), vc);
> >          g_signal_connect(vc->gfx.drawing_area, "key-release-event",
> >                           G_CALLBACK(gd_key_event), vc);
> > +        g_signal_connect(vc->gfx.drawing_area, "touch-event",
> > +                         G_CALLBACK(gd_touch_event), vc);
> >
> >          g_signal_connect(vc->gfx.drawing_area, "enter-notify-event",
> >                           G_CALLBACK(gd_enter_event), vc);
> > @@ -2086,6 +2163,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s,=
 VirtualConsole *vc,
> >                                GSList *group, GtkWidget *view_menu)
> >  {
> >      bool zoom_to_fit =3D false;
> > +    int i;
> >
> >      vc->label =3D qemu_console_get_label(con);
> >      vc->s =3D s;
> > @@ -2133,6 +2211,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s,=
 VirtualConsole *vc,
> >                            GDK_BUTTON_PRESS_MASK |
> >                            GDK_BUTTON_RELEASE_MASK |
> >                            GDK_BUTTON_MOTION_MASK |
> > +                          GDK_TOUCH_MASK |
> >                            GDK_ENTER_NOTIFY_MASK |
> >                            GDK_LEAVE_NOTIFY_MASK |
> >                            GDK_SCROLL_MASK |
> > @@ -2168,6 +2247,11 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s=
, VirtualConsole *vc,
> >          s->free_scale =3D true;
> >      }
> >
> > +    for (i =3D 0; i < INPUT_EVENT_SLOTS_MAX; i++) {
> > +        struct touch_slot *slot =3D &touch_slots[i];
> > +        slot->tracking_id =3D -1;
> > +    }
> > +
> >      return group;
> >  }
> >
> > --
> > 2.38.1
> >
> >
>=20
>=20
> --=20
> Marc-Andr=E9 Lureau
>=20

--cewm54m2z6qumi7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmQTCcQACgkQ9GknjS8M
AjXyWg/+JfiebvyEEJlu3ux5Tmu327AtBLHcsCCheHEDkUmZS5OI+aSfHu7s8FEE
g2QRIVTYHrrf8tYH4na5vcM8CUk+nyBM+mgIY6VsI5DD7QND8/0BCZZuYPdum8OV
07ztoZwPVsy8URvOjuetWvO7suT6MibLz5oar407Gt+4DYNjAWRHWKFjdnUs4qG2
eTPEXloFlVpoXEsBQZiNNZ5QrAzs1eczChZRxB9XopxdL31EgNLOd0LVIK2F/f68
s96yz4tbu8MouVmhQDHgJkpD3MdPPaExjzKjNSdptnyPBdVEseXc8P6Z6i40TjYW
6vYm6xlo819mwsPThjPYb3Igv5Oy4NMaF2vEqp6zkaIWGu7CqipZpBu0AwYhBrsi
t0wfvMsGA4sECiGWI3ue5sYGdBB7uH48D/zkdY0+DDh9zquFLWERgXIfV12bgKry
OblAXAfbLGMb/1782hhNWdS73UxPFCbuariWhA5DGhzEkNhweMzY9JRvd5lqjhwf
KCODOgsC3E0lZIvjamUEFYtpg/2uo/OVWbm5x1ATlWe5I7uUT6TsCRx8PpXuFUVE
PkYkgg6JMoDdcJItq9rR6TPu2G3evYND0kfgaNWgA2RxJaAfdk1sTEQz3UfrnIVr
iLRprLZ3xWXCYC/9FxZGeG28B6X9x+h24/CM0Mx5GMUIPnemHNU=
=XuIW
-----END PGP SIGNATURE-----

--cewm54m2z6qumi7l--


