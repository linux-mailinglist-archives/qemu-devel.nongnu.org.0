Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0502FEDB7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 15:58:41 +0100 (CET)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2bQ0-0007En-R2
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 09:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l2bOU-0006MJ-HX
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 09:57:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l2bOS-0000uV-7R
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 09:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611241022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DAXEekOi4O2/6FHM7DzwKHrlGJD+gkZw+umDw92IL2w=;
 b=V6pkS+FIab+A3i/UyBXpA0+1abYcBN1ZWU/Ee6zajLZlLFV834rNyy9hqu4JbeORZZ4xyG
 p5N5VIzJM7KVe0lBMtj33ubJ83qrEbIug6VxMmBWT5x8aqy6oy51b4VqyUZvmzcCGuveQx
 syJYnxescy719M1Ip9TXUlN+ijQHwZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-oMV32bJtP7qGJ65OlcJzQg-1; Thu, 21 Jan 2021 09:56:59 -0500
X-MC-Unique: oMV32bJtP7qGJ65OlcJzQg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C70CE1934100;
 Thu, 21 Jan 2021 14:56:57 +0000 (UTC)
Received: from localhost (ovpn-115-60.ams2.redhat.com [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7673650A80;
 Thu, 21 Jan 2021 14:56:52 +0000 (UTC)
Date: Thu, 21 Jan 2021 14:56:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/6] Update git repo URLs to GitLab
Message-ID: <20210121145651.GA59088@stefanha-x1.localdomain>
References: <20210111115017.156802-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210111115017.156802-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 11:50:11AM +0000, Stefan Hajnoczi wrote:
> Several places in qemu.git reference qemu.org git repo URLs. Let's switch=
 to
> GitLab repo URLs in order to enable GitLab as a gating CI and in order to
> reduce qemu.org bandwidth consumption.
>=20
> Paolo has already set up GitLab mirror repos. sgabios was missing and I a=
dded
> that today. It is now possible to replace git.qemu.org/git with
> gitlab.com/qemu-project in URLs.
>=20
> Stefan Hajnoczi (6):
>   .github: point Repo Lockdown bot to GitLab repo
>   gitmodules: use GitLab repos instead of qemu.org
>   gitlab-ci: remove redundant GitLab repo URL command
>   docs: update README to use GitLab repo URLs
>   pc-bios: update mirror URLs to GitLab
>   get_maintainer: update repo URL to GitLab
>=20
>  README.rst                |  4 ++--
>  .github/lockdown.yml      |  8 +++----
>  .gitlab-ci.yml            |  1 -
>  .gitmodules               | 44 +++++++++++++++++++--------------------
>  pc-bios/README            |  4 ++--
>  scripts/get_maintainer.pl |  2 +-
>  6 files changed, 31 insertions(+), 32 deletions(-)
>=20
> --=20
> 2.29.2
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAJljMACgkQnKSrs4Gr
c8i8AQf+MlMCYY6s40oA9RGxvcjQEwZ4qnbPaO95TYfjm4SjGmzYC1HFQLHLPEzx
I8VqZHNu85L0Ed8mqNMstnUpwP9P+MWd9M9eJ7rJW8SzAMEDSJJQzm6mvMT9vscq
m8eqofeYiop5BWLNKhvu3VWQiNBE7+apFba32gm9bXeYLV+jEioiA6hANq55XR+P
TaILykgreg7Bty8R4Axf26aTO05umStydKvz/dIKdNMqbjwObnqKjNUHKjeKbutg
Jv5TYWXXo82iKfY4JndfpiDrr7lH6gSRf9+2s+j8FI2f8/5WEEhO5H9IqtmjaywE
Ugldx2QkTSo04BdSnngSsuwaUUIu1Q==
=7OOQ
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--


