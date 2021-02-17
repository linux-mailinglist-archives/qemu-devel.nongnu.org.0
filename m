Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2395131DC1C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 16:28:15 +0100 (CET)
Received: from localhost ([::1]:47834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCOkO-0000ki-J2
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 10:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCOiy-00006q-V5
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:26:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCOix-0003Yl-3l
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:26:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613575602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ecY4yNIrgjKzSNwRMISeJ/qxpef/5XZk23de/J/fLls=;
 b=Dm6r0v1xJrdosABpZhTyL8pukBxKHXfPhauEfnHfieymFlPFBuvHeAp0wiVKtpBaAGfC/z
 VpCiHBFOcvR67EpzLxuKyJqo/hTSVsXk8W5ygBCOin3cDCY6UOFkaEmUMs0hpWRfWOlL3T
 zui1k8Jo5cHAhvK2PPpqYSL1DG9sCDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-vJnBQjXrPrqlOWkaYb0jYw-1; Wed, 17 Feb 2021 10:26:40 -0500
X-MC-Unique: vJnBQjXrPrqlOWkaYb0jYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB4CD192CC43;
 Wed, 17 Feb 2021 15:26:38 +0000 (UTC)
Received: from localhost (ovpn-115-102.ams2.redhat.com [10.36.115.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7C115D719;
 Wed, 17 Feb 2021 15:26:34 +0000 (UTC)
Date: Wed, 17 Feb 2021 15:26:33 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v2 5/7] vhost: Add x-vhost-enable-shadow-vq qmp
Message-ID: <20210217152633.GG269203@stefanha-x1.localdomain>
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-6-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209153757.1653598-6-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/i8j2F0k9BYX4qLc"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 04:37:55PM +0100, Eugenio P=E9rez wrote:
> diff --git a/qapi/net.json b/qapi/net.json
> index c31748c87f..a1cdffb0f9 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -77,6 +77,28 @@
>  ##
>  { 'command': 'netdev_del', 'data': {'id': 'str'} }
> =20
> +##
> +# @x-vhost-enable-shadow-vq:
> +#
> +# Use vhost shadow virtqueue.

Is this command for testing only or do you expect it to be invoked by
libvirt in production? I think the shadow virtqueue can be an internal
QEMU feature that is hidden from management tools.

> +#
> +# @name: the device name of the virtual network adapter
> +#
> +# @enable: true to use he alternate shadow VQ notification path
> +#
> +# Returns: Error if failure, or 'no error' for success
> +#
> +# Since: 6.0

Is this a generic feature for any vhost or vDPA device? If yes, please
replace "virtual network adapter" in the doc comment.

Does this only apply to vhost-net devices? If so, please put "vhost-net"
in the name since there are other non-net vhost devices.

> +#
> +# Example:
> +#
> +# -> { "execute": "x-vhost-enable-shadow-vq", "arguments": {"enable": tr=
ue} }

Missing "name" field?

--/i8j2F0k9BYX4qLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAtNakACgkQnKSrs4Gr
c8iLXQf+PKxYtC65+omdA8zsrOELcr89AvloccdW5a6OvoHu5oowlCSAFPKmEDon
N1HwfyKuwH6mWP9HvntWr4a35LRPDghDTf/cvuJeG3w2hqUJr9kadWoBL9HICr1T
2/U8FB66ialGkE+yG0BIrHcZpIKOZy4vv+JlzwHUoj2ctRJ7biys2Zj1dyYjPr8Q
aD6dWsw7L6ttLG8kL9GaA6Vid9L9Y8k4qoa7KIRYd0skVNvdXqLvqXqoja0Ue9Mv
5vv29Ty6k2C2i94DFOeR5uboWoahvugS63nTX5M/ExvLAdAY3vENCB62/ljQa2br
hRtNUfU/U1/bEWsONrP4LtdpCez6Jw==
=L2vh
-----END PGP SIGNATURE-----

--/i8j2F0k9BYX4qLc--


