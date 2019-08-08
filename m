Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE4685E23
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 11:22:53 +0200 (CEST)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvedI-0007Wl-8B
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 05:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48865)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hveco-00076I-Uc
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 05:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hvecn-0007Iq-Rf
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 05:22:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54388)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hvecn-0007IZ-MN
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 05:22:21 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C941CC04D293;
 Thu,  8 Aug 2019 09:22:20 +0000 (UTC)
Received: from redhat.com (ovpn-112-28.ams2.redhat.com [10.36.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 905A819C7F;
 Thu,  8 Aug 2019 09:22:16 +0000 (UTC)
Date: Thu, 8 Aug 2019 10:22:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190808092213.GB2534@redhat.com>
References: <20190808020723.GB26938@richard> <20190808080229.GA2534@redhat.com>
 <20190808084653.GB32524@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190808084653.GB32524@richard>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 08 Aug 2019 09:22:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Fail] tests/test-util-filemonitor fails
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 08, 2019 at 04:46:53PM +0800, Wei Yang wrote:
> On Thu, Aug 08, 2019 at 09:02:29AM +0100, Daniel P. Berrang=C3=A9 wrote=
:
> >On Thu, Aug 08, 2019 at 10:07:23AM +0800, Wei Yang wrote:
> >> Current qemu fails tests/test-util-filemonitor.
> >
> >You'll need to provide more info. The test works for me and passes in =
all
> >the QEMU CI environments.
> >
>=20
> The error message from my side is:
>=20
> /util/filemonitor: Expected watch id 200000000 but got 100000000
> **
> ERROR:tests/test-util-filemonitor.c:665:test_file_monitor_events: asser=
tion failed: (err =3D=3D 0)
>=20
> What else you'd prefer to have?

Can you set the  "FILEMONITOR_DEBUG=3D1" env variable before running
the test - it will print out lots more info

Also what operating system are you using, and what kernel version

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

