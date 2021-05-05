Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E33C373D78
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:18:01 +0200 (CEST)
Received: from localhost ([::1]:40094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leILg-00086x-3N
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leIJr-0007Lm-UG
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:16:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leIJo-0007Uo-8q
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620224162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tksGDf7KZB/BHAzDgg1A/gs/GgJS36/jDH/Np0ru7Sk=;
 b=IDuGI+7jqU/DnORhnVmj246T/IkkgMjPRQelpZybII6P9HUtQCOw+4k3whcTH3+8lq1lKi
 vR+7t5IMEdEyDzKest+ilRYQQvofXZTSGpZECNJzLNTVHxS9D6DwY4wMNUhwa8WZ1UYehW
 IUIKkNrAEiRIxlhMHs9FlE1Hume1hII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-TUo2UuCuNMy-R4dMp3ru5w-1; Wed, 05 May 2021 10:15:58 -0400
X-MC-Unique: TUo2UuCuNMy-R4dMp3ru5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBAC61008068;
 Wed,  5 May 2021 14:15:57 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D2575C1C5;
 Wed,  5 May 2021 14:15:54 +0000 (UTC)
Date: Wed, 5 May 2021 15:15:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 09/26] DAX: virtio-fs: Add vhost-user slave commands
 for mapping
Message-ID: <YJKomatE4qqje5cY@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-10-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-10-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RDhv9EiM8KNnMv4E"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--RDhv9EiM8KNnMv4E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:43PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index dd0a02aa99..169a146e72 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -45,6 +45,72 @@ static const int user_feature_bits[] =3D {
>  #define DAX_WINDOW_PROT PROT_NONE
>  #endif
> =20
> +/*
> + * The message apparently had 'received_size' bytes, check this
> + * matches the count in the message.
> + *
> + * Returns true if the size matches.
> + */
> +static bool check_slave_message_entries(const VhostUserFSSlaveMsg *sm,
> +                                        int received_size)
> +{
> +    int tmp;
> +
> +    /*
> +     * VhostUserFSSlaveMsg consists of a body followed by 'n' entries,
> +     * (each VhostUserFSSlaveMsgEntry).  There's a maximum of
> +     * VHOST_USER_FS_SLAVE_MAX_ENTRIES of these.
> +     */
> +    if (received_size <=3D sizeof(VhostUserFSSlaveMsg)) {

received_size is an int and we risk hitting checking against the coerced
size_t value but then using the signed int received_size later. It's
safer to convert to size_t once and then use that size_t value
everywhere later.

> +typedef struct {
> +    /* Offsets within the file being mapped */
> +    uint64_t fd_offset;
> +    /* Offsets within the cache */
> +    uint64_t c_offset;
> +    /* Lengths of sections */
> +    uint64_t len;
> +    /* Flags, from VHOST_USER_FS_FLAG_* */
> +    uint64_t flags;
> +} VhostUserFSSlaveMsgEntry;
> +
> +typedef struct {
> +    /* Number of entries */
> +    uint16_t count;
> +    /* Spare */
> +    uint16_t align;

VhostUserFSSlaveMsgEntry is aligned to 64 bits, so the 16-bit align
field is not sufficient for full alignment.

--RDhv9EiM8KNnMv4E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCSqJkACgkQnKSrs4Gr
c8jXzQgAmyg1B2TTNc7jlm/iJwpSGNBqjLHp1NhvN9XQ3O27BiPWFEtV/rokM32Q
l4VdKETyC+TN4g7VHyMAcsb2VLG0vQqrj7VR3TH5zXZv/Pinsw8apI3fchRHMjZI
AKLphvMlA8Z7/7KcQn8L/VmLOD+fNnU1AFxgsrQaVFONS2n9LVrJQhSFWDQNQdVL
Es7LI4X/++ShGOgy7CsfsviKj8bhl9zsrwCp14RWX88iMGEtXDeJ8BbNhrsLEhvd
QKuGBsgKstAeEotyucfQrFYhefBatfrMTS+0EchsZVWm9otDh0cDxNuWNUi7jFxn
2ptKdoAFAs19xYuOx/EgDCgK+io9RQ==
=45zR
-----END PGP SIGNATURE-----

--RDhv9EiM8KNnMv4E--


