Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615192B6B9A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:21:07 +0100 (CET)
Received: from localhost ([::1]:53186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4fC-0007UY-EZ
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kf4Nj-0001Dx-DK
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:03:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kf4Ng-0001xn-Hp
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605632579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rQGzB7JdqxT22+BhEWiZikrUwjzE4YKpC/22XO6sf+0=;
 b=G7MPXIuEacKCKemsJ6kNsbb3tALKXtpGxWu+XenJhVg4VpqqFxFgUrPpWeZPt2aS539yX/
 3DeVJyMNm/UUPsYwLlbbqi4BTzNTQJoHQALd6Uo8m1XChYTcZB+5y0zb4k2R38JLAOu9TC
 A9CdBdwep6tsv57Kp+sPb2rGusFtGeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-MZuY2XgQOGeKixkt1zM1AQ-1; Tue, 17 Nov 2020 12:02:57 -0500
X-MC-Unique: MZuY2XgQOGeKixkt1zM1AQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86FE211CC7E0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 17:02:56 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D116719930;
 Tue, 17 Nov 2020 17:02:49 +0000 (UTC)
Date: Tue, 17 Nov 2020 17:02:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Use of g_return_if_fail(), g_return_val_if_fail()
Message-ID: <20201117170248.GV131917@stefanha-x1.localdomain>
References: <87r1os6mn5.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87r1os6mn5.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U8v/hV883cEE9JJG"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--U8v/hV883cEE9JJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 04:14:38PM +0100, Markus Armbruster wrote:
> * block/export/vhost-user-blk-server.c:270:    g_return_val_if_fail(len <=
=3D sizeof(struct virtio_blk_config), -1);
>=20
>   Stefan, why is len > sizeof(struct virtio_blk_config) a programming
>   error?
>=20
>   Why is returning safe?

Thanks for pointing this out. The vhost-user frontend passed an invalid
len and we're validating input. This and the other instances in
vhost-user config function in contrib/ should be replaced with explicit
input validation.

I'll send a patch.

Stefan

--U8v/hV883cEE9JJG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+0AjgACgkQnKSrs4Gr
c8hCOQgAghN24+nPl1RV9oRHstY/iJyjeWAt7o+eclLuUN4eYccQ4WH70cml0i60
4lguHmOcxMuhsfJ1Pk3wFzw2S4Z/NmiyKAzgZ8UoY4dtHkfn9XM0q/G09Vp5rBZf
HrJYGpThM083o3SzMPrILmJZjB9daqdECSFga7hKxVMeOL1GkARWEFbaDfBFwpp7
RzOBNsx7+0qVNQYuVtcCLNp5yhvICm5VsFJDjOqBkO7OjspOWYzEANkYN4u6ejx9
Ta3nTEf+RvYjIaYbIte28HQA3bQN0YG+s74cZchMGZ2QALoCmpFCnJMYZQBfNabg
BRtrvcEX8y/J+twxWXfk8S5QRdC/pA==
=F+K/
-----END PGP SIGNATURE-----

--U8v/hV883cEE9JJG--


