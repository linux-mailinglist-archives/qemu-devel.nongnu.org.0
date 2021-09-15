Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881F540BCC1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 02:52:38 +0200 (CEST)
Received: from localhost ([::1]:59248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQJAD-0006sC-L8
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 20:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQJ8a-0005LH-1x
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 20:50:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQJ8K-0003aI-JY
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 20:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631667038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fcmy/kr3FNAxNzuFytLeIJqK4uLm5ASkxxHGcYUfpUs=;
 b=FsQoXyQtUWkPdPTq0MyqzwYOQKQ01VTfrxQWMkM6NqLsnY/P7Mjx1Qfh2zUFliPzlh+Fg1
 b9u1xwYX0nvAGDBoTPuILozZLfyCjg1M0Hv5Pttrb8x2eFvxnvyMmNqboxfHZs3zzEqk1g
 ht3EKhe9sXT1OlCAXV3P1S2OtdH/qY0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556--PPpK5XuOe21UDrPfyY_cA-1; Tue, 14 Sep 2021 20:50:35 -0400
X-MC-Unique: -PPpK5XuOe21UDrPfyY_cA-1
Received: by mail-ot1-f72.google.com with SMTP id
 i2-20020a05683033e200b00538e5aa7d41so899514otu.1
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 17:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fcmy/kr3FNAxNzuFytLeIJqK4uLm5ASkxxHGcYUfpUs=;
 b=s57IfUz5LFBk0zA5UcRPgzzHtJsFhFC2YnbvWat8QRrCI/G4iM8xw4v26vgbhLtLnK
 8I3CFDLOi/qfB9+Fm6Q2TMCgFbhRUfW0ahD+zV1yc0PcjMhuO4A3GsSlyfGWAemYHqFU
 ASdIibcW8NjzCfejkK5xioCMsFJen1ka3GPZSThFHcteuKX5VPi/YC3xtwHP26SWJeHh
 yKh5BWVLxxcsE3wuXa+IFlOIuwfXdpGJuBzdxBm1jwftoB5SldRu4zv8qMypXURjf4Ye
 1SabNXN9TiEfBc2FyTTYJqu5Aovs6owzYDkFpze0+YhI6ffSDGVJZ3pHPacQy+gjErxO
 XLtg==
X-Gm-Message-State: AOAM5313HS7aEbrXU+IbDLVdqjDS+x5l0LEOG+JOHVZeO4zSEQg8eSrp
 33g0b4eIj3sPGz/fO9RigUIMsYQxdYkJLTssdTj5pJzThQeN7c5+hh/D3Pqi7vYNoRI5nj6coiE
 VVuO2KuqQxnUDXVcr7NXsYlMxnzNqyMo=
X-Received: by 2002:aca:add3:: with SMTP id w202mr3340929oie.112.1631667034420; 
 Tue, 14 Sep 2021 17:50:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAO5XJsPDUJZxrSyp/raI7PZi3PQZrHCED0c6RCwKC/wbycONyuAlVterk1rsLVNx4FR8wrA59IgUNPlqzMLI=
X-Received: by 2002:aca:add3:: with SMTP id w202mr3340919oie.112.1631667034244; 
 Tue, 14 Sep 2021 17:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210824153540.177128-1-hreitz@redhat.com>
 <20210824153540.177128-2-hreitz@redhat.com>
 <2404b821-78bf-bfcd-417e-0f4bb9eb911c@redhat.com>
In-Reply-To: <2404b821-78bf-bfcd-417e-0f4bb9eb911c@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Sep 2021 20:50:23 -0400
Message-ID: <CAFn=p-Y3d8-Qhc5GnArfy+NmoX7foao_yQ++O7xVnh75LAOEgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iotests: Fix unspecified-encoding pylint warnings
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f7dc5805cbfe15af"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f7dc5805cbfe15af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 11:47 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
wrote:

> On 8/24/21 5:35 PM, Hanna Reitz wrote:
> > As of recently, pylint complains when `open()` calls are missing an
> > `encoding=3D` specified.  Everything we have should be UTF-8 (and in fa=
ct,
> > everything should be UTF-8, period (exceptions apply)), so use that.
> >
> > Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> > ---
> >  tests/qemu-iotests/297        | 2 +-
> >  tests/qemu-iotests/iotests.py | 8 +++++---
> >  2 files changed, 6 insertions(+), 4 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
>
I don't see this upstream just yet, so ...

Reviewed-by: John Snow <jsnow@redhat.com>

I'll get around to revisiting my "run the iotest linters on Python CI"
thing soon which will flush out anything else that might still be missing.

--js

--000000000000f7dc5805cbfe15af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 24, 2021 at 11:47 AM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 8/24/21 5:35 PM, Hanna Reitz wrote:<br>
&gt; As of recently, pylint complains when `open()` calls are missing an<br=
>
&gt; `encoding=3D` specified.=C2=A0 Everything we have should be UTF-8 (and=
 in fact,<br>
&gt; everything should be UTF-8, period (exceptions apply)), so use that.<b=
r>
&gt; <br>
&gt; Signed-off-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" ta=
rget=3D"_blank">hreitz@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/qemu-iotests/297=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 tests/qemu-iotests/iotests.py | 8 +++++---<br>
&gt;=C2=A0 2 files changed, 6 insertions(+), 4 deletions(-)<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redha=
t.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>I don&#39;t see this upstream just yet=
, so ...</div><div><br></div><div>Reviewed-by: John Snow &lt;<a href=3D"mai=
lto:jsnow@redhat.com">jsnow@redhat.com</a>&gt;</div><div><br></div><div>I&#=
39;ll get around to revisiting my &quot;run the iotest linters on Python CI=
&quot; thing soon which will flush out anything else that might still be mi=
ssing.</div><div><br></div><div>--js<br></div></div></div>

--000000000000f7dc5805cbfe15af--


