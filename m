Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B757B403756
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 11:54:35 +0200 (CEST)
Received: from localhost ([::1]:59196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuHq-0003UV-Rt
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 05:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNuEq-0008BO-4n
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNuEl-0008SI-QZ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631094682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n4uYB2a8tg1ZtYYDB5dJIFhuyl6y7SAebtsyA9u04zU=;
 b=ibwPjsNOg26114AlUgQfTIJE5kezGGhkPXY7aAKpIhPU1/4iuQ0d2Vyl/4dgBmpom4zRIh
 FHFS7VAHOOPOd/UD+GoLCq1nrQp8oohxZ+mw7zpyPY+RjHKQr6ymLPMb/MCfo7ODUinZ3k
 qPBzk2JjQ95AYE0XYnaQ4bN9/Ck0cAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-uVaoIVzaPJqKOgL0FQxp7g-1; Wed, 08 Sep 2021 05:51:18 -0400
X-MC-Unique: uVaoIVzaPJqKOgL0FQxp7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75B7F835DE1;
 Wed,  8 Sep 2021 09:51:17 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FF421B400;
 Wed,  8 Sep 2021 09:51:12 +0000 (UTC)
Date: Wed, 8 Sep 2021 10:51:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 14/16] vfio-user: dma read/write operations
Message-ID: <YTiHj6TGg8tYJ7zE@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <7b21118256af2cb3d0dfe45b1e4ef9683fabccb5.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <7b21118256af2cb3d0dfe45b1e4ef9683fabccb5.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QFfDkVNioXy8H1fi"
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

--QFfDkVNioXy8H1fi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 09:42:47AM -0700, Elena Ufimtseva wrote:
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 2c9fcb2fa9..29a874c066 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3406,11 +3406,72 @@ type_init(register_vfio_pci_dev_type)
>   * vfio-user routines.
>   */
> =20
> -static int vfio_user_pci_process_req(void *opaque, char *buf, VFIOUserFD=
s *fds)
> +static int vfio_user_dma_read(VFIOPCIDevice *vdev, VFIOUserDMARW *msg)
>  {
> +    PCIDevice *pdev =3D &vdev->pdev;
> +    char *buf;
> +    int size =3D msg->count + sizeof(VFIOUserDMARW);

The caller has only checked that hdr->size is large enough for
VFIOUserHdr, not VFIOUserDMARW. We must not access VFIOUserDMARW fields
until this has been checked.

Size should be size_t to avoid signedness issues.

Even then, this can overflow on 32-bit hosts so I suggest moving this
arithmetic expression below the msg->count > vfio_user_max_xfer() check.
That way it's clear that overflow cannot happen.

> +
> +    if (msg->hdr.flags & VFIO_USER_NO_REPLY) {
> +        return -EINVAL;
> +    }
> +    if (msg->count > vfio_user_max_xfer()) {
> +        return -E2BIG;
> +    }

Does vfio-user allow the request to be smaller than the reply? In other
words, is it okay that we're not checking msg->count against hdr->size?

> +
> +    buf =3D g_malloc0(size);
> +    memcpy(buf, msg, sizeof(*msg));
> +
> +    pci_dma_read(pdev, msg->offset, buf + sizeof(*msg), msg->count);

The vfio-user spec doesn't go into errors but pci_dma_read() can return
errors. Hmm...

> +
> +    vfio_user_send_reply(vdev->vbasedev.proxy, buf, size);
> +    g_free(buf);
>      return 0;
>  }
> =20
> +static int vfio_user_dma_write(VFIOPCIDevice *vdev,
> +                               VFIOUserDMARW *msg)
> +{
> +    PCIDevice *pdev =3D &vdev->pdev;
> +    char *buf =3D (char *)msg + sizeof(*msg);

Or:

  char *buf =3D msg->data;

> +
> +    /* make sure transfer count isn't larger than the message data */
> +    if (msg->count > msg->hdr.size - sizeof(*msg)) {
> +        return -E2BIG;
> +    }

msg->count cannot be accessed until we have checked that msg->hdr.size
is large enough for VFIOUserDMARW. Adding the check also eliminates the
underflow in the subtraction if msg->hdr.size was smaller than
sizeof(VFIOUserDMARW).

> +
> +    pci_dma_write(pdev, msg->offset, buf, msg->count);
> +
> +    if ((msg->hdr.flags & VFIO_USER_NO_REPLY) =3D=3D 0) {
> +        vfio_user_send_reply(vdev->vbasedev.proxy, (char *)msg,
> +                             sizeof(msg->hdr));
> +    }
> +    return 0;
> +}
> +
> +static int vfio_user_pci_process_req(void *opaque, char *buf, VFIOUserFD=
s *fds)
> +{
> +    VFIOPCIDevice *vdev =3D opaque;
> +    VFIOUserHdr *hdr =3D (VFIOUserHdr *)buf;
> +    int ret;
> +
> +    if (fds->recv_fds !=3D 0) {
> +        return -EINVAL;

Where are the fds closed?

--QFfDkVNioXy8H1fi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE4h48ACgkQnKSrs4Gr
c8g7Fgf/dpWQZrFbSYeCE8kxtGvLWcpQj4+ejzaRY0YV6Yw3KFplG3pDnFStW4bJ
fnYIIBAn0sjiV33pMEetPVURYDniUpiFDNyVfSAaPkZzMlA/Jb3KjySVS/q57M2H
6B6VYkWgcbIFEjiub9Xe/0iDeqLKGpJ6cEvQxi6+rAIk+oQJ0bsn41Ju7zWFqPTJ
78LL+/n4hGIaZ39XwwYxsZ0iYsHRFAcXjuG7Hs/LWmdRwglS4qCBzBy3LaBFeYNO
x6DJWu5v7aVgW3EiEeGOd2ItgYaJjTJF72/ctCzjMChNpsrEi6L32ZjIcGpWSFwA
nQqlMKniTesR0J9FisaU3flrhyQM/Q==
=e/oZ
-----END PGP SIGNATURE-----

--QFfDkVNioXy8H1fi--


