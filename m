Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0DE40FE90
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 19:21:46 +0200 (CEST)
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRHYX-0001hN-Hg
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 13:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRHWM-00087D-Gl
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRHWJ-0008RW-I2
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631899166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WUiCKybLQLfmg+nCcj1yTHm4mcwFZklVLpofjUOiYvA=;
 b=Y8vS1xMIknV4mVyhnffsznKQlWGpU/g8MgpPqXD6l08dstPIjwdFrI3JXVT+VVv3VVziQd
 MNc9mh3tm7BJAB82biZs7JM28BxqH44XBUtdq+dqksnkbKCqs9APFqwwwz1Db+6MqoYUqG
 hQOcylzgJJ9LR/953ynBQr02vh7QDHE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-2Ad9VN7xObiiugrVpNbawQ-1; Fri, 17 Sep 2021 13:19:24 -0400
X-MC-Unique: 2Ad9VN7xObiiugrVpNbawQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 a4-20020a056830008400b005194eddc1d4so39572569oto.23
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 10:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WUiCKybLQLfmg+nCcj1yTHm4mcwFZklVLpofjUOiYvA=;
 b=wl8KQdC/7l6gI1xPSpKkD21Jw0qK3d60TXcbdCOMKJhU9Yui91M+rcYSwDfE8bOzfS
 C8SzwhL9BcOZwA51RkK1DF2O1uGhBibyUGGh7ZrvjCIa0inKTPZleGznzKSaLYV5ouZj
 qtzEG/Nf13EjZE9VyWCUA0h3ofZK7nk94paceBxlUsDTRcDuA7IeryXHZLC0iZDwPknf
 +GpyZhS6t3CXH8hl+D7gPqedlyBSOJUBm4QHbEWGmjKaYLvnSVTYFlsOVnzsxPbMVc8Q
 Xhij0/HbeqAQeoUlcHM4NpWxqc0F/IJskL6QSqhUyT7ap4/Go9wK4PwhmVWgzJZDoYWB
 EDXw==
X-Gm-Message-State: AOAM533XV8CTmf3qO/0X4xs6vcaojlfcZWLKQJkPy1J/elEXDc0QG92D
 zUbvgW+ueHvVwfoLHS9s9Tog8rtpcMFGC1d6ZNZwJ8IwsrDe9hT1SIZ2Ks7XVksCEownmM+99ME
 A7eKoatGLx3HwAgMcU9GShY4psvADqq0=
X-Received: by 2002:a05:6808:a01:: with SMTP id
 n1mr4697339oij.52.1631899164104; 
 Fri, 17 Sep 2021 10:19:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCTmZg67cujBquDk7lP9atvB5aFytTRLi07BRE7LRvzaW/ZfMluq3rmIX/4FW/Zh3dCKIxG/pGWmKPgVwwUv4=
X-Received: by 2002:a05:6808:a01:: with SMTP id
 n1mr4697330oij.52.1631899163927; 
 Fri, 17 Sep 2021 10:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-4-jsnow@redhat.com>
 <19e00805-83cc-f0bf-beea-1ac6ca0472d8@redhat.com>
In-Reply-To: <19e00805-83cc-f0bf-beea-1ac6ca0472d8@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 13:19:13 -0400
Message-ID: <CAFn=p-Zdy9m5T55K4=ZXxttc_gAbNN5cZBAOi_P_swps-A=w4Q@mail.gmail.com>
Subject: Re: [PATCH 03/15] python/aqmp: Return cleared events from
 EventListener.clear()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f9be9005cc342106"
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

--000000000000f9be9005cc342106
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 8:36 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 17.09.21 07:40, John Snow wrote:
> > This serves two purposes:
> >
> > (1) It is now possible to discern whether or not clear() removed any
> > event(s) from the queue with absolute certainty, and
> >
> > (2) It is now very easy to get a List of all pending events in one
> > chunk, which is useful for the sync bridge.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/aqmp/events.py | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
>
> Not sure if `clear` is an ideal name then, but `drain` sounds like
> something that would block, and `drop` is really much different from
> `clear`.  Also, doesn=E2=80=99t matter, having Collection.delete return t=
he
> deleted element is a common thing in any language=E2=80=99s standard libr=
ary, so
> why not have `clear` do the same.
>
>
It isn't too late to change the name, but it sounds like you don't
necessarily prefer any of those others over what's there now.


> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>
Thanks!

--000000000000f9be9005cc342106
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 8:36 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17.09.2=
1 07:40, John Snow wrote:<br>
&gt; This serves two purposes:<br>
&gt;<br>
&gt; (1) It is now possible to discern whether or not clear() removed any<b=
r>
&gt; event(s) from the queue with absolute certainty, and<br>
&gt;<br>
&gt; (2) It is now very easy to get a List of all pending events in one<br>
&gt; chunk, which is useful for the sync bridge.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/events.py | 9 +++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
Not sure if `clear` is an ideal name then, but `drain` sounds like <br>
something that would block, and `drop` is really much different from <br>
`clear`.=C2=A0 Also, doesn=E2=80=99t matter, having Collection.delete retur=
n the <br>
deleted element is a common thing in any language=E2=80=99s standard librar=
y, so <br>
why not have `clear` do the same.<br>
<br></blockquote><div><br></div><div>It isn&#39;t too late to change the na=
me, but it sounds like you don&#39;t necessarily prefer any of those others=
 over what&#39;s there now.<br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>Thanks! <br></div></div></div>

--000000000000f9be9005cc342106--


