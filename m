Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A8A1368DD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 09:18:19 +0100 (CET)
Received: from localhost ([::1]:42450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ippUo-0008OJ-Fd
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 03:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ippQ2-000380-88
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 03:13:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ippPz-00054e-Ha
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 03:13:20 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27848
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ippPz-0004yu-5x
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 03:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578643997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=rm4dE3LICyAOWUszXuAucSfIWXlm1O+9Wg2NIodBicU=;
 b=Fq9Klq/VVy2BpPvKeigPvVT5ni9cqzYmMXJ6UYriIgaP2raxOqoi4LSiOznGTeqSA+W8fK
 9jORuLlqWj5aZycBhHEoVXjgC5zW7HrMQfCvZyl57v0bW/ZR6HN4qXvp5TdGwMBOs3hkCV
 gFxQNU1ludayt1LZwOJfi2a/tR0EM8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-uoG7g-spOI6FjtqQO0O_Rw-1; Fri, 10 Jan 2020 03:13:17 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F34A21005512;
 Fri, 10 Jan 2020 08:13:15 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-154.ams2.redhat.com [10.36.116.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D368860C88;
 Fri, 10 Jan 2020 08:13:11 +0000 (UTC)
Subject: Re: [PATCH 2/4] Makefile: Clarify all the codebase requires qom/
 objects
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200109153939.27173-1-philmd@redhat.com>
 <20200109153939.27173-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <85cf7f0e-e171-208e-9e2d-d41639ce59b0@redhat.com>
Date: Fri, 10 Jan 2020 09:13:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200109153939.27173-3-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: uoG7g-spOI6FjtqQO0O_Rw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/01/2020 16.39, Philippe Mathieu-Daud=C3=A9 wrote:
> QEMU user-mode also requires the qom/ objects, it is not only
> used by "system emulation and qemu-img". As we will use a big
> if() block, move it upper in the "Common libraries for tools
> and emulators" section.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  Makefile.objs | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/Makefile.objs b/Makefile.objs
> index 7c1e50f9d6..5aae561984 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -2,6 +2,7 @@
>  # Common libraries for tools and emulators
>  stub-obj-y =3D stubs/
>  util-obj-y =3D crypto/ util/ qobject/ qapi/
> +qom-obj-y =3D qom/
> =20
>  chardev-obj-y =3D chardev/
> =20
> @@ -26,11 +27,6 @@ block-obj-m =3D block/
> =20
>  crypto-obj-y =3D crypto/
> =20
> -#######################################################################
> -# qom-obj-y is code used by both qemu system emulation and qemu-img
> -
> -qom-obj-y =3D qom/
> -
>  #######################################################################
>  # io-obj-y is code used by both qemu system emulation and qemu-img
> =20
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>


