Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76BF1468AB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 14:06:26 +0100 (CET)
Received: from localhost ([::1]:56730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iucBl-0000Gm-DR
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 08:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38299)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iub1U-0000LN-CJ
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:51:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iub1T-0000f1-Aw
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:51:44 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56438
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iub1T-0000eP-7B
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytSh5xAa5oU3qXFzV9e7GnwuJ2jTYzVuuh5qeumunFU=;
 b=KYq0aEWS9+Ss+EVgtoYjmObiozrbzn7Uus4F7QX7Pup9eaXbxWyi3L2EtwMl9oAtrHYHFJ
 sXgFNbj2XFm7ULGIP3Qe8qKXK4iCpHFVr2IRF93NFBzpPlI3aiGbSCcFz8u+kXm113f/WK
 LWLNs/a4pDUVNpB5Tdo7XV22Aq64Yr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-BlTcwQY7PK2B6mRH_oWSQA-1; Thu, 23 Jan 2020 06:51:38 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C9AD1088385;
 Thu, 23 Jan 2020 11:51:37 +0000 (UTC)
Received: from gondolin (ovpn-116-120.ams2.redhat.com [10.36.116.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C3BE19C69;
 Thu, 23 Jan 2020 11:51:28 +0000 (UTC)
Date: Thu, 23 Jan 2020 12:51:26 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 6/6] tests/acceptance/virtio_seg_max_adjust: Restrict to
 Linux host
Message-ID: <20200123125126.64be33b6.cohuck@redhat.com>
In-Reply-To: <20200122223247.30419-7-philmd@redhat.com>
References: <20200122223247.30419-1-philmd@redhat.com>
 <20200122223247.30419-7-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: BlTcwQY7PK2B6mRH_oWSQA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Denis Plotnikov <dplotnikov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Jan 2020 23:32:47 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> This test is failing on OSX:
>=20
>   TestFail: machine type pc-i440fx-2.0: <class 'TypeError'>
>=20
> Looking at the job.log:
>=20
>   Unexpected error in object_property_find() at qom/object.c:1201:
>   qemu-system-x86_64: -device virtio-blk-pci,id=3Dscsi0,drive=3Ddrive0: c=
an't apply global virtio-blk-device.scsi=3Dtrue: Property '.scsi' not found
>=20
> Which makes sense looking at hw/block/virtio-blk.c:
>=20
>   1261 static Property virtio_blk_properties[] =3D {
>   1262     DEFINE_BLOCK_PROPERTIES(VirtIOBlock, conf.conf),
>   ...
>   1268 #ifdef __linux__
>   1269     DEFINE_PROP_BIT64("scsi", VirtIOBlock, host_features,
>   1270                       VIRTIO_BLK_F_SCSI, false),
>   1271 #endif
>=20
> Fix by only running this test on a Linux host:
>=20
>  (38/55) tests/acceptance/virtio_seg_max_adjust.py:VirtioMaxSegSettingsCh=
eck.test_machine_types:  SKIP: Host OS is not Linux

Does this work with the change I proposed in the other thread? If it
does, I'd prefer to send a proper fix for that. (Well, I'd prefer to
fix it regardless.)

Or is there other Linux-specific stuff in there? Does not look like it
at a glance, we were just bitten by the unrelated scsi property thing.

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/acceptance/virtio_seg_max_adjust.py | 3 +++
>  1 file changed, 3 insertions(+)


