Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4993E68697
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 11:47:21 +0200 (CEST)
Received: from localhost ([::1]:36386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmxZo-0003zy-GV
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 05:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55864)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hmxZR-0003LB-LN
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 05:46:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hmxZQ-0005D6-Hp
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 05:46:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60714)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hmxZQ-0005Cb-C5
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 05:46:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A3D7B85A03;
 Mon, 15 Jul 2019 09:46:55 +0000 (UTC)
Received: from redhat.com (ovpn-112-60.ams2.redhat.com [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B77356012C;
 Mon, 15 Jul 2019 09:46:46 +0000 (UTC)
Date: Mon, 15 Jul 2019 10:46:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20190715094643.GD30298@redhat.com>
References: <20190713143311.17620-1-marcandre.lureau@redhat.com>
 <20190713143311.17620-4-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190713143311.17620-4-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 15 Jul 2019 09:46:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 3/6] tests/docker: add podman support
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 13, 2019 at 06:33:08PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> Allow to specify the container engine to run with ENGINE variable.
>=20
> By default, ENGINE=3Dauto and will select either podman or docker.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  Makefile                      | 2 +-
>  tests/docker/Makefile.include | 8 ++++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

>=20
> diff --git a/Makefile b/Makefile
> index 1fcbaed62c..7863bb0cf5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1153,7 +1153,7 @@ endif
>  	@echo  ''
>  	@echo  'Test targets:'
>  	@echo  '  check           - Run all tests (check-help for details)'
> -	@echo  '  docker          - Help about targets running tests inside D=
ocker containers'
> +	@echo  '  docker          - Help about targets running tests inside c=
ontainers'
>  	@echo  '  vm-help         - Help about targets running tests inside V=
M'
>  	@echo  ''
>  	@echo  'Documentation targets:'

I guess the target could be renamed to "cont" to parallel with "vm"
name too - fact either either "cont-help" and "vm-help" for both
or justr "cont" and "vm" for both,

Doesn't need to be done in this commit though.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

