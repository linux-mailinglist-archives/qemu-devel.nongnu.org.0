Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1773DFCCC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:27:15 +0200 (CEST)
Received: from localhost ([::1]:39616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCF8-0004n5-DR
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCE0-0002mD-8V
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:26:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCDv-0005Bx-Mv
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628065559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JogUtPEbTMHxydsUOGXsb60qLApMw7vMdzi0Spc0IP4=;
 b=YG44VrIkmVwLhCl070Vv7xqwzkSPy5np5g40fLnFwIwI1GD5rDaP3ezgjep4x7iUrQQiP+
 RYyo9WYcrbXQPUC8WVD1skIV8/qXu/uKoRsGShLKil1UEJsCfxKYRbpIecmoMX93SDiJok
 fgZjeqyVgm5lUGARKatbGXCKBwsFkKg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-mI051vqVMQ2_XM67SBgwHw-1; Wed, 04 Aug 2021 04:25:57 -0400
X-MC-Unique: mI051vqVMQ2_XM67SBgwHw-1
Received: by mail-pj1-f70.google.com with SMTP id
 h21-20020a17090adb95b029017797967ffbso1831011pjv.5
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JogUtPEbTMHxydsUOGXsb60qLApMw7vMdzi0Spc0IP4=;
 b=WZvtFcusmOqa6BmTRzhXBxgpVqgsdtr24Ctd43PlUEFmvjYDYiKylTHmI4mN2qmdum
 xHXCum15mibq1u7j7ZJcNaqOapM65FvIZmVxJKsggSkebWpp8FjEyniR0jszUh6ZYZj+
 buPAuTbsx/eQ4A9fJ281NNCk0/FofcoGK4wOHEacWsD2pTtN0JmrTkWKw4vHtfAbGx9q
 dle1lU3J7Yr59tQAno8EWOJh6uTU+jRNwhgzJfE5QJhliu36ZyOWdmapKZoH4ytMeRbo
 gsa7O7jKEDLohvkT1Vf0+dkZI/rUqd2WCvberP5xrLcr6Zxex/54I0Biy3lglvlo3vhD
 xXFA==
X-Gm-Message-State: AOAM533qKmQbeq1KumaMgHoROkqVZHg7kDI28P2257MCS5QYGpgojxMn
 5F0sDb/NetOAkikq4kNpjmA8HpewGimnacJYtURZYxrqWwksdAtwre8Uu2wxG3FGHryupw9T5IU
 SSPNnr52hsTLLWnpFugO74iy0PkT7pZE=
X-Received: by 2002:a63:4c0e:: with SMTP id z14mr63376pga.427.1628065556672;
 Wed, 04 Aug 2021 01:25:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy971UH6gQ7WiBFse3dCvwMZNSswokBv6/YnsXJuqtGQQt6W3qFaZaRDKxcOvXDJNDe/2UhbKxNJyxjlOJ4dBA=
X-Received: by 2002:a63:4c0e:: with SMTP id z14mr63367pga.427.1628065556526;
 Wed, 04 Aug 2021 01:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <877dh2r6cf.fsf@dusky.pond.sub.org>
In-Reply-To: <877dh2r6cf.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 4 Aug 2021 12:25:45 +0400
Message-ID: <CAMxuvaxS2vvy9mAO2v-0BQhT_0Jp-LkCjH+L=xtyYGFN3z1U4Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] qapi: untie 'if' conditions from C preprocessor
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002b136a05c8b78d9e"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002b136a05c8b78d9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 3, 2021 at 5:44 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > This series makes the 'if' conditions less liberal, by formalizing a
> simple
> > expression tree based on bare boolean logic of configure option
> identifiers.
> >
> > (this allows to express conditions in Rust in my QAPI-Rust PoC series)
> >
> > thanks
>
> I like this overall.
>
> The commit messages are rather terse in places.  I have a few questions,
> I asked for a few minor tweaks, and I also noted a few possible
> improvements that can be done on top.  I wonder whether we can drop
> PATCH 04.
>
> Let's discuss my findings, then decide whether we want a respin.
>

Thanks, I am sending v7 with the requested changes.

--0000000000002b136a05c8b78d9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 5:44 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; This series makes the &#39;if&#39; conditions less liberal, by formali=
zing a simple<br>
&gt; expression tree based on bare boolean logic of configure option identi=
fiers.<br>
&gt;<br>
&gt; (this allows to express conditions in Rust in my QAPI-Rust PoC series)=
<br>
&gt;<br>
&gt; thanks<br>
<br>
I like this overall.<br>
<br>
The commit messages are rather terse in places.=C2=A0 I have a few question=
s,<br>
I asked for a few minor tweaks, and I also noted a few possible<br>
improvements that can be done on top.=C2=A0 I wonder whether we can drop<br=
>
PATCH 04.<br>
<br>
Let&#39;s discuss my findings, then decide whether we want a respin.<br></b=
lockquote><div><br></div><div>Thanks, I am sending v7 with the requested ch=
anges.</div><div><br></div></div></div>

--0000000000002b136a05c8b78d9e--


