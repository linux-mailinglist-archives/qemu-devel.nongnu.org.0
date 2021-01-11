Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F92A2F17BA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 15:12:29 +0100 (CET)
Received: from localhost ([::1]:56710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxvn-00050c-V7
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 09:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kyxtW-0003yX-1t; Mon, 11 Jan 2021 09:10:06 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kyxtU-0002oo-2G; Mon, 11 Jan 2021 09:10:05 -0500
Received: by mail-ej1-x632.google.com with SMTP id q22so24974817eja.2;
 Mon, 11 Jan 2021 06:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KowXmvOxKcdkD+mVyHjxb3Mae/sgl0/kRtQasN6FSYY=;
 b=fMEgA5rw3cDrd9hxo7xF/NQO9WouNX5CLHzHUFZS1EMjefBCL7i+yZqRA/NY4Eh3HY
 LJf5Ozn/L6jkr2S4XTS/I141MT0l+tPmjkGRKN+hW9LuOpDNK+c0ciR0K0OTlAxg94B7
 feBWUCjN4nuNVl3jdhrNzfXnWejciPqz1BbArgQ85Z/Zh59TuKHMxUDEgfbZedbnpb/X
 gc6CdHWAK819PZSXWMCNh/+8OIee/z+mgds1dbf/Cvxixe9S87fTotbU53CGMB2Wvx5L
 qd7sEQHPx1r1zcnBSzauOVTh2Ib35NUREXw2y1R98k7aNrEFjsOPbU8YsZriKQfvPTcr
 mK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KowXmvOxKcdkD+mVyHjxb3Mae/sgl0/kRtQasN6FSYY=;
 b=sRtT8A2zRnQYQLwgJQa6Rn9V1VFlUPO1X30A4wFjSxKdTSrGj3VfZce8pcsJpJ25DA
 OcH+k6BNmHfZI4PYMNMvTI9SJeNV0SwDMWQp3HpzuxAY+xkI+qRobcIxIQbTmP3uOm+k
 rR66Nvb9zk0GiHxWXmljbHw3dPlDWaCRx26vq3x+LKjVoE75hZPDrS6H2wHkcmT8jVg4
 +aavpv1+OExbnG46AWeLOWHY15fzJhiddk8BO0fHCPXAeMW6csc2Uf4V0pebatm0iPHy
 wbxq+6Y27VBewRzBEaFt6umMpJ+zuz+U9qI2pYWZRlzF3RCIBjNgK7l8SSuumKGJEDVl
 Nptg==
X-Gm-Message-State: AOAM5321/2DJEFHg5dXJ5XITXz/RTEdnKzjkiF+4u4Pefj8LU11dX6co
 Oa/iymEbKzOiNvbkSmovkhlh55pOLDiqht7feoI=
X-Google-Smtp-Source: ABdhPJzTvU9spyzOy5Bo2P0aOVUvugee6q+9c8/p2mXGZyCeG0JZ21avPCAclto24ldAlaNTUyPjsF7NHvezksbEQs8=
X-Received: by 2002:a17:906:98d4:: with SMTP id
 zd20mr10942343ejb.532.1610374199530; 
 Mon, 11 Jan 2021 06:09:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609167865.git.lukasstraub2@web.de>
 <69934ceacfd33a7dfe53db145ecc630ad39ee47c.1609167865.git.lukasstraub2@web.de>
 <CAJ+F1CLLiHca4Lf_nL7p2+Q3MT5JA0Qn9W6g14q0MYtYoROOdA@mail.gmail.com>
 <87ft374myk.fsf@dusky.pond.sub.org>
In-Reply-To: <87ft374myk.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 11 Jan 2021 18:09:45 +0400
Message-ID: <CAJ+F1C+osNqR_7FBVoVh2Fg65axrQVWoOVbbuRtjiNysj=k+HQ@mail.gmail.com>
Subject: Re: [PATCH v14 1/7] Introduce yank feature
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001e5a6905b8a076a5"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqVw=?= <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001e5a6905b8a076a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 5:34 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>
> > Hi
> >
> > On Mon, Dec 28, 2020 at 7:08 PM Lukas Straub <lukasstraub2@web.de>
> wrote:
> >
> >> The yank feature allows to recover from hanging qemu by "yanking"
> >> at various parts. Other qemu systems can register themselves and
> >> multiple yank functions. Then all yank functions for selected
> >> instances can be called by the 'yank' out-of-band qmp command.
> >> Available instances can be queried by a 'query-yank' oob command.
> >>
> >
> > Looking at the changes and API usage, I wonder if it wouldn't have been
> > simpler to associate the yank function directly with the YankInstance
> > (removing the need for register/unregister functions - tracking the sta=
te
> > left to the callback). Have you tried that approach? If not, I could
> check
> > if this idea would work.
>
> Considering we're at v14...  would it make sense to commit the current
> approach, then explore the alternative approach on top?
>
>
works for me

If yes, is v14 committable as is?
>
>
Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001e5a6905b8a076a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 11, 2021 at 5:34 PM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Marc=
-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=
=3D"_blank">marcandre.lureau@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi<br>
&gt;<br>
&gt; On Mon, Dec 28, 2020 at 7:08 PM Lukas Straub &lt;<a href=3D"mailto:luk=
asstraub2@web.de" target=3D"_blank">lukasstraub2@web.de</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; The yank feature allows to recover from hanging qemu by &quot;yank=
ing&quot;<br>
&gt;&gt; at various parts. Other qemu systems can register themselves and<b=
r>
&gt;&gt; multiple yank functions. Then all yank functions for selected<br>
&gt;&gt; instances can be called by the &#39;yank&#39; out-of-band qmp comm=
and.<br>
&gt;&gt; Available instances can be queried by a &#39;query-yank&#39; oob c=
ommand.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Looking at the changes and API usage, I wonder if it wouldn&#39;t have=
 been<br>
&gt; simpler to associate the yank function directly with the YankInstance<=
br>
&gt; (removing the need for register/unregister functions - tracking the st=
ate<br>
&gt; left to the callback). Have you tried that approach? If not, I could c=
heck<br>
&gt; if this idea would work.<br>
<br>
Considering we&#39;re at v14...=C2=A0 would it make sense to commit the cur=
rent<br>
approach, then explore the alternative approach on top?<br>
<br></blockquote><div><br></div><div>works for me</div><div> <br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
If yes, is v14 committable as is?<br>
<br>
</blockquote></div><br clear=3D"all"><div>Acked-by: Marc-Andr=C3=A9 Lureau =
&lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.=
com</a>&gt;</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001e5a6905b8a076a5--

