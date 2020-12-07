Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124DD2D0EDB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 12:20:24 +0100 (CET)
Received: from localhost ([::1]:47256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmEZ4-0001dc-Ph
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 06:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmEQC-0008M1-Jl
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:11:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmEQ8-000191-LH
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607339450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cTd8KuXuAQQPCmff2c2RM3azzOycqpF5AdnjrlWWztY=;
 b=gTT4GG9NZXOKFQA/Ae7kN0cfs5Q/PkUo+nb2jlr0vyzdv9BmiqN2RxznGCww5qcSrn0jcW
 UvSo6fzWUUBHwLvxk6PJeRi/HL2kwB7vRTIMB9OF1vG2TeLu+V1xb5x1c/QUNGDReQFcbT
 kdcfwS0uQhvklz/r0EGE+venVHJ3qNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-5aPtDpc9PaW2CNz-F6vpog-1; Mon, 07 Dec 2020 06:10:49 -0500
X-MC-Unique: 5aPtDpc9PaW2CNz-F6vpog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E61C71005513;
 Mon,  7 Dec 2020 11:10:47 +0000 (UTC)
Received: from gondolin (ovpn-113-45.ams2.redhat.com [10.36.113.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EB885C1A1;
 Mon,  7 Dec 2020 11:10:42 +0000 (UTC)
Date: Mon, 7 Dec 2020 12:10:40 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 2/3] tests/acceptance: verify s390x device detection
Message-ID: <20201207121040.07fc5ee2.cohuck@redhat.com>
In-Reply-To: <0fdfd10a-36a2-2fcf-449c-adf5ccd761c4@redhat.com>
References: <20201130180216.15366-1-cohuck@redhat.com>
 <20201130180216.15366-3-cohuck@redhat.com>
 <0fdfd10a-36a2-2fcf-449c-adf5ccd761c4@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Fri, 4 Dec 2020 10:47:34 -0300
Wainer dos Santos Moschetta <wainersm@redhat.com> wrote:

> On 11/30/20 3:02 PM, Cornelia Huck wrote:
> > The kernel/initrd combination does not provide the virtio-net
> > driver; therefore, simply check whether the presented device type
> > is indeed virtio-net for the two virtio-net-{ccw,pci} devices.
> >
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >   tests/acceptance/machine_s390_ccw_virtio.py | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/accept=
ance/machine_s390_ccw_virtio.py
> > index 683b6e0dac2e..e203ee304264 100644
> > --- a/tests/acceptance/machine_s390_ccw_virtio.py
> > +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> > @@ -80,3 +80,14 @@ class S390CCWVirtioMachine(Test):
> >           exec_command_and_wait_for_pattern(self,
> >                                             'cat /sys/bus/ccw/devices/0=
.3.1234/virtio?/features',
> >                                             virtio_rng_features)
> > +        # verify that we indeed have virtio-net devices (without havin=
g the
> > +        # virtio-net driver handy)
> > +        exec_command_and_wait_for_pattern(self,
> > +                                          'cat /sys/bus/ccw/devices/0.=
1.1111/cutype',
> > +                                          '3832/01')
> > +        exec_command_and_wait_for_pattern(self,
> > +                                          'cat /sys/bus/pci/devices/00=
05\:00\:00.0/subsystem_vendor',
> > +                                          '0x1af4')
> > +        exec_command_and_wait_for_pattern(self,
> > +                                          'cat /sys/bus/pci/devices/00=
05\:00\:00.0/subsystem_device',
> > +                                          '0x0001') =20
>=20
> Here I think it's ok to do...
>=20
> exec_command_and_wait_for_pattern(self,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'cat /sys/bus/ccw/devices/0.1=
.1111/cutype',
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '3832/01')
>=20
> ... so checkpatch is happy, everybody is happy.
>=20
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Ok, I'll try to raise the general happiness level, then :) Thanks!


