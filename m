Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600FA449C7D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 20:38:24 +0100 (CET)
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkATG-0001oW-Vi
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 14:38:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mkAQk-0000qR-EJ
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 14:35:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mkAQd-0002mE-CT
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 14:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636400132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YWBTXukWa3iCfrv7BfHKEz7eFSYH+MdKP1LD4Qdzhhc=;
 b=g51KR+BE0g30/zWG5SqFXQcEvXeENu21/801zN9AbZBSETT+pG50dTi3FNjYfnootjAv+O
 Q5JR5tU0nbjM9/yTkp4ZKEW1IpzVwP/CqvXix2Bz8mJyyfF58WZjqv5CY+IWf3eqaXnAi+
 /S1QBvPlMC9B/oxVwtx2LV2aatjQY7w=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-LMRTUfvJORKzYywzuocU0Q-1; Mon, 08 Nov 2021 14:35:22 -0500
X-MC-Unique: LMRTUfvJORKzYywzuocU0Q-1
Received: by mail-ua1-f69.google.com with SMTP id
 s5-20020a9f2c45000000b002cfa7164503so7150712uaj.0
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 11:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YWBTXukWa3iCfrv7BfHKEz7eFSYH+MdKP1LD4Qdzhhc=;
 b=aRoUcWShB/Ddkb21bvL2F+qWbhe7BYh4t0Wr+B4PfUd4FnN6YbhNE17391bVpSUQKQ
 uoJdnS7KSKgBmgWhMFumzsKsr/BVt1RvUDdaBiVYipKW0Qe+5sSWVpYOGiyAIX+TKujI
 +VlOI5Hn66nYfVgpmDcFFktYeUNq1Nm5juA4ABbioBANNEcdlYwihFmhtie1Kt3eYFW3
 BjGr++DftepoVmPwaf5KO5ceYhASWqBOylCm9DfRXUYD6IOn2pDabhKS4MbRHN1lHYni
 ERWAv9eQ4PC65h2BGY5SHkqf29svWm1FiCkS2ewNikjn18oCF5vvCIU2aX37J28M6big
 8DRA==
X-Gm-Message-State: AOAM530V+FKOJEUiO2JIzGz0UL2cWGfWKhoBb9rQ8ZETq9tT4w9NgNKZ
 fExv6hAO6pW6k7dfauMgE4TRiXxTwmlvKbFDKZ58ljDkO/fm5YOSA+J6wSubQyMXBsUwKyXkt9q
 H6vmQkET/rYpKFADJu7p8V4fCL7VOdec=
X-Received: by 2002:a9f:21e1:: with SMTP id 88mr1782580uac.79.1636400121134;
 Mon, 08 Nov 2021 11:35:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzK27+dqDEOvod2Zt61yjiIFcem5CF9peH5dti4CHQdsL07/pdw9+rc51ekXCKhw7Aso0fS2dyn3l6XJi6Q7Ts=
X-Received: by 2002:a9f:21e1:: with SMTP id 88mr1782459uac.79.1636400120286;
 Mon, 08 Nov 2021 11:35:20 -0800 (PST)
MIME-Version: 1.0
References: <20211004215238.1523082-1-jsnow@redhat.com>
 <CAJ+F1CLazZxCbDPL-LO9V3Ee33JHbwhJkFfG9EVumuBp6QegZg@mail.gmail.com>
In-Reply-To: <CAJ+F1CLazZxCbDPL-LO9V3Ee33JHbwhJkFfG9EVumuBp6QegZg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 8 Nov 2021 14:35:09 -0500
Message-ID: <CAFn=p-bL5jCaSsUzQ-ee3zwJOd=UOVswLikApmJFjWs+MZSS8w@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] docs/sphinx: change default `role` to "any"
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e1659905d04c17cc"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>, Eric Blake <eblake@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e1659905d04c17cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 5, 2021 at 9:22 AM Marc-Andr=C3=A9 Lureau <marcandre.lureau@gma=
il.com>
wrote:

> Hi
>
> On Tue, Oct 5, 2021 at 1:53 AM John Snow <jsnow@redhat.com> wrote:
>
>> V4: Fixed more occurrences that have occurred since V3.
>>
>> V3: Removed bad rebase confetti
>>     fixed the OSS-Fuzz link to ... actually be a link.
>>
>> (Patch 2 can be squashed into patch 1 on merge, but this keeps the diff
>> easy to see and review.)
>>
>
> queued with extra fixes in patch 2, thanks
>
>
Thanks!

--000000000000e1659905d04c17cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 5, 2021 at 9:22 AM Marc-A=
ndr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marcandr=
e.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 5, 2021 at 1:53 A=
M John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">V4: Fixed more occurrences that have occurred since V3.<br>
<br>
V3: Removed bad rebase confetti<br>
=C2=A0 =C2=A0 fixed the OSS-Fuzz link to ... actually be a link.<br>
<br>
(Patch 2 can be squashed into patch 1 on merge, but this keeps the diff<br>
easy to see and review.)<br></blockquote><div><br></div><div>queued with ex=
tra fixes in patch 2, thanks<br></div><div> <br></div></div></div></blockqu=
ote><div><br></div><div>Thanks!</div><br></div></div>

--000000000000e1659905d04c17cc--


