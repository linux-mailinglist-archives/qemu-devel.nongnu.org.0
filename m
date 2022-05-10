Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FFD521267
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:41:31 +0200 (CEST)
Received: from localhost ([::1]:36330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noNJ5-0000Sa-1p
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noMxw-0000uC-Ku
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:19:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noMxu-00016r-DW
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652177977;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RlhAEld4doCfSi9nlH+b5KjVIslsozKC1H0ghwuNR5s=;
 b=UvMzL/iPM7UohNMKEc9Eff2ahSQ4UqUf871NlkXTA/qRUtDMgNImzOdsXsI1GEbssFjd7m
 hM339jyMTlIkgvqNk7EiIHuIPiU7TLHvhjUU2Sp2XbiDVVLmv+bSuxPrS612ya8DQsiczl
 1yLh9UsdWCD5D7VuBCYm49+f69yHuLw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-LfkfJTK8POmh2B4rMb6Mnw-1; Tue, 10 May 2022 06:19:36 -0400
X-MC-Unique: LfkfJTK8POmh2B4rMb6Mnw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E0C685A5BE
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 10:19:36 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76A33400DE5E;
 Tue, 10 May 2022 10:19:35 +0000 (UTC)
Date: Tue, 10 May 2022 11:19:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com
Subject: Re: [PULL 00/16] migration queue
Message-ID: <Yno8NV5bQPUlqvcx@redhat.com>
References: <20220510083355.92738-1-dgilbert@redhat.com>
 <Yno3RvWhwSDZjI7o@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Yno3RvWhwSDZjI7o@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 10, 2022 at 10:58:30AM +0100, Dr. David Alan Gilbert wrote:
> * Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >=20
> > The following changes since commit 178bacb66d98d9ee7a702b9f2a4dfcd88b72=
a9ab:
> >=20
> >   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu in=
to staging (2022-05-09 11:07:04 -0700)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220510a
> >=20
> > for you to fetch changes up to 511f4a0506af1d380115a61f3362149953646871:
> >=20
> >   multifd: Implement zero copy write in multifd migration (multifd-zero=
-copy) (2022-05-10 09:15:06 +0100)
>=20
> Nack
> This is still failing the Alpine build test:
>=20
> ninja: job failed: cc -m64 -mcx16 -Ilibio.fa.p -I. -I.. -Iqapi -Itrace -I=
ui -Iui/shader -I/usr/include/p11-kit-1 -I/usr/include/glib-2.0 -I/usr/lib/=
glib-2.0/include -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -st=
d=3Dgnu11 -O2 -g -isystem /builds/dagrh/qemu/linux-headers -isystem linux-h=
eaders -iquote . -iquote /builds/dagrh/qemu -iquote /builds/dagrh/qemu/incl=
ude -iquote /builds/dagrh/qemu/disas/libvixl -iquote /builds/dagrh/qemu/tcg=
/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FIL=
E_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decl=
s -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-co=
mmon -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -=
Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body=
 -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthro=
ugh=3D2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fst=
ack-protector-strong -fPIE -MD -MQ libio.fa.p/io_channel-socket.c.o -MF lib=
io.fa.p/io_channel-socket.c.o.d -o libio.fa.p/io_channel-socket.c.o -c ../i=
o/channel-socket.c
> In file included from /usr/include/linux/errqueue.h:6,
>                  from ../io/channel-socket.c:29:
> /usr/include/linux/time_types.h:7:8: error: redefinition of 'struct __ker=
nel_timespec'
>     7 | struct __kernel_timespec {
>       |        ^~~~~~~~~~~~~~~~~
> In file included from /usr/include/liburing.h:19,
>                  from /builds/dagrh/qemu/include/block/aio.h:18,
>                  from /builds/dagrh/qemu/include/io/channel.h:26,
>                  from /builds/dagrh/qemu/include/io/channel-socket.h:24,
>                  from ../io/channel-socket.c:24:
> /usr/include/liburing/compat.h:9:8: note: originally defined here
>     9 | struct __kernel_timespec {
>       |        ^~~~~~~~~~~~~~~~~
> ninja: subcommand failed
> make: *** [Makefile:163: run-ninja] Error 1

Yuk. That very much looks like a bug in liburing itself to me.


We've exposed the latent bug by including linux/errqueue.h =20

With regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


