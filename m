Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF1398536
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:25:36 +0200 (CEST)
Received: from localhost ([::1]:60390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loN83-0002FS-Dt
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loN5N-0006BA-2x
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loN5L-0005ge-67
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622625766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jXO3ETM+t7htaPiqF+RrazeaNHhsI4XBQcC9KnN9oHM=;
 b=N5YeX0JyPorYrAunst65vaLjjDjMtpqiDmMhKZsvPhMCFcZopA3K0RDqUi6BeUhB5C1g/i
 khHZ63HVxbPfBCbgKg6sEyJleHudwnX/AzIsvLSctzwpJQ21ClmUnnzX0rxP9vWnRi1Ege
 6W7/QtYAJTOIfV7O+wOP7/wcnM6h/Po=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-96dBPK7JPrqMGFeQapq3hA-1; Wed, 02 Jun 2021 05:22:43 -0400
X-MC-Unique: 96dBPK7JPrqMGFeQapq3hA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AF688042AE;
 Wed,  2 Jun 2021 09:22:42 +0000 (UTC)
Received: from localhost (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6C045D9D0;
 Wed,  2 Jun 2021 09:22:41 +0000 (UTC)
Date: Wed, 2 Jun 2021 10:22:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 1/2] GitLab: Add "Bug" issue reporting template
Message-ID: <YLdN4OcxSD0fJOvD@stefanha-x1.localdomain>
References: <20210521173818.255817-1-jsnow@redhat.com>
 <20210521173818.255817-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210521173818.255817-2-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yDGtqIgYzy4FnXBy"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--yDGtqIgYzy4FnXBy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 21, 2021 at 01:38:17PM -0400, John Snow wrote:
> diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
> new file mode 100644
> index 00000000000..67a02a3ffcf
> --- /dev/null
> +++ b/.gitlab/issue_templates/bug.md
> @@ -0,0 +1,61 @@
> +<!--
> +This is the upstream QEMU issue tracker.
> +
> +Before submitting a bug, please attempt to reproduce your problem using
> +the latest development version of QEMU obtained from
> +https://gitlab.com/qemu-project/qemu/.

Please be specific about what "latest development version" means. I
guess it means qemu.git/master?

If we are asking them to build QEMU then it would be nice to include a
link with instructions on how to build from source.

> +
> +QEMU generally supports the last two releases advertised via
> +https://www.qemu.org/. Problems with distro-packaged versions of QEMU
> +older than this should be reported to the distribution instead.
> +
> +See https://www.qemu.org/contribute/report-a-bug/ for guidance.
> +-->
> +
> +## Host environment
> + - Operating system: (Windows 10 21H1, Fedora 34, etc.)
> + - OS/kernel version: (For POSIX hosts, use `uname -a`)
> + - Architecture: (x86, ARM, s390x, etc.)
> + - QEMU flavor: (qemu-system-x86_64, qemu-aarch64, qemu-img, etc.)

Is this necessary since we ask for the command-line below?

> +<!--
> +Attach logs, stack traces, screenshots, etc. Compress the files if necessary.
> +If using libvirt, libvirt logs and XML domain information may be relevant.
> +
> +See https://qemu-project.gitlab.io/qemu/devel/tracing.html on how to
> +configure additional QEMU logging.

This sentence can be removed. Tracing is mostly for developers and
requires knowledge of the source code. People who can use tracing
already know about it and for the rest it doesn't count as "additional
QEMU logging" because they won't be able to use it effectively.

--yDGtqIgYzy4FnXBy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC3TeAACgkQnKSrs4Gr
c8iAnQgAhr50MrvQ7xJOlVizW16CQE0c2dGyw+AZKT8YBmlENrBZaS0V61rnWBjS
wYJDusXw6zLSg4wnjXiJZsvn2wB9m5eQUzh/n5TcbYJlwAco9U/iMDvmeyMaV2R4
ngQm2b51/NXMC7y/fREyonBFPqIKMHCLIF2+TyXFwI6Vopxlxg3ykWRbVCZhcknE
wT8GGc4yxzIAO/89nvFhGUOAdJwaI1rqIVqRQ++Hiujh2IioaKMD2CfFGMWHxZ8L
zFrZ9r2YUPff0jbUr00RL6sPBQl7gUS2LMCho+xo3N/C+elW7SwGeQJuwamJHJ6s
z4PabSjY2FaQLTzYqTWq5fSX5y6q7g==
=WT+Z
-----END PGP SIGNATURE-----

--yDGtqIgYzy4FnXBy--


