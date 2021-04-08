Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B99D3589D0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:33:32 +0200 (CEST)
Received: from localhost ([::1]:54570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXb0-0008WA-Rm
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lUXWw-0006Eu-Bs
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:29:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lUXPC-0002N1-NQ
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617898878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zjC2Ir6JBT9ZD9+m9XlKhudtvf2gFRLCYPNX2mVVpNU=;
 b=UAc4T+yftpsJjdhCy7gR4mNinttIEIVIYm4XLk7GkDA+/i6/N49sxZ4+cUZm2qE4/eEhVq
 HLA2BHnbCpzsw8zYVwdb+AbbMmVmcRmSngKIedPjw7ImaeGLrjF/tEVqG/7Jlk6iLRedwv
 8h1cv+/s8DAOjlbGPt4eS4Z4Wf3GAzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-7p4JmxiqOXSB75-ix6H6gQ-1; Thu, 08 Apr 2021 12:21:01 -0400
X-MC-Unique: 7p4JmxiqOXSB75-ix6H6gQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26B631883525;
 Thu,  8 Apr 2021 16:21:00 +0000 (UTC)
Received: from localhost (ovpn-114-187.ams2.redhat.com [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A60919C78;
 Thu,  8 Apr 2021 16:20:47 +0000 (UTC)
Date: Thu, 8 Apr 2021 17:20:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Ge, Xiongzi" <Xiongzi.Ge@netapp.com>
Subject: Re: [Virtio-fs] Live migration support for virtio-fs
Message-ID: <YG8tXxdyakzkyI0h@stefanha-x1.localdomain>
References: <714BD741-AE3F-4BC5-8DFB-F5C74A8623B1@netapp.com>
 <YFnC9QXo6uP+2zC1@work-vm> <20210323145312.GB483930@redhat.com>
 <YFoCpIh5PCSP6gXB@work-vm>
 <40D27E5F-C65A-4441-BA23-ABA6880DAA71@netapp.com>
MIME-Version: 1.0
In-Reply-To: <40D27E5F-C65A-4441-BA23-ABA6880DAA71@netapp.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YNYjzn8sg3lyMsUB"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YNYjzn8sg3lyMsUB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 07, 2021 at 06:05:29PM +0000, Ge, Xiongzi wrote:
> Thanks Dr Gilbert, Vivek, Stefan, Greg!
> I put together the discussion into this thread and CC qemu-devel@nongnu.o=
rg.=20
>=20
> Problem:
> Current Virtio-FS does not support live migration.  Even when the virtiof=
s directory is not mounted on the guest, VM cannot do live migration. Any s=
uggestions/interest If we want to make this work so we can still have the l=
ive migration feature for other purpose on that VM?=20
>=20
> If we already have a shared file system like Ceph, does this make it diff=
erent?=20

(Marc-Andr=E9: I CCed you regarding D-Bus VMState, see below.)

During the last virtio-fs call on Wednesday we discussed how to allow
live migration when the file system is not mounted. This means live
migration of a mounted file system still wouldn't be supported, but at
least it would be possible to migrate when the file system is not
mounted.

The easiest way to do that is to hot unplug the vhost-user-fs-pci device
so that QEMU can live migrate the VM and then hot plug the
vhost-user-fs-pci device again after migration has completed. This
requires either manually performing the hot plug operations or some
automation to do this around live migration.

A smoother approach would be for QEMU to allow live migration when the
file system is not mounted. Unfortunately it turns out this is actually
rather involved because virtiofsd runs as a separate process from QEMU
and the live migration interface for vhost-user devices is currently
pretty basic
(https://qemu.readthedocs.io/en/latest/interop/dbus-vmstate.html). There
is currently no way for virtiofsd to communicate with QEMU to allow/deny
live migration depending on whether virtiofsd currently has an active
FUSE session (mount). It might be possible to extend the D-Bus VMState
interface and implement support for "migration blockers" as they are
known in QEMU, but I wonder whether it's not better to just work on
full virtio-fs live migration instead. Either task is complex and I
wouldn't recommend it as a first contribution to virtiofsd or QEMU.

Can you make use of the hotplug approach to live migration?

Stefan

--YNYjzn8sg3lyMsUB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBvLV4ACgkQnKSrs4Gr
c8gDdAf+JdmGLPwy1p7SMorFUuvvSotUbcfdHDfwdcda8xdo5BTk33cUdVs21JA9
NhtY88Z4WALFx8Cp7QxlaiXLef6BJ1DVsfX4T2m04Jt5tERqVMf0G9rBQp7ILfRl
akAauid1pHNfk4JTx+V3++dNt/3tXOjnd0Vf7HKcH9LUI0T0IHf0SkpFpaVQNh9/
YX7UV/wG0nZNr0hH05e4XegkhIWfUwQZnGwuSjWJ0hjsFu+bcP8F/7xsZYQKgLqu
4cXpOn7EMB5ERr8wLPtvMjGYsAYpyIrhoV6+GW4XK4ALswxtEA9ObEAMht6DDmq5
37F7xpdCKDH+AZniLKlr8wF9kNdipg==
=52sP
-----END PGP SIGNATURE-----

--YNYjzn8sg3lyMsUB--


