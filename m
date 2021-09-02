Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D2F3FE9F2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:24:33 +0200 (CEST)
Received: from localhost ([::1]:38410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLh5M-000518-Rg
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLh3t-0002rk-3r
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:23:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLh3p-000135-Lp
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630567377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=any3xluYv38YaS9orqCKUlZHCgmcPuugrtn5iDRBhnI=;
 b=S6x2Vjcp9FtwNKszFIHYvOFJ91yZ34jQuOJHVxQqK7jtK3N6Fx9cSQKLKqpXf8ktXifYID
 FJKf8yXJ6KmMWsLbIx7oEBSd0C6zAD4j/7p8awI4hCzxh7QvGoxbOZh3VjLouERIp5LQLm
 hxeD8m9vl1Ly0s7875EeFcA1WmYiNB4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-a7pVt6bYPIC-Abl5PN2qqQ-1; Thu, 02 Sep 2021 03:22:45 -0400
X-MC-Unique: a7pVt6bYPIC-Abl5PN2qqQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 q18-20020a05651232b200b003d9019c6ae4so445298lfe.22
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=any3xluYv38YaS9orqCKUlZHCgmcPuugrtn5iDRBhnI=;
 b=drcCqiPNiywajSduYamjo+x88peD591A8iPAyiUjscAlGTYvc1P9otZ800nqs5rZ/Z
 R/RUIQcNBe+ELYAkPacQoZRABywEcSvX+24+LYE5E2poFv1kbZm1c442bBQHE6/Zlto8
 ycbpdTsdx5JWxfSfTFDMXKLi9p+VuVw/lKOcL9vEQDFjjFmE9mqYyJut3ykVEpuQm2To
 usTcCgCvVx5Ai/o7g+eVVglPe7dgfVTlzt1XV9OSqvij/B646+uqrPj0597iQgNcS8RC
 AC4GVp0UGnXAbzLuEqLk6lnGhNjR0LcyVptv+lZIrHU4RZRFzpK9Z2qSwGwmJRCsxHaf
 heDg==
X-Gm-Message-State: AOAM530HSegusa6z2AtGrmk7ZVGq4tBhrIl1AauSmoIb8hmcOmTI0rKA
 DAgQrnfaBkzObZKhQTImFyrgKHvSIrcWk7TEfRwgpI+FrAqqMoG3hx2We/W7ZWaWVt71Mm2KsAd
 KkXMuMU3FqVB/P+dzXRKWuOuY/H/OoXY=
X-Received: by 2002:a05:6512:16a0:: with SMTP id
 bu32mr1569916lfb.322.1630567364026; 
 Thu, 02 Sep 2021 00:22:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAb8lMV7NHcmfmPTeaws2VvRunpNXeEsp7HoYGLEnJme5icejVT8XqRqmxb5g9d9TFp3SzYYb2zrDAnwLVSqI=
X-Received: by 2002:a05:6512:16a0:: with SMTP id
 bu32mr1569884lfb.322.1630567363612; 
 Thu, 02 Sep 2021 00:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
In-Reply-To: <YS4rulGV9eueB04H@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Sep 2021 04:22:55 -0300
Message-ID: <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Daniel, thanks for the feedback !

On Tue, Aug 31, 2021 at 10:17 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Tue, Aug 31, 2021 at 08:02:39AM -0300, Leonardo Bras wrote:
> > Call qio_channel_set_zerocopy(true) in the start of every multifd threa=
d.
> >
> > Change the send_write() interface of multifd, allowing it to pass down
> > flags for qio_channel_write*().
> >
> > Pass down MSG_ZEROCOPY flag for sending memory pages, while keeping the
> > other data being sent at the default copying approach.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  migration/multifd-zlib.c | 7 ++++---
> >  migration/multifd-zstd.c | 7 ++++---
> >  migration/multifd.c      | 9 ++++++---
> >  migration/multifd.h      | 3 ++-
> >  4 files changed, 16 insertions(+), 10 deletions(-)
>
> > @@ -675,7 +676,8 @@ static void *multifd_send_thread(void *opaque)
> >              }
> >
> >              if (used) {
> > -                ret =3D multifd_send_state->ops->send_write(p, used, &=
local_err);
> > +                ret =3D multifd_send_state->ops->send_write(p, used, M=
SG_ZEROCOPY,
> > +                                                          &local_err);
>
> I don't think it is valid to unconditionally enable this feature due to t=
he
> resource usage implications
>
> https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
>
>   "A zerocopy failure will return -1 with errno ENOBUFS. This happens
>    if the socket option was not set, the socket exceeds its optmem
>    limit or the user exceeds its ulimit on locked pages."

You are correct, I unfortunately missed this part in the docs :(

> The limit on locked pages is something that looks very likely to be
> exceeded unless you happen to be running a QEMU config that already
> implies locked memory (eg PCI assignment)

Do you mean the limit an user has on locking memory?

If so, that makes sense. I remember I needed to set the upper limit of lock=
ed
memory for the user before using it, or adding a capability to qemu before.

Maybe an option would be trying to mlock all guest memory before setting
zerocopy=3Don in qemu code. If it fails, we can print an error message and =
fall
back to not using zerocopy (following the idea of a new io_async_writev()
I told you in the previous mail).


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

Best regards,
Leonardo


