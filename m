Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4427458A114
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 21:08:43 +0200 (CEST)
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJgD3-0000gh-PF
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 15:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oJg1s-0004HB-UR
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oJg1q-0007Fi-8q
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659639425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oMwE49k6wAEt2QTWRx2yBXc/bHja+0uTUo3+UyjnlKs=;
 b=Ol+9X3C1flupyubefxj/Hh8kJ7Z87YfUhJ/e3xg0IDKIQIimvxfNH004hIL8C3Yx6AS7F9
 IKQAf2fyy3mFBN5PecSBvA+EPo3ihEyPPsJgDBRFbYTm/kBZfJCMKf/0oeDVsokYreDP4y
 HVeCANqvBwHgZG1Tx8y5bsFzvxe3CGg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-5xgLgTRyOSafDTfXNHHiCQ-1; Thu, 04 Aug 2022 14:57:02 -0400
X-MC-Unique: 5xgLgTRyOSafDTfXNHHiCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59A0B3C0E21E;
 Thu,  4 Aug 2022 18:57:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B51571121314;
 Thu,  4 Aug 2022 18:57:00 +0000 (UTC)
Date: Thu, 4 Aug 2022 14:56:59 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 pbonzini@redhat.com
Cc: sgarzare@redhat.com, kwolf@redhat.com,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Fam Zheng <fam@euphon.net>, Qing Wang <qinwang@redhat.com>
Subject: Re: [PATCH 7.1] virtio-scsi: fix race in virtio_scsi_dataplane_start()
Message-ID: <YuwWe9Yh9uijB+xG@fedora>
References: <20220803162824.948023-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fxODSeY07Sy3WE1f"
Content-Disposition: inline
In-Reply-To: <20220803162824.948023-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--fxODSeY07Sy3WE1f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 03, 2022 at 12:28:24PM -0400, Stefan Hajnoczi wrote:
> As soon as virtio_scsi_data_plane_start() attaches host notifiers the
> IOThread may start virtqueue processing. There is a race between
> IOThread virtqueue processing and virtio_scsi_data_plane_start() because
> it only assigns s->dataplane_started after attaching host notifiers.
>=20
> When a virtqueue handler function in the IOThread calls
> virtio_scsi_defer_to_dataplane() it may see !s->dataplane_started and
> attempt to start dataplane even though we're already in the IOThread:
>=20
>   #0  0x00007f67b360857c __pthread_kill_implementation (libc.so.6 + 0xa25=
7c)
>   #1  0x00007f67b35bbd56 raise (libc.so.6 + 0x55d56)
>   #2  0x00007f67b358e833 abort (libc.so.6 + 0x28833)
>   #3  0x00007f67b358e75b __assert_fail_base.cold (libc.so.6 + 0x2875b)
>   #4  0x00007f67b35b4cd6 __assert_fail (libc.so.6 + 0x4ecd6)
>   #5  0x000055ca87fd411b memory_region_transaction_commit (qemu-kvm + 0x6=
7511b)
>   #6  0x000055ca87e17811 virtio_pci_ioeventfd_assign (qemu-kvm + 0x4b8811)
>   #7  0x000055ca87e14836 virtio_bus_set_host_notifier (qemu-kvm + 0x4b583=
6)
>   #8  0x000055ca87f8e14e virtio_scsi_set_host_notifier (qemu-kvm + 0x62f1=
4e)
>   #9  0x000055ca87f8dd62 virtio_scsi_dataplane_start (qemu-kvm + 0x62ed62)
>   #10 0x000055ca87e14610 virtio_bus_start_ioeventfd (qemu-kvm + 0x4b5610)
>   #11 0x000055ca87f8c29a virtio_scsi_handle_ctrl (qemu-kvm + 0x62d29a)
>   #12 0x000055ca87fa5902 virtio_queue_host_notifier_read (qemu-kvm + 0x64=
6902)
>   #13 0x000055ca882c099e aio_dispatch_handler (qemu-kvm + 0x96199e)
>   #14 0x000055ca882c1761 aio_poll (qemu-kvm + 0x962761)
>   #15 0x000055ca880e1052 iothread_run (qemu-kvm + 0x782052)
>   #16 0x000055ca882c562a qemu_thread_start (qemu-kvm + 0x96662a)
>=20
> This patch assigns s->dataplane_started before attaching host notifiers
> so that virtqueue handler functions that run in the IOThread before
> virtio_scsi_data_plane_start() returns correctly identify that dataplane
> does not need to be started.
>=20
> Note that s->dataplane_started does not need the AioContext lock because
> it is set before attaching host notifiers and cleared after detaching
> host notifiers. In other words, the IOThread always sees the value true
> and the main loop thread does not modify it while the IOThread is
> active.
>=20
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2099541
> Reported-by: Qing Wang <qinwang@redhat.com>

Qing Wang has confirmed that this solves the assertion failures.

Paolo/Michael: Can this still be merged for QEMU 7.1?

Stefan

--fxODSeY07Sy3WE1f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLsFnsACgkQnKSrs4Gr
c8iyoQf8D+UIJ2LA37Cz7RmIuOr+b+1VNX0sypZL+N60UauVMwk5o94cDQa3ER7j
/1QmqYKVU4Q+RSNU8jh917P2bOBKaMNS7dqb0ZQz1pz5CxaJSZOb1EUkEeECjmmr
R3h6euJn05ncM3tHP516Ubda9q958+BlX9CYkO20D/jWb/eYWbFFBRRNhaZxPV79
gbJaPRUl92D5wV18X5Qm6Z2dY9RsXyWuMaI7qbriTJjbcFT7AJrExDWwDbTUGqPQ
c3ThopSbO78U5FB+FXIbf+/4VjFwoS6tajAyfwMyUcYDB6ORu835dGniYT4H7CA/
UJfGrUE69UXYs4lkfDhrAnnY9SOUag==
=6G2m
-----END PGP SIGNATURE-----

--fxODSeY07Sy3WE1f--


