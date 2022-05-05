Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100B851BB76
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:08:37 +0200 (CEST)
Received: from localhost ([::1]:43714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXTP-0007bF-S3
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmWme-0001XX-3g
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:24:24 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:38634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmWmc-0000zp-6o
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:24:23 -0400
Received: by mail-lf1-x12d.google.com with SMTP id p12so6259797lfs.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Q35Hx9bmprLC82Tz+BnhLMZARxDopUxIUN7NlIzWu8=;
 b=k/c955zGQY+ADV4bSeGKtNF5x83tRgGdOSMGrJ+W2nzVdo6Qln18JXyxOUP7mpM+Sb
 upRawdBzI9WliA2N/U1GKNjbtNuHi7xap8Pmen20++H9sLHH3qgms6Lfj0qg7akr6iDZ
 0ypcnphmqtJ4u88FYdRZwOaORV//Lp94qJ48tEYYOdCe5LvzhI+cdj00qJPxzI2bTiWg
 1q4ypQTpoXvfDqbADY5kmQVcCj7A7n5Rb83tXsz6UW5K6n5cQLS2uEzy6s1/u72oG1JS
 ZqjVcSVtH25qLLBaXI7OFZoYG94DyCp3CJLlI76yiNosH0uNv3nRPcxlU3Li3OwGyj/4
 LB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Q35Hx9bmprLC82Tz+BnhLMZARxDopUxIUN7NlIzWu8=;
 b=zWM7Ay6rRHdPeLtmywTStpOTnYsSU9Au7o/4+MhhcKY25xMqHFjNSZOn+csaF+FtHZ
 Hjufb1AhmBypAfuOmeWCPVRY9MDbFNoJVItfODwAAiksYV+Vbe6DHSwjCIwUEgHJf9fx
 ZoRXsDCCpl2CS8qOCURqbMrpBDAVwTIWSHxUgPlqgVhym3TTfXCa231VK4wbo80pjkEX
 Rrx+gL5tx5Sf1VHYrj8u6NmorbX0W/xZMxoe3rsE6/oqHvX+49bYZ8nYZgNxqOPEL+Q7
 RfSQFia9hZV6OK0XEYIJuPS0VE1mpHqeM9UgTYoUzXO6n80F/0Otq0+xgNUO8V9ILSzO
 IOug==
X-Gm-Message-State: AOAM5311/6SIQPuR+hD12jZ0TxDvbXuA51xHAtmsI+kQ/zWzCAzxKwMZ
 urCHM1ejdmcVWH9HllAjmnJe/0mbfwmkzAnUK7Y=
X-Google-Smtp-Source: ABdhPJw2NMFMfm0Nna16mIrttvF4lVHOAjBkTxMqSGpdNX5OhCyNxMc3R+9KD4Yzu6dl7R/QfnoWbxP+uJ89iUqeQZI=
X-Received: by 2002:a05:6512:32c2:b0:473:ac22:36b7 with SMTP id
 f2-20020a05651232c200b00473ac2236b7mr7441020lfg.532.1651739060563; Thu, 05
 May 2022 01:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220504210001.678419-1-pbonzini@redhat.com>
 <20220504210001.678419-5-pbonzini@redhat.com>
In-Reply-To: <20220504210001.678419-5-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 May 2022 12:24:09 +0400
Message-ID: <CAJ+F1CJm-i-Ap4r7hmrxS06aA9QgyxvoeaJK8TskvPk25O5PFw@mail.gmail.com>
Subject: Re: [PATCH 4/5] net: slirp: add support for CFI-friendly timer API
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000f7741105de3f7746"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000f7741105de3f7746
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2022 at 1:01 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> libslirp 4.7 introduces a CFI-friendly version of the .timer_new callback=
.
> The new callback replaces the function pointer with an enum; invoking the
> callback is done with a new function slirp_handle_timer.
>
> Support the new API so that CFI can be made compatible with using a syste=
m
> libslirp.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  net/slirp.c | 41 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/net/slirp.c b/net/slirp.c
> index b3a92d6e38..57af42299d 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -184,10 +184,43 @@ static int64_t net_slirp_clock_get_ns(void *opaque)
>      return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>  }
>
> +typedef struct SlirpTimer SlirpTimer;
>  struct SlirpTimer {
>      QEMUTimer timer;
> +#if SLIRP_CHECK_VERSION(4,7,0)
> +    Slirp *slirp;
> +    SlirpTimerId id;
> +    void *cb_opaque;
> +#endif
> +};
> +
> +#if SLIRP_CHECK_VERSION(4,7,0)
> +static void net_slirp_init_completed(Slirp *slirp, void *opaque)
> +{
> +    SlirpState *s =3D opaque;
> +    s->slirp =3D slirp;
>  }
>
> +static void net_slirp_timer_cb(void *opaque)
> +{
> +    SlirpTimer *t =3D opaque;
> +    slirp_handle_timer(t->slirp, t->id, t->cb_opaque);
> +}
> +
> +static void *net_slirp_timer_new_opaque(SlirpTimerId id,
> +                                        void *cb_opaque, void *opaque)
> +{
> +    SlirpState *s =3D opaque;
> +    SlirpTimer *t =3D g_new(SlirpTimer, 1);
> +    t->slirp =3D s->slirp;
> +    t->id =3D id;
> +    t->cb_opaque =3D cb_opaque;
> +    timer_init_full(&t->timer, NULL, QEMU_CLOCK_VIRTUAL,
> +                    SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
> +                    net_slirp_timer_cb, t);
> +    return t;
> +}
> +#else
>  static void *net_slirp_timer_new(SlirpTimerCb cb,
>                                   void *cb_opaque, void *opaque)
>  {
> @@ -197,6 +230,7 @@ static void *net_slirp_timer_new(SlirpTimerCb cb,
>                      cb, cb_opaque);
>      return t;
>  }
> +#endif
>
>  static void net_slirp_timer_free(void *timer, void *opaque)
>  {
> @@ -231,7 +265,12 @@ static const SlirpCb slirp_cb =3D {
>      .send_packet =3D net_slirp_send_packet,
>      .guest_error =3D net_slirp_guest_error,
>      .clock_get_ns =3D net_slirp_clock_get_ns,
> +#if SLIRP_CHECK_VERSION(4,7,0)
> +    .init_completed =3D net_slirp_init_completed,
> +    .timer_new_opaque =3D net_slirp_timer_new_opaque,
> +#else
>      .timer_new =3D net_slirp_timer_new,
> +#endif
>      .timer_free =3D net_slirp_timer_free,
>      .timer_mod =3D net_slirp_timer_mod,
>      .register_poll_fd =3D net_slirp_register_poll_fd,
> @@ -578,7 +617,7 @@ static int net_slirp_init(NetClientState *peer, const
> char *model,
>
>      s =3D DO_UPCAST(SlirpState, nc, nc);
>
> -    cfg.version =3D 3;
> +    cfg.version =3D SLIRP_CHECK_VERSION(4,7,0) ? 4 : 3;
>      cfg.restricted =3D restricted;
>      cfg.in_enabled =3D ipv4;
>      cfg.vnetwork =3D net;
> --
> 2.35.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f7741105de3f7746
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 1:01 AM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">libsl=
irp 4.7 introduces a CFI-friendly version of the .timer_new callback.<br>
The new callback replaces the function pointer with an enum; invoking the<b=
r>
callback is done with a new function slirp_handle_timer.<br>
<br>
Support the new API so that CFI can be made compatible with using a system<=
br>
libslirp.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0net/slirp.c | 41 ++++++++++++++++++++++++++++++++++++++++-<br>
=C2=A01 file changed, 40 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/net/slirp.c b/net/slirp.c<br>
index b3a92d6e38..57af42299d 100644<br>
--- a/net/slirp.c<br>
+++ b/net/slirp.c<br>
@@ -184,10 +184,43 @@ static int64_t net_slirp_clock_get_ns(void *opaque)<b=
r>
=C2=A0 =C2=A0 =C2=A0return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
=C2=A0}<br>
<br>
+typedef struct SlirpTimer SlirpTimer;<br>
=C2=A0struct SlirpTimer {<br>
=C2=A0 =C2=A0 =C2=A0QEMUTimer timer;<br>
+#if SLIRP_CHECK_VERSION(4,7,0)<br>
+=C2=A0 =C2=A0 Slirp *slirp;<br>
+=C2=A0 =C2=A0 SlirpTimerId id;<br>
+=C2=A0 =C2=A0 void *cb_opaque;<br>
+#endif<br>
+};<br>
+<br>
+#if SLIRP_CHECK_VERSION(4,7,0)<br>
+static void net_slirp_init_completed(Slirp *slirp, void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 SlirpState *s =3D opaque;<br>
+=C2=A0 =C2=A0 s-&gt;slirp =3D slirp;<br>
=C2=A0}<br>
<br>
+static void net_slirp_timer_cb(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 SlirpTimer *t =3D opaque;<br>
+=C2=A0 =C2=A0 slirp_handle_timer(t-&gt;slirp, t-&gt;id, t-&gt;cb_opaque);<=
br>
+}<br>
+<br>
+static void *net_slirp_timer_new_opaque(SlirpTimerId id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *cb=
_opaque, void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 SlirpState *s =3D opaque;<br>
+=C2=A0 =C2=A0 SlirpTimer *t =3D g_new(SlirpTimer, 1);<br>
+=C2=A0 =C2=A0 t-&gt;slirp =3D s-&gt;slirp;<br>
+=C2=A0 =C2=A0 t-&gt;id =3D id;<br>
+=C2=A0 =C2=A0 t-&gt;cb_opaque =3D cb_opaque;<br>
+=C2=A0 =C2=A0 timer_init_full(&amp;t-&gt;timer, NULL, QEMU_CLOCK_VIRTUAL,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SCAL=
E_MS, QEMU_TIMER_ATTR_EXTERNAL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 net_=
slirp_timer_cb, t);<br>
+=C2=A0 =C2=A0 return t;<br>
+}<br>
+#else<br>
=C2=A0static void *net_slirp_timer_new(SlirpTimerCb cb,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *cb_opaque, void *opaque=
)<br>
=C2=A0{<br>
@@ -197,6 +230,7 @@ static void *net_slirp_timer_new(SlirpTimerCb cb,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cb, cb_opaque);<br>
=C2=A0 =C2=A0 =C2=A0return t;<br>
=C2=A0}<br>
+#endif<br>
<br>
=C2=A0static void net_slirp_timer_free(void *timer, void *opaque)<br>
=C2=A0{<br>
@@ -231,7 +265,12 @@ static const SlirpCb slirp_cb =3D {<br>
=C2=A0 =C2=A0 =C2=A0.send_packet =3D net_slirp_send_packet,<br>
=C2=A0 =C2=A0 =C2=A0.guest_error =3D net_slirp_guest_error,<br>
=C2=A0 =C2=A0 =C2=A0.clock_get_ns =3D net_slirp_clock_get_ns,<br>
+#if SLIRP_CHECK_VERSION(4,7,0)<br>
+=C2=A0 =C2=A0 .init_completed =3D net_slirp_init_completed,<br>
+=C2=A0 =C2=A0 .timer_new_opaque =3D net_slirp_timer_new_opaque,<br>
+#else<br>
=C2=A0 =C2=A0 =C2=A0.timer_new =3D net_slirp_timer_new,<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0.timer_free =3D net_slirp_timer_free,<br>
=C2=A0 =C2=A0 =C2=A0.timer_mod =3D net_slirp_timer_mod,<br>
=C2=A0 =C2=A0 =C2=A0.register_poll_fd =3D net_slirp_register_poll_fd,<br>
@@ -578,7 +617,7 @@ static int net_slirp_init(NetClientState *peer, const c=
har *model,<br>
<br>
=C2=A0 =C2=A0 =C2=A0s =3D DO_UPCAST(SlirpState, nc, nc);<br>
<br>
-=C2=A0 =C2=A0 cfg.version =3D 3;<br>
+=C2=A0 =C2=A0 cfg.version =3D SLIRP_CHECK_VERSION(4,7,0) ? 4 : 3;<br>
=C2=A0 =C2=A0 =C2=A0cfg.restricted =3D restricted;<br>
=C2=A0 =C2=A0 =C2=A0cfg.in_enabled =3D ipv4;<br>
=C2=A0 =C2=A0 =C2=A0cfg.vnetwork =3D net;<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f7741105de3f7746--

