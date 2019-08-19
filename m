Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF4927A6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 16:55:05 +0200 (CEST)
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzj3o-0003j3-GI
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 10:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40123)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1hzj1s-00035I-4H
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 10:53:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1hzj1q-0003Hj-Tz
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 10:53:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61473)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1hzj1q-0003HQ-On
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 10:53:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E7BAD3091782;
 Mon, 19 Aug 2019 14:53:01 +0000 (UTC)
Received: from localhost.localdomain (ovpn-124-60.rdu2.redhat.com
 [10.10.124.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11A881D9;
 Mon, 19 Aug 2019 14:52:55 +0000 (UTC)
Date: Mon, 19 Aug 2019 10:52:53 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190819145253.GA7887@localhost.localdomain>
References: <20190818231827.27573-1-philmd@redhat.com>
 <20190818231827.27573-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190818231827.27573-2-philmd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 19 Aug 2019 14:53:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/4] tests/docker: Use one package per line
 to improve readability
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
Cc: Fam Zheng <fam@euphon.net>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 19, 2019 at 01:18:24AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Use one package per line to improve readability. This also
> helps while reviewing patches.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  tests/docker/dockerfiles/travis.docker | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/docker/dockerfiles/travis.docker b/tests/docker/dock=
erfiles/travis.docker
> index e72dc85ca7..35714664a1 100644
> --- a/tests/docker/dockerfiles/travis.docker
> +++ b/tests/docker/dockerfiles/travis.docker
> @@ -5,7 +5,15 @@ ENV LC_ALL en_US.UTF-8
>  RUN sed -i "s/# deb-src/deb-src/" /etc/apt/sources.list
>  RUN apt-get update
>  RUN apt-get -y build-dep qemu
> -RUN apt-get -y install device-tree-compiler python2.7 python-yaml dh-a=
utoreconf gdb strace lsof net-tools gcovr
> +RUN apt-get -y install \
> +    device-tree-compiler \
> +    dh-autoreconf \
> +    gcovr \
> +    gdb strace \

Two in a single line here.

> +    lsof \
> +    net-tools \
> +    python2.7 \
> +    python-yaml
>  # Travis tools require PhantomJS / Neo4j / Maven accessible
>  # in their PATH (QEMU build won't access them).
>  ENV PATH /usr/local/phantomjs/bin:/usr/local/phantomjs:/usr/local/neo4=
j-3.2.7/bin:/usr/local/maven-3.5.2/bin:/usr/local/cmake-3.9.2/bin:/usr/lo=
cal/clang-5.0.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sb=
in:/bin
> --=20
> 2.20.1
>=20
>=20


