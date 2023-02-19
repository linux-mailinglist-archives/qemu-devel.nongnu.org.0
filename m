Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565EE69BF1C
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 09:30:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTf3m-0004XP-Nq; Sun, 19 Feb 2023 03:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pTf3l-0004XG-Hn
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 03:28:37 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pTf3j-0000UZ-Lg
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 03:28:37 -0500
Received: by mail-lf1-x134.google.com with SMTP id t5so231778lfe.11
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 00:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ESfOvN/Jv8hOy8HvnalxIKNYBzCQFv+ib7bmdjV2Vr4=;
 b=Mr9wTOdujJ0U2sUTB/zv6dVQplkTeOd82Ye0qiqSSL0cUDsLTAnOT7VH9PbkQoG3Jm
 F9diozirgeMnujBncoeG6u82QMiJ+CitW2D6ydDvzmCsjiYoGYwXZXPKke2ni/3Q+A5J
 DMUXX4r0dUtGEL15euOUp6TK6l2UoING6Orm1AdR1T+SPhHPQ1pjjY0ECEHkqA0FqKO2
 0/EQApLN+8yb8xdPZDOxiIr57BHGLRh4oZ+qqERaUYf0csOrgU3auVWOEei5BkH4JGH5
 WyftcP39FioaIXazmooQKmmCqQPp1lXFExonZ4qNqa9buWdB/6ktceW0AM5d8Lw6lnnQ
 Hk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ESfOvN/Jv8hOy8HvnalxIKNYBzCQFv+ib7bmdjV2Vr4=;
 b=l/8MsHdtf4VNff12bcPOwUAWC6W64asLjj+Fbt6UAyL3oSF2xjm2qD4GsqO0Y4Gqgu
 VLouFQKuJK2S170Rj8G8zx3LrtXpL2PY/W7B2aEZWR+eQasV5Axm5jWCufOkZwkgubm6
 jNfqcpt+TGz4bERMRPJv6IpHvmBbTE/iWbRJ5reSnFWyCMsYrBi+1uUQX0lgqmILhB2v
 MA/n+qYMYwGkdlnwiXAh98Ta2w80ucNREDb+qBGdbrnbixgknU2O94DPQY29VaC/fnDP
 VJVXtsU0jvNT5AyqkJTQdYa+uqYwrrTuMGZ1zEaleqklHNxoKIuPDRoDKZrtwoOwbu9j
 8huQ==
X-Gm-Message-State: AO0yUKUNgNpFp5qFu90d9pxR10V8irjCbJqGXz3dzcRRCDxgFKiU2xZa
 LnaD4uPqn+kJ7rKCYDNLKgprz82OZEZPsHgNBbw=
X-Google-Smtp-Source: AK7set/YNgzf5vQWw9ir/LKo5czGCK/KzLB7gVvw4d62nRiFjpG+3icqhsYmtFxE5ErAo6pzvmFQ4cfScrQ5OuFnsrA=
X-Received: by 2002:ac2:5316:0:b0:4d5:ca42:aee5 with SMTP id
 c22-20020ac25316000000b004d5ca42aee5mr395145lfh.5.1676795313734; Sun, 19 Feb
 2023 00:28:33 -0800 (PST)
MIME-Version: 1.0
References: <20230218162216.46944-1-slp@redhat.com>
 <20230218162216.46944-5-slp@redhat.com>
In-Reply-To: <20230218162216.46944-5-slp@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 19 Feb 2023 12:28:22 +0400
Message-ID: <CAJ+F1C+An6Mbi0DdXVQ2z-VjEUZDkBGVwzo633N_Eeqr53CdHA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ui/gtk: enable backend to send multi-touch events
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
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

Hi Sergio

On Sat, Feb 18, 2023 at 8:23 PM Sergio Lopez <slp@redhat.com> wrote:
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

> ---
>  ui/gtk.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>
> diff --git a/ui/gtk.c b/ui/gtk.c
> index fd82e9b1ca..bf1e7f086d 100644
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
> @@ -1058,6 +1065,74 @@ static gboolean gd_scroll_event(GtkWidget *widget,=
 GdkEventScroll *scroll,
>  }
>
>
> +static gboolean gd_touch_event(GtkWidget *widget, GdkEventTouch *touch,
> +                               void *opaque)
> +{
> +    VirtualConsole *vc =3D opaque;
> +    struct touch_slot *slot;
> +    uint64_t num_slot =3D (uint64_t) touch->sequence;

Perhaps use GPOINTER_TO_UINT?

> +    int update;
> +    int type =3D -1;
> +    int i;
> +
> +    if (num_slot >=3D INPUT_EVENT_SLOTS_MAX) {
> +        return FALSE;
> +    }

Hmm, a pointer < INPUT_EVENT_SLOTS_MAX ?

This seems to work because the wayland GDK backend uses presumably
evdev slot id + 1.. We may want to have some slot id mapping, or at
least report some warning for discarded events.

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
> +        }
> +        qemu_input_event_sync();

Shouldn't you sync at the end of the loop? (otherwise you get several
SYN_REPORT, no?)

> +    }
> +
> +    return TRUE;
> +}
> +
>  static const guint16 *gd_get_keymap(size_t *maplen)
>  {
>      GdkDisplay *dpy =3D gdk_display_get_default();
> @@ -1977,6 +2052,8 @@ static void gd_connect_vc_gfx_signals(VirtualConsol=
e *vc)
>                           G_CALLBACK(gd_key_event), vc);
>          g_signal_connect(vc->gfx.drawing_area, "key-release-event",
>                           G_CALLBACK(gd_key_event), vc);
> +        g_signal_connect(vc->gfx.drawing_area, "touch-event",
> +                         G_CALLBACK(gd_touch_event), vc);
>
>          g_signal_connect(vc->gfx.drawing_area, "enter-notify-event",
>                           G_CALLBACK(gd_enter_event), vc);
> @@ -2086,6 +2163,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, V=
irtualConsole *vc,
>                                GSList *group, GtkWidget *view_menu)
>  {
>      bool zoom_to_fit =3D false;
> +    int i;
>
>      vc->label =3D qemu_console_get_label(con);
>      vc->s =3D s;
> @@ -2133,6 +2211,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, V=
irtualConsole *vc,
>                            GDK_BUTTON_PRESS_MASK |
>                            GDK_BUTTON_RELEASE_MASK |
>                            GDK_BUTTON_MOTION_MASK |
> +                          GDK_TOUCH_MASK |
>                            GDK_ENTER_NOTIFY_MASK |
>                            GDK_LEAVE_NOTIFY_MASK |
>                            GDK_SCROLL_MASK |
> @@ -2168,6 +2247,11 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, =
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

