Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C018442C0A1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:54:07 +0200 (CEST)
Received: from localhost ([::1]:45630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1madlm-00054r-Kc
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1madj5-0002ra-Kw
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:51:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1madj1-000439-Mp
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634129473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2QRkU5n82IT9aLcZG8LlH1aj+SWTTgPNz9zsMlGJr9U=;
 b=ht0mwiNPeccyX6REJNY1fagykziaRG40Zck8h84N8FEpKuGRGgb+BS5RpcfSuJcfSA6AD1
 hWi6U9eZleE5xXqXS+Qf3zgro36/CcZuPLMGnxggtqybsXMnA9e2UaaD6zAXUbk9JD6ptP
 VQtorL6quziWo26KBdIdxWKONvW8bT4=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-lPBNI2iKMauwfkmt1wIhww-1; Wed, 13 Oct 2021 08:51:12 -0400
X-MC-Unique: lPBNI2iKMauwfkmt1wIhww-1
Received: by mail-ua1-f72.google.com with SMTP id
 c19-20020ab03493000000b002ba380b6ef5so1248365uar.12
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 05:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2QRkU5n82IT9aLcZG8LlH1aj+SWTTgPNz9zsMlGJr9U=;
 b=yX7lehG/v/NHh2ORO0pVi3tCkNsiSGcp/dJJP86rmN9kiXkrRpfDhRbqFELNMZtisx
 KhztXDaszqgbgCI3CcL+QB9lEa3W67c8QiP0gSVFMWt3ClEMCfa/iVok+US6gwPKiHTg
 b3lyTKF7Cv5sRA2vaq4spl40F1GbVDFJW+h8ut5694/xyvGcTsSxzMC1Sk6ABxvAF8/k
 RDw81dznrzt/NihAEdrnnERzoXIhMwlaUAmqbpYBtRnf2IQCLGRKsSK2DPJnYUogFFLy
 IoFBHzrXPy9Cvf2fSsk/YhYN00PqSq4PKLCRfByWm1pnHvep/rjl/uI92tAJJbxR3a3j
 /cLw==
X-Gm-Message-State: AOAM532ufFWsBk+B/Hf3qpIxHm5xEjziXnAGNmQg31s/VD3N2OR0m9A6
 Q0zKBOXcuHAm5J9+9jdYWWAFDW7ic6Wyn5T8AOYD9xqgChKdxmOQ1oaJBYY/bVewAazRbzZw/Zy
 s/legrklpOucu6fkLQUh62MJK/6XjgKA=
X-Received: by 2002:a67:f70a:: with SMTP id m10mr10865059vso.40.1634129471866; 
 Wed, 13 Oct 2021 05:51:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaEbI/gI3pLj5CUSQdevZ4CFpcIPga3FG0TeY6J+IU0wEo++X1hAJ6F/9l+ScuQXKCTbmTfWAOmaksT1LMZUU=
X-Received: by 2002:a67:f70a:: with SMTP id m10mr10865029vso.40.1634129471682; 
 Wed, 13 Oct 2021 05:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211012223445.1051101-1-jsnow@redhat.com>
 <5041f802-0b42-f130-ee68-56cd7464b75d@redhat.com>
In-Reply-To: <5041f802-0b42-f130-ee68-56cd7464b75d@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 13 Oct 2021 08:51:00 -0400
Message-ID: <CAFn=p-aJdGpCzkMHmMO9WO+rYn55OznyZ7K5BJz+Rv0GkRDhOA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Switch iotests to using Async QMP
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ad4af205ce3b6abf"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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

--000000000000ad4af205ce3b6abf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 4:45 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 13.10.21 00:34, John Snow wrote:
> > Based-on: <20211012214152.802483-1-jsnow@redhat.com>
> >            [PULL 00/10] Python patches
> > GitLab:
> https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-iotest-wrapper
> > CI: https://gitlab.com/jsnow/qemu/-/pipelines/387210591
> >
> > Hiya,
> >
> > This series continues where the last two AQMP series left off and adds =
a
> > synchronous 'legacy' wrapper around the new AQMP interface, then drops
> > it straight into iotests to prove that AQMP is functional and totally
> > cool and fine. The disruption and churn to iotests is pretty minimal.
> >
> > In the event that a regression happens and I am not physically proximat=
e
> > to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variable
> > to any non-empty string as it pleases you to engage the QMP machinery
> > you are used to.
> >
> > I'd like to try and get this committed early in the 6.2 development
> > cycle to give ample time to smooth over any possible regressions. I've
> > tested it locally and via gitlab CI, across Python versions 3.6 through
> > 3.10, and "worksforme". If something bad happens, we can revert the
> > actual switch-flip very trivially.
>
> So running iotests locally, I got one failure:
>
> $ TEST_DIR=3D/tmp/vdi-tests ./check -c writethrough -vdi 300
> [...]
> 300                             fail       [10:28:06] [10:28:11]
> 5.1s                 output mismatch (see 300.out.bad)
> --- /home/maxx/projects/qemu/tests/qemu-iotests/300.out
> +++ 300.out.bad
> @@ -1,4 +1,5 @@
> -.......................................
> +..............ERROR:qemu.aqmp.qmp_client.qemu-b-222963:Task.Reader:
> ConnectionResetError: [Errno 104] Connection reset by peer
> +.........................
>   ----------------------------------------------------------------------
>   Ran 39 tests
> [...]
>
>
Oh, unfortunate.


>
> I=E2=80=99m afraid I can=E2=80=99t really give a reproducer or anything. =
 It feels like
>

Thank you for the report!


> just some random spurious timing-related error.  Although then again,
> 300 does have an `except machine.AbnormalShutdown` clause at one
> point...  So perhaps that=E2=80=99s the culprit, and we need to disable l=
ogging
> there.
>
>
I'll investigate!

--000000000000ad4af205ce3b6abf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 13, 2021 at 4:45 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 13.10.2=
1 00:34, John Snow wrote:<br>
&gt; Based-on: &lt;<a href=3D"mailto:20211012214152.802483-1-jsnow@redhat.c=
om" target=3D"_blank">20211012214152.802483-1-jsnow@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [PULL 00/10] Python patches<b=
r>
&gt; GitLab: <a href=3D"https://gitlab.com/jsnow/qemu/-/commits/python-aqmp=
-iotest-wrapper" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/js=
now/qemu/-/commits/python-aqmp-iotest-wrapper</a><br>
&gt; CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/387210591" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipeline=
s/387210591</a><br>
&gt;<br>
&gt; Hiya,<br>
&gt;<br>
&gt; This series continues where the last two AQMP series left off and adds=
 a<br>
&gt; synchronous &#39;legacy&#39; wrapper around the new AQMP interface, th=
en drops<br>
&gt; it straight into iotests to prove that AQMP is functional and totally<=
br>
&gt; cool and fine. The disruption and churn to iotests is pretty minimal.<=
br>
&gt;<br>
&gt; In the event that a regression happens and I am not physically proxima=
te<br>
&gt; to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variabl=
e<br>
&gt; to any non-empty string as it pleases you to engage the QMP machinery<=
br>
&gt; you are used to.<br>
&gt;<br>
&gt; I&#39;d like to try and get this committed early in the 6.2 developmen=
t<br>
&gt; cycle to give ample time to smooth over any possible regressions. I&#3=
9;ve<br>
&gt; tested it locally and via gitlab CI, across Python versions 3.6 throug=
h<br>
&gt; 3.10, and &quot;worksforme&quot;. If something bad happens, we can rev=
ert the<br>
&gt; actual switch-flip very trivially.<br>
<br>
So running iotests locally, I got one failure:<br>
<br>
$ TEST_DIR=3D/tmp/vdi-tests ./check -c writethrough -vdi 300<br>
[...]<br>
300=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fail=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [10:28:06] [=
10:28:11] <br>
5.1s=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 output mismatch (see 300.out.bad)<br>
--- /home/maxx/projects/qemu/tests/qemu-iotests/300.out<br>
+++ 300.out.bad<br>
@@ -1,4 +1,5 @@<br>
-.......................................<br>
+..............ERROR:qemu.aqmp.qmp_client.qemu-b-222963:Task.Reader: <br>
ConnectionResetError: [Errno 104] Connection reset by peer<br>
+.........................<br>
=C2=A0=C2=A0---------------------------------------------------------------=
-------<br>
=C2=A0=C2=A0Ran 39 tests<br>
[...]<br>
<br></blockquote><div><br></div><div>Oh, unfortunate.<br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I=E2=80=99m afraid I can=E2=80=99t really give a reproducer or anything.=C2=
=A0 It feels like <br></blockquote><div><br></div><div>Thank you for the re=
port!<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
just some random spurious timing-related error.=C2=A0 Although then again, =
<br>
300 does have an `except machine.AbnormalShutdown` clause at one <br>
point...=C2=A0 So perhaps that=E2=80=99s the culprit, and we need to disabl=
e logging <br>
there.<br>
<br></blockquote><div><br></div>I&#39;ll investigate!<br></div></div>

--000000000000ad4af205ce3b6abf--


