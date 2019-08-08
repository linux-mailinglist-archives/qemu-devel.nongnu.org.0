Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6427C86066
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 12:54:05 +0200 (CEST)
Received: from localhost ([::1]:48344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvg3Y-0006HS-KT
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 06:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38513)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hvg2v-0005rc-Lh
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 06:53:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hvg2u-0006rK-Kj
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 06:53:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45814)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hvg2u-0006qs-F3
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 06:53:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AF0B53006BB6;
 Thu,  8 Aug 2019 10:53:23 +0000 (UTC)
Received: from redhat.com (ovpn-112-28.ams2.redhat.com [10.36.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6B1A608A5;
 Thu,  8 Aug 2019 10:53:10 +0000 (UTC)
Date: Thu, 8 Aug 2019 11:53:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20190808105307.GE2534@redhat.com>
References: <20190807071445.4109-1-bala24@linux.ibm.com>
 <20190807071445.4109-2-bala24@linux.ibm.com>
 <5839fa4e-b6f3-9547-e71d-50be75c4f9fc@redhat.com>
 <20190808101013.GD1999@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190808101013.GD1999@stefanha-x1.localdomain>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 08 Aug 2019 10:53:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH 1/6] utils/python_api: add scripting
 interface for Qemu with python lib
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, maddy@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, Balamuruhan S <bala24@linux.ibm.com>,
 anju@linux.vnet.ibm.com, clg@kaod.org, Stefan Hajnoczi <stefanha@redhat.com>,
 hari@linux.vnet.ibm.com, pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 08, 2019 at 11:10:13AM +0100, Stefan Hajnoczi wrote:
> On Wed, Aug 07, 2019 at 12:20:47PM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
> > > +void python_args_clean(char *args[], int nargs)
> > > +{
> > > +    for (int i =3D 0; i < nargs; i++) {
> > > +        g_free(args[i]);
> > > +    }
> > > +}
> > >=20
> >=20
> > Wondering about security, is this feature safe to enable in productio=
n
> > environment? It seems to bypass all the hard effort to harden QEMU se=
curity.
>=20
> This seems like a feature that distros would not enable.  Only users
> building QEMU from source could enable it.

Well that's true when this scripting is only used from one obscure ppc
device. Once merged though, its inevitable that people will want to
extend scripting to more & more parts of QEMU code. This is a big can
of worms...

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

