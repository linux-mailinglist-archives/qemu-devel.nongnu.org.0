Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02D44A3F15
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:14:11 +0100 (CET)
Received: from localhost ([::1]:51874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nESlG-0003za-HM
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:14:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eterrell@redhat.com>)
 id 1nESgV-0001io-3Y
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:09:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eterrell@redhat.com>)
 id 1nESgT-0004Ui-9m
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643620152;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9WS2UbJMOd4QSQVDLOzH+vH05HsVvmcgWmNqOBe8814=;
 b=MaCHTE7EHw6688jbiTs+a6Q0sun1Xf8+lE8k+vL4OGGUfVwHDYI2VI2RFNT0V8inSMIDiF
 oCr1E0HO77np6NBhJV+aLAR3pr6rAPYXPRoQogFdPyEV7nCl+cRoZcyZfm7Kct1Fby04mG
 PdDQnMmtfm8Gp1yOEwbUrd4ylv7BFVQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-hVmXsH0zM-un3J7BZ9P2oA-1; Mon, 31 Jan 2022 04:07:55 -0500
X-MC-Unique: hVmXsH0zM-un3J7BZ9P2oA-1
Received: by mail-wr1-f72.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so4499245wrh.23
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 01:07:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=9WS2UbJMOd4QSQVDLOzH+vH05HsVvmcgWmNqOBe8814=;
 b=WZlvvQhKMfE46JJci1ZcGS/+2z1GHIMwRgCDtQHzLS4HkUDS85mrM0Mr18esjcK+BG
 6W02zYn47rGyUZTw3QpeLKFHoTJTwg1U8tzDLV6IFeMiT9R/QR/0j3PmMMQ286NStDXK
 zr+mR3NCcMzyRM7w/HaQjg5jDe7032HZnGs85hgTIyLBcKsBuzNK+fe+f9fjqYjcAkiY
 c8+6NxVHu82JWpT9T0jb1WyZ6rQfSogcqqIQ+GolsmXc5SqVO3l7Y5lSxqhtpd4uako9
 rzEh5Igj8pP6lHh79D2ZEHRi9nH3CcdEmI9jubfOdkgS+4R5CWyIkutHX9JFvJUGVgZs
 JzKA==
X-Gm-Message-State: AOAM530seSQMqBk9ezIyMLKVzSXDIzc1xPpsCV6PT6A31WlREaTHSIL2
 tRlYHAOzL4MSCoW4w3twtGXEb5NSI/4NudYygYTnbUwAOY8ww/G86twshXV446r+rM5IOU91ktc
 drVVQHcFyiQw3wTsxR3MkMbVJttvNK8U=
X-Received: by 2002:adf:fe09:: with SMTP id n9mr16161145wrr.559.1643620074436; 
 Mon, 31 Jan 2022 01:07:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKx1Ho0/XqznhMzEh9dYGXN53rY46QIBxJRm4EZnNvSqC3cAhU8X5QknYfvU/68pdpa7IOyIPm9xJJP4+l5W4=
X-Received: by 2002:adf:fe09:: with SMTP id n9mr16161138wrr.559.1643620074242; 
 Mon, 31 Jan 2022 01:07:54 -0800 (PST)
MIME-Version: 1.0
References: <20210802130303.3300108-1-berrange@redhat.com>
 <008bee58061405c8f9fe36d8c40a62d360bd4547.camel@redhat.com>
 <YfQO7w9QL+LrE11D@redhat.com>
In-Reply-To: <YfQO7w9QL+LrE11D@redhat.com>
From: Eduardo Otubo <eterrell@redhat.com>
Date: Mon, 31 Jan 2022 10:07:43 +0100
Message-ID: <CAGMDDkfCM5bvyTDm02tNnu3Z6cS_0OZWST-FA5qGGJPDBgeprQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] seccomp: fix hole in blocking forks
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eterrell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eterrell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: otubo@redhat.com
Cc: Eduardo Otubo <otubo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 4:42 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> Hi Eduardo,
>
> You acked this series, but going through my old git branches I
> just discovered that this never got merged. I guess I was assuming
> you had queued it for a future PULL when you acked it.
>
> I don't mind sending a pull request myself if you've no objections.

I don't mind at all. Thanks for letting me know! I might have missed it som=
ehow.

Thank you!

>
> On Wed, Aug 04, 2021 at 10:05:38AM +0200, Eduardo Terrell Ferrari Otubo w=
rote:
> > On Mon, 2021-08-02 at 14:02 +0100, Daniel P. Berrang=C3=A9 wrote:
> > > Blocking the 'fork' syscall on Linux is not sufficient to block the
> > > 'fork' C library function, because the latter is essentially always
> > > implemented using the 'clone' syscall these days.
> > >
> > > Blocking 'clone' is difficult as that also blocks pthread creation,
> > > so it needs careful filtering.
> > >
> > > Daniel P. Berrang=C3=A9 (5):
> > >   seccomp: allow action to be customized per syscall
> > >   seccomp: add unit test for seccomp filtering
> > >   seccomp: fix blocking of process spawning
> > >   seccomp: block use of clone3 syscall
> > >   seccomp: block setns, unshare and execveat syscalls
> > >
> > >  MAINTAINERS               |   1 +
> > >  softmmu/qemu-seccomp.c    | 282 +++++++++++++++++++++++++++++-------
> > > --
> > >  tests/unit/meson.build    |   4 +
> > >  tests/unit/test-seccomp.c | 269 ++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 490 insertions(+), 66 deletions(-)
> > >  create mode 100644 tests/unit/test-seccomp.c
> > >
> > > --
> > > 2.31.1
> > >
> > >
> >
> > Acked-by: Eduardo Otubo <otubo@redhat.com>
> >
> > --
> > Eduardo Otubo
> >
> >
>
>
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


