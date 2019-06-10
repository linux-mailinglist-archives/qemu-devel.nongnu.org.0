Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F47F3BB01
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 19:33:00 +0200 (CEST)
Received: from localhost ([::1]:48574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haOAF-00086g-08
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 13:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55519)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1haO7x-0007Ko-Bs
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 13:30:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1haO7w-0003SD-3z
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 13:30:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41840)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1haO7v-00038L-Ta
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 13:30:36 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 24AF53082E0F;
 Mon, 10 Jun 2019 17:30:07 +0000 (UTC)
Received: from redhat.com (ovpn-112-50.ams2.redhat.com [10.36.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94A4A600CD;
 Mon, 10 Jun 2019 17:30:03 +0000 (UTC)
Date: Mon, 10 Jun 2019 18:30:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190610173000.GL7809@redhat.com>
References: <20190607211544.7964-1-ehabkost@redhat.com>
 <CAFEAcA-wCqppsi+gcrTqGjR3bSDOHs5btKKE8oHYxbAUDtu7Fw@mail.gmail.com>
 <20190610131105.GJ22416@habkost.net>
 <CAFEAcA_fBBN_854PznqJUniks0uemEite8Hxcw6cwTbUSr+aVg@mail.gmail.com>
 <20190610171213.GK7809@redhat.com>
 <CAFEAcA8L7dFfwi84_wLwEV1xYyyAbf31WxiqCf_z_m8p0SAhhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA8L7dFfwi84_wLwEV1xYyyAbf31WxiqCf_z_m8p0SAhhg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 10 Jun 2019 17:30:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 0/8] Python queue, 2019-06-07
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 10, 2019 at 06:15:46PM +0100, Peter Maydell wrote:
> On Mon, 10 Jun 2019 at 18:12, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> > There's been two new LTS releases of Ubuntu since then
> > with Xenial and Bionic, so IMHO, it is pretty reasonable
> > to want to drop Trusty rather than continuing to spend time
> > on software versions from 2014 and before. Both our Travis
> > and Docker setups use Xenial as minimum and the number of
> > our developers stuck using Trusty is likely negligible.
> >
> > What gap is your gcc compile farm filling & can we find an
> > alternate way to address that gap that's viable ?
>=20
> In this case, it's the aarch64 host. I can probably
> find something else to run this on, but it's not going
> to happen immediately.

Do you have access to any machine in the compile farm or is access
granted on a per-machine basis ?   If i'm reading this page right:

  https://cfarm.tetaneutral.net/machines/list/

there is now one aarch64 machine (gcc117) that is running
Debian 9 / Stretch and another (gcc118) with OpenSUSE Leap 15.
In terms of OS version at least, either of those could be viable
for QEMU, if it is possible for you to access them.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

