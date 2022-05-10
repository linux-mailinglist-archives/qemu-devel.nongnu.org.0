Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A458952128B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:47:09 +0200 (CEST)
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noNOW-0006IH-Pq
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noNLN-0004FT-Mp
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:43:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noNLL-0005lO-Vr
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652179431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7e1S7I/zLJphv4UsMWvLjOEnPniwh8VBCx/BRakIlts=;
 b=CBVgMv8QsuOqXnOrcxaNK0Gtk4agnIXV8rAJcJ+5jXYC29RYGbZnMYrWaLdNPPALr1WogU
 WfsHqi9IuQAXK/cu49C9iBQJYq2rf3cYmmlZXObIqWrFgmfKZrEM9ojHf1okJMnHmuBtee
 Br21pUMmMlK1lx5DcrAkFGr6BHMdcWA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-EpQ4cknsPVeUnCmZhII08g-1; Tue, 10 May 2022 06:43:50 -0400
X-MC-Unique: EpQ4cknsPVeUnCmZhII08g-1
Received: by mail-wm1-f69.google.com with SMTP id
 k35-20020a05600c1ca300b003946a9764baso1098867wms.1
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 03:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=7e1S7I/zLJphv4UsMWvLjOEnPniwh8VBCx/BRakIlts=;
 b=2XOnrSEjm6F2y4zSTqQCm/mHAE74W3w1JkRfJjiCMo8w3ejxwYDP8BFjqkakMj5w1E
 oYD1x1TjU5ix04O5X2e2qO33fFM0/4kcVlVySVYWVMlkPbFbAsl/4A2OI7xIM0u4VC7O
 5E0FHZB/5ZNL8h6cgAjOMRZkkwP25sn1qGWSQXYpK3G+9hQ35UllDDQsZtCVy3GiwhKW
 t4XF87fgoAaYSzpaMhPQ6bW3i3BLLW5C0cLNkMevAdUa+Lg+wAe3VPOuGIyqwmiavj5T
 +SX+Dhgs3I7kzcx13wiVYPTBrqHER6rPWcuucdbUJUYWI5ypyFW46iXhNOpqRKtdrUhH
 9bCg==
X-Gm-Message-State: AOAM530ABcct9d9V+ruWNchmYhiw09qlu+tS8Ky62SJXvGUtK4l4eD70
 eQa9BYmzOln0ulcSrwuLt4Xt30vNeSt1L3d/r7peCsAHT9Mgd6k7RcT57WTEGGpPjcbN9hGK2ge
 QrOn3x2hfOj9rT7U=
X-Received: by 2002:adf:e904:0:b0:20a:d652:592b with SMTP id
 f4-20020adfe904000000b0020ad652592bmr18137574wrm.714.1652179428944; 
 Tue, 10 May 2022 03:43:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM0f9ipt7JS0oPYUipm3yPl7lvZIjp/EcAOxxQ1TiahBm0tzb6fLsVK6Rmv4wr9qauPaMK0w==
X-Received: by 2002:adf:e904:0:b0:20a:d652:592b with SMTP id
 f4-20020adfe904000000b0020ad652592bmr18137549wrm.714.1652179428573; 
 Tue, 10 May 2022 03:43:48 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d67ca000000b0020c5253d8cfsm16325847wrw.27.2022.05.10.03.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 03:43:48 -0700 (PDT)
Date: Tue, 10 May 2022 11:43:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com
Subject: Re: [PULL 00/16] migration queue
Message-ID: <YnpB4vg2ozbBzUCg@work-vm>
References: <20220510083355.92738-1-dgilbert@redhat.com>
 <Yno3RvWhwSDZjI7o@work-vm> <Yno8NV5bQPUlqvcx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Yno8NV5bQPUlqvcx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> On Tue, May 10, 2022 at 10:58:30AM +0100, Dr. David Alan Gilbert wrote:
> > * Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > >=20
> > > The following changes since commit 178bacb66d98d9ee7a702b9f2a4dfcd88b=
72a9ab:
> > >=20
> > >   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu =
into staging (2022-05-09 11:07:04 -0700)
> > >=20
> > > are available in the Git repository at:
> > >=20
> > >   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220510a
> > >=20
> > > for you to fetch changes up to 511f4a0506af1d380115a61f33621499536468=
71:
> > >=20
> > >   multifd: Implement zero copy write in multifd migration (multifd-ze=
ro-copy) (2022-05-10 09:15:06 +0100)
> >=20
> > Nack
> > This is still failing the Alpine build test:
> >=20
> > ninja: job failed: cc -m64 -mcx16 -Ilibio.fa.p -I. -I.. -Iqapi -Itrace =
-Iui -Iui/shader -I/usr/include/p11-kit-1 -I/usr/include/glib-2.0 -I/usr/li=
b/glib-2.0/include -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -=
std=3Dgnu11 -O2 -g -isystem /builds/dagrh/qemu/linux-headers -isystem linux=
-headers -iquote . -iquote /builds/dagrh/qemu -iquote /builds/dagrh/qemu/in=
clude -iquote /builds/dagrh/qemu/disas/libvixl -iquote /builds/dagrh/qemu/t=
cg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_F=
ILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-de=
cls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-=
common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits=
 -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-bo=
dy -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallth=
rough=3D2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -f=
stack-protector-strong -fPIE -MD -MQ libio.fa.p/io_channel-socket.c.o -MF l=
ibio.fa.p/io_channel-socket.c.o.d -o libio.fa.p/io_channel-socket.c.o -c ..=
/io/channel-socket.c
> > In file included from /usr/include/linux/errqueue.h:6,
> >                  from ../io/channel-socket.c:29:
> > /usr/include/linux/time_types.h:7:8: error: redefinition of 'struct __k=
ernel_timespec'
> >     7 | struct __kernel_timespec {
> >       |        ^~~~~~~~~~~~~~~~~
> > In file included from /usr/include/liburing.h:19,
> >                  from /builds/dagrh/qemu/include/block/aio.h:18,
> >                  from /builds/dagrh/qemu/include/io/channel.h:26,
> >                  from /builds/dagrh/qemu/include/io/channel-socket.h:24,
> >                  from ../io/channel-socket.c:24:
> > /usr/include/liburing/compat.h:9:8: note: originally defined here
> >     9 | struct __kernel_timespec {
> >       |        ^~~~~~~~~~~~~~~~~
> > ninja: subcommand failed
> > make: *** [Makefile:163: run-ninja] Error 1
>=20
> Yuk. That very much looks like a bug in liburing itself to me.
>=20
>=20
> We've exposed the latent bug by including linux/errqueue.h =20

Yes, I think there was a thread after the 1st pull where Leo identified
the patch that fixed it; but it's not in that image.

Dave

> With regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>=20
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


