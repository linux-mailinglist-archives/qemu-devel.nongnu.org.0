Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266236BCC01
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 11:07:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pckUP-0008On-Ta; Thu, 16 Mar 2023 06:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pckUN-0008N2-9q; Thu, 16 Mar 2023 06:05:39 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pckUF-0005LP-2S; Thu, 16 Mar 2023 06:05:38 -0400
Received: by mail-pg1-x52e.google.com with SMTP id y189so572236pgb.10;
 Thu, 16 Mar 2023 03:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678961117;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FFnkWFYm7y2PyhrQIB3ehHNCC0TvVL1qw6UeQ1yz9dg=;
 b=Sz5qnuf4zglLkh9I0mbAKfQQXjFQ++rAYQL0Rfo/1RwZjhXSlq6ypXTCRO/NuvxFEC
 Gv0ZqTF9UplIwH52c+0POmWx/y2FH63bfivch6T+F3EFkLqf7KU0SVmB0ffK50G0yxWf
 JASEckgrqm1nhltfUAe9yzGPzVu+dIZRWC5FHVdevOxEpm5NXgM2s4i3Q59U/ZzTROcN
 Fklltx0MzPn1mKmuEK8ad5AX/hBPpC0qT0lDw4FsU3BvDcWsGOUTbLuXgGB3/bxDN9ly
 iKJUlNZH4Vv2Uh9gXOK1bzeVPmroKhKnUuL1miWDBiJelW4ECUaaT98t39JlBX/TgshR
 bHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678961117;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FFnkWFYm7y2PyhrQIB3ehHNCC0TvVL1qw6UeQ1yz9dg=;
 b=xFFck031A7Fik7+NxL+6YCaJ7toGl7Aq2t+chGj6iMPnRK56Qn8whd4XGSmiH6olzI
 Krpx+v2BOWMrts+RAaB1J0XZw5oZwoJ/EO0Cy0+Aylz+odLgnXbOa2NlMdRtB9970eob
 pY8B0u1lzox6vqbGyKSswS+sj7Wjana2rV+EITC1qxEFa3bJjyCwBkKNq+0VTKYdS64/
 NO0QNMh2GOm/Frp/ENsKWNKoy36eX4GQj7OLqGaPKecmgN+j5kVCmq1rPtO1k2pBnxGo
 ldulWqYRZG/NvIDwlIO/3f8060+nlqHKf0BLmT83aYt7wQbTushd2LWaZ2ZjK4Xg8fpb
 MPXg==
X-Gm-Message-State: AO0yUKW2SM8Ryq7WAyspVCDomIIo/r4u0THizhJWn8CaCVNXAEL7t6QK
 HpezrxuN7m5NYwtQ7X5s7SQfqkQ8B1gA1x4mWk4=
X-Google-Smtp-Source: AK7set+rlsfNGEJsF7bv1ab+UELDf5DyikNP/5gYk05nWOiCne1IvgWQYYh0YafRI85sZc++VA9CPI+YgX2KlK14n04=
X-Received: by 2002:a65:6452:0:b0:503:7bcd:89e9 with SMTP id
 s18-20020a656452000000b005037bcd89e9mr700466pgv.1.1678961117377; Thu, 16 Mar
 2023 03:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
 <878rfxuiau.fsf@pond.sub.org>
In-Reply-To: <878rfxuiau.fsf@pond.sub.org>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Thu, 16 Mar 2023 13:05:04 +0300
Message-ID: <CA+rFky5JchyFTEdYoGFezJzjnbS2MK_zUou4EME-uf-oBsp-YA@mail.gmail.com>
Subject: Re: dropping 32-bit host support
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000fe3ac005f701982a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=randrianasulu@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000fe3ac005f701982a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 13:01 Markus Armbruster =
<armbru@redhat.com>:

> Thomas Huth <thuth@redhat.com> writes:
>
> [...]
>
> > The problem is really that we don't have unlimited resources in the
> > QEMU project. Currently we're heavily struggling with the load in the
> > CI, but also pure man power is always very scarce. So at one point in
> > time, you have to decide to say good bye to some old and hardly used
> > features - at least to stop testing and actively supporting it. If you
> > want to continue testing and fixing bugs for such host systems, that's
> > fine, of course, but don't expect the QEMU developers to do that job
> > in the future.
>
> This.
>
> We're out of free lunch.  We're glad you enjoyed it while it lasted.
>
> If you want more lunch, you need to join the kitchen.  Here are a few
> things we need to keep a host or target supported:
>
> * Competent maintainer(s) to relieve the ones who have maintained this
>   for you so far
>
> * CI runners to conserve scarce CI minutes (or the money to buy more)
>
> * Trustworthy system administrator(s) to set them up and keep them
>   running.
>


* Four - different developer culture, like, a bit fewer commits to run CI
with ? :)



>

--000000000000fe3ac005f701982a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 13:=
01 Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat=
.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Thomas Huth &lt;<a hr=
ef=3D"mailto:thuth@redhat.com" target=3D"_blank" rel=3D"noreferrer">thuth@r=
edhat.com</a>&gt; writes:<br>
<br>
[...]<br>
<br>
&gt; The problem is really that we don&#39;t have unlimited resources in th=
e<br>
&gt; QEMU project. Currently we&#39;re heavily struggling with the load in =
the<br>
&gt; CI, but also pure man power is always very scarce. So at one point in<=
br>
&gt; time, you have to decide to say good bye to some old and hardly used<b=
r>
&gt; features - at least to stop testing and actively supporting it. If you=
<br>
&gt; want to continue testing and fixing bugs for such host systems, that&#=
39;s<br>
&gt; fine, of course, but don&#39;t expect the QEMU developers to do that j=
ob<br>
&gt; in the future.<br>
<br>
This.<br>
<br>
We&#39;re out of free lunch.=C2=A0 We&#39;re glad you enjoyed it while it l=
asted.<br>
<br>
If you want more lunch, you need to join the kitchen.=C2=A0 Here are a few<=
br>
things we need to keep a host or target supported:<br>
<br>
* Competent maintainer(s) to relieve the ones who have maintained this<br>
=C2=A0 for you so far<br>
<br>
* CI runners to conserve scarce CI minutes (or the money to buy more)<br>
<br>
* Trustworthy system administrator(s) to set them up and keep them<br>
=C2=A0 running.<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">* Four - different developer cul=
ture, like, a bit fewer commits to run CI with ? :)</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--000000000000fe3ac005f701982a--

