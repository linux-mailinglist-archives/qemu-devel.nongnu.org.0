Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE682D0ECB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 12:17:10 +0100 (CET)
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmEVw-0000y3-RU
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 06:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmEOo-0007lW-Da
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:09:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmEOj-0000ib-D0
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:09:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607339376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fcLgkNMNPTYsrcDN3K28QNf0n/8kfBQa2p5DhS5SvEw=;
 b=IejZEh7TI9JoAYb2gme97WmQiWRHpCxM0aIBfctYncZplrlVG0lKvq6AxGuEsTY3/IY0ny
 6CkWE4ZQ6UeazUWsAexPnLrCFylNmFbdkVWYLimsgi/XciUbQA/r12T5otyQAM37/AuLI9
 aSoqjZiKYJjF/qtM2+6r9XPRboHo1B8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-R62PFctBOfix0OgcXj-SfQ-1; Mon, 07 Dec 2020 06:09:32 -0500
X-MC-Unique: R62PFctBOfix0OgcXj-SfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77CCA800D53;
 Mon,  7 Dec 2020 11:09:31 +0000 (UTC)
Received: from gondolin (ovpn-113-45.ams2.redhat.com [10.36.113.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9739F10016FA;
 Mon,  7 Dec 2020 11:09:26 +0000 (UTC)
Date: Mon, 7 Dec 2020 12:09:23 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 1/3] tests/acceptance: test virtio-ccw revision handling
Message-ID: <20201207120923.57a487c0.cohuck@redhat.com>
In-Reply-To: <ac7b78a0-4ba5-5eea-4bff-85c04d783ecb@redhat.com>
References: <20201130180216.15366-1-cohuck@redhat.com>
 <20201130180216.15366-2-cohuck@redhat.com>
 <ac7b78a0-4ba5-5eea-4bff-85c04d783ecb@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Dec 2020 10:36:33 -0300
Wainer dos Santos Moschetta <wainersm@redhat.com> wrote:

> Hi,
>=20
> On 11/30/20 3:02 PM, Cornelia Huck wrote:
> > The max_revision prop of virtio-ccw devices can be used to force
> > an older revision for compatibility handling. The easiest way to
> > check this is to force a device to revision 0, which turns off
> > virtio-1.
> >
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >   tests/acceptance/machine_s390_ccw_virtio.py | 18 ++++++++++++++++--
> >   1 file changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/accept=
ance/machine_s390_ccw_virtio.py
> > index db6352c44434..683b6e0dac2e 100644
> > --- a/tests/acceptance/machine_s390_ccw_virtio.py
> > +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> > @@ -51,6 +51,10 @@ class S390CCWVirtioMachine(Test):
> >                            '-initrd', initrd_path,
> >                            '-append', kernel_command_line,
> >                            '-device', 'virtio-net-ccw,devno=3Dfe.1.1111=
',
> > +                         '-device',
> > +                         'virtio-rng-ccw,devno=3Dfe.2.0000,max_revisio=
n=3D0',
> > +                         '-device',
> > +                         'virtio-rng-ccw,devno=3Dfe.3.1234,max_revisio=
n=3D2',
> >                            '-device', 'zpci,uid=3D5,target=3Dzzz',
> >                            '-device', 'virtio-net-pci,id=3Dzzz')
> >           self.vm.launch()
> > @@ -60,9 +64,19 @@ class S390CCWVirtioMachine(Test):
> >           # first debug shell is too early, we need to wait for device =
detection
> >           exec_command_and_wait_for_pattern(self, 'exit', shell_ready)
> >  =20
> > -        ccw_bus_id=3D"0.1.1111"
> > +        ccw_bus_ids=3D"0.1.1111  0.2.0000  0.3.1234"
> >           pci_bus_id=3D"0005:00:00.0"
> >           exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devi=
ces/',
> > -                                          ccw_bus_id)
> > +                                          ccw_bus_ids)
> >           exec_command_and_wait_for_pattern(self, 'ls /sys/bus/pci/devi=
ces/',
> >                                             pci_bus_id)
> > +        # check that the device at 0.2.0000 is in legacy mode, while t=
he
> > +        # device at 0.3.1234 has the virtio-1 feature bit set
> > +        virtio_rng_features=3D"000000000000000000000000000011001000000=
0000000000000000000000000"
> > +        virtio_rng_features_legacy=3D"00000000000000000000000000001100=
00000000000000000000000000000000" =20
>=20
> Do something like...
>=20
> virtio_rng_features=3D"0000000000000000000000000000" + \
>  =C2=A0=C2=A0=C2=A0 "110010000000000000000000000000000000"
>=20
> ... and checkpatch should not complain.

Yes, I can tweak it like that before queuing.

>=20
>=20
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Thanks!

>=20
>=20
> > +        exec_command_and_wait_for_pattern(self,
> > +                                          'cat /sys/bus/ccw/devices/0.=
2.0000/virtio?/features',
> > +                                          virtio_rng_features_legacy)
> > +        exec_command_and_wait_for_pattern(self,
> > +                                          'cat /sys/bus/ccw/devices/0.=
3.1234/virtio?/features',
> > +                                          virtio_rng_features) =20


