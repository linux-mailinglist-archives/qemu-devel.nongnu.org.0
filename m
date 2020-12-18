Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325542DEBDD
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 00:13:48 +0100 (CET)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqOwU-00042w-Ot
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 18:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kqOvD-0003Qb-Oe
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 18:12:27 -0500
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:42361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kqOvB-0000Y3-AS
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 18:12:27 -0500
Received: by mail-qk1-x72c.google.com with SMTP id 22so3708554qkf.9
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 15:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4RVEuPkyzayN0q629vxoS0XQJXxsVF0cSrf9VfcD/mY=;
 b=WmF1o1tB4QFsZAbBxZM6tj62hYSy7AflllPDJ615xTYDl1qeOytFVZKKkzNye/K7jU
 xHpQkvF84DJMmFB4H4f1Y+kA63t+jj0R+AMqtPC0MAHoC4aQYjSvs8mkVq9xfWgZaRD0
 dMbenoPSrZINItkotn5E5FBhZMq8s0FQoU03HCnkADCJXKqHVhkKbeDFGYrG1qAq7rPx
 PqcKnmh3zGj15d3Sf2k3lOxBQtoJtQmNBLqOFVcFnKEaiyvm6P6MvgKcpVIea9oPCc9M
 oPLSQXuD+Djq6Fo6uuN4g7cOFfpkSernZ+WJQXkAVW8tyHa1nV44cRwg7twuf2h5mxpE
 STvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4RVEuPkyzayN0q629vxoS0XQJXxsVF0cSrf9VfcD/mY=;
 b=tNw0vcqbSENkB+R68poogccSo5FDN5Z9/EyiZZGX+vu6q5DCciEyiFNW3w9Zvn4p2t
 OvYj/gr4hsQW2Ah5POPeRR+4twG226HddxAYH/DObkzjqhhTgkNGjElp9sj5h+XwIkFC
 hPJbEiHeKJ4g44pMVv8TRLntXFQqFNdiQJcIuX4MbfVOX566NezL8awn0fDzRVG/ZdcT
 qvAOWrOOKMHSiHyGuVTOO2DcD1FA/DpKi/p/fW1QUDP/f5YQcIHHzpuU5BDaq+UacpCh
 k2NvWUqMHyon5j9I3UNksbe3dGo2EhYJYh3REZfoqdeyOODujCdCn2RYVQES0RVrQrec
 zL6w==
X-Gm-Message-State: AOAM531xw2GtEgpZm9a6qBqWmqDxeTf3pSAz3660tn7EF9hPS0fDbCHR
 eFQHhHFstJdHjoGz6aFbW15TUbpkngmieXMe1GzwRw==
X-Google-Smtp-Source: ABdhPJySIJeQfZAfvquouQQWAiXr2zwLkH6qog/AMh9dGBuRcDG4Vskpu97IaQNYChP5sZ9evAL3rbiZJnYEe9QLedE=
X-Received: by 2002:a37:a614:: with SMTP id p20mr7022797qke.359.1608333143684; 
 Fri, 18 Dec 2020 15:12:23 -0800 (PST)
MIME-Version: 1.0
References: <20201218205451.10559-1-imp@freebsd.org>
 <20201218205451.10559-3-imp@freebsd.org>
In-Reply-To: <20201218205451.10559-3-imp@freebsd.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 18 Dec 2020 16:12:15 -0700
Message-ID: <CANCZdfrqDc15eGYSrPQjYHdZyH6_2AMt1oYK__fU5Nbghi1kUA@mail.gmail.com>
Subject: Re: [PATCH 2/4] tcg: Additional Trap type for FreeBSD
To: Warner Losh <imp@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000b5d0c705b6c53dd2"
Received-SPF: none client-ip=2607:f8b0:4864:20::72c;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Juergen Lock <nox@freebsd.org>, Sean Bruno <sbruno@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b5d0c705b6c53dd2
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 18, 2020 at 1:55 PM <imp@freebsd.org> wrote:

> From: Sean Bruno <sbruno@freebsd.org>
>
> FreeBSD can generate a trap 0xc as well as 0xe when writing to a
> read-only page.
>
> Signed-off-by: Juergen Lock <nox@FreeBSD.org>
> [imp rewored commit message for clarity]
> Signed-off-by: Warner Losh <imp@FreeBSD.org>
> ---
>  accel/tcg/user-exec.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 4ebe25461a..1f5befa9f9 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -343,7 +343,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>
>      pc = PC_sig(uc);
>      return handle_cpu_signal(pc, info,
> -                             TRAP_sig(uc) == 0xe ? (ERROR_sig(uc) >> 1) &
> 1 : 0,
> +#if defined(__FreeBSD__) || defined(__DragonFly__)
> +                             (TRAP_sig(uc) == 0xe ||
> +                              TRAP_sig(uc) == 0xc) ?
> +#else
> +                             TRAP_sig(uc) == 0xe ?
> +#endif
> +                             (ERROR_sig(uc) >> 1) & 1 : 0,
>

I'd like to withdraw this patch. After I posted it I talked to our x86
expert and he's convinced it's bogus.

We'll run without it for a while and see if we need to revisit this or not.
But for now, please don't consider this change.

Warner


>                               &MASK_sig(uc));
>  }
>
> --
> 2.22.1
>
>

--000000000000b5d0c705b6c53dd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 18, 2020 at 1:55 PM &lt;<=
a href=3D"mailto:imp@freebsd.org">imp@freebsd.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: Sean Bruno &lt;<a hr=
ef=3D"mailto:sbruno@freebsd.org" target=3D"_blank">sbruno@freebsd.org</a>&g=
t;<br>
<br>
FreeBSD can generate a trap 0xc as well as 0xe when writing to a<br>
read-only page.<br>
<br>
Signed-off-by: Juergen Lock &lt;nox@FreeBSD.org&gt;<br>
[imp rewored commit message for clarity]<br>
Signed-off-by: Warner Losh &lt;imp@FreeBSD.org&gt;<br>
---<br>
=C2=A0accel/tcg/user-exec.c | 8 +++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index 4ebe25461a..1f5befa9f9 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -343,7 +343,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0pc =3D PC_sig(uc);<br>
=C2=A0 =C2=A0 =C2=A0return handle_cpu_signal(pc, info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TRAP_sig(uc) =3D=3D 0xe ? (ERROR_sig(uc) &gt=
;&gt; 1) &amp; 1 : 0,<br>
+#if defined(__FreeBSD__) || defined(__DragonFly__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(TRAP_sig(uc) =3D=3D 0xe ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TRAP_sig(uc) =3D=3D 0xc) ?<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TRAP_sig(uc) =3D=3D 0xe ?<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ERROR_sig(uc) &gt;&gt; 1) &amp; 1 : 0,<br><=
/blockquote><div><br></div><div>I&#39;d like to withdraw this patch. After =
I posted it I talked to our x86 expert and he&#39;s convinced it&#39;s bogu=
s.</div><div><br></div><div>We&#39;ll run without it for a while and see if=
 we need to revisit this or not. But for now, please don&#39;t consider thi=
s change.</div><div><br></div><div>Warner</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;MASK_sig(uc));<br>
=C2=A0}<br>
<br>
-- <br>
2.22.1<br>
<br>
</blockquote></div></div>

--000000000000b5d0c705b6c53dd2--

