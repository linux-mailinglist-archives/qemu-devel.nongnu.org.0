Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4085AD342
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:53:40 +0200 (CEST)
Received: from localhost ([::1]:53064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBbf-00046Y-AH
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oVBI0-0008Rb-Pr
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:33:20 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:43691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oVBHz-000523-1s
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:33:20 -0400
Received: by mail-lf1-x12b.google.com with SMTP id v26so12908019lfd.10
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 05:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=jUzKCX5LrqcNKxgQ6Q2pcrSzgqi5mo9lLUUYQbgt86M=;
 b=E2G9gtd1TP21qlS7NRarXWpaL8kbbCclV3+mpqMu38NOhIbFhpANgvyufdjyFC39cm
 sUhpTnGNbMbwmCyFrCo+aHs2nPrmakAVM0hRbPswYFPQsOSF+PxfM8BM8ETPANT4IjP6
 8pXNOGPknn2h3iz3ZrQaVxkK00qLUhPsQCCP2WwITODei7YYWx/gsxrwDZph+CXGGkAz
 c5UQD1zT487lUzH/rGfJSsGd049SDPLNfyk08UzAt6Z/Edx8FXj1kld6lD9qRjtcEw8J
 rjz471pcBC7otSjnf+FsI0SztAq5BH+NuAo8X2YXsVtmOz0gtVnTfi3J7uSkAIam7Cy7
 Vh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=jUzKCX5LrqcNKxgQ6Q2pcrSzgqi5mo9lLUUYQbgt86M=;
 b=EY0wlj8lR1vmlzs3M4AGXV8i/Uwar5E+ACVHbEv/wodcyLAgurCpAFs+vSrlqPSYAK
 r+4D9xHircmRFULzpgLPofekqHWvuPfFaQxdJNFkfUepiybBDm1w+a+BOw2rOZlHspDf
 e/zHxkQ4lgHPFSyk91cc+UjVzc10w1Zc/OJnerrSkAlt7lU2bj2h9GKRaD2RyKpieEAZ
 XYmsxTY7ZSmx+Lu0ypwrMyvCOCM2goNj9TF8LHSuvGG5MdzaKGY05MW//BbfgLbOh5qe
 pJnpaq7541Bg1+2ngRFG4f619V8oAATdUi88Tz+tsd/KXcX3g++aeuzYoffNYW1tYK9Z
 3J/w==
X-Gm-Message-State: ACgBeo2XzL6yViB5t1rfo0PI0xU0oIJ9cJVTYy6mVxXYnsVSXSjnBwPN
 7ZwtcfEFwOGch3OovFM4dVLO96oEOmhLrbUGcLo=
X-Google-Smtp-Source: AA6agR70ZKV0rWoljYjDJUBg+87XD2fJn+cMXsWVTrl8MbjJLKP8K+qWE3CVMnP8OV/pCB3C6H/q0ffqwYzyQOtGycg=
X-Received: by 2002:a05:6512:2306:b0:48b:2905:21a8 with SMTP id
 o6-20020a056512230600b0048b290521a8mr17938887lfu.167.1662381196143; Mon, 05
 Sep 2022 05:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1661240709.git.tugy@chinatelecom.cn>
 <CAJ+F1CL7G+RGGH1Qt6TwX0fHRjNxtyfg27HyuZJnGh49KdXaGg@mail.gmail.com>
 <02813d8a-6fce-8623-a188-ead54682b55e@chinatelecom.cn>
In-Reply-To: <02813d8a-6fce-8623-a188-ead54682b55e@chinatelecom.cn>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 5 Sep 2022 16:33:04 +0400
Message-ID: <CAJ+F1CJi4mkAHEGBm2WYK+mw37byzof0p+omCcuZy9sdh4N4xQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] introduce qemu_socketpiar()
To: Guoyi Tu <tugy@chinatelecom.cn>
Cc: peter.maydell@linaro.org, f4bug@amsat.org, qemu_oss@crudebyte.com, 
 richard.henderson@linaro.org, berrange@redhat.com, mst@redhat.com, 
 kraxel@redhat.com, qemu-devel@nongnu.org, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ad720a05e7ed48bf"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12b.google.com
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

--000000000000ad720a05e7ed48bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Sep 5, 2022 at 4:28 PM Guoyi Tu <tugy@chinatelecom.cn> wrote:

>
>
> On 9/5/22 19:19, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Tue, Aug 23, 2022 at 12:00 PM <tugy@chinatelecom.cn
> > <mailto:tugy@chinatelecom.cn>> wrote:
> >
> >     From: Guoyi Tu <tugy@chinatelecom.cn <mailto:tugy@chinatelecom.cn>>
> >
> >     Introduce qemu_socketpair() to create socket pair fd, and
> >     set the close-on-exec flag at default as with the other type
> >     of socket does.
> >
> >     besides, the live update feature is developing, so it's necessary
> >     to do that.
> >
> >     Guoyi Tu (2):
> >        oslib-posix: Introduce qemu_socketpair()
> >        vhost-user: Call qemu_socketpair() instead of socketpair()
> >
> >
> > Looks like a good idea to me. We will eventually extend the support for
> > win32 (as discussed in "[PATCH 19/51] tests/qtest: Build
> > test-filter-{mirror, redirector} cases for posix only").
> >
> > There are other places where you can replace existing socketpair() call=
s
> > in the code base. Why not do it?
> >
> yeah, Thanks for reminding me, Maybe i can replace all the existing
> socketpair() calls in a separate patch if this patch can be merged to
> upstream.
>

It needs to be reviewed though, all may not want to set CLOEXEC, but most
should. Else, we should probably consider switching to GSpawn which does
dup or unset CLOEXEC for explicitely passed fds.


> --
> Guoyi
>
> > Current patches lgtm
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com
> > <mailto:marcandre.lureau@redhat.com>>
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000ad720a05e7ed48bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 5, 2022 at 4:28 PM Guoy=
i Tu &lt;<a href=3D"mailto:tugy@chinatelecom.cn">tugy@chinatelecom.cn</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 9/5/22 19:19, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Tue, Aug 23, 2022 at 12:00 PM &lt;<a href=3D"mailto:tugy@chinatelec=
om.cn" target=3D"_blank">tugy@chinatelecom.cn</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:tugy@chinatelecom.cn" target=3D"_blank">t=
ugy@chinatelecom.cn</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0From: Guoyi Tu &lt;<a href=3D"mailto:tugy@chinatele=
com.cn" target=3D"_blank">tugy@chinatelecom.cn</a> &lt;mailto:<a href=3D"ma=
ilto:tugy@chinatelecom.cn" target=3D"_blank">tugy@chinatelecom.cn</a>&gt;&g=
t;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Introduce qemu_socketpair() to create socket pair f=
d, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0set the close-on-exec flag at default as with the o=
ther type<br>
&gt;=C2=A0 =C2=A0 =C2=A0of socket does.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0besides, the live update feature is developing, so =
it&#39;s necessary<br>
&gt;=C2=A0 =C2=A0 =C2=A0to do that.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Guoyi Tu (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 oslib-posix: Introduce qemu_socketpair()<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 vhost-user: Call qemu_socketpair() instead =
of socketpair()<br>
&gt; <br>
&gt; <br>
&gt; Looks like a good idea to me. We will eventually extend the support fo=
r <br>
&gt; win32 (as discussed in &quot;[PATCH 19/51] tests/qtest: Build <br>
&gt; test-filter-{mirror, redirector} cases for posix only&quot;).<br>
&gt; <br>
&gt; There are other places where you can replace existing socketpair() cal=
ls <br>
&gt; in the code base. Why not do it?<br>
&gt; <br>
yeah, Thanks for reminding me, Maybe i can replace all the existing <br>
socketpair() calls in a separate patch if this patch can be merged to <br>
upstream.<br></blockquote><br></div><div class=3D"gmail_quote">It needs to =
be reviewed though, all may not want to set CLOEXEC, but most should. Else,=
 we should probably consider switching to GSpawn which does dup or unset CL=
OEXEC for explicitely passed fds.<br></div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
--<br>
Guoyi<br>
<br>
&gt; Current patches lgtm<br>
&gt; Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_b=
lank">marcandre.lureau@redhat.com</a>&gt;&gt;<br>
&gt; <br>
&gt; -- <br>
&gt; Marc-Andr=C3=A9 Lureau<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ad720a05e7ed48bf--

