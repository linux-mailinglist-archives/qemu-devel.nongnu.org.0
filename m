Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC252C532A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:43:01 +0100 (CET)
Received: from localhost ([::1]:55836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFfw-0007FV-VM
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kiFW8-0005ox-Ph
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:32:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kiFW2-0007Fv-N9
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606390364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bg1LufzOpwMVY02O7KAdX54APwtRdWu1wVyOHITsV1I=;
 b=Cfl4pFMVCQTP35SEhKd871I7uyojwjjyZifQL6MC0KeZ5UFMLBSHLpqvz8XKMZP8IzOqWN
 HiJM+Zkd9a/v8HoOemlSFtnjQtIp/BX7cd9XbRWhvC73p0GrAo6jcNt4TLNB/dxTJyMuKg
 0m0GxRxMHPCaPoylstRBmdJQ5J1CU/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-uIvTiNyZPLq1554-sfJ_Yg-1; Thu, 26 Nov 2020 06:32:42 -0500
X-MC-Unique: uIvTiNyZPLq1554-sfJ_Yg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3296A1006C94;
 Thu, 26 Nov 2020 11:32:41 +0000 (UTC)
Received: from gondolin (ovpn-113-125.ams2.redhat.com [10.36.113.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BFC110016F7;
 Thu, 26 Nov 2020 11:32:36 +0000 (UTC)
Date: Thu, 26 Nov 2020 12:32:33 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH RFC] tests/acceptance: add a test for devices on s390x
Message-ID: <20201126123233.6dec3039.cohuck@redhat.com>
In-Reply-To: <79a12074-e63d-6362-5359-612069d10d26@redhat.com>
References: <20201125135820.1442611-1-cohuck@redhat.com>
 <148a7ef1-aae2-89ae-88f7-3c70c9f02999@redhat.com>
 <79a12074-e63d-6362-5359-612069d10d26@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Nov 2020 17:04:05 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Hi Cornelia,
>=20
> On 11/25/20 4:03 PM, Thomas Huth wrote:
> > On 25/11/2020 14.58, Cornelia Huck wrote: =20
> >> This adds a very basic test for checking that we present devices
> >> in a way that Linux can consume: boot with both virtio-net-ccw and
> >> virtio-net-pci attached and then verify that Linux is able to see
> >> and detect these devices. =20
> >=20
> > Thanks for tackling it!
> >  =20
> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >> ---
> >>
> >> A very basic test, but it would have caught the recent zPCI regression=
. =20
>=20
> Thanks for adding this test :)
>=20
> >>
> >> If anyone has a better idea than using early debug shells in the Debia=
n
> >> install image, please let me know. At least it's quick, as we can chec=
k
> >> for the devices quite early in the boot sequence. =20
>=20
> This is the simplest cheaper way I think.
>=20
> Alternative is to use Guenter's images:
> https://github.com/groeck/linux-build-test/tree/master/rootfs/s390

I tried to use these, but it seems I would need a kernel with the
relevant drivers built-in for that, and neither Fedora nor Debian seem
to do that. Maybe I'm holding it wrong, but I think I'll just stick to
my current approach, as I have that one working :)

>=20
> >>
> >> Not sure if running under both kvm and tcg on an s390 host would add
> >> useful extra coverage. Also not sure if this needs fencing on any of t=
he
> >> public CIs (have not tried yet). =20
> >=20
> > We're only running the acceptance tests in the gitlab-CI, no worries ab=
out
> > the others.
> >  =20
> >> ---
> >>  tests/acceptance/s390_devices.py | 68 +++++++++++++++++++++++++++++++=
+
> >>  1 file changed, 68 insertions(+)
> >>  create mode 100644 tests/acceptance/s390_devices.py
> >>
> >> diff --git a/tests/acceptance/s390_devices.py b/tests/acceptance/s390_=
devices.py
> >> new file mode 100644
> >> index 000000000000..6ce47061f35d
> >> --- /dev/null
> >> +++ b/tests/acceptance/s390_devices.py =20
> >=20
> > s390x_devices.py ?
> >=20
> > Or maybe even machine_s390x.py instead, like the other machine*.py file=
s? =20
>=20
> Feel free to use whatever name/directory structure that help others to
> find your tests (don't forget to add an entry to MAINTAINERS).

Good point, I forgot about an explicit MAINTAINERS entry.

>=20
> Regards,
>=20
> Phil.
>=20


