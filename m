Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DE5463BFA
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 17:39:47 +0100 (CET)
Received: from localhost ([::1]:39836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms6AU-00039u-9o
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 11:39:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ms69F-0002RL-Tj
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 11:38:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ms69C-00042x-0w
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 11:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638290305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GgwAWQT2kKnzrc9A+A1JeubTlfRbJ9AElAux0u8fvY8=;
 b=V61S179btawINrgKE1/6DYcasH8LRF9dyi+Doyl0aqN6KTeZuQuypctG0HlCY6hOhq+NnS
 Le0LZrXcctQryQRzABpvbyO6JOuRUMCknBXiwtpJiIUdEF/1y1fI9yLekC4S+qACx+J6t3
 DEJdcvf5dON7Vfjjx2tlm/JjSWwiqJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-l2GL4pNhONu-zMO_qXn7IA-1; Tue, 30 Nov 2021 11:38:23 -0500
X-MC-Unique: l2GL4pNhONu-zMO_qXn7IA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 580C393920;
 Tue, 30 Nov 2021 16:38:22 +0000 (UTC)
Received: from localhost (unknown [10.39.195.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4099845D64;
 Tue, 30 Nov 2021 16:38:12 +0000 (UTC)
Date: Tue, 30 Nov 2021 16:38:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: why is iommu_platform set to off by default?
Message-ID: <YaZTc6WmGnkC0KRD@stefanha-x1.localdomain>
References: <CAFEAcA-Fb15x7hAe-g8hP8HL1xB14iGnYi5=ZJM=0G0_hbBjTw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Fb15x7hAe-g8hP8HL1xB14iGnYi5=ZJM=0G0_hbBjTw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7zNWmYsRUOPT2O4Y"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7zNWmYsRUOPT2O4Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 02:32:49PM +0000, Peter Maydell wrote:
> I've just spent a day or so trying to track down why PCI passthrough
> of a virtio-blk-pci device wasn't working. The problem turns out to be
> that by default virtio pci devices don't use the IOMMU, even when the
> machine model has created an IOMMU and arranged for the PCI bus to
> be underneath it. So when the L2 guest tries to program the virtio device=
,
> the virtio device treats the IPAs it writes as if they were PAs and
> of course the data structures it's looking for aren't there.
>=20
> Why do we default this to 'off'? It seems pretty unhelpful not to
> honour the existence of the IOMMU, and the failure mode is pretty
> opaque (L2 guest just hangs)...

Historically VIRTIO used guest physical addresses instead of bus
addresses (IOVA). I think when IOMMU support was added, a QEMU -device
virtio-* parameter was added and it's simply off by default:

  iommu_platform=3D<bool>  - on/off (default: false)

Maybe this behavior is for backwards compatibility? Existing guests with
IOMMUs shouldn't change behavior, although this could be fixed with
machine type compat properties.

Stefan

--7zNWmYsRUOPT2O4Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGmU3MACgkQnKSrs4Gr
c8hPAgf+PLWew2JXr2PWl9Oc+oaGcOMs1TXjWiKDV6UfnrOqpRqAdSyt/uC0Bdz9
th1nsSBXOPSLcMMxfrxnEy4ChwV8qBBjyQIphLtlEhOM75GsgJV38YBVCKS0QwV2
eomgZ/8xHpDB4nMwI4HLZ2Gwii21GPw4pE1I6PdMATKmSmdEV4tLJ85HjIalwGhj
MV3VUxD4MNib9gTwyuxdgASxcFk93bO0Lfk7KyEwuBd0NXfcQzgreawCwxCBIHnB
5WVhw2Oy1zIQkcvI303K2rDuOLmquPzmXINF3G20nzkNz8d6oPx5n0Sx8AS4SnyX
NGoMjJwxHYFPExuwtUmkc1gB2r8CUg==
=5KKE
-----END PGP SIGNATURE-----

--7zNWmYsRUOPT2O4Y--


