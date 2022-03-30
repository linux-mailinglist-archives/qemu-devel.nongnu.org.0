Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2180A4EC8BA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 17:48:37 +0200 (CEST)
Received: from localhost ([::1]:58906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZaYl-0002GF-O3
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 11:48:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZaXI-0001O3-3A
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 11:47:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZaXE-0001cR-G4
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 11:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648655218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzDOOrhxz4S/rlLSLzJEnknMk/J2M+h2qnKS2ehI7fQ=;
 b=IoWzhacZIEMhu2hNhN2s12EBcHl/lh/yLJ99rkIf/PaBgkAsKWWpm03T7SjqFiWrXXsXXZ
 boGHop5JGNHCmMfInGpx5hMi2bnLH/blolZdn6AKzmUu/CEtUFKz4wJNhlGTXqRkBFxD3p
 25FB6VyOT4qmTiI1ES/tmte8Cc0mL+U=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-PGwYSyp4NrCQ9Gnp8k3EVw-1; Wed, 30 Mar 2022 11:46:53 -0400
X-MC-Unique: PGwYSyp4NrCQ9Gnp8k3EVw-1
Received: by mail-vs1-f70.google.com with SMTP id
 g20-20020a67dc94000000b003253f7908dbso3001873vsk.13
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 08:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DzDOOrhxz4S/rlLSLzJEnknMk/J2M+h2qnKS2ehI7fQ=;
 b=rapFciLuCY1Wkrrs7Clwaqe+U1qCybnCrHwldREiyvp3UYbrGyusTGzYrsTsTke87u
 9C0XuV1DA2mdQrHDseFYdEkqbjqB/HtcAb6d6gkTUG//BifurGLbXvRd6YtX76S9Iejh
 2C4URboUyqURj3QbmuisB3qPzvorHF81DIpYc2/phFsTASy9U2FIOuY+djkBUTuWSsp/
 nP/HLs/yl/p4hzQ1MolLgepJrMchQ4BGoRPt7OjxuzJc6PpFPGKueptUYti6S2l1+WY8
 ZJn247mroxt7B6CdCnVV4M/CwufbmDFyEDYXPJAB8/Jb985QtfXUYOqbWqQgw4/q3n/j
 jKHw==
X-Gm-Message-State: AOAM533WOkIxYeW599y9ngwyTPawmOVbqC6T2MbD7LTqNDCwwt9DSLV6
 Nw6WIGUaVx6PEznr98oSDzPAottStIsFDwm7Q5n24nz8X8pWCkQQ4CjJY9L3APKq4gZmvZV932e
 Mw7tOiK55TpUuvR5EtdQ6pOOt1hTKRnE=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr20743169vsa.38.1648655212806; 
 Wed, 30 Mar 2022 08:46:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8A7wxvicrV7AjOrfgF1n4C0F5EYyEIhAV6wpM6sB0/uy3/hpMjkK2yHCR+PJ1r2KEwl4Z89UsdYsKuVhesfs=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr20743153vsa.38.1648655212556; Wed, 30
 Mar 2022 08:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220325200438.2556381-1-jsnow@redhat.com>
 <20220325200438.2556381-4-jsnow@redhat.com>
 <YkRyDe3yiIWYFyLT@redhat.com>
In-Reply-To: <YkRyDe3yiIWYFyLT@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 30 Mar 2022 11:46:41 -0400
Message-ID: <CAFn=p-bn5jn9Xg5HsaYwnVnp+5_U115f5WNBZzXNkKmgukxnxg@mail.gmail.com>
Subject: Re: [PATCH 3/4] python/qmp-shell: relicense as LGPLv2+
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Luiz Capitulino <lcapitulino@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <mlureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@habkost.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 11:07 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Fri, Mar 25, 2022 at 04:04:37PM -0400, John Snow wrote:
> > qmp-shell is presently licensed as GPLv2 (only). I intend to include
> > this tool as an add-on to an LGPLv2+ library package hosted on
> > PyPI.org. I've selected LGPLv2+ to maximize compatibility with other
> > licenses while retaining a copyleft license.
> >
> > To keep licensing matters simple, I'd like to relicense this tool as
> > LGPLv2+ as well in order to keep the resultant license of the hosted
> > release files simple -- even if library users won't "link against" this
> > command line tool.
> >
> > Therefore, I am asking permission from the current authors of this
> > tool to loosen the license. At present, those people are:
> >
> > - John Snow (me!), 411/609
> > - Luiz Capitulino, Author, 97/609
> > - Daniel Berrang=C3=A9, 81/609
> > - Eduardo Habkost, 10/609
> > - Marc-Andr=C3=A9 Lureau, 6/609
> > - Fam Zheng, 3/609
> > - Cleber Rosa, 1/609
> >
> > (All of which appear to have been written under redhat.com addresses.)
> >
> > Eduardo's fixes are largely automated from 2to3 conversion tools and ma=
y
> > not necessarily constitute authorship, but his signature would put to
> > rest any questions.
> >
> > Cleber's changes concern a single import statement change. Also won't
> > hurt to ask.
> >
> > CC: Luiz Capitulino <lcapitulino@redhat.com>
> > CC: Daniel Berrange <berrange@redhat.com>
> > CC: Eduardo Habkost <ehabkost@habkost.com>
> > CC: Marc-Andr=C3=A9 Lureau <mlureau@redhat.com>
> > CC: Fam Zheng <fam@euphon.net>
> > CC: Cleber Rosa <crosa@redhat.com>
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/qemu/aqmp/qmp_shell.py | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
>
> Acked-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Thanks!

That's a wrap :)

>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


