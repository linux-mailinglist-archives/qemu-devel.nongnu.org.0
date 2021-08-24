Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29983F627B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:12:51 +0200 (CEST)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZ2h-0005XX-0T
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIZ1H-0004B8-H5
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:11:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIZ1E-0003AK-Tr
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629821480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PL7emM3Jpy4TLpkx0wLLmoazdpJqr+5fqGAAPdhRQGU=;
 b=EY9pH3ylZ21Cb4AXJzWeK8AHIF4EMTXFB6fvLimF7E03Ovkq+ZV1JLLyneyHjsaO+r5VfZ
 Kyy6uDfqbP/cJvPM5a24HTDIb7hKmtv8yWzTSj++z313+8kLDPpYaxvV6Q0qGnFuMgFFJM
 7waSALfLbluEIHbfKDbfRYlO66lLaMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-scCKAzHQMHWJTY88pH2TNA-1; Tue, 24 Aug 2021 12:11:18 -0400
X-MC-Unique: scCKAzHQMHWJTY88pH2TNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9C93190A7B4;
 Tue, 24 Aug 2021 16:11:16 +0000 (UTC)
Received: from localhost (unknown [10.39.192.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B78671ABD7;
 Tue, 24 Aug 2021 16:11:12 +0000 (UTC)
Date: Tue, 24 Aug 2021 17:04:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 07/16] vfio-user: get device info
Message-ID: <YSUYfS442NY5TltC@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <d2c6a72f9b0b207bcb2c7fe49abe45854d4e017b.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <d2c6a72f9b0b207bcb2c7fe49abe45854d4e017b.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="A4dDGPMklaNGNEF2"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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

--A4dDGPMklaNGNEF2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 16, 2021 at 09:42:40AM -0700, Elena Ufimtseva wrote:
> +int vfio_user_get_info(VFIODevice *vbasedev)
> +{
> +    VFIOUserDeviceInfo msg;
> +
> +    memset(&msg, 0, sizeof(msg));
> +    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_INFO, sizeof(msg), 0);
> +    msg.argsz = sizeof(struct vfio_device_info);
> +
> +    vfio_user_send_recv(vbasedev->proxy, &msg.hdr, NULL, 0, 0);
> +    if (msg.hdr.flags & VFIO_USER_ERROR) {
> +        return -msg.hdr.error_reply;
> +    }
> +
> +    vbasedev->num_irqs = msg.num_irqs;
> +    vbasedev->num_regions = msg.num_regions;
> +    vbasedev->flags = msg.flags;
> +    vbasedev->reset_works = !!(msg.flags & VFIO_DEVICE_FLAGS_RESET);

No input validation. I haven't checked what happens when num_irqs,
num_regions, or flags are bogus but it's a little concerning. Unlike
kernel VFIO, we do not trust these values.

Stefan

--A4dDGPMklaNGNEF2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmElGHwACgkQnKSrs4Gr
c8infAf/TqMquKnyQgP/iIwx3A7Otre77ybKCns3Uab0z5h+AXMu7ZxkPD0QCGOv
wRQpz1M90CerQrUo5hojNGtbawDTKoXyQKNahlviqG3YYl+ZPG504Tbof97GgFLE
7HTe7F6BLjpuxiF3Tpbmj7Vk9kDjh37TbY+mqm5UR7q8/tuNeLIuAE6rFnLAHXtW
PQqT1jjLf9Qv3lDw8nYkVUsnNxQ9/D+L+HeeiV0Qb8NyeaCKKqLfdYOjADW7PGM6
fcD6a1GQP9p6HkChUNsRsDvDHMipR9L6/ru+wvtTHboWKvObyAF4q1zSJ6IUhlmZ
HdGNub4R77zcjeStwszHBRgiw8ODQQ==
=B6vt
-----END PGP SIGNATURE-----

--A4dDGPMklaNGNEF2--


