Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA7F31D9EB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 14:03:32 +0100 (CET)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMUN-0006r3-J6
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 08:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCMSg-0005wZ-59
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:01:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCMSd-0004N4-Kk
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613566902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XIThSsbUjDdWjx/9SU7T/XKx8itj2Smth98HnG4qOis=;
 b=Ab9OZCNqjrROd6ghdKEANsX0hLiTB9++QzvA3DcIc6MYB7uCM6E/8cNxQTnE7aI/S5rmZm
 hthXm7OvOaifblWd0D0QWZDutGAEZT4mmEqNelADez/k5yyDgXjGwOTnAneiDUKmc2lxqn
 2T87Eyynv1omDYJSyL7o4pCyL9kIY1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-eMe8E2DTOMCdqLF5J46xQg-1; Wed, 17 Feb 2021 08:01:38 -0500
X-MC-Unique: eMe8E2DTOMCdqLF5J46xQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C10D41005501;
 Wed, 17 Feb 2021 13:01:36 +0000 (UTC)
Received: from localhost (ovpn-115-102.ams2.redhat.com [10.36.115.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E0F36A8ED;
 Wed, 17 Feb 2021 13:01:09 +0000 (UTC)
Date: Wed, 17 Feb 2021 13:01:08 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v2 4/7] vhost: Add VhostShadowVirtqueue
Message-ID: <20210217130108.GF269203@stefanha-x1.localdomain>
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-5-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209153757.1653598-5-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Rob Miller <rob.miller@broadcom.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 04:37:54PM +0100, Eugenio P=E9rez wrote:
> +/*
> + * Creates vhost shadow virtqueue, and instruct vhost device to use the =
shadow
> + * methods and file descriptors.
> + */
> +VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx=
)
> +{
> +    g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqueue=
, 1);
> +    int r;
> +
> +    r =3D event_notifier_init(&svq->kick_notifier, 0);
> +    if (r !=3D 0) {
> +        error_report("Couldn't create kick event notifier: %s",
> +                     strerror(errno));
> +        goto err_init_kick_notifier;
> +    }
> +
> +    r =3D event_notifier_init(&svq->call_notifier, 0);
> +    if (r !=3D 0) {
> +        error_report("Couldn't create call event notifier: %s",
> +                     strerror(errno));
> +        goto err_init_call_notifier;
> +    }
> +
> +    return svq;

Use-after-free due to g_autofree. I think this should be:

  return g_steal_pointer(&svq)

https://developer.gnome.org/glib/stable/glib-Memory-Allocation.html#g-steal=
-pointer

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAtE5QACgkQnKSrs4Gr
c8iPKwgAsqpgBXufqRLw/6AgkmS4Uw1bCJru2OzwGNmr8nHE73Fy+Nn4+Ck+4V3D
PIPomdEyA+GDcDoI6m820D85cBQJLaJosu7u5bgQirHJM5fPsRQfy2P20SAK1FWF
b6LnpEFF0a9ZHz26LtQZDQ4GYZ2eMwuwFzyky+JWd/LF//A9FOFP3OH+PM9wYNHA
aXFShfY9mFPDFIstEcVyAx2d/uFt+lah5S0zLJANUVAwZWdxNzarDeYspJ3gYUZ5
3C4++2ApTDQY9bF3XJZfEei78HRnz1mHNTVnpxPnRy6KZ/AKgjwRrvRi16WfkHx8
pwlbJIdEXaH6+ss6KE1aEhPDpjcPhQ==
=N1Yp
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--


