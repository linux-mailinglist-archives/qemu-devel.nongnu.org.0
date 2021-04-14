Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1D635F189
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 12:34:27 +0200 (CEST)
Received: from localhost ([::1]:42050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWcqo-0005VJ-7w
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 06:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWcol-0004bZ-Ta
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:32:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWcoi-0006uN-4W
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618396335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ktSX/kzmdF55Hu8x0z9qJhiWvBto+gl0zZ2vtr8K7oc=;
 b=WdMuDVNaUqs3X0Y7rBjuTn7tq5MJSth3pYrqY23oW7h610EWVV9hCk8KtB15aI9Prm4xAP
 WUAx+CwF2e3jrt7ocV6fWaO1YuEZoxjoOd7MKu5dl0qmXF/NfOEicyqVrsBcn/G/h5CtPA
 KcUT6hR9WCcpcbBnt97SNyPtOA+Q0UU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-Wlhvuh_SN4uGID1g0QHECA-1; Wed, 14 Apr 2021 06:32:11 -0400
X-MC-Unique: Wlhvuh_SN4uGID1g0QHECA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08F94100A605;
 Wed, 14 Apr 2021 10:32:10 +0000 (UTC)
Received: from localhost (ovpn-114-209.ams2.redhat.com [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3336C6E6F5;
 Wed, 14 Apr 2021 10:31:53 +0000 (UTC)
Date: Wed, 14 Apr 2021 11:31:52 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH 0/5] Use ccache in the gitlab-CI
Message-ID: <YHbEmCF1Lem2g3Up@stefanha-x1.localdomain>
References: <20210414081907.871437-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210414081907.871437-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZOYZCeJVMQzHOqPW"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ZOYZCeJVMQzHOqPW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 10:19:02AM +0200, Thomas Huth wrote:
> Here are some patches to enable ccache in the gitlab-CI. Using the
> compiler cache can speed up some of the jobs in the CI by avoiding
> to recompile the same sources again and again. With this patch series,
> some jobs indeed get quite a bit faster. For example "build-system-fedora=
"
> goes down from 29 minutes (https://gitlab.com/thuth/qemu/-/jobs/116814905=
1)
> to 12 minutes (https://gitlab.com/thuth/qemu/-/jobs/1175479324) in the
> best case.
> However, and that's why I've marked this series still as RFC, there
> are some jobs which refuse to improve much, for example the *-cfi-* jobs
> are still running for a long time, see e.g.:
>=20
>  https://gitlab.com/thuth/qemu/-/jobs/1168149079 (50 minutes on master)
>  https://gitlab.com/thuth/qemu/-/jobs/1175479342 (43 minutes with ccache)
>=20
> Thus the overall run time did not improve very much yet.
>=20
> Additionally, the jobs are sometimes running even slower, e.g. if the
> cache has not been populated yet or if there are a lot of cache misses,
> and I've seen some jobs hitting the 60 min time limit because of this.
> And I've even seen two or three jobs failing intermittendly with a
> crashing test, e.g.:
>=20
>  https://gitlab.com/thuth/qemu/-/jobs/1175479336
>=20
> Not sure whether that's related to some bad caching of ccache, or
> whether it's something that also occurs on the master branch recently?
> Has anybody else experienced such a problem?

The GitLab CI cache implementation does not appear to be designed for
ccache because the files are saved in a cache.zip file and then
extracted again each time a job runs.

That is very inefficient for something like a 1 GiB ccache directory.

More details:
https://docs.gitlab.com/ee/ci/caching/#availability-of-the-cache

The GitLab CI cache feature in its current form just doesn't look
suitable for ccache.

I wonder if we can implement ccache differently on dedicated runners.
The ccache directory would really be shared (mounted within job
containers) without the additional cache.zip step to avoid wasting CPU
cycles compressing/decompressing and RAM with duplicated page cache.

Stefan

--ZOYZCeJVMQzHOqPW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB2xJgACgkQnKSrs4Gr
c8jqZwf9FDa0TSh8T3S4MMOuAu6u5OaYM8JlXm1JTogDp6u75mEChTmGZMgtQcVb
vyh/IQeRuKLJyIY1x+hx0Pzy2SytAX0MMy0qHeWFsF6hNOdtCPCGe6oOCeSSaFJz
tFVastf883leVhqI2YZg2xuC2tqIovas0ujMbUhET/j6zKr6TboaBBNb9uQtmVLd
xdH/e/nE94i0cSZPEXNK+YDzfA9Gy78CrkUMxJCMPzKxEuEtXxG70sH7J/q2R0Ji
8ncQuuVJXuI/dMzwzGJvnpy/KWP1jcUyUHMOqYAWi8sHS+dgOQW6w4VFpCiJu2Rr
T9QgQsYgPTYty5NYyl+SHA3B9d4gVA==
=97Zw
-----END PGP SIGNATURE-----

--ZOYZCeJVMQzHOqPW--


