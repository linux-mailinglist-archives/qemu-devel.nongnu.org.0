Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FE837F976
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:12:00 +0200 (CEST)
Received: from localhost ([::1]:58402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhC4F-0005wJ-Uw
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhBwB-0003IC-GV
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:03:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhBw4-0003ZM-Jk
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620914611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fmaVA1nLhxCRQb3Xb0SgPAdfRABU4DaLtXCeVbNxZ40=;
 b=Xbewfgur7Vkfy0oltVek0UC3seEiW23Feoy72bOnjiHAkukhdA1RTG+47oK92qmrSYsje0
 Fomr5NKbDvIyk/I52GAoXzkQEI5VtNDejmROdZdj8KhCrIOtm8zY5IJ5xZlq/RnPOslIf7
 d7HUWswofSnfYMXNVfUYfESYXP3ihfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-M2yGB4T_N6ivCGluDf_70w-1; Thu, 13 May 2021 10:03:28 -0400
X-MC-Unique: M2yGB4T_N6ivCGluDf_70w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBADD80BCB6;
 Thu, 13 May 2021 14:02:23 +0000 (UTC)
Received: from localhost (ovpn-113-21.ams2.redhat.com [10.36.113.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C3C219C95;
 Thu, 13 May 2021 14:02:19 +0000 (UTC)
Date: Thu, 13 May 2021 15:02:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: its@irrelevant.dk
Subject: Re: making a qdev bus available from a (non-qtree?) device
Message-ID: <YJ0xar/7H5vvEnQy@stefanha-x1.localdomain>
References: <YJrKRsF4/38QheKn@apples.localdomain>
 <87im3o2m8l.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87im3o2m8l.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QElcyoqJBFZAcm4G"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: mst@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--QElcyoqJBFZAcm4G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 02:02:50PM +0200, Markus Armbruster wrote:
> Klaus Jensen <its@irrelevant.dk> writes:
> > I can then call `qdev_set_parent_bus()` and set the parent bus to the
> > bus creates in the nvme-subsys device. This solves the problem since
> > the namespaces are not "garbage collected" when the nvme device is
> > removed, but it just feels wrong you know? Also, if possible, I'd of
> > course really like to retain the nice entries in `info qtree`.
>=20
> I'm afraid I'm too ignorant on NVME to give useful advice.
>=20
> Can you give us a brief primer on the aspects of physical NVME devices
> you'd like to model in QEMU?  What are "controllers", "namespaces", and
> "subsystems", and how do they work together?
>=20
> Once we understand the relevant aspects of physical devices, we can
> discuss how to best model them in QEMU.

One specific question about the nature of devices vs subsystems vs
namespaces:

Does the device expose all the namespaces from one subsystem, or does it
need to be able to filter them (e.g. hide certain namespaces or present
a mix of namespaces from multiple subsystems)?

The status of the namespace as a DeviceState is a bit questionable since
the only possible parent it could have is a device, but multiple devices
want to use it. I understand why you're considering whether it should be
an --object...

Stefan

--QElcyoqJBFZAcm4G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCdMWoACgkQnKSrs4Gr
c8hO0QgAxK+QalrntbWs4k3M5goBtxlEEFqrPU6WNbjZHKobuOgBUP6Szfu5rsRU
CNLgM55e1pLmhgdL1eaEnl+rA7kJBw5lpz8iQzsIkl+fgjyP6ED3jEefmt1OG3fi
NUr68y6eibtYA7pWA/F3sl2DB9gl1otS/zHJ4D3/F7gCT8siBAZ+4KeLYh2gSyiN
ibNF0ph82txDzLyvZCAORLuchRlenYI1YoqHSSSGqR3Zp84aQU9KNrrQqmqnek5l
5mF/b8lT7kyoOgo+1d8SRWQpgnJDq992lkq9yoKzT13BUE3R4LsABGNU/AUezvRS
pn4eyT18EVnHEecMS/DmGbGWPqNLYA==
=4zPO
-----END PGP SIGNATURE-----

--QElcyoqJBFZAcm4G--


