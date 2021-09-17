Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9770B40FFBC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 21:23:00 +0200 (CEST)
Received: from localhost ([::1]:55872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRJRr-00029G-17
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 15:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRJQf-0000Vj-R3
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 15:21:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRJQc-0007v2-SX
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 15:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631906501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L10eqfImoG0JkDumWMOOFU+zLZ7pDq2PptNqw+Pr2K0=;
 b=FD8vLPaq3Fq/cjLBEC0py2WmfifZeRwWhLAnrgVBLYdnhSL33UoHJdIMYgL8MHndi4pttY
 GH7ghF68nq53N59l406r1c6JNbe2VvandtTF9oJg0dELqYNixCmKI0YHNJIe0pGHSebBH8
 9lkXGDNdiWtok6rNSV9FRewQD1iIC6Y=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-FERbVD87N9a5UTeHOyIqbw-1; Fri, 17 Sep 2021 15:21:38 -0400
X-MC-Unique: FERbVD87N9a5UTeHOyIqbw-1
Received: by mail-ot1-f70.google.com with SMTP id
 q12-20020a05683033cc00b00521230773b1so39904360ott.4
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 12:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L10eqfImoG0JkDumWMOOFU+zLZ7pDq2PptNqw+Pr2K0=;
 b=E7ICaXjV6qPz5YuMBtLgx/Lua2TcbJpDPUr0DaxMdKit5wF+MhTTRhA6EkLWSJg8g3
 f6ZLyOcE9j485L0cxKNoPbYOnEcx+Vs+khYYja4dHPplh15jh5eUhOUY3+vtKohoSZge
 lWWIinrp0opw4AoI+rFOsb3fo2ouU7v3ZDIgM/CEmidh9YKqHg898pz5MftzCGgRV4S5
 l0AGzqOHG8TtrJxHo0Zgf/bvG/01sK1UkdEBYKQN0E4T78tg2hg2bVeFWr6rRIHaR+5+
 P9nO5TzQImvqV9m/LOmZ5OA6piO3udPjJQq8QYb8n5VxYmKymx4nCDIO60q73RZm2FVn
 G1Xw==
X-Gm-Message-State: AOAM533GpiSKznTw//SHWHJk4tbt4doKCB+fxQERuuiKxHyxStmAlW80
 tGHKbRUWczcHsbiuGMhU+noTbnlKv1BkBn75Vc1jOBSfvhc8eQPheWSwnAJ7Glcd44tc/bP4y6w
 1uedqt4Z7PrnAAVxfGMoBBClwOr1nY5Y=
X-Received: by 2002:a4a:615c:: with SMTP id u28mr10433388ooe.97.1631906497674; 
 Fri, 17 Sep 2021 12:21:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3dPuDuInlcLbpWBTmN1P75tFABKgWLw2sw3cdsIJQbykCXjAO+5pTBNYa9v2n1Va5K/CJ6JuaEZ11BWMOe40=
X-Received: by 2002:a4a:615c:: with SMTP id u28mr10433370ooe.97.1631906497471; 
 Fri, 17 Sep 2021 12:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-9-jsnow@redhat.com>
 <fa088868-d112-59e4-7181-159d3c0cac58@redhat.com>
In-Reply-To: <fa088868-d112-59e4-7181-159d3c0cac58@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 15:21:26 -0400
Message-ID: <CAFn=p-bqe2u9dsbCPGiCGGpy6YuDiZu_0WhOoVOBU6Bj0SEtZQ@mail.gmail.com>
Subject: Re: [PATCH 08/15] python/aqmp: Create MessageModel and
 StandaloneModel classes
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000016b94405cc35d7f7"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000016b94405cc35d7f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021, 9:39 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 17.09.21 07:40, John Snow wrote:
> > This allows 'Greeting' to be subclass of 'Message'. We need the adapter
> > classes to avoid some typing problems that occur if we try to put too
> > much into the 'Model' class itself; the exact details of why are left a=
s
> > an exercise to the reader.
> >
> > Why bother? This makes 'Greeting' =E2=8A=86 'Message', which is taxonom=
ically
> > true; but the real motivation is to be able to inherit and abuse all of
> > the Mapping dunders so that we can call dict(greeting) or
> > bytes(greeting), for example.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/aqmp/models.py | 67 ++++++++++++++++++++++++++++---------=
-
> >   1 file changed, 50 insertions(+), 17 deletions(-)
>
> (I feel like this is a bit much outside of my scope, so this=E2=80=99ll h=
ave to
> do without my R-b.)
>

It's a patch I like the least, too. I shouldn't have included it here in
this series. It needs more time in the oven and it should be included ...
somewhere else.

Sorry about this one.

>

--00000000000016b94405cc35d7f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Sep 17, 2021, 9:39 AM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 17.09.21 07:40, John Snow wrote:<br>
&gt; This allows &#39;Greeting&#39; to be subclass of &#39;Message&#39;. We=
 need the adapter<br>
&gt; classes to avoid some typing problems that occur if we try to put too<=
br>
&gt; much into the &#39;Model&#39; class itself; the exact details of why a=
re left as<br>
&gt; an exercise to the reader.<br>
&gt;<br>
&gt; Why bother? This makes &#39;Greeting&#39; =E2=8A=86 &#39;Message&#39;,=
 which is taxonomically<br>
&gt; true; but the real motivation is to be able to inherit and abuse all o=
f<br>
&gt; the Mapping dunders so that we can call dict(greeting) or<br>
&gt; bytes(greeting), for example.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/models.py | 67 ++++++++++++++++++++++++++=
++----------<br>
&gt;=C2=A0 =C2=A01 file changed, 50 insertions(+), 17 deletions(-)<br>
<br>
(I feel like this is a bit much outside of my scope, so this=E2=80=99ll hav=
e to <br>
do without my R-b.)<br></blockquote></div></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">It&#39;s a patch I like the least, too. I shouldn&#39;t =
have included it here in this series. It needs more time in the oven and it=
 should be included ... somewhere else.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Sorry about this one.</div><div dir=3D"auto"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div></div>

--00000000000016b94405cc35d7f7--


