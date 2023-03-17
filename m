Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10EC6BE274
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:03:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd53E-0007eu-0K; Fri, 17 Mar 2023 04:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pd53B-0007eP-AN
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:02:57 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pd539-0001og-7V
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:02:57 -0400
Received: by mail-lj1-x22b.google.com with SMTP id a32so4208886ljq.1
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679040173;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SbN2Uv6wIZ/ofcHrI2qC2q1YgcS8hcr1rp7G2uD9e/E=;
 b=fj4YiG8C29ubHnShmo8+5fztUFNR3IJr3vnVjZCMtqCTR4z8BOnMAkmWH504pWIeo9
 +L5S9BlIAMfLf9XCH6BB2/Sudu7URVkjgT6DZvL6nTPQZ2Nor8b8pY17+PjmBIS44tsQ
 x0b7YhJBEzvlsiSrFyBhjOZtLLeFFq39SupgIykZvN1sZuaHwsV3aLbQzxbloMShl7t8
 Kph8hFNQUPjcOCJYDHN1IOoIKvHKV7FdxVd+yFf0NwL7Y6t4JnvquvQwdWazlo8quMlw
 kiS5Cb/Pj5uc79Y00vYArc0yytFKatyrcF5oKjK5UPx2zaPKVwneql+6nLcMIMsGwKF5
 30vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679040173;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SbN2Uv6wIZ/ofcHrI2qC2q1YgcS8hcr1rp7G2uD9e/E=;
 b=rTvtCYxFdnDJRAzdvRMVdJBjVmB7ftX45nGfBvk80ViD7sqKfa/Ibpn4p+qHUwgKkY
 P0UjPT3l4Cv9PqzfRg5SQIk0fHlm+Ys7KdsRIzj0OkOrEqMWdv5mSIe+TBhAjFUR3NhU
 YAezrl4Q3h6G7nRWZsi8RKnj/ByRRy8Iuuz6VMgKzzxskmk9IdCxHUI2cv6VCvdj7f5a
 adUCz5HMXKP0VwRRx1C8wgzXT8HoLXW7zB2CUbF0bnDqcdGcqeJ/klEcc0meAlLVzA3T
 9ScngAiGaISAb/ANNibo2V/JoPI1h3wzZBi/DjJyEVGZqEWJJIPSuFfQchRKRCzMmoeI
 3H4g==
X-Gm-Message-State: AO0yUKUb1fwOLaJNvlq5D118JyWMcUZOB8bOoohbw9bPwzeIoaRcCBtK
 m+R1Pf0pI9C/+LSw4HwB5PwgUq6uy+8XcFCu4tc=
X-Google-Smtp-Source: AK7set/1dB2vDlcSmlkbiSsZjagvxF/If23LKUeXIrmFtVUFdEfRzNMjye60ON/eay59Za6AJ2sSHJ/y5YV5lGoMPwk=
X-Received: by 2002:a2e:b4aa:0:b0:295:b026:8c33 with SMTP id
 q10-20020a2eb4aa000000b00295b0268c33mr3083491ljm.0.1679040172569; Fri, 17 Mar
 2023 01:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230316120624.46410-1-slp@redhat.com>
 <20230316120624.46410-7-slp@redhat.com>
In-Reply-To: <20230316120624.46410-7-slp@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 17 Mar 2023 12:02:41 +0400
Message-ID: <CAJ+F1CLVevQJPb0tnB3qTq3GjJATejyEcyYbxkQurFN30iORXA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ui/gtk: enable backend to send multi-touch events
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
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

Hi

On Thu, Mar 16, 2023 at 4:07=E2=80=AFPM Sergio Lopez <slp@redhat.com> wrote=
:
>
> GTK3 provides the infrastructure to receive and process multi-touch
> events through the "touch-event" signal and the GdkEventTouch type.
> Make use of it to transpose events from the host to the guest.
>
> This allows users of machines with hardware capable of receiving
> multi-touch events to run guests that can also receive those events
> and interpret them as gestures, when appropriate.
>
> An example of this in action can be seen here:
>
>  https://fosstodon.org/@slp/109545849296546767
>
> Signed-off-by: Sergio Lopez <slp@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  ui/gtk.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>
> diff --git a/ui/gtk.c b/ui/gtk.c
> index fd82e9b1ca..3a667bfba6 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -130,6 +130,13 @@ typedef struct VCChardev VCChardev;
>  DECLARE_INSTANCE_CHECKER(VCChardev, VC_CHARDEV,
>                           TYPE_CHARDEV_VC)
>
> +struct touch_slot {
> +    int x;
> +    int y;
> +    int tracking_id;
> +};
> +static struct touch_slot touch_slots[INPUT_EVENT_SLOTS_MAX];
> +
>  bool gtk_use_gl_area;
>
>  static void gd_grab_pointer(VirtualConsole *vc, const char *reason);
> @@ -1058,6 +1065,82 @@ static gboolean gd_scroll_event(GtkWidget *widget,=
 GdkEventScroll *scroll,
>  }
>
>
> +static gboolean gd_touch_event(GtkWidget *widget, GdkEventTouch *touch,
> +                               void *opaque)
> +{
> +    VirtualConsole *vc =3D opaque;
> +    struct touch_slot *slot;
> +    uint64_t num_slot =3D GPOINTER_TO_UINT(touch->sequence);
> +    bool needs_sync =3D false;
> +    int update;
> +    int type =3D -1;
> +    int i;
> +
> +    if (num_slot >=3D INPUT_EVENT_SLOTS_MAX) {
> +        fprintf(stderr, "%s: unexpected touch slot number: %ld >=3D %d\n=
",
> +                __func__, num_slot, INPUT_EVENT_SLOTS_MAX);

(may be better use warn_report?).

> +        return FALSE;
> +    }
> +
> +    slot =3D &touch_slots[num_slot];
> +    slot->x =3D touch->x;
> +    slot->y =3D touch->y;
> +
> +    switch (touch->type) {
> +    case GDK_TOUCH_BEGIN:
> +        type =3D INPUT_MULTITOUCH_TYPE_BEGIN;
> +        slot->tracking_id =3D num_slot;
> +        break;
> +    case GDK_TOUCH_UPDATE:
> +        type =3D INPUT_MULTITOUCH_TYPE_UPDATE;
> +        break;
> +    case GDK_TOUCH_END:
> +    case GDK_TOUCH_CANCEL:
> +        type =3D INPUT_MULTITOUCH_TYPE_END;
> +        break;
> +    default:
> +        fprintf(stderr, "%s: unexpected touch event\n", __func__);

same

> +    }
> +
> +    for (i =3D 0; i < INPUT_EVENT_SLOTS_MAX; ++i) {
> +        if (i =3D=3D num_slot) {
> +            update =3D type;
> +        } else {
> +            update =3D INPUT_MULTITOUCH_TYPE_UPDATE;
> +        }
> +
> +        slot =3D &touch_slots[i];
> +
> +        if (slot->tracking_id =3D=3D -1) {
> +            continue;
> +        }
> +
> +        if (update =3D=3D INPUT_MULTITOUCH_TYPE_END) {
> +            slot->tracking_id =3D -1;
> +            qemu_input_queue_mtt(vc->gfx.dcl.con, update, i, slot->track=
ing_id);
> +            needs_sync =3D true;
> +        } else {
> +            qemu_input_queue_mtt(vc->gfx.dcl.con, update, i, slot->track=
ing_id);
> +            qemu_input_queue_btn(vc->gfx.dcl.con, INPUT_BUTTON_TOUCH, tr=
ue);
> +            qemu_input_queue_mtt_abs(vc->gfx.dcl.con,
> +                                     INPUT_AXIS_X, (int) slot->x,
> +                                     0, surface_width(vc->gfx.ds),
> +                                     i, slot->tracking_id);
> +            qemu_input_queue_mtt_abs(vc->gfx.dcl.con,
> +                                     INPUT_AXIS_Y, (int) slot->y,
> +                                     0, surface_height(vc->gfx.ds),
> +                                     i, slot->tracking_id);
> +            needs_sync =3D true;
> +        }
> +    }
> +
> +    if (needs_sync) {
> +        qemu_input_event_sync();
> +    }
> +
> +    return TRUE;
> +}
> +
>  static const guint16 *gd_get_keymap(size_t *maplen)
>  {
>      GdkDisplay *dpy =3D gdk_display_get_default();
> @@ -1977,6 +2060,8 @@ static void gd_connect_vc_gfx_signals(VirtualConsol=
e *vc)
>                           G_CALLBACK(gd_key_event), vc);
>          g_signal_connect(vc->gfx.drawing_area, "key-release-event",
>                           G_CALLBACK(gd_key_event), vc);
> +        g_signal_connect(vc->gfx.drawing_area, "touch-event",
> +                         G_CALLBACK(gd_touch_event), vc);
>
>          g_signal_connect(vc->gfx.drawing_area, "enter-notify-event",
>                           G_CALLBACK(gd_enter_event), vc);
> @@ -2086,6 +2171,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, V=
irtualConsole *vc,
>                                GSList *group, GtkWidget *view_menu)
>  {
>      bool zoom_to_fit =3D false;
> +    int i;
>
>      vc->label =3D qemu_console_get_label(con);
>      vc->s =3D s;
> @@ -2133,6 +2219,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, V=
irtualConsole *vc,
>                            GDK_BUTTON_PRESS_MASK |
>                            GDK_BUTTON_RELEASE_MASK |
>                            GDK_BUTTON_MOTION_MASK |
> +                          GDK_TOUCH_MASK |
>                            GDK_ENTER_NOTIFY_MASK |
>                            GDK_LEAVE_NOTIFY_MASK |
>                            GDK_SCROLL_MASK |
> @@ -2168,6 +2255,11 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, =
VirtualConsole *vc,
>          s->free_scale =3D true;
>      }
>
> +    for (i =3D 0; i < INPUT_EVENT_SLOTS_MAX; i++) {
> +        struct touch_slot *slot =3D &touch_slots[i];
> +        slot->tracking_id =3D -1;
> +    }
> +
>      return group;
>  }
>
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

