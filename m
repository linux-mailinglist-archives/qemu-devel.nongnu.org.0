Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD01BBC5D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 21:47:37 +0200 (CEST)
Received: from localhost ([::1]:33300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCUJ5-00009e-NP
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 15:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iCUIE-00085j-BZ
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 15:46:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iCUID-0005Zf-8z
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 15:46:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45584)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iCUI9-0005YR-Mh; Mon, 23 Sep 2019 15:46:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E56E8308FEC1;
 Mon, 23 Sep 2019 19:46:36 +0000 (UTC)
Received: from dhcp-17-179.bos.redhat.com (dhcp-17-179.bos.redhat.com
 [10.18.17.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 900A360BFB;
 Mon, 23 Sep 2019 19:46:30 +0000 (UTC)
Date: Mon, 23 Sep 2019 15:46:28 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v2 02/16] tests/docker: fix DOCKER_PARTIAL_IMAGES
Message-ID: <20190923194628.GC6528@dhcp-17-179.bos.redhat.com>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190919171015.12681-3-alex.bennee@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 23 Sep 2019 19:46:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 19, 2019 at 06:10:01PM +0100, Alex Benn=E9e wrote:
> Finger trouble in a previous clean-up inadvertently set
> DEBIAN_PARTIAL_IMAGES instead of DOCKER_PARTIAL_IMAGES. Also fix the
> typo to debian-9-mxe.
>=20
> Fixes: 44d5a8bf5d2
> Signed-off-by: John Snow <jsnow@redhat.com>
> [AJB: merged fix from Message-Id: <20190917185537.25417-1-jsnow@redhat.=
com>]
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

> ---
>  tests/docker/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.incl=
ude
> index 50a400b573a..3fc7a863e51 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -7,7 +7,7 @@ DOCKER_FILES_DIR :=3D $(SRC_PATH)/tests/docker/dockerfi=
les
>  DOCKER_DEPRECATED_IMAGES :=3D debian
>  # we don't run tests on intermediate images (used as base by another i=
mage)
>  DOCKER_PARTIAL_IMAGES :=3D debian debian8 debian9 debian10 debian-sid
> -DEBIAN_PARTIAL_IMAGES +=3D debian8-mxe debian-9-mxe debian-ports debia=
n-bootstrap
> +DOCKER_PARTIAL_IMAGES +=3D debian8-mxe debian9-mxe debian-ports debian=
-bootstrap
>  DOCKER_IMAGES :=3D $(filter-out $(DOCKER_DEPRECATED_IMAGES),$(sort $(n=
otdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
>  DOCKER_TARGETS :=3D $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
>  # Use a global constant ccache directory to speed up repetitive builds
> --=20
> 2.20.1
>=20
>=20

