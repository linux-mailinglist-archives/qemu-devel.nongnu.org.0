Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB834A3A94
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 22:38:16 +0100 (CET)
Received: from localhost ([::1]:52536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEHtm-0008Ph-W7
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 16:38:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nEHqu-0005Jx-40
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:35:17 -0500
Received: from [2607:f8b0:4864:20::932] (port=36427
 helo=mail-ua1-x932.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nEHqs-0001yK-6c
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:35:15 -0500
Received: by mail-ua1-x932.google.com with SMTP id u76so10792797uau.3
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 13:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xM2vyqoi7kfVAZysmGC6Uw6dQDTz6sWICdz6JGW4cI8=;
 b=EE4FUonCGlm9+ohyvy9JxlM3NcwH/U0cxY89MJ4io0X3pZZqny+8kTJImaaCQr6+/O
 WB/zLSZi0bh20V2L9LkQ3q9+9CGxmdbkNuXjG5FX/MSF/rHhv5lC2DsVIZt0DcSD3lwT
 2HFpt7a3+n8SaFIB1dANNyvDJrVj4+OqWVYmjgmulJ5lRETeFtwwFCPtM1T2s8bx3EIZ
 6pPTyqj59wPRp3UsISWBO19SdLKPhTu+0vDmORrULlvj/wLQcoMZ+7tc/Gdi2V2W3kqu
 ZFEtQ/wEz6R6Xf7f0G0M+CKnM0qb5tfuMejZk0R+VvTk1ZHN3jfngpyXKEY4SwmCuj0e
 BVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xM2vyqoi7kfVAZysmGC6Uw6dQDTz6sWICdz6JGW4cI8=;
 b=gjl+GU7T5vn1N9hzMueYULY9eybC7L9BWAb1EvxQqMVUlaRd+0EuwTCmAgfqc2ORu5
 /vuZFU0nARhY9RJwjKemmQ0k+6uFJer1I331hQVecf6xGaYog10cuVWfv8z2VGKG5vMz
 +4Z6Y24Sy4y3+WE8blJgzQndtK28rjLKLKPtDNkXk/In9mra0Dd8lhFHpCYAODP/7gjK
 VuMA6N2UGXG6IvUo9N88SKOS0khbm7/mHpBbtIhqRxex1OhgySAq+oSoGKSWBl3+LxEB
 4cNrV1QR2AbtlkpEwAbuF8cQ0KuJD7BC06WU+rFh8orm0V/mZyM6QZdigNb3t+ZvIRHy
 jybg==
X-Gm-Message-State: AOAM531drU2SUO9sckFlSa05zJ+FRMxqbzpGTCZQmcc6UpjioyNB0uAv
 p7//CQ4oMiry/N6EorysbeApFVLdzvjugC1+z0Q/ug==
X-Google-Smtp-Source: ABdhPJwsqZJVVMDy0VWEP4tDhgRIZPpePdhu1IY/010MC1DqypFu0YTztm4AEBvzx5o6WRXmyCSP4GrVKn0y9Yb3+Os=
X-Received: by 2002:ab0:2a07:: with SMTP id o7mr7345031uar.39.1643578510499;
 Sun, 30 Jan 2022 13:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20220128232805.86191-1-imp@bsdimp.com>
 <20220128232805.86191-37-imp@bsdimp.com>
 <78170fc0-ad21-168b-9ad6-1c34b26a6f41@linaro.org>
In-Reply-To: <78170fc0-ad21-168b-9ad6-1c34b26a6f41@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 30 Jan 2022 14:34:59 -0700
Message-ID: <CANCZdfq4SAMLVCGOcjoXuMBDJ89HTZe9Lu2qRXZvjxwkpJXUrA@mail.gmail.com>
Subject: Re: [PATCH v3 36/40] bsd-user/signal.c: implement do_sigaction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004770aa05d6d37144"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::932
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::932;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Konrad Witaszczyk <def@freebsd.org>, Jessica Clarke <jrtc27@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004770aa05d6d37144
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 30, 2022 at 2:19 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/29/22 10:28, Warner Losh wrote:
> > +    if (block_signals()) {
> > +        return -TARGET_ERESTART;
> > +    }
> > +
> > +    k = &sigact_table[sig - 1];
> > +    if (oact) {
> > +        oact->_sa_handler = tswapal(k->_sa_handler);
> > +        oact->sa_flags = tswap32(k->sa_flags);
> > +        oact->sa_mask = k->sa_mask;
> > +    }
> > +    if (act) {
> > +        /* XXX: this is most likely not threadsafe. */
>
> It surely is -- we never set another thread's sigaction, and we've just
> blocked all
> signals, so we're signal-safe.  Am I missing something?
>

Now that I look at it, I can't understand why this comment is here. I'll
remove it.

Warner


> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
>

--0000000000004770aa05d6d37144
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 30, 2022 at 2:19 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 1/29/22 10:28, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 if (block_signals()) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_ERESTART;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 k =3D &amp;sigact_table[sig - 1];<br>
&gt; +=C2=A0 =C2=A0 if (oact) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oact-&gt;_sa_handler =3D tswapal(k-&gt;_s=
a_handler);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oact-&gt;sa_flags =3D tswap32(k-&gt;sa_fl=
ags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oact-&gt;sa_mask =3D k-&gt;sa_mask;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if (act) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* XXX: this is most likely not threadsaf=
e. */<br>
<br>
It surely is -- we never set another thread&#39;s sigaction, and we&#39;ve =
just blocked all <br>
signals, so we&#39;re signal-safe.=C2=A0 Am I missing something?<br></block=
quote><div><br></div><div>Now that I look at it, I can&#39;t understand why=
 this comment is here. I&#39;ll remove it.</div><div><br></div><div>Warner<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Otherwise,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
<br>
r~<br>
</blockquote></div></div>

--0000000000004770aa05d6d37144--

