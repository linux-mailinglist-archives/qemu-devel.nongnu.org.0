Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA09D2B69BA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:16:20 +0100 (CET)
Received: from localhost ([::1]:45608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf3eV-0002aX-HT
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kf3d9-00021o-C9
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:14:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kf3d5-0001zb-EF
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605629690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wsI8dT8PpexMe9TuKFjAgUNaAmV6auVjRCkQ8lpeHW4=;
 b=Z77SIY2h7+v8oa5xxle5bXFcz069XVOfwGzCiE9+Hy7wdRJKxuD/JHLm8DHeA6ipbhPI1Q
 /vM/T9e8tW7lVsdUdyxQbldUVED0k8cxdczo0Y+zI4gld6L7e00Sv4Fq90JGLOzCAoyVqB
 7xJnR2zBvOgsjSB6854fVDhQjgj8jNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-mCQTzDWuOOqXoqcnilpHFw-1; Tue, 17 Nov 2020 11:14:44 -0500
X-MC-Unique: mCQTzDWuOOqXoqcnilpHFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 576FA8042A0;
 Tue, 17 Nov 2020 16:14:43 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82F3B62A4F;
 Tue, 17 Nov 2020 16:14:39 +0000 (UTC)
Date: Tue, 17 Nov 2020 16:14:38 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 09/10] vhost: add VHOST_SET_VRING_ENABLE support
Message-ID: <20201117161438.GR131917@stefanha-x1.localdomain>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <1605223150-10888-11-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1605223150-10888-11-git-send-email-michael.christie@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X35wERi4JU/f1kly"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--X35wERi4JU/f1kly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 05:19:09PM -0600, Mike Christie wrote:
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 2f98b81..e953031 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -1736,6 +1736,28 @@ static long vhost_vring_set_num_addr(struct vhost_=
dev *d,
> =20
>  =09return r;
>  }
> +
> +static long vhost_vring_set_enable(struct vhost_dev *d,
> +=09=09=09=09   struct vhost_virtqueue *vq,
> +=09=09=09=09   void __user *argp)
> +{
> +=09struct vhost_vring_state s;
> +=09int ret =3D 0;
> +
> +=09if (vq->private_data)
> +=09=09return -EBUSY;
> +
> +=09if (copy_from_user(&s, argp, sizeof s))
> +=09=09return -EFAULT;
> +
> +=09if (s.num !=3D 1 && s.num !=3D 0)
> +=09=09return -EINVAL;
> +
> +=09if (d->ops && d->ops->enable_vring)
> +=09=09ret =3D d->ops->enable_vring(vq, s.num);
> +=09return ret;
> +}

Silently ignoring this ioctl on drivers that don't implement
d->ops->enable_vring() could be a problem. Userspace expects to be able
to enable/disable vqs, we can't just return 0 because the vq won't be
enabled/disabled as requested.

> diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> index a293f48..1279c09 100644
> --- a/drivers/vhost/vhost.h
> +++ b/drivers/vhost/vhost.h
> @@ -158,6 +158,7 @@ struct vhost_msg_node {
> =20
>  struct vhost_dev_ops {
>  =09int (*msg_handler)(struct vhost_dev *dev, struct vhost_iotlb_msg *msg=
);
> +=09int (*enable_vring)(struct vhost_virtqueue *vq, bool enable);

Please add doc comments explaining what this callback needs to do and
the environment in which it is executed (locks that are held, etc).

--X35wERi4JU/f1kly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+z9u4ACgkQnKSrs4Gr
c8ic5gf+O5o6weTp4soPZPFPYRPFV5BCzOnFZJnbdZ9ZiVoApnqC2iOnZTeJjwov
Tut0vqNrK6AaS/CHM6zo5pPSiwcITUlDy94VuB4fwtxprI3+b5FSbVBT5jZsdqpX
Axm3VoQu7RaqcWhPS0Sj6QRGy3bL6aruaoDM5zIlBO2p78bQsxqhgZxPKnoaG63s
deG/jgvNvGZgJ+EYd+CxvdaNvQP9ktK8MTWryuMdzYo/lOo1sGLyfdsimQPQNYs1
PrG1/vyYUDRBYwoUFuKRuopp/2GLMHDXeZXf4ZvqyPT4CYFH6CFJ7TK5ae4a15R7
HqqpOBChKzwUplk9si9SdpffMI+CJQ==
=Jr92
-----END PGP SIGNATURE-----

--X35wERi4JU/f1kly--


