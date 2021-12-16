Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CEB477ABE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:36:47 +0100 (CET)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxugQ-00076I-DB
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:36:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxuc1-0002VK-9J
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:32:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxuby-0001PF-Dt
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639675929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZZuTPWzW+w0Y/JTYd3jlwmaSu5H4c3+tVUbbscNEZaQ=;
 b=N3BNQnGg6mgDtrHWJtNji/SeQ57T6qzT/6qowoMeJu6GoKx37dp/l0xGhK/pz8CL+aHzJ0
 wr2UaxHj0O3RDH15XjQ4C6beciNZSw/SYo6fqCvEazpi24bi7gSjxa5zcMTa4T8YbsJ/fa
 IONmPCM6/LtSapcuvkCWwMtzATejkKc=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-hOq79ACEPuyHyqbH8G9RXw-1; Thu, 16 Dec 2021 12:32:06 -0500
X-MC-Unique: hOq79ACEPuyHyqbH8G9RXw-1
Received: by mail-vk1-f200.google.com with SMTP id
 j194-20020a1f23cb000000b00302c74a4262so12348422vkj.11
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 09:32:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZZuTPWzW+w0Y/JTYd3jlwmaSu5H4c3+tVUbbscNEZaQ=;
 b=C4d6Xq1pKDGpGCRlhZ0mBcx6dOdK+W2+7hjLCRQ0oXdgzVDe+jG6RxSsX+MivBVDLX
 sfbjnVUWi93hpqLY6XTJGVm58gBZ/fdTpW2U4JQZKoj/LpG9L8bXSFK5dPFgD1UAo1UF
 hcIX1wpgc4b4Z+iCw2RdowzvjBi8mR33Tpg7FgBS6pHxllFeeONF3dCz1ArBW5fVgeZT
 bLc0xhMI3FxHSKGDKdrSbcDD0qYMDXloMtpJrV6qwZZ8mKPjyr2XvcZB9vs13qEYNSGp
 NTD+ub+yoGUQuj7pF5FVNrqlA1xFc+Hyd3VvniaZ59F0kDo9S11wp9MU0cMGfujNXnvl
 DVCA==
X-Gm-Message-State: AOAM530bxydevyxPkDeTiF/8HwM7SWuXAmjO81a8mGCcMl/iJ3ZzB+J7
 NZsCNVGy97Sa00UmJwyK1p6ZYnusnC4+h5XHoMSapyT71wixs2lXTb4CRuDXzFqpFjFOhsVxMDx
 HuIHQb8+IJ0whMAT31+xg+1MlHQHDwQU=
X-Received: by 2002:ab0:298f:: with SMTP id u15mr4173827uap.79.1639675925399; 
 Thu, 16 Dec 2021 09:32:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpue8hqWW0JsZvBu9eF4ZpMzAg+ulrE2RkpqTl6vfFEuMTvwgotVibu6TQM9+TnfzOWs9hW5QHRKRmYNbPgiM=
X-Received: by 2002:ab0:298f:: with SMTP id u15mr4173810uap.79.1639675925218; 
 Thu, 16 Dec 2021 09:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-4-jsnow@redhat.com>
 <YbsSm3JUHvPAnyTx@redhat.com>
In-Reply-To: <YbsSm3JUHvPAnyTx@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 12:31:54 -0500
Message-ID: <CAFn=p-ZkVW+Znu9jD1UqWb1mCp+fnP1hC_XXf0PDvby=g8xZaA@mail.gmail.com>
Subject: Re: [PATCH v2 03/25] python/aqmp: copy type definitions from qmp
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000011dbdc05d346cdd7"
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer Moschetta <wainersm@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000011dbdc05d346cdd7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 5:19 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Dec 15, 2021 at 02:39:17PM -0500, John Snow wrote:
> > Copy the remaining type definitions from QMP into the qemu.aqmp.legacy
> > module. Now, most users don't need to import anything else but
> > qemu.aqmp.legacy.
>
> I'm probably missing the historical discussion but it feels very
> wierd to be saying
>
>    "most users don't need anything except  <something> legacy"
>
> Naively, I'd expect most users to want something *not* legacy.
>
>
> Regards,
> Daniel
>

The legacy.py module is a wrapper that pretends to be the
QEMUMonitorProtocol class written by Luiz Capitulino. It exists as a
synchronous wrapper around the async core. However, it's not a design that
I think actually makes sense long-term for the library as a standalone
project, so I named it legacy to intuit that it's providing compatibility
for an older interface.

The goal is to eventually remove it in favor of a sync.py that has a sync
interface that's more closely aligned to the async core. I've got a series
for this, but I wanted to pursue this tree-wide switcheroo first.

As for the phrasing, I suppose I mean: "most users [that need the legacy
interface] don't need to import both the old interface AND the legacy
wrapper that mimics it, they can just import the legacy wrapper."

--00000000000011dbdc05d346cdd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 5:19 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Dec 15, 2021 at 02:39:17PM -0500, John Snow wrote:<br>
&gt; Copy the remaining type definitions from QMP into the qemu.aqmp.legacy=
<br>
&gt; module. Now, most users don&#39;t need to import anything else but<br>
&gt; qemu.aqmp.legacy.<br>
<br>
I&#39;m probably missing the historical discussion but it feels very<br>
wierd to be saying<br>
<br>
=C2=A0 =C2=A0&quot;most users don&#39;t need anything except=C2=A0 &lt;some=
thing&gt; legacy&quot;<br>
<br>
Naively, I&#39;d expect most users to want something *not* legacy.<br>
<br>
<br>
Regards,<br>
Daniel<br></blockquote></div><div class=3D"gmail_quote"><br></div><div clas=
s=3D"gmail_quote">The legacy.py module is a wrapper that pretends to be the=
 QEMUMonitorProtocol class written by Luiz Capitulino. It exists as a synch=
ronous wrapper around the async core. However, it&#39;s not a design that I=
 think actually makes sense long-term for the library as a standalone proje=
ct, so I named it legacy to intuit that it&#39;s providing compatibility fo=
r an older interface.</div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote">The goal is to eventually remove it in favor of a sync.py =
that has a sync interface that&#39;s more closely aligned to the async core=
. I&#39;ve got a series for this, but I wanted to pursue this tree-wide swi=
tcheroo first.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmai=
l_quote">As for the phrasing, I suppose I mean: &quot;most users [that need=
 the legacy interface] don&#39;t need to import both the old interface AND =
the legacy wrapper that mimics it, they can just import the legacy wrapper.=
&quot;</div><div class=3D"gmail_quote"><br></div></div>

--00000000000011dbdc05d346cdd7--


