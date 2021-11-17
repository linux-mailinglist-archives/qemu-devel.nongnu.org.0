Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C8245450C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 11:34:20 +0100 (CET)
Received: from localhost ([::1]:33258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnIGh-0004yl-Vo
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 05:34:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mnIF5-00046h-9U
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:32:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mnIEx-0002Hc-Qr
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637145149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ADkjcIqz+k/PZafkrCp3K9fp2tSqEZlTdYbPQyhIj9U=;
 b=EJmFBSuLWsnmouu2Tg1jKYn/ze8fqQLLwsahCKeAxeYwQ+OfkwUGzR0e9llmAkVLtcNPXX
 C7W3laprF+Ii6dFAqDJJQAqljhn0nAv6qS0+/gxF2Aw0mae+RUrtz8FHgD0hW/788uHKS5
 Hm26k5UjDJdItRUUBFROxE/GH2/xA4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-h8HKFLozPay0ccKOHKRogg-1; Wed, 17 Nov 2021 05:32:26 -0500
X-MC-Unique: h8HKFLozPay0ccKOHKRogg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 502A010144E0;
 Wed, 17 Nov 2021 10:32:25 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90FCE5F4ED;
 Wed, 17 Nov 2021 10:32:24 +0000 (UTC)
Date: Wed, 17 Nov 2021 10:32:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Qi, Yadong" <yadong.qi@intel.com>
Subject: Re: [PATCH 1/2] block:hdev: support BLKSECDISCARD
Message-ID: <YZTaN4nZHke5pQ1f@stefanha-x1.localdomain>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-2-yadong.qi@intel.com>
 <YZJq4E92zYQeqMy7@stefanha-x1.localdomain>
 <BL1PR11MB547976F230BB9EAE2E7C458BE3999@BL1PR11MB5479.namprd11.prod.outlook.com>
 <YZOO1hD/+AAMB/b5@stefanha-x1.localdomain>
 <YZSY44T08a2yePpr@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YZSY44T08a2yePpr@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4S2WJnPyshtTAOY9"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jens Axboe <axboe@kernel.dk>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "Chen, Luhai" <luhai.chen@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Christoph Hellwig <hch@infradead.org>, "Wang, Kai Z" <kai.z.wang@intel.com>,
 "hreitz@redhat.com" <hreitz@redhat.com>, "fam@euphon.net" <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4S2WJnPyshtTAOY9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 16, 2021 at 09:53:39PM -0800, Christoph Hellwig wrote:
> On Tue, Nov 16, 2021 at 10:58:30AM +0000, Stefan Hajnoczi wrote:
> > Question for Jens and Christoph:
> >=20
> > Is there a way for userspace to detect whether a Linux block device
> > supports SECDISCARD?
>=20
> I don't know of one.
>=20
> > If not, then maybe a new sysfs attribute can be added:
>=20
> This looks correct, but if we start looking into SECDISCARD seriously
> I'd like to split the max_sectors settings for it from discard as that
> is currently a bit of a mess.  If we then expose the secure erase max
> sectors in sysfs that would also be a good indicator.

That is probably better because userspace would the queue limits
information too. Thanks!

> What is the use case for exposing secure erase in qemu?  The whole
> concept for a LBA based secure erase is generally not a very smart
> idea for flash based media..

Yadong, please see Christoph's question above.

Stefan

--4S2WJnPyshtTAOY9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGU2jcACgkQnKSrs4Gr
c8g8oQgAuQntdhj9y7JliIkLkzIi3OfmJXa7dOLeg2SE8x79HCFL/R90CwRcJh/p
P6Qbd7flAGzzecimmpoYDUe/eElg5Vz1iTBnA9cjokMlVO4aoU6wsI4jviDz9LBr
dj+lWJNsNv/PTpun6dSQwQo4NuYYQYefzO9DkNa2zcOe3bulxrqHzcS8uB0+osVM
tWw5AdtB7P+yOZ4frJgrLn2NDlVcANxDF3bNe6zqLID/hpeVFl83Yaqj4Rb2sNRf
ys9sf97/lTNNG8ioOjME/3nRhSZU0nZU2ADS+28+h/okw3/CywradHHL7EtMAyad
LAkNu72Ncqk1DOKDbZNHydfcn9m0/Q==
=ywqU
-----END PGP SIGNATURE-----

--4S2WJnPyshtTAOY9--


