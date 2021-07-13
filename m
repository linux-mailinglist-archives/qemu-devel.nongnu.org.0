Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB5D3C7025
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 14:08:15 +0200 (CEST)
Received: from localhost ([::1]:39396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3HCw-0003wh-7O
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 08:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3HBg-00039H-4L
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 08:06:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3HBc-0001vO-AH
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 08:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626178010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mDMmRRNWO/umbau7iCP3z6VcUZNzK6oasf5/5tnIcSw=;
 b=Du/OTfWbBOeOH0ZeTXfAlgsmedsDTNt33qk50Rif6A30u3GttjjEz87OgbIrVFzCoqTDB9
 frvb8MxoxMVLqltLVqT0O4D8fRrqOEJkbpx90SDk1o7eqPwRqqIuWcGtz6+SD+FP57ABhi
 Ki+DcjdVvUnAIcDwWZRsPkuH20vY3+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-AfhSgUCjNRKHfdJ3k77Dbg-1; Tue, 13 Jul 2021 08:06:47 -0400
X-MC-Unique: AfhSgUCjNRKHfdJ3k77Dbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1210784F20A;
 Tue, 13 Jul 2021 12:06:37 +0000 (UTC)
Received: from localhost (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8218D7E641;
 Tue, 13 Jul 2021 12:06:29 +0000 (UTC)
Date: Tue, 13 Jul 2021 13:06:28 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: VFIO/vfio-user: specify NVMe namespace to boot from
Message-ID: <YO2BxLCOmNgRqIBl@stefanha-x1.localdomain>
References: <CH0PR02MB789873144D21EEEB6C501D298B159@CH0PR02MB7898.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CH0PR02MB789873144D21EEEB6C501D298B159@CH0PR02MB7898.namprd02.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z+lPr0iFkT+4YpU5"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 John Levon <john.levon@nutanix.com>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Z+lPr0iFkT+4YpU5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 01:24:07PM +0000, Thanos Makatos wrote:
> We're working on implementing a virtual NVMe controller based on SPDK and=
 a multiprocess-qemu branch that uses the vfio-user. We're facing a problem=
 where the existing API doesn't allow us to tell QEMU from which NVMe names=
pace we'd like SeaBIOS to boot from.
>=20
> How can we solve this problem? Can we add a parameter to the '-boot' opti=
on, e.g. '-boot path=3D/devices/pciblah/...@namespace0'? AFAIK VFIO should =
have the same problem.=20
>=20
> The corresponding SeaBIOS patch can be found in https://mail.coreboot.org=
/hyperkitty/list/seabios@seabios.org/thread/2Q7NPH7TJNHK6JGPHQL7755HILO23IS=
N/

Hi,
I have CCed Gerd Hoffmann on a hunch that he may have ideas.

Yes, I think the path needs to include the Namespace ID similar to how
SCSI boot paths include the target/channel/LUN.

When the SeaBIOS NVMe driver probes the controller is should discover
the available Namespaces and set up individual drives for each
Namespace. That would be analogous to virtio_scsi_add_lun().

Stefan

--Z+lPr0iFkT+4YpU5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDtgcQACgkQnKSrs4Gr
c8jUlwf/ebIcHKHZvTzzul0ymEbw45zj0TUa90F3d/yRu0U4d3Ueua2Q8+8OP23J
06pbTaNmNznrAMmk+dyFJdUFYOPjzE2kx7TdDgbMn4JDJw11OTk6upkGWc+0O5LC
p+687xxHdesZyXVcc5riWUX+hed//De1zigCM2QxipE76w1NgyowtChvGNblYpET
H+OJypCXiYCz1jtGytfBXNaM8DkEZ4lAnbLXna+mjYWzjbgubhKf7pp5mKoGnrgg
lX/27+K7SVr1GA2+WlBc1kunyrecpGKw1HZJkielDNs0uLydHl9+GXNHk/lRkULE
2fHqA+Oqrd5iIABVk6zCfx6M6WRD1A==
=y0nh
-----END PGP SIGNATURE-----

--Z+lPr0iFkT+4YpU5--


