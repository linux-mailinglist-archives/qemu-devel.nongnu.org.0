Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154703187A3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:02:29 +0100 (CET)
Received: from localhost ([::1]:46748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA8ns-00037Y-6U
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:02:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA8lN-0002MO-Cy
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:59:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA8lL-0000EN-SL
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613037590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r+iUP7yOxQ4pq6pxMuzXbrrEcpDWFvp8WBbiEXVDRts=;
 b=IP2nuHw7wWw+lgW/cTmj7IQ6lWByT0pe7tP70P+Zwk1qaHiLEHqHbXdTbPKddejt0sxo2L
 MZqZ6bYMuKGXtzxVUPCjvBY5+fBCQKZAw7yQyVtZhHyk1FIFOIZmHWVs86o3f7cnBBmEeZ
 HRFp/fC96+VeWPdKEnggiCvPEQiqqEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-AoLWBqIGMk-IXa7ZzFzmTA-1; Thu, 11 Feb 2021 04:59:48 -0500
X-MC-Unique: AoLWBqIGMk-IXa7ZzFzmTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D2C2801962
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 09:59:47 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF0405D6B1;
 Thu, 11 Feb 2021 09:59:37 +0000 (UTC)
Date: Thu, 11 Feb 2021 09:59:36 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 01/24] DAX: vhost-user: Rework slave return values
Message-ID: <20210211095936.GB247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-2-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-2-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 09, 2021 at 07:02:01PM +0000, Dr. David Alan Gilbert (git) wrote:
> +static uint64_t vhost_user_slave_handle_vring_host_notifier(
> +                struct vhost_dev *dev,
> +               VhostUserVringArea *area,
> +               int fd)

Indentation looks off. Only worth changing if you respin.

> @@ -1398,7 +1399,8 @@ static void slave_read(void *opaque)
>      struct vhost_user *u = dev->opaque;
>      VhostUserHeader hdr = { 0, };
>      VhostUserPayload payload = { 0, };
> -    int size, ret = 0;
> +    int size;
> +    uint64_t ret = 0;
>      struct iovec iov;
>      struct msghdr msgh;
>      int fd[VHOST_USER_SLAVE_MAX_FDS];
> @@ -1472,7 +1474,7 @@ static void slave_read(void *opaque)
>          break;
>      default:
>          error_report("Received unexpected msg type: %d.", hdr.request);
> -        ret = -EINVAL;
> +        ret = (uint64_t)-EINVAL;

The !!ret was removed below so it would have previously been true (1).
Now it has changed value.

If there is no specific reason to change the value, please keep it true
(1) just in case a vhost-user device backend depends on that value.

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlAAgACgkQnKSrs4Gr
c8j1Kgf/fZt238LWQCca4Gpguk6XJFxiYj3jOx2sPqTTORynV35/etPqJfQrFOE6
diwJ/x4F2XmowMmraAX8TQ+nTer6sRxE6CWuJfv3j/I9XIlB9g4nQY+PH8SU/DFy
v1X2RjcWwbTWHC/xMF3abyP8kjBAuqLJ94nLf9ACPVfl2m21rLditeiZ6qPkqiOD
Idpn3i1uO+EGLsZhbLaAYH68O7gberHE7dy8VxWEiw9EteHYybJNOX3uxPSd63M/
LEgJOmq3Ykr1UxfjQx8jHKVc6wQmYtq2XcwcM6hyEyOUKLgrLBAaLRu6T9M6ud1h
nMALP8DtZI/jtq/8Fluy2fm0iAFVsQ==
=+Zqx
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--


