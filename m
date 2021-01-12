Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7BD2F2EF8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:26:07 +0100 (CET)
Received: from localhost ([::1]:41324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIkQ-0007pP-PW
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kzIiG-0006Rb-DW
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:23:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kzIiE-0003Mm-8D
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610454229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZPIEeuLXflQAhbWFJghx0QTOt9eyvbm+uplSRfh9fw=;
 b=VTqkQC0AZhdwzBSUP9GEkpBQ9u/uBnx8LLdKVryQiSrCXf0U7ofqDkEh14U2jjmR4Hi2+T
 OOUVyibjRvmznV20zSoW7xpMf5f05czii4Ch/3yaey++Q/GhrZkkdJmCCVyP2MAwXeco92
 gllV8kvw2lJAlKEGaCdP/A/tEfoMSfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-swGwAWCMMjSRJC2OUctKOQ-1; Tue, 12 Jan 2021 07:23:47 -0500
X-MC-Unique: swGwAWCMMjSRJC2OUctKOQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C6CA8049C1;
 Tue, 12 Jan 2021 12:23:46 +0000 (UTC)
Received: from gondolin (ovpn-114-102.ams2.redhat.com [10.36.114.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7C655D9CD;
 Tue, 12 Jan 2021 12:23:40 +0000 (UTC)
Date: Tue, 12 Jan 2021 13:23:38 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] tests/acceptance: Fix race conditions in s390x tests &
 skip fedora on gitlab-CI
Message-ID: <20210112132338.4122061b.cohuck@redhat.com>
In-Reply-To: <877doinznw.fsf@linaro.org>
References: <20210108185645.86351-1-thuth@redhat.com>
 <20210112115305.1cd5b8c5.cohuck@redhat.com>
 <877doinznw.fsf@linaro.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 11:32:44 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> Cornelia Huck <cohuck@redhat.com> writes:
>=20
> > On Fri,  8 Jan 2021 19:56:45 +0100
> > Thomas Huth <thuth@redhat.com> wrote:
> > =20
> >> There was a race condition in the first test where there was already t=
he
> >> "crw" output in the dmesg, but the "0.0.4711" entry has not been creat=
ed
> >> in the /sys fs yet. Fix it by waiting until it is there.
> >>=20
> >> The second test has even more problems on gitlab-CI. Even after adding=
 some
> >> more synchronization points (that wait for some messages in the "dmesg=
"
> >> output to make sure that the modules got loaded correctly), there are =
still
> >> occasionally some hangs in this test when it is running in the gitlab-=
CI.
> >> So far I was unable to reproduce these hangs locally on my computer, s=
o
> >> this issue might take a while to debug. Thus disable the 2nd test in t=
he
> >> gitlab-CI until the problems are better understood and fixed.
> >>=20
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>  tests/acceptance/machine_s390_ccw_virtio.py | 14 ++++++++++++--
> >>  1 file changed, 12 insertions(+), 2 deletions(-)
> >>=20
> >> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/accep=
tance/machine_s390_ccw_virtio.py
> >> index eccf26b262..4028c99afc 100644
> >> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> >> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> >> @@ -12,6 +12,7 @@
> >>  import os
> >>  import tempfile
> >> =20
> >> +from avocado import skipIf
> >>  from avocado_qemu import Test
> >>  from avocado_qemu import exec_command_and_wait_for_pattern
> >>  from avocado_qemu import wait_for_console_pattern
> >> @@ -133,8 +134,10 @@ class S390CCWVirtioMachine(Test):
> >>          self.vm.command('device_add', driver=3D'virtio-net-ccw',
> >>                          devno=3D'fe.0.4711', id=3D'net_4711')
> >>          self.wait_for_crw_reports()
> >> -        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devi=
ces/',
> >> -                                          '0.0.4711')
> >> +        exec_command_and_wait_for_pattern(self, 'for i in 1 2 3 4 5 6=
 7 ; do '
> >> +                    'if [ -e /sys/bus/ccw/devices/*4711 ]; then break=
; fi ;'
> >> +                    'sleep 1 ; done ; ls /sys/bus/ccw/devices/',
> >> +                    '0.0.4711') =20
> >
> > I'm wondering whether we should introduce a generic helper function for
> > "execute command repeatedly, if the expected result did not yet show
> > up", or "wait for a file/directory to exist". It's probably not
> > uncommon for a desired outcome to arrive asynchronously, and having a
> > function for waiting/retrying could be handy. =20
>=20
> We don't really want to encourage fragile shell scripts in the guest so
> something that makes it easy to encode these loops in python. Currently
> the _console_interaction helper fails the test if failure_message is
> seen so I guess we need a slightly more liberal interaction which
> accepts a command can fail so we can write something like:
>=20
>   while True:
>       if exec_command_and_check(self, "stat -t /sys/bus/ccw/devices/0.0.4=
711",
>                                 "/sys/bus/ccw/devices/0.0.4711"):
>           break
>=20
> ?

Yes, something like that. The caller can decide whether they want to
limit retries.

>=20
> > =20
> >>          # and detach it again
> >>          self.clear_guest_dmesg()
> >>          self.vm.command('device_del', id=3D'net_4711') =20
>=20
>=20


