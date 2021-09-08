Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728264036C6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 11:18:32 +0200 (CEST)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNtiw-0006W6-DB
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 05:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNtgr-0004ie-Cf
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNtgp-00044m-Kf
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631092579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ABzBonQ8z1xCO7KQgazWPG1Ldoma5G8mpOF9G9aENbc=;
 b=Rqf4MIs84OBygUYC9K1LHoEIPZ5cnFgbTv8C1dakMBIiPNEEc5PHwr36TDX5bn5Q6Qu9cc
 Afu1i7N9lGFEFW5BcJ1rHp+4HTBZYssd359Pp94AXl5m56oqu2FQxP+F/sGPSSRJjJ1lyq
 Btq5B3ZHbt9kCjPbyCI+Q0CZn9aeOp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-gVIaq8ccOf-KRbkbDm9OuQ-1; Wed, 08 Sep 2021 05:16:18 -0400
X-MC-Unique: gVIaq8ccOf-KRbkbDm9OuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CDEA1023F4D;
 Wed,  8 Sep 2021 09:16:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BD127880A;
 Wed,  8 Sep 2021 09:16:02 +0000 (UTC)
Date: Wed, 8 Sep 2021 10:16:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 13/16] vfio-user: dma map/unmap operations
Message-ID: <YTh/UV5A1+cdezDi@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <8960370c1ce02089099702878ed6fb6c3d42ad06.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <8960370c1ce02089099702878ed6fb6c3d42ad06.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hx9Mo9sp+HREuRnT"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--hx9Mo9sp+HREuRnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 09:42:46AM -0700, Elena Ufimtseva wrote:
> +void vfio_user_drain_reqs(VFIOProxy *proxy)
> +{
> +    VFIOUserReply *reply;
> +    bool iolock =3D 0;
> +
> +    /*
> +     * Any DMA map/unmap requests sent in the middle
> +     * of a memory region transaction were sent async.
> +     * Wait for them here.
> +     */
> +    QEMU_LOCK_GUARD(&proxy->lock);
> +    if (proxy->last_nowait !=3D NULL) {
> +        iolock =3D qemu_mutex_iothread_locked();
> +        if (iolock) {
> +            qemu_mutex_unlock_iothread();
> +        }
> +
> +        reply =3D proxy->last_nowait;
> +        reply->nowait =3D 0;
> +        while (reply->complete =3D=3D 0) {
> +            if (!qemu_cond_timedwait(&reply->cv, &proxy->lock, wait_time=
)) {
> +                error_printf("vfio_drain_reqs - timed out\n");
> +                break;
> +            }
> +        }
> +
> +        if (reply->msg->flags & VFIO_USER_ERROR) {
> +            error_printf("vfio_user_rcv error reply on async request ");
> +            error_printf("command %x error %s\n", reply->msg->command,
> +                         strerror(reply->msg->error_reply));
> +        }
> +        proxy->last_nowait =3D NULL;
> +        g_free(reply->msg);
> +        QTAILQ_INSERT_HEAD(&proxy->free, reply, next);
> +    }
> +
> +    if (iolock) {
> +        qemu_mutex_lock_iothread();
> +    }

Not sure this lock ordering is correct. Above we acquire proxy->lock
while holding the BQL and here we acquire the BQL while holding
proxy->lock. If another thread (e.g. a vCPU thread) does something
similar this is the ABBA lock ordering problem.

The more obviously correct way to write this is:

  WITH_QEMU_LOCK_GUARD(&proxy->lock) {
      ...
  }

  if (iolock) {
      qemu_mutex_lock_iothread();
  }

> +}
> +
>  static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
>                                    uint32_t size, uint32_t flags)
>  {
> @@ -715,6 +756,89 @@ int vfio_user_validate_version(VFIODevice *vbasedev,=
 Error **errp)
>      return 0;
>  }
> =20
> +int vfio_user_dma_map(VFIOProxy *proxy, struct vfio_iommu_type1_dma_map =
*map,
> +                      VFIOUserFDs *fds, bool will_commit)
> +{
> +    VFIOUserDMAMap *msgp =3D g_malloc(sizeof(*msgp));

Is this zero-initialized anywhere to guarantee that QEMU memory isn't
exposed to the VFIO device emulation program?

> +    int ret, flags;
> +
> +    /* commit will wait, so send async without dropping BQL */
> +    flags =3D will_commit ? (NOIOLOCK | NOWAIT) : 0;

Why is this distinction between will_commit and !will_commit necessary?
I get a sense that the network communications code drops the BQL and
that's undesirable here for some reason. I wonder why the code doesn't
take the NOWAIT code path all the time?

--hx9Mo9sp+HREuRnT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE4f1AACgkQnKSrs4Gr
c8iOuwf/SCK1yFKBxSEfRCW1CjAXbMTac2EFdgIGJeLG+2JjIimKvjNrw6vFJr5g
N4eVhBgNuJonUUTisKVWA4vSimjGwVouI7zmt7BoUfZO3A2YJmxVqh2YMRRhfJcO
+8kFoMejolrPWzp/ZonSUg4Eoer0EQVHdZhMsnHSURj/jIHCFuRzLTFsSp9aaIUt
SVx9i1DXJRk3KvkdTSn2ab+MiwGQNcWlc2t969me2cED3EIO7X0dNuwbeMR+97jr
VilAknjqMEOIRM6mOfhu3tXLFGvHZ5Zt2uCy+otYUHIG7QyavI1G5+727tF8ASdS
m3icllACJUo+1gP9YuxFPpzxwWOQyQ==
=jH8R
-----END PGP SIGNATURE-----

--hx9Mo9sp+HREuRnT--


