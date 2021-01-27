Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF70306713
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 23:16:54 +0100 (CET)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4t7N-0007N9-V0
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 17:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel@ucw.cz>) id 1l4t5z-0006kP-37
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:15:29 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:58944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel@ucw.cz>) id 1l4t5l-0006pd-1j
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:15:22 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 88E5B1C0B8E; Wed, 27 Jan 2021 23:15:05 +0100 (CET)
Date: Wed, 27 Jan 2021 23:15:05 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Adrian Catangiu <acatan@amazon.com>
Subject: Re: [PATCH v4 1/2] drivers/misc: sysgenid: add system generation id
 driver
Message-ID: <20210127221505.GB24799@amd>
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
 <1610453760-13812-2-git-send-email-acatan@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline
In-Reply-To: <1610453760-13812-2-git-send-email-acatan@amazon.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: none client-ip=46.255.230.98; envelope-from=pavel@ucw.cz;
 helo=jabberwock.ucw.cz
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jason@zx2c4.com, dgunigun@redhat.com, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, ghammer@redhat.com, vijaysun@ca.ibm.com,
 0x7f454c46@gmail.com, qemu-devel@nongnu.org, mhocko@kernel.org,
 oridgar@gmail.com, avagin@gmail.com, ptikhomirov@virtuozzo.com,
 linux-s390@vger.kernel.org, corbet@lwn.net, mpe@ellerman.id.au, mst@redhat.com,
 ebiggers@kernel.org, borntraeger@de.ibm.com, sblbir@amazon.com,
 bonzini@gnu.org, arnd@arndb.de, jannh@google.com, raduweis@amazon.com,
 asmehra@redhat.com, graf@amazon.com, rppt@kernel.org, luto@kernel.org,
 gil@azul.com, colmmacc@amazon.com, tytso@mit.edu, gregkh@linuxfoundation.org,
 areber@redhat.com, linux-kernel@vger.kernel.org, ebiederm@xmission.com,
 ovzxemul@gmail.com, rafael@kernel.org, w@1wt.eu, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> - Solution
>=20
> The System Generation ID is a simple concept meant to alleviate the
> issue by providing a monotonically increasing u32 counter that changes
> each time the VM or container is restored from a snapshot.

I'd make it u64.

But as people explained, this has race problems that may be impossible
to solve?

Best regards,
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAR5ekACgkQMOfwapXb+vIeRACdFFlEw9Qzjgj/nAuNJzxFeb2z
28wAoKXL22jBt2ohyVp9BgmFr64wldNZ
=T3KQ
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--

