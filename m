Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8610934024D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:45:58 +0100 (CET)
Received: from localhost ([::1]:58270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpE5-00006j-Jg
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMp8t-0004KF-0l
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:40:35 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:35344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMp8q-00005D-O4
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:40:34 -0400
Received: by mail-il1-x12e.google.com with SMTP id 19so4270424ilj.2
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=euFxUV8F3UdD0WvI2dolXxK6il3EDHS44sPv3rxxdh4=;
 b=Eu5IVM6bXl0Vmug3kBzWimBtCFU5wXlEgplHWjB27xDQElBHilNaFKNUFlVPXVLYrK
 n4Kq3uUwUp0/h2Mw6qFr8BBjpTAgVbKzEA5IhRKCrjxReGbME98xVt42C+BVumNGvxSt
 mqo9Qjw/4sEECUTqpnyBMP6zBa5w69wuHE616aYL9itD0mUNpzlAP8cWCWwBMldLYb+E
 wtVHdr/sVXhv12mrA7Qs8PsbV5GZFVZvRaYib17vub1HXMDS87pHEdxEmBnskT7qFgDz
 STJnIob9FjURKrEbraGZ2bHSmZmtoWGaG408Szn+ckTJlqvHYN0gNzqV5YoCcB40tqlh
 LLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=euFxUV8F3UdD0WvI2dolXxK6il3EDHS44sPv3rxxdh4=;
 b=YyKMeXSSy1n1fU6DJBieIYOx8oBaRboTP03wu+agDXVuAmhqdM85SrJJbv9j3NjNeh
 eapsOqHT8VOrx5xbWXnsVIYRR/NN2YjBuVCOfxr947rzDvEnxgGj77WufgJRNmq6LDW/
 yD7tD+5PV5aqVqLHTJ/m8TQY5oeFAxNWLtvjc1dToc7DX343reSbyHaCEjvJRLZCqlBi
 5mS4LU7N5MLbmBn/TKE9AFalNsGft7EPRGZ94+Ja/7A8hBjFTWLTtSLJhpbD4mwuN65S
 l7/ZYjq5Cxvc9bBKZy/VksBlymuxBsgNxeubqhJZ2Z+rqvn1xTvP1buNOZDHu5LSvVRC
 sWFA==
X-Gm-Message-State: AOAM532x57z5Ch8tx9b7hZ+7Dge01Oetkq2LRWpdhh1AG/cp92TZUrsn
 wIqybwCGQstLmE00G23ubOLvGQtdvtgs0lfm6kM=
X-Google-Smtp-Source: ABdhPJxnxdRMzhoNFSgCWCXG1w2SPxqqZ4x78iZH68qkEE3cLT6FEKf/xoqoamGY5IX/VuGzf3AHsUaYsGp/SwQfrHg=
X-Received: by 2002:a92:d0c3:: with SMTP id y3mr10230824ila.303.1616060431403; 
 Thu, 18 Mar 2021 02:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210317191115.1445-1-luoyonggang@gmail.com>
 <877dm4lub2.fsf@dusky.pond.sub.org>
In-Reply-To: <877dm4lub2.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Thu, 18 Mar 2021 09:40:19 +0000
Message-ID: <CAE2XoE_8aYi=ega2U8qjH8_h1Qr3D6FQK-HLDg9_59VhZG4bWA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_0=2F2=5D_=2A=2A=2A_This_is_based_on_pull_request_fr?=
 =?UTF-8?Q?om_Alex_Benn=C3=A9e_=2A=2A=2A?=
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f30d8705bdcc639f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=luoyonggang@gmail.com; helo=mail-il1-x12e.google.com
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
Reply-To: luoyonggang@gmail.com
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f30d8705bdcc639f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 18, 2021 at 8:50 AM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Please use the subject line for explaining the purpose of the series.
> "Based on" information should go into the body.  Ideally also in
> machine-readable form, like
>
>     Based-on: <20171220185924.32756-1-armbru@redhat.com>
>
> where the thing in <anglular brackets> is the pull request's Message-id.
>
> Note: I used one of my pull requests, not Alex's, for this example.
>
> Yonggang Luo <luoyonggang@gmail.com> writes:
>
> > *** BLURB HERE ***
>
> Recommend to delete this placeholder next time :)
Thanks, i'll do it next time
>
> > The pull request
> > https://patchew.org/QEMU/20210317072216.16316-1-alex.bennee@linaro.org/
> >
> > Yonggang Luo (2):
> >   plugins: Update qemu-plugins.symbols to match qemu-plugins.h
> >   plugins: Move all typedef and type declaration to the front of the
> >     qemu-plugin.h
> >
> >  include/qemu/qemu-plugin.h   | 187 +++++++++++++++++------------------
> >  plugins/qemu-plugins.symbols |  25 +++--
> >  2 files changed, 104 insertions(+), 108 deletions(-)
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000f30d8705bdcc639f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, Mar 18, 2021 at 8:50 AM Markus Armbruster =
&lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<b=
r>&gt;<br>&gt; Please use the subject line for explaining the purpose of th=
e series.<br>&gt; &quot;Based on&quot; information should go into the body.=
=C2=A0 Ideally also in<br>&gt; machine-readable form, like<br>&gt;<br>&gt; =
=C2=A0 =C2=A0 Based-on: &lt;<a href=3D"mailto:20171220185924.32756-1-armbru=
@redhat.com">20171220185924.32756-1-armbru@redhat.com</a>&gt;<br>&gt;<br>&g=
t; where the thing in &lt;anglular brackets&gt; is the pull request&#39;s M=
essage-id.<br>&gt;<br>&gt; Note: I used one of my pull requests, not Alex&#=
39;s, for this example.<br>&gt;<br>&gt; Yonggang Luo &lt;<a href=3D"mailto:=
luoyonggang@gmail.com">luoyonggang@gmail.com</a>&gt; writes:<br>&gt;<br>&gt=
; &gt; *** BLURB HERE ***<br>&gt;<br>&gt; Recommend to delete this placehol=
der next time :)<div>Thanks, i&#39;ll do it next time<br>&gt;<br>&gt; &gt; =
The pull request<br>&gt; &gt; <a href=3D"https://patchew.org/QEMU/202103170=
72216.16316-1-alex.bennee@linaro.org/">https://patchew.org/QEMU/20210317072=
216.16316-1-alex.bennee@linaro.org/</a><br>&gt; &gt;<br>&gt; &gt; Yonggang =
Luo (2):<br>&gt; &gt; =C2=A0 plugins: Update qemu-plugins.symbols to match =
qemu-plugins.h<br>&gt; &gt; =C2=A0 plugins: Move all typedef and type decla=
ration to the front of the<br>&gt; &gt; =C2=A0 =C2=A0 qemu-plugin.h<br>&gt;=
 &gt;<br>&gt; &gt; =C2=A0include/qemu/qemu-plugin.h =C2=A0 | 187 ++++++++++=
+++++++------------------<br>&gt; &gt; =C2=A0plugins/qemu-plugins.symbols |=
 =C2=A025 +++--<br>&gt; &gt; =C2=A02 files changed, 104 insertions(+), 108 =
deletions(-)<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=
=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=
=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--000000000000f30d8705bdcc639f--

