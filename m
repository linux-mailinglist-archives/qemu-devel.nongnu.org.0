Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13AB477FF6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:21:55 +0100 (CET)
Received: from localhost ([::1]:34252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxz8M-00008p-Q7
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:21:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxxgK-0004xP-LU
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 15:48:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxxg6-0003W7-TV
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 15:48:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639687717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RHxII5qHkUudrOo9Ahfn94N8JIBUTIXfSG58ReBE3RQ=;
 b=JE2sgNrdRJCPaPWY4JaZJ4A8Et358c/B9XgySZWIBcmOl5LlQStf7GSV8lNiN9ETf3j7I4
 k/OO6ARRxXE95oD5fvPAQ229bZcpAoK5Huq0E51xsFsWty6MGlzSHrIFDXdIpLjGsKMXYj
 uKPdcMz0Qa+SYqOpLK4Qofp+qhAJFyM=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-Cz7B3GvYPbqqz2JL7MnDKA-1; Thu, 16 Dec 2021 15:48:36 -0500
X-MC-Unique: Cz7B3GvYPbqqz2JL7MnDKA-1
Received: by mail-ua1-f70.google.com with SMTP id
 t22-20020ab02696000000b002e970ec14a3so124071uao.19
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 12:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RHxII5qHkUudrOo9Ahfn94N8JIBUTIXfSG58ReBE3RQ=;
 b=cr2Ntt8/9ogdhKkbvsdrrWz5fL+ibgz6qbXrA3DYHh3N271E3IL4bFVoInQNt0vdOY
 u0SkqH8N2VS1RoA90hVWpLvuIghNmPKbSUtiAdGNbA3g3VUyojxixexMQdvUnnk8+VUw
 vHoo1UHECTutFF0bwJlp5a6aLQLi7UxiNVAd4RUcD1L97r4gbjBltHrgjb+Nasm4WrJ1
 rlrbGrV+ATEh22UnZKiVBtJEIjgpnTnBij0iMIrUiJkpl9cH6dDJItCH2y4tEoae3Fod
 b9I/5higavkGGzwgZSpitnSrTJWkERFZ1Kx6QoyWTgPljFQ9MIYa2HvOGt/RLXTPZAID
 3vWw==
X-Gm-Message-State: AOAM532HBNXmWrdyd/vpInLJEY8NaU8aph12Zy5jqklVsFSYuUnK7mUb
 lRdzOhYJsgkatpxtCSNZI/C5txHzU9LTdLWrLUMN8JSa42j/+bHISQQk/WtZ7kBB9oxIBcGaGX/
 JDRExueqTToP17fSWl3RroK0X+HVv9TA=
X-Received: by 2002:a1f:a4c5:: with SMTP id n188mr7350893vke.35.1639687715996; 
 Thu, 16 Dec 2021 12:48:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLDA9BK4iORkTyxvPk5BU/e/AVHf33INAH2kqcAJ8Lb1izHaJjL3R0EbWOLW0q2tp2pCvtQYyus9Lrava/ABw=
X-Received: by 2002:a1f:a4c5:: with SMTP id n188mr7350883vke.35.1639687715816; 
 Thu, 16 Dec 2021 12:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-16-jsnow@redhat.com>
 <fb2f7353-7cd8-28af-5f38-d9fd68440155@virtuozzo.com>
In-Reply-To: <fb2f7353-7cd8-28af-5f38-d9fd68440155@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 15:48:24 -0500
Message-ID: <CAFn=p-Yir6Nr3h4JUuSO9t7CvwqQ_RmA-wUbVi0Mou5hUdiPXA@mail.gmail.com>
Subject: Re: [PATCH v2 15/25] scripts/render-block-graph: switch to AQMP
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d8185605d3498b9a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

--000000000000d8185605d3498b9a
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 5:58 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 15.12.2021 22:39, John Snow wrote:
> > Creating an instance of qemu.aqmp.ExecuteError is too involved here, so
> > just drop the specificity down to a generic AQMPError.
>
> s/AQMPError/QMPError/  ?
>
>
The problem with relying on linters to achieve consistency is that they
don't lint your commit messages :)

Fixed, thank you.


> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
> > ---
> >   scripts/render_block_graph.py | 8 +++-----
> >   1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/render_block_graph.py
> b/scripts/render_block_graph.py
> > index da6acf050d..97778927f3 100755
> > --- a/scripts/render_block_graph.py
> > +++ b/scripts/render_block_graph.py
> > @@ -25,10 +25,8 @@
> >   from graphviz import Digraph
> >
> >   sys.path.append(os.path.join(os.path.dirname(__file__), '..',
> 'python'))
> > -from qemu.qmp import (
> > -    QEMUMonitorProtocol,
> > -    QMPResponseError,
> > -)
> > +from qemu.aqmp import QMPError
> > +from qemu.aqmp.legacy import QEMUMonitorProtocol
> >
> >
> >   def perm(arr):
> > @@ -105,7 +103,7 @@ def command(self, cmd):
> >           reply = json.loads(subprocess.check_output(ar))
> >
> >           if 'error' in reply:
> > -            raise QMPResponseError(reply)
> > +            raise QMPError(reply)
> >
> >           return reply['return']
> >
> >
>
>
> --
> Best regards,
> Vladimir
>
>

--000000000000d8185605d3498b9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 5:58 AM Vladi=
mir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vse=
mentsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">15.12.2021 22:39, John Snow wrote:<br>
&gt; Creating an instance of qemu.aqmp.ExecuteError is too involved here, s=
o<br>
&gt; just drop the specificity down to a generic AQMPError.<br>
<br>
s/AQMPError/QMPError/=C2=A0 ?<br>
<br></blockquote><div><br></div><div>The problem with relying on linters to=
 achieve consistency is that they don&#39;t lint your commit messages :)</d=
iv><div><br></div><div>Fixed, thank you.<br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
<br>
Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@=
virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0scripts/render_block_graph.py | 8 +++-----<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/scripts/render_block_graph.py b/scripts/render_block_grap=
h.py<br>
&gt; index da6acf050d..97778927f3 100755<br>
&gt; --- a/scripts/render_block_graph.py<br>
&gt; +++ b/scripts/render_block_graph.py<br>
&gt; @@ -25,10 +25,8 @@<br>
&gt;=C2=A0 =C2=A0from graphviz import Digraph<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0sys.path.append(os.path.join(os.path.dirname(__file__), &#=
39;..&#39;, &#39;python&#39;))<br>
&gt; -from qemu.qmp import (<br>
&gt; -=C2=A0 =C2=A0 QEMUMonitorProtocol,<br>
&gt; -=C2=A0 =C2=A0 QMPResponseError,<br>
&gt; -)<br>
&gt; +from qemu.aqmp import QMPError<br>
&gt; +from qemu.aqmp.legacy import QEMUMonitorProtocol<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0def perm(arr):<br>
&gt; @@ -105,7 +103,7 @@ def command(self, cmd):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reply =3D json.loads(subproces=
s.check_output(ar))<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;error&#39; in reply:<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QMPResponseError(repl=
y)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QMPError(reply)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return reply[&#39;return&#39;]=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
<br>
<br>
-- <br>
Best regards,<br>
Vladimir<br>
<br>
</blockquote></div></div>

--000000000000d8185605d3498b9a--


