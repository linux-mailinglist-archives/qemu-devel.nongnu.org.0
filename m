Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E63D43CDFB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:51:58 +0200 (CEST)
Received: from localhost ([::1]:41344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflDZ-0005Mg-1j
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfkgA-00089J-2O
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:17:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfkg6-0008Ef-OT
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635347841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZDTAZAvtmeJkwr0htkqPwl6a6AZ2p1iEtH0fNrPWubE=;
 b=fNhXWLbTt073CNPyQjYYYfQ2py9Z1k9FCKMaBYJ0IRQhgqXWs3hPUqKaU1TOIDYNCFbPm7
 wleYAoNXah+IJAj3gP8gYz8y7ggRfMJ85TdUyfWlHaRfcPUuTg4+A4ckO4fp49izrk91Na
 LIxHSOQcoLGueC5Cem85WS7VP4ZM8Mg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-YtffZy5AMf2HpXGAR8Lq6g-1; Wed, 27 Oct 2021 11:17:16 -0400
X-MC-Unique: YtffZy5AMf2HpXGAR8Lq6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52A6C100C662;
 Wed, 27 Oct 2021 15:17:15 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 872FC5DF35;
 Wed, 27 Oct 2021 15:17:10 +0000 (UTC)
Date: Wed, 27 Oct 2021 16:17:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v3 02/12] vfio-user: build library
Message-ID: <YXltdeUNi1JPuyB7@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <48b1ca2b5070f3655075e02966c40786028dbfd9.1633929457.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <48b1ca2b5070f3655075e02966c40786028dbfd9.1633929457.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="biOmbDHmPggEuW39"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--biOmbDHmPggEuW39
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 11, 2021 at 01:31:07AM -0400, Jagannathan Raman wrote:
> diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
> index 08c16e235f..f9e512d44a 100644
> --- a/hw/remote/Kconfig
> +++ b/hw/remote/Kconfig
> @@ -1,4 +1,9 @@
> +config VFIO_USER_SERVER
> +    bool
> +    default n

Does VFIO_USER_SERVER depend on MULTIPROCESS?

> diff --git a/tests/acceptance/multiprocess.py b/tests/acceptance/multiprocess.py
> index 96627f022a..7383c6eb58 100644
> --- a/tests/acceptance/multiprocess.py
> +++ b/tests/acceptance/multiprocess.py
> @@ -67,6 +67,7 @@ def do_test(self, kernel_url, initrd_url, kernel_command_line,
>      def test_multiprocess_x86_64(self):
>          """
>          :avocado: tags=arch:x86_64
> +        :avocado: tags=distro:centos
>          """
>          kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                        '/linux/releases/31/Everything/x86_64/os/images'
> @@ -82,6 +83,7 @@ def test_multiprocess_x86_64(self):
>      def test_multiprocess_aarch64(self):
>          """
>          :avocado: tags=arch:aarch64
> +        :avocado: tags=distro:ubuntu
>          """
>          kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                        '/linux/releases/31/Everything/aarch64/os/images'

Did you tag them with different distros in order to get coverage on both
CentOS and Ubuntu (even though that's orthogonal to x86_64 vs aarch64)?
Maybe a comment is necessary so it's clear why these tags are in place
because the test isn't actually limited to that distro.

--biOmbDHmPggEuW39
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF5bXUACgkQnKSrs4Gr
c8gQxgf+P+95EM3vdCWsf+jHi8tibsozv3hR/oG4OvX8bV4OFWExU3zIjs9yPQNj
fnOwkg7Fj7+mtlGGEFnv06wDMUPlrAzEMLzt2L2tm/gJAVSYrfLYsU/rjhOq+RMy
a9ot0oCMyRozF2v2cpDKEzmQWKDItO1faxcLmvQhnv3Hy6j9tmFpnjKInyWT0dI7
+kDJ1wyVZ9u7qW9Gp0eIU9JeAtKaeh2IZv0GeRbY/6GlcDtPZt3u74yZqPYULMm3
uoLoJ+v1grLvrAZ6x5YMg2JGJCXTXyI5rArdVUCjkB9A+TNW7T9kXCsJq6zJIwgK
/MUbcC/VYWnYJfvCzqNsWpRKIf/+3A==
=elCl
-----END PGP SIGNATURE-----

--biOmbDHmPggEuW39--


