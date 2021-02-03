Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705630E03F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:56:49 +0100 (CET)
Received: from localhost ([::1]:39084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LSS-0004WN-9y
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7LMs-0008C9-0J
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:51:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7LMq-0007IR-H2
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612371058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xSeCiHi/ErG2LHQNhQLGHQjc05W0BDvx2AwIOBAgxpQ=;
 b=Ps9rPnzz/C7mqXPzoSJrW7poxcbEkGp02MxU59ZMJEcHpEkW4WNMM75F3sdq4BSLpUklgx
 zKo+67osdPOCjbvmPsu+SqA3AYD8zaWjsKmX17mbeMD1xVVNhADnp95ryigTfnlQXIkC1x
 NAp2ajk2pAjEs572O/Qfukote9UAkx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-yh49r8xQOSGwBdKhQ2zXLQ-1; Wed, 03 Feb 2021 11:50:54 -0500
X-MC-Unique: yh49r8xQOSGwBdKhQ2zXLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65B01801962;
 Wed,  3 Feb 2021 16:50:53 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D507E5D9E3;
 Wed,  3 Feb 2021 16:50:52 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:50:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH 1/1] docs: fix mistake in dirty bitmap feature description
Message-ID: <20210203165051.GH74271@stefanha-x1.localdomain>
References: <20210128171313.2210947-1-den@openvz.org>
 <a88ad335-05b1-b720-5689-1c477bd55d1f@virtuozzo.com>
 <ccc0020d-ae27-6e8a-d76e-55615c74befb@redhat.com>
 <80bb1b27-4bb3-de85-713b-a88c8019a14f@openvz.org>
 <cbfdf78b-57ff-3482-3adc-f2eb3e65237e@redhat.com>
 <5bc4c2ef-e1dd-f0bc-12f1-62c1a11a9fe4@openvz.org>
MIME-Version: 1.0
In-Reply-To: <5bc4c2ef-e1dd-f0bc-12f1-62c1a11a9fe4@openvz.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y9PDtDHaFrXNoMPU"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--y9PDtDHaFrXNoMPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 01:29:03PM +0300, Denis V. Lunev wrote:
> On 2/3/21 2:08 AM, Eric Blake wrote:
> > On 2/2/21 4:50 PM, Denis V. Lunev wrote:
> >> On 2/3/21 1:15 AM, Eric Blake wrote:
> >>> On 1/28/21 11:21 AM, Vladimir Sementsov-Ogievskiy wrote:
> >>>> 28.01.2021 20:13, Denis V. Lunev wrote:
> >>>>> Original specification says that l1 table size if 64 * l1_size, whi=
ch
> >>>>> is obviously wrong. The size of the l1 entry is 64 _bits_, not byte=
s.
> >>>>> Thus 64 is to be replaces with 8 as specification says about bytes.
> >>>>>
> >>>>> There is also minor tweak, field name is renamed from l1 to l1_tabl=
e,
> >>>>> which matches with the later text.
> >>>>>
> >>>>> Signed-off-by: Denis V. Lunev <den@openvz.org>
> >>>>> CC: Stefan Hajnoczi <stefanha@redhat.com>
> >>>>> CC: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> >>>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> >>>>
> >>> I saw the subject "dirty bitmap", and assumed it would go through my
> >>> dirty bitmap tree.  In reality, it's unrelated to the dirty bitmap co=
de.
> >>>  Would an improved subject line help?
> >> hmm. Actually this is about "how the dirty bitmaps are stored in the
> >> Parallels Image format". The section is called "dirty bitmap feature".
> >>
> >> What I can propose? :)
> >>
> >> "docs: fix mistake in Parallels Image "dirty bitmap" feature descripti=
on"
> >>
> >> Will this work for you?
> > That feels a bit long; maybe just:
> >
> > docs: fix Parallels Image "dirty bitmap" section
> >
> >
>=20
> looks great to me. Should I resend?

It's okay. I have merged it, updated the commit message, and added a
note about the original commit message. The final commit has a
 Message-id: header so it's easy to find the original email thread.

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--y9PDtDHaFrXNoMPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAa1GsACgkQnKSrs4Gr
c8itcAf+IYYio3tPeOgGAlcmvnNCnY2XckcsPTLsSqLlH8zyKTbqpSnGwzlObrRg
cz5vU/OVfbfIdxOmoi+QxGn+4RjywM9QtmrvPaongkBfBF6tGdWakG8hS69dPy+5
PY6pcKwdi4iiGZ6zi5Cj2rUtTagBiUg/xT3w2IUYBMv7lkrtiB9upJos8wnAo5qr
Trx/mCUXVfOwHYdZrSf7tr/SFdB3oth9BvxTulmSvBCb4oAse2jSW6ZT2yTAj4iy
Qi2AqXQP6rEUFjVlSMCzdAajneUmJbfNSTHc6TO/SOkEJ65vO7IFN3CiDGgBSuod
zWfbth72AMrAxgbxZ0wRYUpo3xBAUQ==
=FIwH
-----END PGP SIGNATURE-----

--y9PDtDHaFrXNoMPU--


