Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6183DFCC0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:24:46 +0200 (CEST)
Received: from localhost ([::1]:58270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCCj-0006ib-NY
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCBP-00040H-Rx
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:23:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mBCBO-00035R-Ea
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628065401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L38IrQABZNSFYPNOHjcw5l2NcS5J2l5qke/AaDWJYQs=;
 b=LN7tib6OC74rQ2Mzj7OKYZ0bBt/rQ9sUjGK1KJ+sUA+N6mVLWjVHUzP6SIRjm9poKRoJEZ
 RRx2fAPQb1ugHIV54j1ieDUSPd6IQOh2hrNlsZ15+KyG63Xs1MofFUt6WoQIHhZSBMVU98
 ke8ifNIsgGeAS7p2nlLQ+6OVQ4UGRDg=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-TkMCnpftOpawLW7vS3XetQ-1; Wed, 04 Aug 2021 04:23:20 -0400
X-MC-Unique: TkMCnpftOpawLW7vS3XetQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 16-20020a17090a1990b029017582e03c3bso5763822pji.7
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L38IrQABZNSFYPNOHjcw5l2NcS5J2l5qke/AaDWJYQs=;
 b=f6ZdU3UaLQL1tJkhHpvnBLhDeVveOZzJekEvaPQkt18LI3BW60VZasFt2d1R/CKje3
 zinh7rOBpXm5xyFlfQaVaHTwzoP1ogqJDrw9I9qfJsiSr8l0HH7WP8hPOe3etq640cRq
 l6dzj7BdRENyTmnZpcaTX+L9A/oaI7nuRzz8NuybB+78mbfCgf9At8k9JD707XNRODeQ
 IlXBDXSjxGghAQfioomceCKWeCyDKsP53a9EZ0KfnOa44xmz0tGOhe/MDPzSd5dAwOdT
 Spw+pecxgjxXO9DsV7+GeLqojoD2eeaGGx1B5cZ0RaNZhmU/Z5H07Cdj7+a3rQKyaPg/
 NVtQ==
X-Gm-Message-State: AOAM533tFWYzlxBSf1bwR6ESiiTAtVy9J6n7oMW1P9tY+F0/V5cz8Nd/
 JatT/iaG7PLse9Nhb1ARGcOCSiKqMkI7cWHZI9UO1X1nYaoVvKkjmdLAFFRBJTts5qzYPyVrX2i
 xXh8gsScTJxnXufEHrZVve8JjQUflJ3U=
X-Received: by 2002:a17:90b:4a47:: with SMTP id
 lb7mr8586909pjb.137.1628065399090; 
 Wed, 04 Aug 2021 01:23:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwUktc3evVvqElSLNMl+9AbxfCUVRNqxGx88apx2X7X7UgeMwNxx6Zbbm1Rdtb6mrnHW4enpJkvbjntgRpHS4=
X-Received: by 2002:a17:90b:4a47:: with SMTP id
 lb7mr8586895pjb.137.1628065398901; 
 Wed, 04 Aug 2021 01:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-7-marcandre.lureau@redhat.com>
 <87zgtzn911.fsf@dusky.pond.sub.org>
In-Reply-To: <87zgtzn911.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 4 Aug 2021 12:23:06 +0400
Message-ID: <CAMxuvawSvC4pjDY7HDNqQ_rhh9wWkMoRDg2PeTa_VS+_LMJoPg@mail.gmail.com>
Subject: Re: [PATCH v6 06/11] qapidoc: introduce QAPISchemaIfCond.docgen()
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c5ead605c8b783f2"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

--000000000000c5ead605c8b783f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Aug 2, 2021 at 7:47 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Instead of building the condition documentation from a list of string,
> > use the result generated from QAPISchemaIfCond.docgen().
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> I suspect this changes the generated documentation, similar to how the
> previous patch changes generated code.  True?  If yes, can you show us
> how?
>


This changes the generated documentation from:
- COND1, COND2... (where COND1, COND2 are Literal nodes, and ',' is Text)
to:
- COND1 and COND2 (the whole string as a Literal node)

This will allow us to generate more complex conditions in the following
patches, such as "(COND1 and COND2) or COND3".

Adding back the formatting is left to the wish list.

--000000000000c5ead605c8b783f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 7:47 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">ar=
mbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_bl=
ank">marcandre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Instead of building the condition documentation from a list of string,=
<br>
&gt; use the result generated from QAPISchemaIfCond.docgen().<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
<br>
I suspect this changes the generated documentation, similar to how the<br>
previous patch changes generated code.=C2=A0 True?=C2=A0 If yes, can you sh=
ow us<br>
how?<br></blockquote><div><br></div><div><br></div><div>This changes the ge=
nerated documentation from:</div><div>- COND1, COND2... (where COND1, COND2=
 are Literal nodes, and &#39;,&#39; is Text)</div><div>to:</div><div>- COND=
1 and COND2 (the whole string as a Literal node)</div><div><br></div><div>T=
his will allow us to generate more complex conditions in the following patc=
hes, such as &quot;(COND1 and COND2) or COND3&quot;.</div><div><br></div><d=
iv>Adding back the formatting is left to the wish list.<br></div><div><br><=
/div></div></div>

--000000000000c5ead605c8b783f2--


