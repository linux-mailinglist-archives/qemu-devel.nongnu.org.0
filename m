Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA734040F7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 00:24:12 +0200 (CEST)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO5zH-0003fS-Mq
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 18:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mO5xJ-0001gW-7M
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 18:22:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mO5xH-0006EE-MT
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 18:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631139726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yr08jNCkKJbcP1Z0ZOnOPoI1ESy4BENrYACTg04G8Ew=;
 b=IlV+1xkPIIS6D7XuSSUXgYNfCz+NvbgBJANekfKvKWd/FyxLqaeyrsA/juhexEV9spRQ6U
 +Kt5ky8B6nZcMVFAxEOcjJ9/qTrjN9ogARGI+WdQ9R6moVbRJhXAv+1+p/9/NkDhEHG9MG
 Cfm8luLOCDRvTckFd8ZqjZ4XUE+ESZU=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-2eXRFOotN0CGL2Mf_ySPbA-1; Wed, 08 Sep 2021 18:22:04 -0400
X-MC-Unique: 2eXRFOotN0CGL2Mf_ySPbA-1
Received: by mail-ot1-f69.google.com with SMTP id
 v23-20020a9d6057000000b00518b08df4d2so2292969otj.13
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 15:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yr08jNCkKJbcP1Z0ZOnOPoI1ESy4BENrYACTg04G8Ew=;
 b=mjKfFxWf1kF1T9M5sLrcSxGgC++ycQ8k0b3yqC9za8q2wHFb2PsH4PySWh2gRw6/Tf
 1EDZUMnbgCOzI+IbxYX6wxIh14M4JYgnzXbi522T6frvXDw1d5Lb5oj7zpdfx0ZpUclK
 fskvC3Y3ursE5swNgJvmr0SWYbqVPSNwFZX00ugg9bAUXElqQrLR4mWjjU/4hS4rnCqo
 YneQePPooTusAqAWxdgjILly3yCC6h0PomEjAWdP2RvlY1UKagBIOL9WKDtbNTRXSf8H
 /goM6gGQ0npPFEVt0AkSi8K+t48g8y5I/FFbf8jsrIWyDA69rFnEnNaOPukIPVsW1ijW
 +1Ow==
X-Gm-Message-State: AOAM532lFiNpU+W5VKjqbiLJNeVvzfOl5IGcBkaBJQahNZF1R9fUngmJ
 bN7Lk/LPk3E2JI5Sn5cP4V5YGcpVYnA+ADWXRe4s+WNQ7lCLnwobzef0+UXvL1LBxM/Ydzc6fWc
 3hFsTh0+68CeZxfWHfDwNZ8anWroR7vs=
X-Received: by 2002:a05:6808:a01:: with SMTP id n1mr257568oij.52.1631139723338; 
 Wed, 08 Sep 2021 15:22:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy992Oy1rOQKDuvYaKA/SL/VPzfdJUQ1ZojTdZcn9Xjbu6cVJ8YD6z2pf2GaDck1ifAbIuu1dA7/XIIH5O6ZUQ=
X-Received: by 2002:a05:6808:a01:: with SMTP id n1mr257560oij.52.1631139723141; 
 Wed, 08 Sep 2021 15:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210520151759.91929-1-jsnow@redhat.com>
 <87pmtjtc8p.fsf@dusky.pond.sub.org>
In-Reply-To: <87pmtjtc8p.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 8 Sep 2021 18:21:52 -0400
Message-ID: <CAFn=p-YheABSMxjhhNRBSyosEppuE4GNqbJ7_=Twqa++wkvDyw@mail.gmail.com>
Subject: Re: [PATCH 0/3] qapi: static typing conversion, pt5c
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c6f80205cb834ff1"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c6f80205cb834ff1
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 8, 2021, 9:42 AM Markus Armbruster <armbru@redhat.com> wrote:

> Needs a rebase now.  Let's finish discussing my review of pt5b [v2]
> first.  Pending patches to expr.py should have made it to master by
> then.  If you're impatient, suggest to base on master + "[PATCH 0/5]
> qapi: Another round of minor fixes and cleanups" + pt5b [v2].
>

Not that impatient. Will focus on seeing 5b through the gates first.

My plan is to get the AQMP stuff merged and CI settled, then return focus
to you. Shouldn't take long.

--js

(ps: trying to answer mails from my phone for $reasons. If my formatting is
garbled and stupid, please just yell at me and I'll figure out how to fix
it. Thanks!)

>

--000000000000c6f80205cb834ff1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, Sep 8, 2021, 9:42 AM Markus Armbruster &lt;<a href=
=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Needs a rebase now.=C2=A0 Let&#39;s finish disc=
ussing my review of pt5b [v2]<br>
first.=C2=A0 Pending patches to expr.py should have made it to master by<br=
>
then.=C2=A0 If you&#39;re impatient, suggest to base on master + &quot;[PAT=
CH 0/5]<br>
qapi: Another round of minor fixes and cleanups&quot; + pt5b [v2].<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Not that =
impatient. Will focus on seeing 5b through the gates first.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">My plan is to get the AQMP stuff merg=
ed and CI settled, then return focus to you. Shouldn&#39;t take long.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">--js</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">(ps: trying to answer mails from my phone for $r=
easons. If my formatting is garbled and stupid, please just yell at me and =
I&#39;ll figure out how to fix it. Thanks!)</div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div>=
</div>

--000000000000c6f80205cb834ff1--


