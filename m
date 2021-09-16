Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD4E40DCF2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:37:42 +0200 (CEST)
Received: from localhost ([::1]:52188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsWD-0004EA-Q1
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQsMQ-0002AF-5a
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:27:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQsMM-0000oo-39
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631802448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4d7H7h2UYcjJpWSlR0AOECr2g2yOzDQfhssBgfg/HcU=;
 b=cZgH1LkhECJ/b4nnvQC+P/bThnt1nC5aXEmTDLIiHgliCxRdpab6jn3hDwx8Ylig9jzSPf
 6QpEbrC+miSfg4H6h00DoDMCHu/LUe4630LsYQ2F79xvdf4xynMkThHoPS/gvUuN+ubMWS
 eeDk2UWQ35TtwJUQwnnQGc8ay4aWvnc=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-H5f_eFXzPyOU_UUzFrr5Ew-1; Thu, 16 Sep 2021 10:27:24 -0400
X-MC-Unique: H5f_eFXzPyOU_UUzFrr5Ew-1
Received: by mail-ot1-f70.google.com with SMTP id
 r14-20020a056830080e00b0053b7b79c0d0so28805902ots.6
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 07:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4d7H7h2UYcjJpWSlR0AOECr2g2yOzDQfhssBgfg/HcU=;
 b=m0ofOcMv+5jKnaP72lgoH4RRb/gLR7eK5ybcGO+MhkA2WSe68Q+YVIsmaof1ACJ/oi
 xPXer7e7WquvPm1QCwQucZSiIaCorMLKMG+v0H6DMbmKiDQL8c+oRvdxGW4nX3EgLcpe
 SfTNnTOFaEkyGB5CQoM/Da4Qae8jsMLusqWeo4eunKttMQX3naOsqSIqhTPOeqqjejoU
 W9QI+7Q3rbBXkiwp2LLz+AuvPbnsgUK4f7zWKEU7iV5oXynvjN4AoUIJwhglUB0miepU
 DBFb/65uldDJPyTogXxuqpzjDu/OurJfZgt0NfjC9NDxEzunWacB7XcRxdFK39mg2vQd
 H7WA==
X-Gm-Message-State: AOAM533lpnlqV1GcuKkpMlvGQidJcjTa2M/L+YBMEVtajCRh3UdYuN8+
 b7/d857HWcK+bHLk+/jqWbO59UyW9EHU9vgy8uCeptrE64E0JMmZWBXdxrILos067MlvtxFbSbR
 HsRXLYDYHFWwQSSzpgcD6rf4iA0p7auk=
X-Received: by 2002:a05:6830:2685:: with SMTP id
 l5mr1224006otu.129.1631802443930; 
 Thu, 16 Sep 2021 07:27:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+8cEkB4OGv9lvzz+lPLKqa++81xFPWwvcvs9r2yeT2HvZdORO8qYZvUHANsNidc3P3oo6WzcJ5tbl4cwlYsM=
X-Received: by 2002:a05:6830:2685:: with SMTP id
 l5mr1223979otu.129.1631802443703; 
 Thu, 16 Sep 2021 07:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-3-jsnow@redhat.com>
 <d394079e-b83b-33ce-b137-2e5bbc2213a1@redhat.com>
In-Reply-To: <d394079e-b83b-33ce-b137-2e5bbc2213a1@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Sep 2021 10:27:12 -0400
Message-ID: <CAFn=p-aJViB-rWrVj2Ra_RXsbfqCFu2N1s_D8cCt10s9AoskMg@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] iotests/mirror-top-perms: Adjust imports
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000000385605cc1d9da0"
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
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000000385605cc1d9da0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 12:27 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
wrote:

> On 9/16/21 6:09 AM, John Snow wrote:
> > We need to import things from the qemu namespace; importing the
> > namespace alone doesn't bring the submodules with it -- unless someone
> > else (like iotests.py) imports them too.
> >
> > Adjust the imports.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/qemu-iotests/tests/mirror-top-perms | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/tests/mirror-top-perms
> b/tests/qemu-iotests/tests/mirror-top-perms
> > index 2fc8dd66e0..de18182590 100755
> > --- a/tests/qemu-iotests/tests/mirror-top-perms
> > +++ b/tests/qemu-iotests/tests/mirror-top-perms
> > @@ -25,7 +25,8 @@ from iotests import qemu_img
> >
> >  # Import qemu after iotests.py has amended sys.path
> >  # pylint: disable=3Dwrong-import-order
> > -import qemu
> > +from qemu import qmp
> > +from qemu.machine import machine
>
> Not straight-forward import name...
>
>
You mean the 'qemu.machine.machine' path? If so, I agree. It will be fixed
when I refactor QEMUMachine. A/QMP happens first.


> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
>

--00000000000000385605cc1d9da0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 16, 2021 at 12:27 AM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 9/16/21 6:09 AM, John Snow wrote:<br>
&gt; We need to import things from the qemu namespace; importing the<br>
&gt; namespace alone doesn&#39;t bring the submodules with it -- unless som=
eone<br>
&gt; else (like iotests.py) imports them too.<br>
&gt; <br>
&gt; Adjust the imports.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/qemu-iotests/tests/mirror-top-perms | 7 ++++---<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-io=
tests/tests/mirror-top-perms<br>
&gt; index 2fc8dd66e0..de18182590 100755<br>
&gt; --- a/tests/qemu-iotests/tests/mirror-top-perms<br>
&gt; +++ b/tests/qemu-iotests/tests/mirror-top-perms<br>
&gt; @@ -25,7 +25,8 @@ from iotests import qemu_img<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Import qemu after iotests.py has amended sys.path<br>
&gt;=C2=A0 # pylint: disable=3Dwrong-import-order<br>
&gt; -import qemu<br>
&gt; +from qemu import qmp<br>
&gt; +from qemu.machine import machine<br>
<br>
Not straight-forward import name...<br>
<br></blockquote><div><br></div><div>You mean the &#39;qemu.machine.machine=
&#39; path? If so, I agree. It will be fixed when I refactor QEMUMachine. A=
/QMP happens first.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redha=
t.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
<br>
</blockquote></div></div>

--00000000000000385605cc1d9da0--


