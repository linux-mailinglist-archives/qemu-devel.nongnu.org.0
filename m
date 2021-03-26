Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CDA34AB60
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 16:22:17 +0100 (CET)
Received: from localhost ([::1]:45840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPoHw-00078E-RC
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 11:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <li.zhang@ionos.com>)
 id 1lPoFt-0004rA-Q2
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:20:09 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:36740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <li.zhang@ionos.com>)
 id 1lPoFr-0000PQ-Mh
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:20:09 -0400
Received: by mail-ed1-x52f.google.com with SMTP id o19so6751278edc.3
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 08:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YWWD3M3mbmMuSx88XXWOrJ0FFVod8UrHy8HkASgwzfU=;
 b=FG+EiLz8Wn7+MKJC8xE5t/7Pkd3kSM21HSHudUNw4WyC5OJ01lXQfxKG9qtQbXBgog
 zG9ZoV9AEk1prXtPJuGLwlstiOFXCFYZb3IcFGqD65yKc1AQfjjFJ2xRjZwahtl8UVtE
 HQ7uOgDHmXftGjoJXNmRIYzTpvlHIzkPP95Mdpaz8bbgQF6xEMjO4oFTAr6rGxWmY1TP
 NGSY8iMF5UGJaG6QxUs+qDST9wyV3LyC2uX+NOvOdJzCN83VBYREqU/LPACHj8TiEQww
 PJocwKbZDaVNWrAR92saUeO5OtCa2UeAt234O7Eb+FeJ1KXhixCA+L74OogTfVTGgeKo
 Q8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YWWD3M3mbmMuSx88XXWOrJ0FFVod8UrHy8HkASgwzfU=;
 b=flPmO577bY5VT2GXoGgtQ9NscNvoVKgZ0zSUnwNlX+Uc1XnH7OOh8BbeWI5Y0PPpdz
 NjLvyydy+3y/plNIJZXiU4nZl/A/q8ATfVqT3zo5AKWxvpa2NSSVos0VCUNwlSigDN1e
 OutjdQGew7g7pWrgRnBiqarXtxiZsJ3s5nrQ2XWekKsihylXGm/r47DDIBbunxxTTdOY
 6CUZPxv3KkrH9SlEgrRK+B45VBgknWtSJHJNp77WaBblKrL5syu3w9dGs5T/BiVTnqgy
 Q9smjW2GBA696aHHGU3mX73uEXdyrgoJcf2fnkDXC0U2Vs1miJdocj5yIsfiWAzTmG3u
 lpEg==
X-Gm-Message-State: AOAM533YUOpL6A5Q7c4IJZAGM6M2iWmtDls5Mqw+Zbfk9JvhiFiP0aYu
 nvQKHae7PLjyr1BJRlJJDJHqIa0qmjDW3xkyC7+ymg==
X-Google-Smtp-Source: ABdhPJzLhOkjmby/WoUKEdvW4hIVIC49UfHPFY16WRsrq62bJ7ANSC2eV47H7I1q7y6RKnbR6+TFj3OIkkxHYJGWEu4=
X-Received: by 2002:a50:e607:: with SMTP id y7mr15986662edm.18.1616772003051; 
 Fri, 26 Mar 2021 08:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <20210315170636.704201-2-zhlcindy@gmail.com>
 <CAEM4iGG67hQDPVrKbSsSpsrpbc12+ky=ROh26QUqO5C0+q0jXg@mail.gmail.com>
 <874kgykmgv.fsf@dusky.pond.sub.org>
In-Reply-To: <874kgykmgv.fsf@dusky.pond.sub.org>
From: Li Zhang <li.zhang@ionos.com>
Date: Fri, 26 Mar 2021 16:19:52 +0100
Message-ID: <CAEM4iGFe0y=YHT6ov=vT=Hs7etJNQGAa2pS8C3VtPozD=6N3CQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Support monitor chardev hotswap with QMP
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000eccb8205be72104c"
Received-SPF: permerror client-ip=2a00:1450:4864:20::52f;
 envelope-from=li.zhang@ionos.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Lukas Straub <lukasstraub2@web.de>, alexandr.iarygin@profitbricks.com,
 QEMU <qemu-devel@nongnu.org>, Li Zhang <li.zhang@cloud.ionos.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, Li Zhang <zhlcindy@gmail.com>,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eccb8205be72104c
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 26, 2021 at 3:40 PM Markus Armbruster <armbru@redhat.com> wrote:

> Li Zhang <li.zhang@ionos.com> writes:
>
> > Hi,
> >
> > Any comments about this patch?
>
> I wanted to review this before my Easter break, but I'm out of time :(
>
> When I'm back (April 6), I'll check whether it still needs review, but I
> do hope somebody else can look at it sooner.
>
>
Thanks anyway. This patch is better to work with Lukas' patches together.

--000000000000eccb8205be72104c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 26, 2021=
 at 3:40 PM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" targ=
et=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Li Zhang &lt;<a href=3D"mailto:li.zhang@io=
nos.com" target=3D"_blank">li.zhang@ionos.com</a>&gt; writes:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; Any comments about this patch?<br>
<br>
I wanted to review this before my Easter break, but I&#39;m out of time :(<=
br>
<br>
When I&#39;m back (April 6), I&#39;ll check whether it still needs review, =
but I<br>
do hope somebody else can look at it sooner.<br>
<br></blockquote><div><br></div><div>Thanks anyway. This patch is better to=
 work with Lukas&#39; patches together.</div><div><br></div></div></div>
</div>

--000000000000eccb8205be72104c--

