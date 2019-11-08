Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D389F478E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 12:51:27 +0100 (CET)
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT2nV-00058E-V9
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 06:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iT2lE-0003KC-NH
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 06:49:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iT2lD-0008IK-Bc
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 06:49:04 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55519
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iT2lD-0008Hy-7m
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 06:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573213742;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EyhXiD19APX6ikgIzmGLd+4/bmV2ql4rZFYOMTAThMk=;
 b=K3k8OatFlsyZD08Le+zCvthFx1yS1hDj3nIqeinfuYoVPBkTSq7fcDScSqRtYXpExYytdW
 abm7NJ9xLSiYyfIzVePiXlY0vfyHuOzVoyZn9ck/ru9gg1QY2OHsvU7xkb5A66vuf7SsFx
 XRfbHdgK5oeCGXk4oWp9Y9805IHZeXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-yb4owf0aPYCHOtqHPcAJBw-1; Fri, 08 Nov 2019 06:48:59 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B38D2107ACC3;
 Fri,  8 Nov 2019 11:48:58 +0000 (UTC)
Received: from redhat.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ACFD6084E;
 Fri,  8 Nov 2019 11:48:50 +0000 (UTC)
Date: Fri, 8 Nov 2019 11:48:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/2] configure: Check bzip2 is available
Message-ID: <20191108114847.GM182396@redhat.com>
References: <20191108114531.21518-1-philmd@redhat.com>
 <20191108114531.21518-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191108114531.21518-3-philmd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: yb4owf0aPYCHOtqHPcAJBw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 08, 2019 at 12:45:31PM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> The bzip2 tool is not included in default installations.
> On freshly installed systems, ./configure succeeds but 'make'
> might fail later:
>=20
>     BUNZIP2 pc-bios/edk2-i386-secure-code.fd.bz2
>   /bin/sh: bzip2: command not found
>   make: *** [Makefile:305: pc-bios/edk2-i386-secure-code.fd] Error 127
>   make: *** Deleting file 'pc-bios/edk2-i386-secure-code.fd'
>   make: *** Waiting for unfinished jobs....
>=20
> Add a check in ./configure to warn the user if bzip2 is missing.
>=20
> Fixes: 536d2173b2b
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: use better English (Daniel)
> (Not taking Daniel Reviewed-by because logic changed)
> ---
>  configure | 4 ++++
>  1 file changed, 4 insertions(+)

> diff --git a/configure b/configure
> index 9b322284c3..2b419a8039 100755
> --- a/configure
> +++ b/configure
> @@ -2147,6 +2147,7 @@ case " $target_list " in
>    ;;
>  esac
> =20
> +# Some firmware binaries are compressed with bzip2

Squash into previous patch

>  for target in $target_list; do
>    case "$target" in
>      arm-softmmu | aarch64-softmmu | i386-softmmu | x86_64-softmmu)
> @@ -2154,6 +2155,9 @@ for target in $target_list; do
>        ;;
>    esac
>  done
> +if test "$edk2_blobs" =3D "yes" && ! has bzip2; then
> +  error_exit "The bzip2 program is required for building QEMU"
> +fi
> =20
>  feature_not_found() {
>    feature=3D$1

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


