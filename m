Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CC44B540F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:01:43 +0100 (CET)
Received: from localhost ([::1]:47422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcrG-0006Ff-Qi
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:01:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJcQ7-0003RA-1G
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:33:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJcQ1-0000GQ-GS
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644849211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fvelzeTAhlm0m1l9rIhG5MR6CGvm+V44/cqNJbKaaSI=;
 b=OiE0YbYX4qICkR7ODWXFLo8HaXt7v5JS9qS4GASgdtfqIXjB79eAPCQrgWlUfPU45wsoxL
 kl/20blnrpPhhkIcyWVM9GZ79pA8lPFhWSEq5w1K61bSu5Aj5bfjQfH5aA5sSTdiETnm9M
 FFFp38evYMAfKoNiRLdVl9vunrkQ9sM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-qTWnyKIpOSS3rnwz8jpc0Q-1; Mon, 14 Feb 2022 09:33:29 -0500
X-MC-Unique: qTWnyKIpOSS3rnwz8jpc0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 633062F45;
 Mon, 14 Feb 2022 14:33:28 +0000 (UTC)
Received: from localhost (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4ACD9101E59D;
 Mon, 14 Feb 2022 14:32:23 +0000 (UTC)
Date: Mon, 14 Feb 2022 14:32:21 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [RFC 3/8] ioregionfd: introduce memory API functions
Message-ID: <Ygpn9ckg7qiupEwn@stefanha-x1.localdomain>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
 <f0ca2f5797d938425d34517d7c0d9d97fdc0f52f.1644302411.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J2r1clOaD9CzhuPS"
Content-Disposition: inline
In-Reply-To: <f0ca2f5797d938425d34517d7c0d9d97fdc0f52f.1644302411.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com, armbru@redhat.com,
 mst@redhat.com, berrange@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--J2r1clOaD9CzhuPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 07, 2022 at 11:22:17PM -0800, Elena Ufimtseva wrote:
> @@ -2434,6 +2569,42 @@ void memory_region_clear_flush_coalesced(MemoryReg=
ion *mr)
> =20
>  static bool userspace_eventfd_warning;
> =20
> +void memory_region_add_ioregionfd(MemoryRegion *mr,
> +                                  hwaddr addr,
> +                                  unsigned size,
> +                                  uint64_t data,

uint64_t data is vague and can be confused with ioeventfd's match data
field. QEMU tends to use void *opaque, but following the ioregionfd
kernel API's naming would be fine too: uint64_t user_data.

> +                                  int fd,
> +                                  bool pio)
> +{
> +    MemoryRegionIoregionfd mriofd =3D {
> +        .addr.start =3D int128_make64(addr),
> +        .addr.size =3D int128_make64(size),
> +        .data =3D data,
> +        .fd =3D fd,
> +    };
> +    unsigned i;
> +
> +    if (kvm_enabled() && !kvm_ioregionfds_enabled()) {
> +        error_report("KVM does not support KVM_CAP_IOREGIONFD");
> +    }

Is this a fatal error?

QEMU should have a userspace ioregionfd implementation for
compatibility. That allows ioregionfd to be tested without running in
KVM mode. (This is how ioeventfd support works in QEMU.)

--J2r1clOaD9CzhuPS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIKZ/UACgkQnKSrs4Gr
c8gc7wgApVwJiBRXrTkMA4JSqvkeViib+6q75WJXEUA3mysxmWe8jGMVeuF9SDdD
dpBn/ho1W8RiQELOrpDmWMzshKM3I3OCvFiMoK96pZIdQ5JfXtSfMF/duD8WBA5Y
FisFdZE2ixVouSxhDkCUvZM81lj71qT7sISayKHTW+cEZ7kqBAmhsC5aHSP2IVDl
eB2PpFXY7iwSIu/EhxLeMA0vw/hSt876+7139Idbjo/NxQ9sOakBtFqVooUcJDwp
nzZ8/bE1JjLt1RxOMxvfWluJMjvnAyo4x6GitU+xNt9/3ncC3cNzsOkzP7+yJ+0c
uf//t7S5q15O7hVGAxWrsswoI4KVPA==
=n4Ci
-----END PGP SIGNATURE-----

--J2r1clOaD9CzhuPS--


