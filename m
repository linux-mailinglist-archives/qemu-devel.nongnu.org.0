Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CA34C6439
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 08:58:53 +0100 (CET)
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOavj-0004zf-SM
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 02:58:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nOaqm-0002ba-52
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:53:44 -0500
Received: from [2a00:1450:4864:20::432] (port=44740
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nOaqk-0003cH-Ih
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:53:43 -0500
Received: by mail-wr1-x432.google.com with SMTP id u1so13933857wrg.11
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 23:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ng3OvYR81BaMuGtUUSzQ1wTsXDJO3QLcmSHJXksNNMw=;
 b=aRQ4h+gjusvngeKezJGMWNMXCEfbVytGeuCJFVgIUr++G4d0odm3Q+XUqQ+9Ywy5Qz
 qZ1+I2sZxwjKqsU16JlQ4pXTspQOPbYzdM9uckS0dTQWDGjh192Fr5FL4tD6/ZiGQTjf
 oWCfAFIzgUk6jYwcbVCK7iJfGFFfyFobL5h04bAGWu4fWn1KDcIV5YFT2mNdLxldS9WJ
 s7nAEZt/3O70yLAl86hCws/vTe825pYHC7KIsgPo5HsOdsPhLdOkCzlQw8n4pGGIAppX
 Gl1USpNxhjz1f6QEoDgENxfkT/IO6kBRM8rV8UPSD4yZnKVT5TYGP9DFYYWlnkoYLFkY
 6D+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ng3OvYR81BaMuGtUUSzQ1wTsXDJO3QLcmSHJXksNNMw=;
 b=HF62BMlHBeQBMGt7FW/eagq4woRMkzMAkbQAQ9mrphdK+mZI9Y24qxeb0AbRGYUr58
 CJr9qwgrcqgS5uB0nKVIT1djoXUJdiNPAd5Y2/Lhn9BMD4+1l3/g4R8nYvapi51lZnuS
 cur3iOoAIWNHIRVPTmJrW+2CFXelLb3ii77bMW3WTUL2V5HCJxR2FPOQqGGsqOgzSsH/
 g9l7/Cf1PLsA40qGtGJzD9He9lwzoBGCot+0PvcO2gwgHK3rdi0fvAx/DknLouJ3ME1m
 T12GWBwhBmE3F8thi57bP1i2zsCPyi5CEPw3EIKrDkPqbUFDEb2Y2OFatZl8lV5mAlWp
 ZDfg==
X-Gm-Message-State: AOAM5322LMzIPC5WMheVahVCguk23su8tbM+n0xSTIjGVd4iBzuxY558
 bgAhl7IwlkmjAHdk+RqdZilvtf5Jwm2v5dF2lzg=
X-Google-Smtp-Source: ABdhPJwLkna4I7el8sa1T5Ifu6afjvDkYHqAz1z5yCvrwihEVRjPZQQq4Ccwi7kjoWF8vIVe+8MiF22VY4p1Eko/CAA=
X-Received: by 2002:adf:f086:0:b0:1ef:6265:a9a9 with SMTP id
 n6-20020adff086000000b001ef6265a9a9mr11080123wro.562.1646034815890; Sun, 27
 Feb 2022 23:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
 <20220222194008.610377-7-marcandre.lureau@redhat.com>
 <CAJ+F1C+QOAcjAiAY=7jcYgjJTQ79PTUDBRoJ3fzyHha2Syw4tA@mail.gmail.com>
 <8d5b4245-56e7-8384-4104-33d3ab1adf42@redhat.com>
In-Reply-To: <8d5b4245-56e7-8384-4104-33d3ab1adf42@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 28 Feb 2022 11:53:23 +0400
Message-ID: <CAJ+F1CK5U1agzbDztrWBavmoiAfmwW3AHcWBKRwGh9f0LRan0A@mail.gmail.com>
Subject: Re: [PATCH 6/8] char: move qemu_openpty_raw from util/ to char/
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007d3a6705d90f58da"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007d3a6705d90f58da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo

On Sat, Feb 26, 2022 at 11:38 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 2/24/22 18:04, Marc-Andr=C3=A9 Lureau wrote:
> > Paolo,
> >
> > This patch is ok, but in some (new?) circumstances it fails with freebs=
d
> > and reveals that -lutil was missing for kinfo_getproc() in
> > util/oslib-posix.c. Please add:
> >
> > -util_ss.add(when: 'CONFIG_POSIX', if_true: files('oslib-posix.c'))
> > +util_ss.add(when: 'CONFIG_POSIX', if_true: [files('oslib-posix.c'),
> util])
> >
> > (even better if we made this specific to freebsd I guess, but not
> > strictly necessary)
>
> Looking again at the patch (because indeed it broke CI :)), I'm not sure
> it's a good idea.  The code seems to be partly taken from other projects
> and doesn't follow the QEMU coding standards.
>

One more reason imho to not have this in the common qemuutil library.

Apparently, the helper was added in 2008, commit 64b7b7334b ("Put
Pseudo-TTY in rawmode for char devices") and it is not necessary since
Solaris 11.4 (see commit 9df8b20d1). I am not sure we need to maintain
compatibility with Solaris <11.4 (released on Aug 2018) tbh. According to
wikipedia page, 11.3 is maintained until January 2024. Maybe wait until
that and drop it?

Do you have a branch where you have queued the accepted patches? I can
rebase, fix the linking on freebsd, fix style and resend.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007d3a6705d90f58da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Paolo<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 26, 2022 at 11:38=
 AM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 2/24/22 18:04, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Paolo,<br>
&gt; <br>
&gt; This patch is ok, but in some (new?) circumstances it fails with freeb=
sd <br>
&gt; and reveals that -lutil was missing for kinfo_getproc() in <br>
&gt; util/oslib-posix.c. Please add:<br>
&gt; <br>
&gt; -util_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(&#39;oslib-p=
osix.c&#39;))<br>
&gt; +util_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: [files(&#39;oslib-=
posix.c&#39;), util])<br>
&gt; <br>
&gt; (even better if we made this specific to freebsd I guess, but not <br>
&gt; strictly necessary)<br>
<br>
Looking again at the patch (because indeed it broke CI :)), I&#39;m not sur=
e <br>
it&#39;s a good idea.=C2=A0 The code seems to be partly taken from other pr=
ojects <br>
and doesn&#39;t follow the QEMU coding standards.<br></blockquote><div><br>=
</div><div>One more reason imho to not have this in the common qemuutil lib=
rary.</div><div><br></div><div>Apparently, the helper was added in 2008, co=
mmit 64b7b7334b (&quot;Put Pseudo-TTY in rawmode for char devices&quot;) an=
d it is not necessary since Solaris 11.4 (see commit 9df8b20d1). I am not s=
ure we need to maintain compatibility with Solaris &lt;11.4 (released on Au=
g 2018) tbh. According to wikipedia page, 11.3 is maintained until January =
2024. Maybe wait until that and drop it?<br></div><div><br></div><div>Do yo=
u have a branch where you have queued the accepted patches? I can rebase, f=
ix the linking on freebsd, fix style and resend.<br></div><br clear=3D"all"=
></div><div>thanks</div><div><br></div><div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div></div>

--0000000000007d3a6705d90f58da--

