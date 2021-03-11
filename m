Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DD9337F90
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 22:20:12 +0100 (CET)
Received: from localhost ([::1]:55048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKSj5-0000td-2n
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 16:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKSbW-0001l9-H8
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:12:22 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKSbU-0006EV-4X
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:12:22 -0500
Received: by mail-ej1-x636.google.com with SMTP id mj10so49139248ejb.5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 13:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eohplvbTQMp8CzehnA67s2fpqWrwwAnrPyEuEFVuUJ0=;
 b=krV78SRser1M1pkTqYjFMUJzlqJexj1+Kaw6FK/BUePtMHvukudBDqcG8PSrHsbVZt
 47zjc7Ho9Ms0OEeBY23ivWTECV7CQR6xL7w45mRmx2irZe4isJ+yW5S4K1YvJgj7r8SN
 zEoo3DgBqsP3qzcOcwl7LxU6jyW5+qFPaNXhh4GT/0PKn8gWdrwPqmEXVbhe7tgsZ+Ki
 B215VFZ/BH8eGq6V0mex4BLcE5dlQLdTrdx6Gg4T3Zjs9PsMBbG49bynR2b7k6260Sv0
 /4vxJEWid3rVwHxX4A94cytQB+lKMzOAoQNl2n7pPWZKrTXr2ppasCw3fS/qvb+nzh3v
 dTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eohplvbTQMp8CzehnA67s2fpqWrwwAnrPyEuEFVuUJ0=;
 b=oORfDp6sIImhx9IhOpKZGIZVVZ17/T+MwRcuFhtl3w4uEb+6dNOpvADrcnh9AkSdHL
 DPB1F83W9FE82j+xsyqmfddovhFzZF1kiBMaYH8yqq9Fv/h2DiWXVLZ2bDiMW/ykBtQg
 JKhCgdfUDisimiKjrfMKPr8s2eC/uE6rMY8EyLp/n1jkzwzkcvKwHHWWhzyNTbQqKWhE
 yxdgQzOugkVBWKaVeCZ/BF55lS40g0GiaIfg5OTWdNE1Dzx9seDxnSnVaYQPJTA8rbX5
 HQrckqq1zVgTuYH81Q4Qrp/tr+8qJoGrN9oji0XY+/31s9U7bP6TKHgV8PirnBbuMc3f
 Oxlg==
X-Gm-Message-State: AOAM532Jq2caOtpjYEo2H9TLsk0koIUe6k6clvbjoCirSVMrzFdJzu50
 S1pIPztadvH03KUdZ5MEjkNjLdfxX1053YR8irw=
X-Google-Smtp-Source: ABdhPJyWu/eu0p9eW6i25F9Ih1ApudHLnJyhM5Oo55X37/5NXaFdG2BCv8jJoycAoLOa1p26KUE9/y7B9Nj2ZrFG2OU=
X-Received: by 2002:a17:906:a1c8:: with SMTP id
 bx8mr4868183ejb.381.1615497138343; 
 Thu, 11 Mar 2021 13:12:18 -0800 (PST)
MIME-Version: 1.0
References: <20210311182957.486939-1-berrange@redhat.com>
 <20210311182957.486939-2-berrange@redhat.com>
In-Reply-To: <20210311182957.486939-2-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 12 Mar 2021 01:12:06 +0400
Message-ID: <CAJ+F1CKyo3BdsK4_0vc8Nfbqj=eB8q63qodQ51E9S14Xm5sbuA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ui: add more trace points for VNC client/server
 messages
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001113a805bd493def"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001113a805bd493def
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 10:43 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
wrote:

> This adds trace points for desktop size and audio related messages.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/trace-events |  9 +++++++++
>  ui/vnc.c        | 21 +++++++++++++++++++--
>  2 files changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/ui/trace-events b/ui/trace-events
> index 0ffcdb4408..bd8f8a9d18 100644
> --- a/ui/trace-events
> +++ b/ui/trace-events
> @@ -37,6 +37,15 @@ vnc_key_event_ext(bool down, int sym, int keycode,
> const char *name) "down %d, s
>  vnc_key_event_map(bool down, int sym, int keycode, const char *name)
> "down %d, sym 0x%x -> keycode 0x%x [%s]"
>  vnc_key_sync_numlock(bool on) "%d"
>  vnc_key_sync_capslock(bool on) "%d"
> +vnc_msg_server_audio_begin(void *state, void *ioc) "VNC server msg audio
> begin state=3D%p ioc=3D%p"
> +vnc_msg_server_audio_end(void *state, void *ioc) "VNC server msg audio
> end state=3D%p ioc=3D%p"
> +vnc_msg_server_audio_data(void *state, void *ioc, const void *buf, size_=
t
> len) "VNC server msg audio data state=3D%p ioc=3D%p buf=3D%p len=3D%zd"
> +vnc_msg_server_desktop_resize(void *state, void *ioc, int width, int
> height) "VNC server msg ext resize state=3D%p ioc=3D%p size=3D%dx%d"
> +vnc_msg_server_ext_desktop_resize(void *state, void *ioc, int width, int
> height, int reason) "VNC server msg ext resize state=3D%p ioc=3D%p size=
=3D%dx%d
> reason=3D%d"
> +vnc_msg_client_audio_enable(void *state, void *ioc) "VNC client msg audi=
o
> enable state=3D%p ioc=3D%p"
> +vnc_msg_client_audio_disable(void *state, void *ioc) "VNC client msg
> audio disable state=3D%p ioc=3D%p"
> +vnc_msg_client_audio_format(void *state, void *ioc, int fmt, int
> channels, int freq) "VNC client msg audio format state=3D%p ioc=3D%p fmt=
=3D%d
> channels=3D%d freq=3D%d"
> +vnc_msg_client_set_desktop_size(void *state, void *ioc, int width, int
> height, int screens) "VNC client msg set desktop size  state=3D%p ioc=3D%=
p
> size=3D%dx%d screens=3D%d"
>  vnc_client_eof(void *state, void *ioc) "VNC client EOF state=3D%p ioc=3D=
%p"
>  vnc_client_io_error(void *state, void *ioc, const char *msg) "VNC client
> I/O error state=3D%p ioc=3D%p errmsg=3D%s"
>  vnc_client_connect(void *state, void *ioc) "VNC client connect state=3D%=
p
> ioc=3D%p"
> diff --git a/ui/vnc.c b/ui/vnc.c
> index e8e3426a65..7291429c04 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -659,6 +659,9 @@ void vnc_framebuffer_update(VncState *vs, int x, int
> y, int w, int h,
>
>  static void vnc_desktop_resize_ext(VncState *vs, int reject_reason)
>  {
> +    trace_vnc_msg_server_ext_desktop_resize(
> +        vs, vs->ioc, vs->client_width, vs->client_height, reject_reason)=
;
> +
>      vnc_lock_output(vs);
>      vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
>      vnc_write_u8(vs, 0);
> @@ -705,6 +708,9 @@ static void vnc_desktop_resize(VncState *vs)
>          return;
>      }
>
> +    trace_vnc_msg_server_desktop_resize(
> +        vs, vs->ioc, vs->client_width, vs->client_height);
> +
>      vnc_lock_output(vs);
>      vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
>      vnc_write_u8(vs, 0);
> @@ -1182,6 +1188,7 @@ static void audio_capture_notify(void *opaque,
> audcnotification_e cmd)
>      assert(vs->magic =3D=3D VNC_MAGIC);
>      switch (cmd) {
>      case AUD_CNOTIFY_DISABLE:
> +        trace_vnc_msg_server_audio_end(vs, vs->ioc);
>          vnc_lock_output(vs);
>          vnc_write_u8(vs, VNC_MSG_SERVER_QEMU);
>          vnc_write_u8(vs, VNC_MSG_SERVER_QEMU_AUDIO);
> @@ -1191,6 +1198,7 @@ static void audio_capture_notify(void *opaque,
> audcnotification_e cmd)
>          break;
>
>      case AUD_CNOTIFY_ENABLE:
> +        trace_vnc_msg_server_audio_begin(vs, vs->ioc);
>          vnc_lock_output(vs);
>          vnc_write_u8(vs, VNC_MSG_SERVER_QEMU);
>          vnc_write_u8(vs, VNC_MSG_SERVER_QEMU_AUDIO);
> @@ -1210,6 +1218,7 @@ static void audio_capture(void *opaque, const void
> *buf, int size)
>      VncState *vs =3D opaque;
>
>      assert(vs->magic =3D=3D VNC_MAGIC);
> +    trace_vnc_msg_server_audio_data(vs, vs->ioc, buf, size);
>      vnc_lock_output(vs);
>      if (vs->output.offset < vs->throttle_output_offset) {
>          vnc_write_u8(vs, VNC_MSG_SERVER_QEMU);
> @@ -2454,9 +2463,11 @@ static int protocol_client_msg(VncState *vs,
> uint8_t *data, size_t len)
>
>              switch (read_u16 (data, 2)) {
>              case VNC_MSG_CLIENT_QEMU_AUDIO_ENABLE:
> +                trace_vnc_msg_client_audio_enable(vs, vs->ioc);
>                  audio_add(vs);
>                  break;
>              case VNC_MSG_CLIENT_QEMU_AUDIO_DISABLE:
> +                trace_vnc_msg_client_audio_disable(vs, vs->ioc);
>                  audio_del(vs);
>                  break;
>              case VNC_MSG_CLIENT_QEMU_AUDIO_SET_FORMAT:
> @@ -2492,6 +2503,8 @@ static int protocol_client_msg(VncState *vs, uint8_=
t
> *data, size_t len)
>                      break;
>                  }
>                  vs->as.freq =3D freq;
> +                trace_vnc_msg_client_audio_format(
> +                    vs, vs->ioc, vs->as.fmt, vs->as.nchannels,
> vs->as.freq);
>                  break;
>              default:
>                  VNC_DEBUG("Invalid audio message %d\n", read_u8(data, 4)=
);
> @@ -2510,6 +2523,7 @@ static int protocol_client_msg(VncState *vs, uint8_=
t
> *data, size_t len)
>      {
>          size_t size;
>          uint8_t screens;
> +        int w, h;
>
>          if (len < 8) {
>              return 8;
> @@ -2520,12 +2534,15 @@ static int protocol_client_msg(VncState *vs,
> uint8_t *data, size_t len)
>          if (len < size) {
>              return size;
>          }
> +        w =3D read_u16(data, 2);
> +        h =3D read_u16(data, 4);
>
> +        trace_vnc_msg_client_set_desktop_size(vs, vs->ioc, w, h, screens=
);
>          if (dpy_ui_info_supported(vs->vd->dcl.con)) {
>              QemuUIInfo info;
>              memset(&info, 0, sizeof(info));
> -            info.width =3D read_u16(data, 2);
> -            info.height =3D read_u16(data, 4);
> +            info.width =3D w;
> +            info.height =3D h;
>              dpy_set_ui_info(vs->vd->dcl.con, &info);
>              vnc_desktop_resize_ext(vs, 4 /* Request forwarded */);
>          } else {
> --
> 2.29.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001113a805bd493def
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 11, 2021 at 10:43 PM Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">This adds trace points for desktop size and audio related messages.<=
br>
<br>
Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redha=
t.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/trace-events |=C2=A0 9 +++++++++<br>
=C2=A0ui/vnc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 21 +++++++++++++++++++--<br>
=C2=A02 files changed, 28 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/ui/trace-events b/ui/trace-events<br>
index 0ffcdb4408..bd8f8a9d18 100644<br>
--- a/ui/trace-events<br>
+++ b/ui/trace-events<br>
@@ -37,6 +37,15 @@ vnc_key_event_ext(bool down, int sym, int keycode, const=
 char *name) &quot;down %d, s<br>
=C2=A0vnc_key_event_map(bool down, int sym, int keycode, const char *name) =
&quot;down %d, sym 0x%x -&gt; keycode 0x%x [%s]&quot;<br>
=C2=A0vnc_key_sync_numlock(bool on) &quot;%d&quot;<br>
=C2=A0vnc_key_sync_capslock(bool on) &quot;%d&quot;<br>
+vnc_msg_server_audio_begin(void *state, void *ioc) &quot;VNC server msg au=
dio begin state=3D%p ioc=3D%p&quot;<br>
+vnc_msg_server_audio_end(void *state, void *ioc) &quot;VNC server msg audi=
o end state=3D%p ioc=3D%p&quot;<br>
+vnc_msg_server_audio_data(void *state, void *ioc, const void *buf, size_t =
len) &quot;VNC server msg audio data state=3D%p ioc=3D%p buf=3D%p len=3D%zd=
&quot;<br>
+vnc_msg_server_desktop_resize(void *state, void *ioc, int width, int heigh=
t) &quot;VNC server msg ext resize state=3D%p ioc=3D%p size=3D%dx%d&quot;<b=
r>
+vnc_msg_server_ext_desktop_resize(void *state, void *ioc, int width, int h=
eight, int reason) &quot;VNC server msg ext resize state=3D%p ioc=3D%p size=
=3D%dx%d reason=3D%d&quot;<br>
+vnc_msg_client_audio_enable(void *state, void *ioc) &quot;VNC client msg a=
udio enable state=3D%p ioc=3D%p&quot;<br>
+vnc_msg_client_audio_disable(void *state, void *ioc) &quot;VNC client msg =
audio disable state=3D%p ioc=3D%p&quot;<br>
+vnc_msg_client_audio_format(void *state, void *ioc, int fmt, int channels,=
 int freq) &quot;VNC client msg audio format state=3D%p ioc=3D%p fmt=3D%d c=
hannels=3D%d freq=3D%d&quot;<br>
+vnc_msg_client_set_desktop_size(void *state, void *ioc, int width, int hei=
ght, int screens) &quot;VNC client msg set desktop size=C2=A0 state=3D%p io=
c=3D%p size=3D%dx%d screens=3D%d&quot;<br>
=C2=A0vnc_client_eof(void *state, void *ioc) &quot;VNC client EOF state=3D%=
p ioc=3D%p&quot;<br>
=C2=A0vnc_client_io_error(void *state, void *ioc, const char *msg) &quot;VN=
C client I/O error state=3D%p ioc=3D%p errmsg=3D%s&quot;<br>
=C2=A0vnc_client_connect(void *state, void *ioc) &quot;VNC client connect s=
tate=3D%p ioc=3D%p&quot;<br>
diff --git a/ui/vnc.c b/ui/vnc.c<br>
index e8e3426a65..7291429c04 100644<br>
--- a/ui/vnc.c<br>
+++ b/ui/vnc.c<br>
@@ -659,6 +659,9 @@ void vnc_framebuffer_update(VncState *vs, int x, int y,=
 int w, int h,<br>
<br>
=C2=A0static void vnc_desktop_resize_ext(VncState *vs, int reject_reason)<b=
r>
=C2=A0{<br>
+=C2=A0 =C2=A0 trace_vnc_msg_server_ext_desktop_resize(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vs, vs-&gt;ioc, vs-&gt;client_width, vs-&gt;cl=
ient_height, reject_reason);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0vnc_lock_output(vs);<br>
=C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);<br=
>
=C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, 0);<br>
@@ -705,6 +708,9 @@ static void vnc_desktop_resize(VncState *vs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 trace_vnc_msg_server_desktop_resize(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vs, vs-&gt;ioc, vs-&gt;client_width, vs-&gt;cl=
ient_height);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0vnc_lock_output(vs);<br>
=C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);<br=
>
=C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, 0);<br>
@@ -1182,6 +1188,7 @@ static void audio_capture_notify(void *opaque, audcno=
tification_e cmd)<br>
=C2=A0 =C2=A0 =C2=A0assert(vs-&gt;magic =3D=3D VNC_MAGIC);<br>
=C2=A0 =C2=A0 =C2=A0switch (cmd) {<br>
=C2=A0 =C2=A0 =C2=A0case AUD_CNOTIFY_DISABLE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vnc_msg_server_audio_end(vs, vs-&gt;ioc)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_lock_output(vs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, VNC_MSG_SERVER_QEMU);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, VNC_MSG_SERVER_QEMU_AUDI=
O);<br>
@@ -1191,6 +1198,7 @@ static void audio_capture_notify(void *opaque, audcno=
tification_e cmd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case AUD_CNOTIFY_ENABLE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vnc_msg_server_audio_begin(vs, vs-&gt;io=
c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_lock_output(vs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, VNC_MSG_SERVER_QEMU);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, VNC_MSG_SERVER_QEMU_AUDI=
O);<br>
@@ -1210,6 +1218,7 @@ static void audio_capture(void *opaque, const void *b=
uf, int size)<br>
=C2=A0 =C2=A0 =C2=A0VncState *vs =3D opaque;<br>
<br>
=C2=A0 =C2=A0 =C2=A0assert(vs-&gt;magic =3D=3D VNC_MAGIC);<br>
+=C2=A0 =C2=A0 trace_vnc_msg_server_audio_data(vs, vs-&gt;ioc, buf, size);<=
br>
=C2=A0 =C2=A0 =C2=A0vnc_lock_output(vs);<br>
=C2=A0 =C2=A0 =C2=A0if (vs-&gt;output.offset &lt; vs-&gt;throttle_output_of=
fset) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, VNC_MSG_SERVER_QEMU);<br=
>
@@ -2454,9 +2463,11 @@ static int protocol_client_msg(VncState *vs, uint8_t=
 *data, size_t len)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (read_u16 (data, 2))=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case VNC_MSG_CLIENT_QEMU_AU=
DIO_ENABLE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vnc_msg_clie=
nt_audio_enable(vs, vs-&gt;ioc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0audio_add(vs)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case VNC_MSG_CLIENT_QEMU_AU=
DIO_DISABLE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vnc_msg_clie=
nt_audio_disable(vs, vs-&gt;ioc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0audio_del(vs)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case VNC_MSG_CLIENT_QEMU_AU=
DIO_SET_FORMAT:<br>
@@ -2492,6 +2503,8 @@ static int protocol_client_msg(VncState *vs, uint8_t =
*data, size_t len)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;as.fre=
q =3D freq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vnc_msg_clie=
nt_audio_format(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vs, =
vs-&gt;ioc, vs-&gt;as.fmt, vs-&gt;as.nchannels, vs-&gt;as.freq);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VNC_DEBUG(&qu=
ot;Invalid audio message %d\n&quot;, read_u8(data, 4));<br>
@@ -2510,6 +2523,7 @@ static int protocol_client_msg(VncState *vs, uint8_t =
*data, size_t len)<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t screens;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int w, h;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &lt; 8) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 8;<br>
@@ -2520,12 +2534,15 @@ static int protocol_client_msg(VncState *vs, uint8_=
t *data, size_t len)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &lt; size) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 w =3D read_u16(data, 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D read_u16(data, 4);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vnc_msg_client_set_desktop_size(vs, vs-&=
gt;ioc, w, h, screens);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpy_ui_info_supported(vs-&gt;vd-&gt;d=
cl.con)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuUIInfo info;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;info, 0, sizeof=
(info));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.width =3D read_u16(data, 2)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.height =3D read_u16(data, 4=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.width =3D w;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.height =3D h;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpy_set_ui_info(vs-&gt;vd-&=
gt;dcl.con, &amp;info);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_desktop_resize_ext(vs, =
4 /* Request forwarded */);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001113a805bd493def--

