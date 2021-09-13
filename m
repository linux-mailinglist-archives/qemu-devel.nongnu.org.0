Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14917409121
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:58:22 +0200 (CEST)
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmTV-0002sv-2R
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPmAW-0005T3-1i
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:38:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPmAT-0001NZ-8E
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631540319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s9iZ5QaS+VVXjTpuNxVzicCoD3V0HYNMRj4PW2nAIdU=;
 b=Y3b+KhOn0xHdXtK/7HGwg0EuzBF8OrBLzpfTXxCZ/HnySr+5BGMzjXczJQwJ0VskzDjzbR
 Ha6Sd85WOjWoZdsS3Aa+VJBIe2sH6I5t/KyuBTyHEaUmG4LEtCyk2UNPCjavVWjPthw7kv
 gJJw32FnfZ3C442HzjRMKfg0VrvApv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-lLlzJ9TKOpqstVmMVPWasQ-1; Mon, 13 Sep 2021 09:38:37 -0400
X-MC-Unique: lLlzJ9TKOpqstVmMVPWasQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 010DD802CB8;
 Mon, 13 Sep 2021 13:38:05 +0000 (UTC)
Received: from localhost (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BECB104B4C5;
 Mon, 13 Sep 2021 13:38:04 +0000 (UTC)
Date: Mon, 13 Sep 2021 14:38:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 4/4] block/block-backend.c: assertions for
 block-backend
Message-ID: <YT9UO4Rd7NnM/wO6@stefanha-x1.localdomain>
References: <20210908131021.774533-1-eesposit@redhat.com>
 <20210908131021.774533-5-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908131021.774533-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fU7GULQoz46x9UKQ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--fU7GULQoz46x9UKQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 08, 2021 at 09:10:21AM -0400, Emanuele Giuseppe Esposito wrote:
> @@ -1767,12 +1817,14 @@ void blk_drain_all(void)
>  void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
>                        BlockdevOnError on_write_error)
>  {
> +    g_assert(qemu_in_main_thread());
>      blk->on_read_error =3D on_read_error;
>      blk->on_write_error =3D on_write_error;
>  }
> =20
>  BlockdevOnError blk_get_on_error(BlockBackend *blk, bool is_read)
>  {
> +    g_assert(qemu_in_main_thread());
>      return is_read ? blk->on_read_error : blk->on_write_error;
>  }
> =20
> @@ -1780,6 +1832,7 @@ BlockErrorAction blk_get_error_action(BlockBackend =
*blk, bool is_read,
>                                        int error)
>  {
>      BlockdevOnError on_err =3D blk_get_on_error(blk, is_read);
> +    g_assert(qemu_in_main_thread());
> =20
>      switch (on_err) {
>      case BLOCKDEV_ON_ERROR_ENOSPC:
> @@ -1819,6 +1872,7 @@ void blk_error_action(BlockBackend *blk, BlockError=
Action action,
>                        bool is_read, int error)
>  {
>      assert(error >=3D 0);
> +    g_assert(qemu_in_main_thread());
> =20
>      if (action =3D=3D BLOCK_ERROR_ACTION_STOP) {
>          /* First set the iostatus, so that "info block" returns an iosta=
tus

The error action APIs are called from the I/O code path. For example,
hw/block/virtio-blk.c:virtio_blk_handle_rw_error() is called from an
IOThread with -device virtio-blk-pci,iothread=3D... with the AioContext
held.

> @@ -1983,11 +2045,13 @@ uint32_t blk_get_max_transfer(BlockBackend *blk)
> =20
>  int blk_get_max_iov(BlockBackend *blk)
>  {
> +    g_assert(qemu_in_main_thread());
>      return blk->root->bs->bl.max_iov;
>  }

This is called by hw/block/virtio-blk.c:virtio_blk_submit_multireq()
from an IOThread with the AioContext held.

--fU7GULQoz46x9UKQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE/VDsACgkQnKSrs4Gr
c8gRGQf/WBmFd3bruKgrvXzjqT7hqUXttjeyDNwiaVrkD9fCGBFnRp37DdajM8xA
XtpZj6W2X9nSubD8vRZ4Id2ziEech+klgsgo762b31ZL6zIE/W8Nl+/dxyTVQ0eY
JE3WHpcFn110x07nvJTwibMXD0o+h7piEaADdoGLKpahjRQ9KpOopII9wo1PtU0k
rqWV5DM2rtt2BpnmMFpdbh0Ad4iGyezT0tt3Um4t+Xa02aSERSft5P/kz7lOMxAa
giB8cxD4xkUmsQvFZE7/pzRYulyh/CEtvSnE9DICjeUNitSDWKpuqvEkhbSC5AXn
mxqvfHHkkL6sIv8UX2y38zlml7GaEA==
=MZbT
-----END PGP SIGNATURE-----

--fU7GULQoz46x9UKQ--


