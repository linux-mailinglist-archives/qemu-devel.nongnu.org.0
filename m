Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42056A6863
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 08:48:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXHB0-0003Df-3m; Wed, 01 Mar 2023 02:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pXHAx-0003D4-S5
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:47:00 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pXHAv-0006P7-Gz
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:46:59 -0500
Received: by mail-ed1-x52c.google.com with SMTP id o12so50138884edb.9
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 23:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1677656815;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Cfq7VAbovSYEGhbTr8+sp2WCCI5QenroDgBC6jwW7mY=;
 b=zEstVKS/Z5vha8LsphOuaTag7FUglNdwKD021RCr5SUvVkHEczdn1DWKuFM2dg3nha
 JsxNpSZQv4o0bz9XajPO7kBAXW94Tt7mKVkddv+zJIOlRj2XjhESQPf0CSQBMH9T5bP7
 2pAU4ozocqkZriv4mZvR658u7hoGJTjzdpjRUJh6EpSv1mej0rQ9n6LoRO1OecODKkOu
 guSrRGcxY8aX04vbR5m4wL+H8lIVf7TCRJArQYNdoKhLkl1SmRmNp3sehXLrVLXQxZtA
 3liJXpnLCDVMzUhmc2Kzv/O2iXrtpRKLG4U8orl7bEIhFcleD9oxTkivgbNAyn0Ok89o
 Fbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677656815;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cfq7VAbovSYEGhbTr8+sp2WCCI5QenroDgBC6jwW7mY=;
 b=KyAYHGRg5Bh7eArAUbJuDZf4J+UDSTbhKYDI1lJtE+sh8GX/OfKIgkzr3mpCt4z5TG
 s7VaHWTMOgQcm7mnBBmK1NzB5UQXNivhoKDfzpImCSkU2Gbd/IjkROo1iYS+J6HtwFUO
 K7ZbQE+cfZkxvRAUb6eh3O7q5yW67gNwJxxtCZrO5/kyuycaE9tZrKlzGtgDjWnCehcQ
 0Ab6EqYdfWQmoDhyiGcD41X4V7lJcWJN3Fic3OiZGzpzZlE4++WpW2Y+gPJeQE0EmT/u
 Fl4YxFvIT3p8qZ+Pht6Q6sriOS5CvKMbE1BlgbdBYKrVUO53qMpqHGIYKj/x1RnVi3Ek
 yaFw==
X-Gm-Message-State: AO0yUKXdP/l1k3Kij7vFaBJV1aZNuND6uftqw7S5QzEUbLxt5bVtnks9
 WJgDjKuTwRUVV9moh8GLeWHkG+8avAZHAcQz7SyvAw==
X-Google-Smtp-Source: AK7set96k+5nSlBDhxrzgJTFNfFejbYzJ9QxIgrHSF+mJN22yC5dkY07Y1PoiKTk9vEeEAwybYN7rOTzg/E29xdw+m8=
X-Received: by 2002:a17:906:7199:b0:8b1:3298:c587 with SMTP id
 h25-20020a170906719900b008b13298c587mr2782109ejk.2.1677656815203; Tue, 28 Feb
 2023 23:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
 <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
 <20230228162938-mutt-send-email-mst@kernel.org>
 <87lekg53gn.fsf@pond.sub.org>
In-Reply-To: <87lekg53gn.fsf@pond.sub.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 1 Mar 2023 00:46:44 -0700
Message-ID: <CANCZdfpdjBk63BVFqA3E3BJCkdgX0Z53G_=ktwKYLqHbgXxhqw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
To: Markus Armbruster <armbru@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000086894d05f5d1ea38"
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--00000000000086894d05f5d1ea38
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 1, 2023, 12:36 AM Markus Armbruster <armbru@redhat.com> wrote:

> "Michael S. Tsirkin" <mst@redhat.com> writes:
>
> > On Tue, Feb 28, 2023 at 09:05:16PM +0100, Thomas Huth wrote:
> >> Well, without CI, I assume that the code will bitrot quite fast
> (considering
> >> that there are continuous improvements to TCG, for example).
> >
> > We have lots of hosts which we don't test with CI.  They don't bitrot
> > because people do testing before release. This is what RCs are for.
> > We did releases before CI - it is a cost/benefit thing.
>
> Dropping 32-bit x86 from CI feels like a no-brainer in the current
> situation.
>
> As to deprecating 32-bit x86: the people by far most qualified to judge
> the "cost/benefit thing" are the regulars who are bearing the cost,
> i.e. the people who are actually maintaining it.  Their opinion should
> overrule any "but somebody out there might still want to use it".
>
> Maintainers, please state your opinion, if any: aye or nay.
>
> Richard tells us "the maint overhead is large."  Makes me think he's in
> favour of dropping 32-bit x86.  Richard?
>
> Peter seems to be reluctant to drop 32-bit ARM at this point.  Peter?
>

For FreeBSD systen we have no 32bit arm host users. There may be a few i386
host users left, but they are a tiny sliver of users. The overwhelming bulk
of our users for qemu-system- are on x86-64 or aarch64 hosts.

For bsd-user, there is no 32 bit host support at all. It was dropped as
part of the push to prune old code and upstream.

Warner

>

--00000000000086894d05f5d1ea38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 1, 2023, 12:36 AM Markus Armbruster &lt;<a=
 href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">&quot;Michael S. Tsirkin&quot; &lt;<a href=
=3D"mailto:mst@redhat.com" target=3D"_blank" rel=3D"noreferrer">mst@redhat.=
com</a>&gt; writes:<br>
<br>
&gt; On Tue, Feb 28, 2023 at 09:05:16PM +0100, Thomas Huth wrote:<br>
&gt;&gt; Well, without CI, I assume that the code will bitrot quite fast (c=
onsidering<br>
&gt;&gt; that there are continuous improvements to TCG, for example).<br>
&gt;<br>
&gt; We have lots of hosts which we don&#39;t test with CI.=C2=A0 They don&=
#39;t bitrot<br>
&gt; because people do testing before release. This is what RCs are for.<br=
>
&gt; We did releases before CI - it is a cost/benefit thing.<br>
<br>
Dropping 32-bit x86 from CI feels like a no-brainer in the current<br>
situation.<br>
<br>
As to deprecating 32-bit x86: the people by far most qualified to judge<br>
the &quot;cost/benefit thing&quot; are the regulars who are bearing the cos=
t,<br>
i.e. the people who are actually maintaining it.=C2=A0 Their opinion should=
<br>
overrule any &quot;but somebody out there might still want to use it&quot;.=
<br>
<br>
Maintainers, please state your opinion, if any: aye or nay.<br>
<br>
Richard tells us &quot;the maint overhead is large.&quot;=C2=A0 Makes me th=
ink he&#39;s in<br>
favour of dropping 32-bit x86.=C2=A0 Richard?<br>
<br>
Peter seems to be reluctant to drop 32-bit ARM at this point.=C2=A0 Peter?<=
br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">F=
or FreeBSD systen we have no 32bit arm host users. There may be a few i386 =
host users left, but they are a tiny sliver of users. The overwhelming bulk=
 of our users for qemu-system- are on x86-64 or aarch64 hosts.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">For bsd-user, there is no 32 bit hos=
t support at all. It was dropped as part of the push to prune old code and =
upstream.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Warner=C2=A0</=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
</blockquote></div></div></div>

--00000000000086894d05f5d1ea38--

