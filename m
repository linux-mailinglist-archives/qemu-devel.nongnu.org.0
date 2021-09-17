Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADA540FAEE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:58:07 +0200 (CEST)
Received: from localhost ([::1]:39464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFJW-00023o-PV
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRFHI-0007l0-Cp
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:55:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRFHE-0001qd-U9
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631890544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ES6Tn8zcpZEi/LRU1UjNQzt7mn0bLNLRPyEUiMjWASI=;
 b=hayoNwsACvaY5SF9RVn3FnqFKCoUJP0JyhH7jw/QHQOOHxlFg5vC7dxQ9jwprSPEddCi+U
 ETwBgxmJYDO27/pLozxwe7IBAa1NXzYIWKL5GYmO65ZfpnMIjFvdIt/AWcAqHLNUr7rNiQ
 yH74IsnD89ImsaCOSEh10x1cLOuwoSE=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-ZfiE_TGcM4GSAPFayzHHiQ-1; Fri, 17 Sep 2021 10:55:40 -0400
X-MC-Unique: ZfiE_TGcM4GSAPFayzHHiQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 17-20020aca2111000000b0026d657f80d7so34036219oiz.16
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 07:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ES6Tn8zcpZEi/LRU1UjNQzt7mn0bLNLRPyEUiMjWASI=;
 b=nxVLbciWHNy6iuEdAGpkq281GGME2NcF4cvHhGYLy1BrP/i5DlFVv2ZTLStrmqaWzn
 Y7iIZMzi9DiHTAqKHoPe3g/rLLhU9oENt2402DhBqjWYH9Jd0POovFdP+f42vMZookRF
 tJpeASGKluy+qrRQQs8sJ/WZFlKYDiHieFhPLt4bl48o4NWDhJ22VtWCAv0kzw5JkxLG
 ZDCqze4cj4ZKa2cO8ULtc1V+Ah/2BrF2wEIe1KbwLeBIlHAfz6hDr1x65fjP4wQvLVTP
 8B4F6M+1km7RZNdKlvXJ4bo3oOYLeqED9YlY7lcSX9tpHgIuj+CnDEzvh9f9DK65zeen
 TfHg==
X-Gm-Message-State: AOAM5307DV9INgeWvzo2nKKovhx5Z6SsUmCD8ieTDStWxsjPW5Ymo+s+
 zqumcRNNHrPNK3RcCQqqxYY/3Z5lmbEcEZEf3tAPewOK+RQzUK43J320lzKrUiTQF9nCiFzpTYe
 0u0PiKv02YxG5s9kS/ry2s94c7yxWdXc=
X-Received: by 2002:a4a:45cc:: with SMTP id y195mr9335134ooa.52.1631890539862; 
 Fri, 17 Sep 2021 07:55:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDe0zgZsNqCE4Rt4NIQNiwtEdwjvrTACjFSOKJoYjYyhpWHgXVZBn0ApEoeVV5DrxBgwJzVBTQ1THSKi/t1V8=
X-Received: by 2002:a4a:45cc:: with SMTP id y195mr9335119ooa.52.1631890539647; 
 Fri, 17 Sep 2021 07:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-16-jsnow@redhat.com>
 <c5c66550-8e12-8aa2-1af3-b778aa399b10@redhat.com>
In-Reply-To: <c5c66550-8e12-8aa2-1af3-b778aa399b10@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 10:55:29 -0400
Message-ID: <CAFn=p-Y-HJ8_dQ51P8xZabYwzdh3FxGozBmAW1zVT20wV6Z-7Q@mail.gmail.com>
Subject: Re: [PATCH 15/15] python, iotests: replace qmp with aqmp
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000eda41505cc321f59"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

--000000000000eda41505cc321f59
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 17, 2021 at 10:40 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 17.09.21 07:40, John Snow wrote:
> > Swap out the synchronous QEMUMonitorProtocol from qemu.qmp with the sync
> > wrapper from qemu.aqmp instead.
> >
> > Add an escape hatch in the form of the environment variable
> > QEMU_PYTHON_LEGACY_QMP which allows you to cajole QEMUMachine into using
> > the old interface, proving that both implementations work concurrently.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/machine/machine.py | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> > index 8f5a6649e5..6b005dd5d1 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -41,7 +41,6 @@
> >   )
> >
> >   from qemu.qmp import (  # pylint: disable=import-error
> > -    QEMUMonitorProtocol,
> >       QMPMessage,
> >       QMPReturnValue,
> >       SocketAddrT,
> > @@ -50,6 +49,12 @@
> >   from . import console_socket
> >
> >
> > +if os.environ.get('QEMU_PYTHON_LEGACY_QMP'):
> > +    from qemu.qmp import QEMUMonitorProtocol
> > +else:
> > +    from qemu.aqmp.legacy import QEMUMonitorProtocol
> > +
> > +
> >   LOG = logging.getLogger(__name__)
>
> Black magic.
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> Tested-by: Hanna Reitz <hreitz@redhat.com>
>
>
Thanks for taking a look! Sorry for making you look at python :)

--000000000000eda41505cc321f59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 10:40 AM Hann=
a Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17.09.=
21 07:40, John Snow wrote:<br>
&gt; Swap out the synchronous QEMUMonitorProtocol from qemu.qmp with the sy=
nc<br>
&gt; wrapper from qemu.aqmp instead.<br>
&gt;<br>
&gt; Add an escape hatch in the form of the environment variable<br>
&gt; QEMU_PYTHON_LEGACY_QMP which allows you to cajole QEMUMachine into usi=
ng<br>
&gt; the old interface, proving that both implementations work concurrently=
.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/machine/machine.py | 7 ++++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/mach=
ine.py<br>
&gt; index 8f5a6649e5..6b005dd5d1 100644<br>
&gt; --- a/python/qemu/machine/machine.py<br>
&gt; +++ b/python/qemu/machine/machine.py<br>
&gt; @@ -41,7 +41,6 @@<br>
&gt;=C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0from qemu.qmp import (=C2=A0 # pylint: disable=3Dimport-er=
ror<br>
&gt; -=C2=A0 =C2=A0 QEMUMonitorProtocol,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QMPMessage,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QMPReturnValue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SocketAddrT,<br>
&gt; @@ -50,6 +49,12 @@<br>
&gt;=C2=A0 =C2=A0from . import console_socket<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +if os.environ.get(&#39;QEMU_PYTHON_LEGACY_QMP&#39;):<br>
&gt; +=C2=A0 =C2=A0 from qemu.qmp import QEMUMonitorProtocol<br>
&gt; +else:<br>
&gt; +=C2=A0 =C2=A0 from qemu.aqmp.legacy import QEMUMonitorProtocol<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0LOG =3D logging.getLogger(__name__)<br>
<br>
Black magic.<br>
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
Tested-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D"_=
blank">hreitz@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>Thanks for taking a look! Sorry for ma=
king you look at python :) <br></div><div><br></div></div></div>

--000000000000eda41505cc321f59--


