Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BA66C0E74
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:15:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCXY-0002Ct-DF; Mon, 20 Mar 2023 06:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1peCXW-0002Cl-6a
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:14:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1peCXU-0001MA-C2
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679307291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U3MVD6C4EqdShDyJQhAMRfv/heZdnz28CMoIhlRtZcc=;
 b=N2vWv3UFEaceYDMJjouFmA6MYrjGVhqztyE9+3wVkFXujamWSM0wH+DcNLtTjdgyJnv8s0
 x9W8AnuUVIMpbS470EQATdAAFdeIK30weLb9iCInGy8dWkncFhzw2iAI+YRdzNAIBWfjIj
 MxwHfygVA+Z0g3SHnHO6y3ybpF3Ck0Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-GA-6apKuMgSlHq50T1h83Q-1; Mon, 20 Mar 2023 06:14:49 -0400
X-MC-Unique: GA-6apKuMgSlHq50T1h83Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6370A101A551;
 Mon, 20 Mar 2023 10:14:49 +0000 (UTC)
Received: from localhost (unknown [10.33.36.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7F2C2027047;
 Mon, 20 Mar 2023 10:14:48 +0000 (UTC)
Date: Mon, 20 Mar 2023 11:16:07 +0100
From: Sergio Lopez <slp@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 6/6] ui/gtk: enable backend to send multi-touch events
Message-ID: <20230320101607.eljur6bp6ir6jn2f@mhamilton>
References: <20230316120624.46410-1-slp@redhat.com>
 <20230316120624.46410-7-slp@redhat.com>
 <CAJ+F1CLVevQJPb0tnB3qTq3GjJATejyEcyYbxkQurFN30iORXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2u2o4do2dbhkrhcz"
Content-Disposition: inline
In-Reply-To: <CAJ+F1CLVevQJPb0tnB3qTq3GjJATejyEcyYbxkQurFN30iORXA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=slp@redhat.com;
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


--2u2o4do2dbhkrhcz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 12:02:41PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>=20
> On Thu, Mar 16, 2023 at 4:07=E2=80=AFPM Sergio Lopez <slp@redhat.com> wro=
te:
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
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
>=20
> > ---
> >  ui/gtk.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >
> > diff --git a/ui/gtk.c b/ui/gtk.c
> > index fd82e9b1ca..3a667bfba6 100644
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
> > @@ -1058,6 +1065,82 @@ static gboolean gd_scroll_event(GtkWidget *widge=
t, GdkEventScroll *scroll,
> >  }
> >
> >
> > +static gboolean gd_touch_event(GtkWidget *widget, GdkEventTouch *touch,
> > +                               void *opaque)
> > +{
> > +    VirtualConsole *vc =3D opaque;
> > +    struct touch_slot *slot;
> > +    uint64_t num_slot =3D GPOINTER_TO_UINT(touch->sequence);
> > +    bool needs_sync =3D false;
> > +    int update;
> > +    int type =3D -1;
> > +    int i;
> > +
> > +    if (num_slot >=3D INPUT_EVENT_SLOTS_MAX) {
> > +        fprintf(stderr, "%s: unexpected touch slot number: %ld >=3D %d=
\n",
> > +                __func__, num_slot, INPUT_EVENT_SLOTS_MAX);
>=20
> (may be better use warn_report?).
>=20
> > +        return FALSE;
> > +    }
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
>=20
> same

I've used "fprintf" for consistency, because it was already being used in
gd_win_grab() and gtk_display_init(). I don't have a preference, would it be
better to use "warn_report" instead?

Sergio.

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
> > +            needs_sync =3D true;
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
> > +            needs_sync =3D true;
> > +        }
> > +    }
> > +
> > +    if (needs_sync) {
> > +        qemu_input_event_sync();
> > +    }
> > +
> > +    return TRUE;
> > +}
> > +
> >  static const guint16 *gd_get_keymap(size_t *maplen)
> >  {
> >      GdkDisplay *dpy =3D gdk_display_get_default();
> > @@ -1977,6 +2060,8 @@ static void gd_connect_vc_gfx_signals(VirtualCons=
ole *vc)
> >                           G_CALLBACK(gd_key_event), vc);
> >          g_signal_connect(vc->gfx.drawing_area, "key-release-event",
> >                           G_CALLBACK(gd_key_event), vc);
> > +        g_signal_connect(vc->gfx.drawing_area, "touch-event",
> > +                         G_CALLBACK(gd_touch_event), vc);
> >
> >          g_signal_connect(vc->gfx.drawing_area, "enter-notify-event",
> >                           G_CALLBACK(gd_enter_event), vc);
> > @@ -2086,6 +2171,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s,=
 VirtualConsole *vc,
> >                                GSList *group, GtkWidget *view_menu)
> >  {
> >      bool zoom_to_fit =3D false;
> > +    int i;
> >
> >      vc->label =3D qemu_console_get_label(con);
> >      vc->s =3D s;
> > @@ -2133,6 +2219,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s,=
 VirtualConsole *vc,
> >                            GDK_BUTTON_PRESS_MASK |
> >                            GDK_BUTTON_RELEASE_MASK |
> >                            GDK_BUTTON_MOTION_MASK |
> > +                          GDK_TOUCH_MASK |
> >                            GDK_ENTER_NOTIFY_MASK |
> >                            GDK_LEAVE_NOTIFY_MASK |
> >                            GDK_SCROLL_MASK |
> > @@ -2168,6 +2255,11 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s=
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
> Marc-Andr=C3=A9 Lureau
>=20

--2u2o4do2dbhkrhcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmQYMmMACgkQ9GknjS8M
AjUygw/9HPTUw5mbKp5qwdHTQTjTiNmPbFaSyukTvuYOJriS3Y0bR946ovS8utMS
hiIJVIqvz2NMnWVIbZaYAvuSqPkDDpfOS6i1EdjaeqTPx0VlDtZD/yXdGOzHrf3A
6MUm3hJnvZP+/46Sazfi8ONDZ8H3Ar3HnqlfwVoMBRN/1P3aqg5zEJaP+LSVAqw+
jeDSnTgGrj7YAFRFgD9cg8pWe86r0NA8rASeUPFzQXiLCQqpGz5OP/kHFRrFEbjk
VmS7dcEXxI1S19zjfy1pD53eDx6//6IbFWZTqIxEsGkddWGYFbqMVgIK+g4hQZu6
SxvNpmF97dbVQo28dXfH2m9b5JmDCOsL5RyNW4svoX1ZLWe1+3o1fN+96Z4DjhHh
TjRUjEkpWcGrKJ18QtGbOQRvNehDs7fXsGNrzJ0iPGXAkJkuDT3tkqRCGHcc65SL
EcEsxjJNwGS+oHxDKWpwfCvcVOEWhEXs+PGDHfwfDHLNJEWrzbRJ9LdX88Fs3Wb5
NLpMTssyrYyGeKUyoFH2Dqu2KJfpGpsdEFtCnesKwO/fHZnv2S5vNSouCs1rvKfH
vSP4Rp21oUXI6tFTdR3gtEeKTvPjbQqyeJmL1cqYIhk8BsUft6J/+nlaGJtM4lux
O0BFm0hoaiM/c0kqRW3ZTQa0wrEYbOID86E7iH+TkBkwD4p/NnM=
=DnIE
-----END PGP SIGNATURE-----

--2u2o4do2dbhkrhcz--


