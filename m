Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137C548CA0A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 18:44:36 +0100 (CET)
Received: from localhost ([::1]:47644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7hfn-0006A2-5x
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 12:44:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7hXN-0005uK-9q
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:35:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7hXJ-0000wL-Qf
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642008941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=81chb/kVea3htd7Ya68s3VGqz5qE6AFIpJs7RZKpndg=;
 b=eG6K9FVnyDRAg97T0fdC+5mXf8387gcKa87yNGCqF5Y2yNWBuA7Dnrw1+gH7QASxc6zsuD
 pN2nypxaIWLrhC2HOOzxgbkzT40L40+r0T/lFCeFdq8lp3CFdu4QBl2XLGvTF62rN17gcv
 pU0DP72k3qxXWl5BPOgtDSWJvtJEmvA=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-aJpYLeTANbKnfnJqE85WSQ-1; Wed, 12 Jan 2022 12:35:40 -0500
X-MC-Unique: aJpYLeTANbKnfnJqE85WSQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 w48-20020a9f31f3000000b002cf15fe9655so2062777uad.17
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 09:35:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=81chb/kVea3htd7Ya68s3VGqz5qE6AFIpJs7RZKpndg=;
 b=kym+uH0kv+WlpYJGyVhm2Qe50bvpF01uW/D0+ECzmyqJY8x/iPqjvGAD5GAiOsQ15W
 JQHnPI8CXn4MD/Pl6h7Zwf+6v+wnanuDRbrUkJZNlMtnUrailwe8hXpLZ7h6pw4ueTBl
 bx4Ajmd7zZZieSdkx3pl4yR75jubAZ3eZQznkmiK/7AvDNywGAjnM3wAbZzFI+3+vw+T
 LVqvQ6xb4TC/DZtION0yFC52Rjs0ma7R1qKs7IjEqOTzinKlcSitwvgcJNlguIVTdAxW
 WZQn3kKDgMC2MhQWGRFCHq1r0xWmYP5ZUPrz65BTbff3wqLe4vL4aA5HieXSaPt0vj4r
 +jgQ==
X-Gm-Message-State: AOAM532Vf9wh7QZXkuWAgWDT6PJenZfxXuzzFAGSgRw8kl5gAVe2yMOH
 3wVRl++VCwaC4YYMpDBNGy3DhgyIRwQ8Ii5kpui9bAjuR/jPail+sjjwsckdQuwI+E3r+dOSdYc
 GBYswEPK948SPSl4kulUfHO4horzllhk=
X-Received: by 2002:a05:6122:b64:: with SMTP id h4mr369973vkf.24.1642008939283; 
 Wed, 12 Jan 2022 09:35:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwv8PQPXOHfaCobFmtf648DO+pg6Yq0JJW3dTFRrZ10iYaK7fTyaUWDNfucDjEoHVx2tzJmfj1AtxFYLiajpBw=
X-Received: by 2002:a05:6122:b64:: with SMTP id h4mr369945vkf.24.1642008939007; 
 Wed, 12 Jan 2022 09:35:39 -0800 (PST)
MIME-Version: 1.0
References: <20220110232910.1923864-1-jsnow@redhat.com>
 <20220110232910.1923864-15-jsnow@redhat.com>
 <20220112135212.b4w5q5rv6qdz2jk5@laptop.redhat>
In-Reply-To: <20220112135212.b4w5q5rv6qdz2jk5@laptop.redhat>
From: John Snow <jsnow@redhat.com>
Date: Wed, 12 Jan 2022 12:35:28 -0500
Message-ID: <CAFn=p-Zn40Of6_O7cQejrBzR5SvpSGu0w0uRoZppPX5L9q3ROg@mail.gmail.com>
Subject: Re: [PATCH v3 14/31] python/qmp: switch qmp-shell to AQMP
To: Beraldo Leal <bleal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 8:52 AM Beraldo Leal <bleal@redhat.com> wrote:
>
> On Mon, Jan 10, 2022 at 06:28:53PM -0500, John Snow wrote:
> > We have a replacement for async QMP, but it doesn't have feature parity
> > yet. For now, then, port the old tool onto the new backend.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > ---
> >  python/qemu/aqmp/legacy.py   |  3 +++
> >  python/qemu/qmp/qmp_shell.py | 31 +++++++++++++++++--------------
> >  2 files changed, 20 insertions(+), 14 deletions(-)
> >
> > diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> > index 27df22818a..0890f95b16 100644
> > --- a/python/qemu/aqmp/legacy.py
> > +++ b/python/qemu/aqmp/legacy.py
> > @@ -22,6 +22,9 @@
> >  from .qmp_client import QMPClient
> >
> >
> > +# (Temporarily) Re-export QMPBadPortError
> > +QMPBadPortError = qemu.qmp.QMPBadPortError
>
> Probably I'm missing something, but any reason for not using, something
> like this?
>
> from qemu.qmp import (QMPMessage, QMPReturnValue, SocketAddrT,
>                       QMPBadPortError)
>

It's a declaration of intent; if I don't shuffle it into a new
assignment, mypy chirps a warning that I am using something "not
explicitly exported by the module". An alternative would be to define
an __all__ List[str], but that's even more churn for something that's
going to be deleted by the end of the series, so I went with this
little temporary hack instead.

Silly, yes.

--js


