Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EF63935F1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 21:06:13 +0200 (CEST)
Received: from localhost ([::1]:41416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmLKd-0006sq-Uc
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 15:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lmLJ2-0005xY-Qi
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:04:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lmLIy-0004tw-98
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622142266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IT5WRcHfo5E/QejFpEbQusohyXMYAV2bMr/eXbUM4Bs=;
 b=D5TuTNHu4d+xbrHCZJLsny0z5f5d7Ip6HsVx+S4TCBKHoM3qyasSmfDymnjCPTCuEdlS5t
 wSd55WEcw8IVaJ9tEaPoYwC+a4Zttec90bS7oPJObN1UWFbuLQE4Zu7SI9YzOMJrmdHUP0
 7e4Q4NYnVSoB+IvkVS3D3YkqJNsV5DU=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-Q15PBf31MZG8exSd7QtUew-1; Thu, 27 May 2021 15:04:24 -0400
X-MC-Unique: Q15PBf31MZG8exSd7QtUew-1
Received: by mail-pg1-f197.google.com with SMTP id
 q64-20020a6343430000b02902164088f2f0so486250pga.5
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 12:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IT5WRcHfo5E/QejFpEbQusohyXMYAV2bMr/eXbUM4Bs=;
 b=POisXNT2u3EJf4/KvE8i5bxg3Bod4ZBRko3EQWcUfA6xFgqgEcQCwp+v3UwGVQb4zb
 /GdWrcV4e6eXifbJzE8tsnpndrf4RZv9/jD+zbWjoL5zgtVZGhFxk58UmkJDYHFpj9lw
 lbRgctFxFREhcuJSHjx7RueWeXNklprY9s1+AvkvtLHwnKt+IkOhUAqjK5MJiyMc0AXM
 g6EgRtHvW9qFjGQZK4kd4MNz660honOD5ImvOq5t6+krAntgzpeUX/HoA24wxhAYe/2g
 F7FafanV1/EhI2K7n0zds/NHMjPAQBN7QYO7CYu6CZJpVzysAZpEoL+zyuopd8wLA36D
 x3ag==
X-Gm-Message-State: AOAM530nZnR19KhZ+tKlkyeNj0oPGqJrkcRoXq+Y+MG4oD2Y9SSDH8Qt
 DHPiCiI31Dur20RceXv9zyrdeOGC5VgMHcDEM0Et2bY07yG+BBYbDr1Q7zmNeUTRbZGOodq24xj
 P5qnb6wCzRdHVhrJRUNV8tg7nR/6eKhA=
X-Received: by 2002:a17:90b:2212:: with SMTP id
 kw18mr5308886pjb.150.1622142262931; 
 Thu, 27 May 2021 12:04:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxivjP2Zz0s0WObkIqaafHTvSKeFU2KI41zqByjZGN02unTG6Q8fBdbeD3V4uQX6wZtmj7KzlDYnHqS+RsvmE8=
X-Received: by 2002:a17:90b:2212:: with SMTP id
 kw18mr5308861pjb.150.1622142262664; 
 Thu, 27 May 2021 12:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-2-eesposit@redhat.com>
 <YK9WNJUQdjjCiv40@stefanha-x1.localdomain>
In-Reply-To: <YK9WNJUQdjjCiv40@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 27 May 2021 21:04:10 +0200
Message-ID: <CABgObfY0yj+pnLmmodxKSuFO+KzPLLpChNSVEb-zCdAyo9yS6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] block-copy: streamline choice of copy_range vs.
 read/write
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000057771d05c3546d9f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000057771d05c3546d9f
Content-Type: text/plain; charset="UTF-8"

Il gio 27 mag 2021, 14:07 Stefan Hajnoczi <stefanha@redhat.com> ha scritto:

> On Tue, May 18, 2021 at 12:07:51PM +0200, Emanuele Giuseppe Esposito wrote:
> >      } else {
> >          /*
> >           * We enable copy-range, but keep small copy_size, until first
> >           * successful copy_range (look at block_copy_do_copy).
> >           */
>
> Is this comment still correct? It appears that this branch of the if
> statement does not always enable copy-range (the !use_copy_range case).
>

It is correct, but it applies only if use_copy_range is true (the patch
doesn't change this).

Paolo

> -        s->use_copy_range = use_copy_range;
> > -        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
> > +        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
>

--00000000000057771d05c3546d9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 27 mag 2021, 14:07 Stefan Hajnoczi &lt;<a href=
=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a>&gt; ha scritto:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Tue, May 18, 2021 at 12:07:51PM +02=
00, Emanuele Giuseppe Esposito wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We enable copy-range, but ke=
ep small copy_size, until first<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* successful copy_range (look =
at block_copy_do_copy).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
<br>
Is this comment still correct? It appears that this branch of the if<br>
statement does not always enable copy-range (the !use_copy_range case).<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It i=
s correct, but it applies only if use_copy_range is true (the patch doesn&#=
39;t change this).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;use_copy_range =3D use_copy_range;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;copy_size =3D MAX(s-&gt;cluster_siz=
e, BLOCK_COPY_MAX_BUFFER);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;method =3D use_copy_range ? COPY_RA=
NGE_SMALL : COPY_READ_WRITE;<br>
</blockquote></div></div></div>

--00000000000057771d05c3546d9f--


