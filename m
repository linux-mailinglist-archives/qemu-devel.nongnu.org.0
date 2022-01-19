Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA35C493F68
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:54:45 +0100 (CET)
Received: from localhost ([::1]:46414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAFAS-0003kT-Ir
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:54:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAEhJ-0002R5-C3
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:24:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAEhH-0000z3-M4
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:24:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642613075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=83+l6brUGXIAwUs02nsKirR46uQgaVPyKFEQcy6z7I4=;
 b=OTDbalF7cG6YjVYEAZ+H0HdOcLDMxbQ5likVe3mRpcGBeNiuBqsVUmDoWUPfPcO/+97GeK
 5nvnB9MXk0mnIviQcw5mHOVIkitkCrY0f3k1M0Jb0Zc+7UIy/R4NNuv2kRrTvjwy1Qcii/
 YUpixm9OKk385JA2KHy09B6HeTa4ZxA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-zdY2WVVSOh6WDCxHxQ2GRw-1; Wed, 19 Jan 2022 12:24:25 -0500
X-MC-Unique: zdY2WVVSOh6WDCxHxQ2GRw-1
Received: by mail-ed1-f71.google.com with SMTP id
 s9-20020aa7d789000000b004021d03e2dfso3214002edq.18
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 09:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=83+l6brUGXIAwUs02nsKirR46uQgaVPyKFEQcy6z7I4=;
 b=VZjZsBNNcspkEcl79bx4q3k7LxMfxltI//+y2iteDEOZMW3Uv++SveKsWNlBvxYn7y
 FbkoptOMQ4VqlKMHModOjPzLF3EfC7nD3uxp3Vxs2H69IBCCNmk7Lejaa3o1YbnHk/um
 pq4HIbMHvb2nlBWXl+bQi28qVGjW8Dbi881QsJTE0YfZlApeCXuQUPmCXBl9BREP2xHV
 Z6kFHMdHHeioHx7D/L3+npKkaSE8gLS0dFqsFPy2B4DhHvXLwTLp+kgQ0o9hhj5gjmR2
 FLp+BknwWq5C++ntaFdwRXYTCoj3GPOlaggtht0jTs/LpMfXyMxRRLhZUcAraRpWUM5e
 fr1g==
X-Gm-Message-State: AOAM530DbDqwDZnbzPJJw6gRsSaaR/DMr04BxHTaof++rkvrtkU9xJV3
 3eoJeo1FlkU2k6VprEVtKLpz4jW20Ia/l1xzot9Y63CPiuZQEiOL9r77r92C0h/jYZr6U8lAc7H
 jS4GuyeJLiFGLvfHD1X6FSRXs45zxG+w=
X-Received: by 2002:a2e:594:: with SMTP id 142mr20365014ljf.116.1642613063837; 
 Wed, 19 Jan 2022 09:24:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMZIpGmecaalQSe+6hRA8J82vfq/R4rBYusvl3O3fFpgHVFc1cC59gPKNSZj0T88hR+05oEoUl5bF49jI95WQ=
X-Received: by 2002:a2e:594:: with SMTP id 142mr20364999ljf.116.1642613063649; 
 Wed, 19 Jan 2022 09:24:23 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-3-leobras@redhat.com>
 <YeAjrIrdZfgh6m1B@redhat.com>
In-Reply-To: <YeAjrIrdZfgh6m1B@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 19 Jan 2022 14:24:12 -0300
Message-ID: <CAJ6HWG7-ptTfZ2PC25T81+kbAgXyVBHmACOSDsXB7iuUsdr8NQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 10:06 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Thu, Jan 06, 2022 at 07:13:39PM -0300, Leonardo Bras wrote:
> > For CONFIG_LINUX, implement the new zero copy flag and the optional cal=
lback
> > io_flush on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> > feature is available in the host kernel, which is checked on
> > qio_channel_socket_connect_sync()
> >
> > qio_channel_socket_flush() was implemented by counting how many times
> > sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
> > socket's error queue, in order to find how many of them finished sendin=
g.
> > Flush will loop until those counters are the same, or until some error =
occurs.
> >
> > Notes on using writev() with QIO_CHANNEL_WRITE_FLAG_ZERO_COPY:
> > 1: Buffer
> > - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid=
 copying,
> > some caution is necessary to avoid overwriting any buffer before it's s=
ent.
> > If something like this happen, a newer version of the buffer may be sen=
t instead.
> > - If this is a problem, it's recommended to call qio_channel_flush() be=
fore freeing
> > or re-using the buffer.
> >
> > 2: Locked memory
> > - When using MSG_ZERCOCOPY, the buffer memory will be locked after queu=
ed, and
> > unlocked after it's sent.
> > - Depending on the size of each buffer, and how often it's sent, it may=
 require
> > a larger amount of locked memory than usually available to non-root use=
r.
> > - If the required amount of locked memory is not available, writev_zero=
_copy
> > will return an error, which can abort an operation like migration,
> > - Because of this, when an user code wants to add zero copy as a featur=
e, it
> > requires a mechanism to disable it, so it can still be accessible to le=
ss
> > privileged users.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  include/io/channel-socket.h |   2 +
> >  io/channel-socket.c         | 107 ++++++++++++++++++++++++++++++++++--
> >  2 files changed, 105 insertions(+), 4 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Thanks!

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


