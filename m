Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF6643E54B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:37:17 +0200 (CEST)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7St-0003ux-LQ
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mg7Ri-0002VS-CW
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mg7Rg-0003Nc-H9
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635435358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tEH1krRsLg0kW2BYu1RSNtAGYi7A8Q+UN8khxU2TNvk=;
 b=RsOW3PNYGn6SbGNAIKCsjzK1zQkCKOLv/mTIIF1go0tYx7YuJYCXfEvMa2MB5lpaUYA3r8
 3Obn47NG1v5nMC2/V2mBIU0v6KUYzWJzlnt51BkSxeBepCowPcppudwDPwXWex0en3wXv/
 ZNfVASMpIJ2ZHMgmVP1Y3aM4K9tpclw=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-qZnjq-7MO7qySkHNGIarrA-1; Thu, 28 Oct 2021 11:35:53 -0400
X-MC-Unique: qZnjq-7MO7qySkHNGIarrA-1
Received: by mail-ua1-f72.google.com with SMTP id
 h19-20020ab01353000000b002cb5de63c37so3510350uae.8
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tEH1krRsLg0kW2BYu1RSNtAGYi7A8Q+UN8khxU2TNvk=;
 b=BI+7fxYOt328xBzr8MrHMFMzeK+96RYZK4aYb8TObuNvB04XcnInr7qVQBQyDGcLAy
 eDV/7eKr0puvtDL+6bmPp/bk9QT9Ybl14IO1zmUpbFKL0Vd9QaeheZk/GjhiIqS0A6wI
 fuuG3eoyJe3mdpgxhS2yEheM20Zqwm9J1PkDsidvryb/T+5wBaBjEN8f9XQp5RQvqkbl
 VcjqzpegYl8N3vuO/3s0LCtxtX374Q1YgXnq0xvwvwRV+Bsn9X44SVBOBhDlznnAZPyz
 IpIDkm7q7Nvr2xnXbAIWCT9L8XmNx/amUr+tYfLLFXL0l/g1pKndeLTkcj4CZsdvXfLh
 Wr0Q==
X-Gm-Message-State: AOAM532pWh9EcmYmWv+CII9o6GTymzKtczshMyi5YTqBh9jOkTzaxCuZ
 jHZCxjgunfij+fKc+gdOk5jCjQZ63Cc1zZdh3/goHrq+8GZJi2+NQDV7XdV0vmk/w+gomI7psR4
 Lu/vm1eTHs5N6tTA3CtOToxtmaVxqwWw=
X-Received: by 2002:a05:6122:c9f:: with SMTP id
 ba31mr5289607vkb.25.1635435352488; 
 Thu, 28 Oct 2021 08:35:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIr31gZz43H8uEwf3JTzafLMRl2MeSFbBPjy1jkpS2QslwzHcHhQWjI9A+dsMJspSVNjp1Z8gsfs+jMU+kp6k=
X-Received: by 2002:a05:6122:c9f:: with SMTP id
 ba31mr5289569vkb.25.1635435352226; 
 Thu, 28 Oct 2021 08:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211026175612.4127598-1-jsnow@redhat.com>
 <20211026175612.4127598-3-jsnow@redhat.com>
 <YXk1wbRWNLlvXxMU@redhat.com>
 <CAFn=p-bU3SjifQXDEBX07Fxy-G-TAj3hbBJYqMJQ=Xrr0bJqEw@mail.gmail.com>
 <YXp05svPZwSXOA/d@redhat.com>
In-Reply-To: <YXp05svPZwSXOA/d@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 28 Oct 2021 11:35:43 -0400
Message-ID: <CAFn=p-bdJ05=z6KBiHKsMSPjDAZoJ59iJjKGnRhZ97vasyz38g@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] python/machine: Handle QMP errors on close more
 meticulously
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000390e3805cf6b77a1"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000390e3805cf6b77a1
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021, 6:01 AM Kevin Wolf <kwolf@redhat.com> wrote:

> Am 27.10.2021 um 19:49 hat John Snow geschrieben:
> > This reply is long, sorry.
>
> And after writing half of a very long reply myself, I noticed that I was
> just very confused, so sorry for making you write a long text for no
> real reason (well, at least for my first point - for the second one,
> your explanation was very helpful, so thanks for that).
>
> Somehow I ended up completely ignoring the context of the code (it's run
> as part of shutdown functions) and instead thought of the general
> condition of QMP connections going away anywhere in the code.
>
> I suppose this could be a relevant concern in an actually asynchronous
> client that may read from the socket (and encounter an error if the QEMU
> process has already gone away and closed the connection) at any time,
> but that's not what machine.py is meant for, at least not for now.
>
> So I'll just delete what I already wrote. This patch should be fine.
>
> Kevin
>

No problem. The cleanup path here is quite complex, so it wasn't clear that
there *wasn't* a problem.

I'd like to upgrade machine.py to use asyncio more natively for the console
socket and qmp layers in the future and help break it apart into smaller
pieces that are easier to reason about.

You're right, though, if/when this part becomes async then needing more
precision on when we mark a vm as defunct will become important.

Thanks for looking at it!

--js

>

--000000000000390e3805cf6b77a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Oct 28, 2021, 6:01 AM Kevin Wolf &lt;<a href=
=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Am 27.10.2021 um 19:49 hat John Snow geschrieben:=
<br>
&gt; This reply is long, sorry.<br>
<br>
And after writing half of a very long reply myself, I noticed that I was<br=
>
just very confused, so sorry for making you write a long text for no<br>
real reason (well, at least for my first point - for the second one,<br>
your explanation was very helpful, so thanks for that).<br>
<br>
Somehow I ended up completely ignoring the context of the code (it&#39;s ru=
n<br>
as part of shutdown functions) and instead thought of the general<br>
condition of QMP connections going away anywhere in the code.<br>
<br>
I suppose this could be a relevant concern in an actually asynchronous<br>
client that may read from the socket (and encounter an error if the QEMU<br=
>
process has already gone away and closed the connection) at any time,<br>
but that&#39;s not what machine.py is meant for, at least not for now.<br>
<br>
So I&#39;ll just delete what I already wrote. This patch should be fine.<br=
>
<br>
Kevin<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">No problem. The cleanup path here is quite complex, so it wasn&#39;t c=
lear that there *wasn&#39;t* a problem.=C2=A0</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">I&#39;d like to upgrade machine.py to use asyncio mor=
e natively for the console socket and qmp layers in the future and help bre=
ak it apart into smaller pieces that are easier to reason about.=C2=A0</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">You&#39;re right, though, if=
/when this part becomes async then needing more precision on when we mark a=
 vm as defunct will become important.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Thanks for looking at it!</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">--js</div><div dir=3D"auto"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"></blockquote></div></div></div>

--000000000000390e3805cf6b77a1--


