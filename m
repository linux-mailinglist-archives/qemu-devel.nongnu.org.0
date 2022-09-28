Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49FD5EE675
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:13:30 +0200 (CEST)
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddQu-0001lz-Gf
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oddOc-0008Ga-BH
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:11:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oddOU-0003Zl-Al
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664395855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y5ow5wpSi6KR8liVXacFqvmBD1zOx7LrY4v1bcEg9r4=;
 b=JzXElnwCRGw7+ZLSHkGp1Apt3+9QnPABz7JniyYi8fZ4WAq3o1kDfubzTs4p0Fu/Q6AX7H
 fAKYOK3qUmc1fTSwIrxLNl0yA1t/R+U2IHyM1CiH79v3eK3aeOruuGNYN1nK31eS0fj1bz
 hc0vg0xH1bmXwjV4M3daLECj94U4P9M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-mtmpPT2VMGKk0coRx5a3og-1; Wed, 28 Sep 2022 16:10:50 -0400
X-MC-Unique: mtmpPT2VMGKk0coRx5a3og-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BC9C811E81;
 Wed, 28 Sep 2022 20:10:50 +0000 (UTC)
Received: from localhost (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57560111E3E9;
 Wed, 28 Sep 2022 20:10:21 +0000 (UTC)
Date: Wed, 28 Sep 2022 16:10:20 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Eric Blake <eblake@redhat.com>, integration@gluster.org,
 David Hildenbrand <david@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, afaria@redhat.com,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, sgarzare@redhat.com
Subject: Re: [PATCH v5 02/12] blkio: add libblkio block driver
Message-ID: <YzSqLODlfWmadSu5@fedora>
References: <20220927193431.22302-1-stefanha@redhat.com>
 <20220927193431.22302-3-stefanha@redhat.com>
 <87sfkc1321.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LFUMwjINMmo8T377"
Content-Disposition: inline
In-Reply-To: <87sfkc1321.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LFUMwjINMmo8T377
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2022 at 07:27:34AM +0200, Markus Armbruster wrote:
> > +##
> > +# @BlockdevOptionsVirtioBlkVhostVdpa:
> > +#
> > +# Driver specific block device options for the virtio-blk-vhost-vdpa b=
ackend.
> > +#
> > +# @path: path to the vhost-vdpa character device.
> > +#
> > +# Since: 7.2
> > +##
> > +{ 'struct': 'BlockdevOptionsVirtioBlkVhostVdpa',
> > +  'data': { 'path': 'str' } }
> > +
>=20
> Should these be 'if': 'CONFIG_BLKIO'?

Will fix in the next revision.

Stefan

--LFUMwjINMmo8T377
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM0qiwACgkQnKSrs4Gr
c8i+7AgAivnc/iYPJNXZNR8BWZzf5d8WZMKL3W7zrFcUnb1BnAVYY7RbpPFHFibH
qin7oHKXxpWCNxjAjP21R7ueeRv0tazJqX98Fj53V+5MSbPopUU3q3+S/5Ji4fTN
5LWPw+3Mfkdlb0ZEtrW1qFyhQJIErFkAICl4WgoKwZBFWuaAGNqH9ds8Lnx0tYvW
mXd2nL1rIhDv/80xKgjb6Gjf2rM0dK6dWfsKtuP4U0MmAQ2vfzBIg314SGTAA0g0
sUuTTLEpco3cxp8E3SymMDp12i1oEnQmvy8zICWruiO09ScsvIqlEaOoeACjohlc
AV7+KdUiSB9ht+K5Ja2VxlOzlCWCLQ==
=vKEx
-----END PGP SIGNATURE-----

--LFUMwjINMmo8T377--


