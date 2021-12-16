Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609CF477A0A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:12:02 +0100 (CET)
Received: from localhost ([::1]:60464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxuIR-0003gf-FJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:11:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxu8W-0000GT-Mk
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:01:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxu8T-00030f-6C
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639674100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6lhwKMkj8yactnSgHrI0ddH37aU2Wm4/1hxRogh5hLI=;
 b=htgkGYOelzEP8+DgIjO+7e9NncvXU//ddx1aAvKbmeXBSlMJPi7n2xi9G6dgdkWSdR1ZmR
 kM527ESmm+OBC4UsNMPK5mlNjXa/81PCyZI1fX5Ek9aIoBiH5IlfapFbuMujMMXYj14NAW
 OzAlQb7iHeEu+tpPXnIk+0Gwmf73w0c=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-YniEaB_SNMCNFntJMxMh9A-1; Thu, 16 Dec 2021 12:01:38 -0500
X-MC-Unique: YniEaB_SNMCNFntJMxMh9A-1
Received: by mail-ua1-f70.google.com with SMTP id
 v19-20020ab06793000000b002f305c90b69so15826316uar.18
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 09:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6lhwKMkj8yactnSgHrI0ddH37aU2Wm4/1hxRogh5hLI=;
 b=lB/qHHbX1Ut1QKn7CPL+Xbf5eQ8q7XMQUHBeoOHym2qJmfqqU8/EZTHTsRrYGGVBaf
 06WvPsMr4jK8xt+9W4MzKEmtjbYL+I6Hzy2Wl3pFHJXY0bteYAYhE/Sispivw9gVfx1c
 r1P/7y0pqJ1CMTQJGVTb5AX3/N/attKAM4l+eBPpKw9c/PxFdoT0YZEGUU1Yab6Kk83X
 Pu9aSpusXyxiK4gIPDPCgMUuO9v+7pupkvFvnbNb7qSR1545+vTqLlLgy/cD+cXJefPz
 tZDuCr5NzMqj0SN8kcRWP4FtbBh/nTFUhDCCChlbdgI+18mtsoznIqBRyUqvy9L6vN4M
 e3Tw==
X-Gm-Message-State: AOAM533UFPsbTQ/qPrnC9nd/QJaMmp9StbJOceeqlLaDgaYxH2adUE/F
 fMZkJDdqee8F+/rii3gyr4v7BNynleryDBT9V+e9rUHejqsT+AVvflEgQX1TJg3HHP0enpulMtA
 oLMSbsX7q6/QX2XaCvtXNbanyUmPWLJs=
X-Received: by 2002:a05:6102:1ca:: with SMTP id
 s10mr6071891vsq.61.1639674097219; 
 Thu, 16 Dec 2021 09:01:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYfRuCZ/+cze2LVc+RbyWX6Nh6ArZcDc4P5hsX7s/1C7ZFNN6e3TBWS5+VziKjhWsxUCs86KUX/4xyeerfjAo=
X-Received: by 2002:a05:6102:1ca:: with SMTP id
 s10mr6071863vsq.61.1639674096991; 
 Thu, 16 Dec 2021 09:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-6-jsnow@redhat.com>
 <cfcc275d-1454-dbae-3f93-4a698b502fa7@virtuozzo.com>
In-Reply-To: <cfcc275d-1454-dbae-3f93-4a698b502fa7@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 12:01:26 -0500
Message-ID: <CAFn=p-Zcu62eJAy2d4XmpO-YvZC9oh3xwx1M7RUt8yht-DhW7g@mail.gmail.com>
Subject: Re: [PATCH v2 05/25] python/aqmp: rename AQMPError to QMPError
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000019578105d346607f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000019578105d346607f
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 5:09 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 15.12.2021 22:39, John Snow wrote:
> > This is in preparation for renaming qemu.aqmp to qemu.qmp. I should have
> > done this from this from the very beginning, but it's a convenient time
> > to make sure this churn is taken care of.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> Honestly, I don't want to check how it intersects with exising QMPError
> from old library, as it's going to be removed anyway. Hope, everything is
> OK:
>
>
it's all namespaced, and it doesn't appear to conflict in practice.


> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
> ---
> >   python/qemu/aqmp/__init__.py   |  6 +++---
> >   python/qemu/aqmp/error.py      | 12 ++++++------
> >   python/qemu/aqmp/events.py     |  4 ++--
> >   python/qemu/aqmp/legacy.py     |  4 ++--
> >   python/qemu/aqmp/protocol.py   |  8 ++++----
> >   python/qemu/aqmp/qmp_client.py |  8 ++++----
> >   6 files changed, 21 insertions(+), 21 deletions(-)
> >
> > diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
> > index c6fa2dda58..e1efab00af 100644
> > --- a/python/qemu/aqmp/__init__.py
> > +++ b/python/qemu/aqmp/__init__.py
> > @@ -6,7 +6,7 @@
> >   QEMU Guest Agent, and the QEMU Storage Daemon.
> >
> >   `QMPClient` provides the main functionality of this package. All errors
> > -raised by this library dervive from `AQMPError`, see `aqmp.error` for
> > +raised by this library dervive from `QMPError`, see `aqmp.error` for
>
> preexisting: s/dervive/derive/
>
>
Whoops. I'll add a patch to fix it. Thanks.

--00000000000019578105d346607f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 5:09 AM Vladi=
mir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vse=
mentsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">15.12.2021 22:39, John Snow wrote:<br>
&gt; This is in preparation for renaming qemu.aqmp to qemu.qmp. I should ha=
ve<br>
&gt; done this from this from the very beginning, but it&#39;s a convenient=
 time<br>
&gt; to make sure this churn is taken care of.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
Honestly, I don&#39;t want to check how it intersects with exising QMPError=
 from old library, as it&#39;s going to be removed anyway. Hope, everything=
 is OK:<br>
<br></blockquote><div><br></div><div>it&#39;s all namespaced, and it doesn&=
#39;t appear to conflict in practice.<br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@=
virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt; <br></blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/__init__.py=C2=A0 =C2=A0|=C2=A0 6 +++---<=
br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/error.py=C2=A0 =C2=A0 =C2=A0 | 12 ++++++-=
-----<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/events.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++=
--<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/legacy.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++=
--<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/protocol.py=C2=A0 =C2=A0|=C2=A0 8 ++++---=
-<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/qmp_client.py |=C2=A0 8 ++++----<br>
&gt;=C2=A0 =C2=A06 files changed, 21 insertions(+), 21 deletions(-)<br>
&gt; <br>
&gt; diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.=
py<br>
&gt; index c6fa2dda58..e1efab00af 100644<br>
&gt; --- a/python/qemu/aqmp/__init__.py<br>
&gt; +++ b/python/qemu/aqmp/__init__.py<br>
&gt; @@ -6,7 +6,7 @@<br>
&gt;=C2=A0 =C2=A0QEMU Guest Agent, and the QEMU Storage Daemon.<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0`QMPClient` provides the main functionality of this packag=
e. All errors<br>
&gt; -raised by this library dervive from `AQMPError`, see `aqmp.error` for=
<br>
&gt; +raised by this library dervive from `QMPError`, see `aqmp.error` for<=
br>
<br>
preexisting: s/dervive/derive/<br>
<br></blockquote><div><br></div><div>Whoops. I&#39;ll add a patch to fix it=
. Thanks.<br></div></div></div>

--00000000000019578105d346607f--


