Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E884E4778FB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:28:40 +0100 (CET)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtcV-00008E-Ug
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:28:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxtbJ-0007ia-FI
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:27:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxtbH-0004Bp-Qm
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639672039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vXO3DHnhua7Z/Jj2XFftDl7jqw8Xq35n6R+MffOvD0I=;
 b=NZyisFwTrZDNuNS9kvB/nREf1MBjDGcvMnIV2mE66RNayVq8U2qY0o12y9CHz/FEbu4e53
 Xnyva4J7cjJxQYU/iE/Uko61JfeVULchSlIpjUss/N8l0hIYmaKpBHvjOWA4uZL97KGcXW
 HFUA0/9kFTZ1ULgVwc7oWxGLKaMfJQE=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-xebYswPgP_ieXfKgwFmDxQ-1; Thu, 16 Dec 2021 11:27:16 -0500
X-MC-Unique: xebYswPgP_ieXfKgwFmDxQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 q12-20020a9f2b4c000000b002ddac466f76so15812072uaj.12
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vXO3DHnhua7Z/Jj2XFftDl7jqw8Xq35n6R+MffOvD0I=;
 b=QgLLuQ5G3he43vU4zxlTCWMS07Eefln9PI0quZzj/4AS8Yb9xSYTSNFKmk8zDZKois
 Mpd1PMFfZrxUJqAfnnreOA4lZp3rJpwbJkGc4n+UmW5rGzqcuAgQY/WQ5tEMXJKj9duD
 hwmwIALbUTl9CtQVV7nOe7D0yhf2YnqqwIhys3hozoq2n5AlTQEuOZ3AcB56hi3GeK9T
 d2tVZ09Ik2HRK9bxxd7ifEhL7x8+pknvPBSkk0CsBVsiw6P8rNu/luAfmLCI7Q07nrtL
 KNrzMvxSFSMITZdDAbSACb65A7+tYM4zdTr1h/nZXxJm+Pan41or9g+3ixzpuleYkZYU
 366A==
X-Gm-Message-State: AOAM530vcrOj/1Jz13VysM5qDmp/QE1ciquqyl04GVT3rZDlvcn8w0s9
 utrGdc37R33tth1O5bjL1urieHZNuuml4M7EYVva6B4MjQJ2t2hg4dBuE92S5lhQx33PrOMUWUj
 Rv3AV8NHtPb5Yi5JLTJPcrnNmPU80LSs=
X-Received: by 2002:a67:d78c:: with SMTP id q12mr6191744vsj.35.1639672035766; 
 Thu, 16 Dec 2021 08:27:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgJbT1kceDaFkf5csMta9Pe6/Od1osGg64xPNttcrGNJ0uyCT2BuC00uJSGZ03LvnyctK/IQbb9mS/lBgFvsA=
X-Received: by 2002:a67:d78c:: with SMTP id q12mr6191735vsj.35.1639672035567; 
 Thu, 16 Dec 2021 08:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <YbsaCNlzcnQUOcza@redhat.com>
In-Reply-To: <YbsaCNlzcnQUOcza@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 11:27:04 -0500
Message-ID: <CAFn=p-ansvqEOwrbqTkRuTSyQsuhUeWbf5N1bicfn5n-sK7H4g@mail.gmail.com>
Subject: Re: [PATCH v2 00/25] Python: delete synchronous qemu.qmp package
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003a804505d345e572"
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer Moschetta <wainersm@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003a804505d345e572
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 5:51 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Dec 15, 2021 at 02:39:14PM -0500, John Snow wrote:
> > GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-qmp-legacy-switc=
h
> > CI: https://gitlab.com/jsnow/qemu/-/pipelines/430491195
> >
> > Hi, this series is part of an effort to publish the qemu.qmp package on
> > PyPI. It is the first of three series to complete this work:
> >
> > --> (1) Switch the new Async QMP library in to python/qemu/qmp
> >     (2) Fork python/qemu/qmp out into its own repository,
> >         with updated GitLab CI/CD targets to build packages.
> >     (3) Update qemu.git to install qemu.qmp from PyPI,
> >         and then delete python/qemu/qmp.
>
> What timeframe are you suggesting step (3) for ?
>
>
Roughly around when (2) happens; I don't want to maintain the same code in
two different places.


> In the series for (2) you're calling it version 0.0.1 indicating
> it is liable to  have API incompatible changes.
>

Yes. (We can pin to version 0.0.1 in-tree and bump it manually when
required.)


> For step (3), either we're going to have to fetch a precise
> version number to avoid risk of API breakage, or we're going
> to have to call it stable in (2) and commit to the API.
>

Pinning is what I'd prefer, I have some changes in mind that may require
some API changes, so I'd rather not call it stable yet.

--0000000000003a804505d345e572
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 5:51 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Dec 15, 2021 at 02:39:14PM -0500, John Snow wrote:<br>
&gt; GitLab: <a href=3D"https://gitlab.com/jsnow/qemu/-/commits/python-qmp-=
legacy-switch" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/jsno=
w/qemu/-/commits/python-qmp-legacy-switch</a><br>
&gt; CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/430491195" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipeline=
s/430491195</a><br>
&gt; <br>
&gt; Hi, this series is part of an effort to publish the qemu.qmp package o=
n<br>
&gt; PyPI. It is the first of three series to complete this work:<br>
&gt; <br>
&gt; --&gt; (1) Switch the new Async QMP library in to python/qemu/qmp<br>
&gt;=C2=A0 =C2=A0 =C2=A0(2) Fork python/qemu/qmp out into its own repositor=
y,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with updated GitLab CI/CD targets to =
build packages.<br>
&gt;=C2=A0 =C2=A0 =C2=A0(3) Update qemu.git to install qemu.qmp from PyPI,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and then delete python/qemu/qmp.<br>
<br>
What timeframe are you suggesting step (3) for ?<br>
<br></blockquote><div><br></div><div>Roughly around when (2) happens; I don=
&#39;t want to maintain the same code in two different places.<br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
In the series for (2) you&#39;re calling it version 0.0.1 indicating<br>
it is liable to=C2=A0 have API incompatible changes.<br></blockquote><div><=
br></div><div>Yes. (We can pin to version 0.0.1 in-tree and bump it manuall=
y when required.)<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
For step (3), either we&#39;re going to have to fetch a precise<br>
version number to avoid risk of API breakage, or we&#39;re going<br>
to have to call it stable in (2) and commit to the API.<br></blockquote><di=
v><br></div><div>Pinning is what I&#39;d prefer, I have some changes in min=
d that may require some API changes, so I&#39;d rather not call it stable y=
et.<br></div><div>=C2=A0</div></div></div>

--0000000000003a804505d345e572--


