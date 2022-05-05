Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0892351BBA3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:13:10 +0200 (CEST)
Received: from localhost ([::1]:50592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXXo-0003rm-Mi
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmWlS-0008Nl-0V
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:23:10 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:34645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmWlQ-0000tP-CZ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:23:09 -0400
Received: by mail-lj1-x233.google.com with SMTP id 17so4645904lji.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9kkDmGXQI+HOKnkifS1aXKvn6iNREDWFxF3F8IF7whA=;
 b=Bi5igJ80qaCEcrxpIccFR4NE8NeRN1O98Mfzce1hnm9W6UFT/8szumjOQ/9NXoA9b/
 RR1rxAI4hx4Z5MeQrJZiAGxYqBUJjf78QzprW7U7mHqknZg7Y3ZKiJbcVmiHXyp2lQWn
 jxPLoztBqBTGg1eIQWtYjh/IS2X57Ho9R8d4qDTsQHTRTwlwH80w6iMIG1E3edvSfog9
 wUj+wXJs3bASrzb6C3M0mUZ0zILcfpZmngYeEGgVaKHOTgTGV6EIMCVjmie6u1uV1j6W
 VSDnzezgpF6sdh6kJnxA7vD7DarU9Sl8oVi0RWxuIlxplAT+EJU6KFxjfiqdv45XFzsj
 3Fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9kkDmGXQI+HOKnkifS1aXKvn6iNREDWFxF3F8IF7whA=;
 b=5dtyBN5UR0hWP1YS3Pr6F+6x8amdCZi2i+lLxgXfuKG0DHSSjcZFP2y+kuOpMWrFFK
 1t2+bhVZ1OT6LN24shmkwHfHUSkoABt71AG1DtADG7Z/vdMk0z3gg2u9lhRvLzs1nxF7
 wtu5XAqsUM2fKXHhFTgsaryyYGN4lRVMp0Eoe2s/WljInWH/wj5FpHSkoLFo3Ad3p1iJ
 IpwNmhKFIk7gHIHHtxb2urTWo27fsCZT4yesrgY4+eC289njN/HP9nzRvYlehXm1xebg
 0/qOMjpNcTfbrHTAi0RdiiUX8fRtIYefSYIb+pH1pigwCL9VvC9dwNF/PiZ2+GOn1Tt8
 GCAA==
X-Gm-Message-State: AOAM5311DcGPEm2YAithDlVCaR2dW2AF9KPSwg1zeDFzpJeW3jhx9iPx
 1GwNwzp1co0gjsxBSwt89TToXRojbs2ahCI2NtlJ4TR9XhU=
X-Google-Smtp-Source: ABdhPJyo96Pcm1GXC5Zqo7F/k1p2umvHqtwS0iyId0WwGBRYCfiVm/R2ZgQY+Z7Ow0JzaCo7fkNShkGrjdvRfc9yecg=
X-Received: by 2002:a05:651c:889:b0:24f:2336:1b95 with SMTP id
 d9-20020a05651c088900b0024f23361b95mr15820066ljq.345.1651738986629; Thu, 05
 May 2022 01:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220504210001.678419-1-pbonzini@redhat.com>
 <20220504210001.678419-3-pbonzini@redhat.com>
In-Reply-To: <20220504210001.678419-3-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 May 2022 12:22:54 +0400
Message-ID: <CAJ+F1CJKPUSa+VYBzbeXU7+iSqsWmQ10Y7qDkOQwdLxd2Lty3g@mail.gmail.com>
Subject: Re: [PATCH 2/5] net: slirp: introduce a wrapper struct for QemuTimer
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000008f50bf05de3f733e"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x233.google.com
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

--0000000000008f50bf05de3f733e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2022 at 1:02 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> This struct will be extended in the next few patches to support the
> new slirp_handle_timer() call.  For that we need to store an additional
> "int" for each SLIRP timer, in addition to the cb_opaque.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  net/slirp.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/net/slirp.c b/net/slirp.c
> index bc5e9e4f77..f1e25d741f 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -184,23 +184,32 @@ static int64_t net_slirp_clock_get_ns(void *opaque)
>      return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>  }
>
> +struct SlirpTimer {
> +    QEMUTimer timer;
> +}
> +
>  static void *net_slirp_timer_new(SlirpTimerCb cb,
>                                   void *cb_opaque, void *opaque)
>  {
> -    return timer_new_full(NULL, QEMU_CLOCK_VIRTUAL,
> -                          SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
> -                          cb, cb_opaque);
> +    SlirpTimer *t =3D g_new(SlirpTimer, 1);
> +    timer_init_full(&t->timer, NULL, QEMU_CLOCK_VIRTUAL,
> +                    SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
> +                    cb, cb_opaque);
> +    return t;
>  }
>
>  static void net_slirp_timer_free(void *timer, void *opaque)
>  {
> -    timer_free(timer);
> +    SlirpTimer *t =3D timer;
> +    timer_del(&t->timer);
> +    g_free(t);
>  }
>
>  static void net_slirp_timer_mod(void *timer, int64_t expire_timer,
>                                  void *opaque)
>  {
> -    timer_mod(timer, expire_timer);
> +    SlirpTimer *t =3D timer;
> +    timer_mod(&t->timer, expire_timer);
>  }
>
>  static void net_slirp_register_poll_fd(int fd, void *opaque)
> --
> 2.35.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008f50bf05de3f733e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 1:02 AM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This =
struct will be extended in the next few patches to support the<br>
new slirp_handle_timer() call.=C2=A0 For that we need to store an additiona=
l<br>
&quot;int&quot; for each SLIRP timer, in addition to the cb_opaque.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0net/slirp.c | 19 ++++++++++++++-----<br>
=C2=A01 file changed, 14 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/net/slirp.c b/net/slirp.c<br>
index bc5e9e4f77..f1e25d741f 100644<br>
--- a/net/slirp.c<br>
+++ b/net/slirp.c<br>
@@ -184,23 +184,32 @@ static int64_t net_slirp_clock_get_ns(void *opaque)<b=
r>
=C2=A0 =C2=A0 =C2=A0return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
=C2=A0}<br>
<br>
+struct SlirpTimer {<br>
+=C2=A0 =C2=A0 QEMUTimer timer;<br>
+}<br>
+<br>
=C2=A0static void *net_slirp_timer_new(SlirpTimerCb cb,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *cb_opaque, void *opaque=
)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return timer_new_full(NULL, QEMU_CLOCK_VIRTUAL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 cb, cb_opaque);<br>
+=C2=A0 =C2=A0 SlirpTimer *t =3D g_new(SlirpTimer, 1);<br>
+=C2=A0 =C2=A0 timer_init_full(&amp;t-&gt;timer, NULL, QEMU_CLOCK_VIRTUAL,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SCAL=
E_MS, QEMU_TIMER_ATTR_EXTERNAL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cb, =
cb_opaque);<br>
+=C2=A0 =C2=A0 return t;<br>
=C2=A0}<br>
<br>
=C2=A0static void net_slirp_timer_free(void *timer, void *opaque)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 timer_free(timer);<br>
+=C2=A0 =C2=A0 SlirpTimer *t =3D timer;<br>
+=C2=A0 =C2=A0 timer_del(&amp;t-&gt;timer);<br>
+=C2=A0 =C2=A0 g_free(t);<br>
=C2=A0}<br>
<br>
=C2=A0static void net_slirp_timer_mod(void *timer, int64_t expire_timer,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 timer_mod(timer, expire_timer);<br>
+=C2=A0 =C2=A0 SlirpTimer *t =3D timer;<br>
+=C2=A0 =C2=A0 timer_mod(&amp;t-&gt;timer, expire_timer);<br>
=C2=A0}<br>
<br>
=C2=A0static void net_slirp_register_poll_fd(int fd, void *opaque)<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000008f50bf05de3f733e--

