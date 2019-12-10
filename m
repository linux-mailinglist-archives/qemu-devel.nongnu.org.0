Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC925117D15
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 02:19:16 +0100 (CET)
Received: from localhost ([::1]:48954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieUBH-0000V4-JZ
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 20:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1ieUAP-0008VC-47
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 20:18:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1ieUAN-0002od-I5
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 20:18:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59330
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1ieUAN-0002oP-B6
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 20:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575940698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bnAerfd+U62iSqu20JMfYP7bOnvv1Pad0WP0GzjH0BQ=;
 b=Qa9KYVQOWxzzXeWxcTj0mX/avCV/zpVrcFtLkNInjbflTkOpUpEX4ClFnRBffOZWGBe77v
 fd7/8S7HVSq1Q+E9AERR0b/VwcbCDwyJiKN8YPKQH35PirPlXSm2rzCsfxT8Z4lZzJBnKU
 JW03UkK6ibBDCQGfzQZhi2qP8JinJUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-H8zCTnZTP8yP5fJ3qNcyHg-1; Mon, 09 Dec 2019 20:18:14 -0500
X-MC-Unique: H8zCTnZTP8yP5fJ3qNcyHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B04CF107ACC4;
 Tue, 10 Dec 2019 01:18:13 +0000 (UTC)
Received: from localhost.localdomain (ovpn-125-99.rdu2.redhat.com
 [10.10.125.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFD4019C5B;
 Tue, 10 Dec 2019 01:18:05 +0000 (UTC)
Date: Mon, 9 Dec 2019 20:18:03 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 4/4] python/qemu: accel: Add tcg_available() method
Message-ID: <20191210011803.GE31990@localhost.localdomain>
References: <20191206213433.11305-1-wainersm@redhat.com>
 <20191206213433.11305-5-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191206213433.11305-5-wainersm@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="10jrOL3x2xqLmOsH"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: fam@euphon.net, ehabkost@redhat.com, alex.bennee@linaro.org,
 qemu-devel@nongnu.org, philmd@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--10jrOL3x2xqLmOsH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2019 at 04:34:33PM -0500, Wainer dos Santos Moschetta wrote=
:
> This adds a method to check if the tcg accelerator is enabled
> in the QEMU binary.
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  python/qemu/accel.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/python/qemu/accel.py b/python/qemu/accel.py
> index 9fecffb44b..f4ff31825d 100644
> --- a/python/qemu/accel.py
> +++ b/python/qemu/accel.py
> @@ -67,3 +67,11 @@ def kvm_available(target_arch=3DNone, qemu_bin=3DNone)=
:
>      if qemu_bin and "kvm" not in list_accel(qemu_bin):
>          return False
>      return True
> +
> +def tcg_available(qemu_bin):
> +    """
> +    Check if TCG is available.
> +
> +    @param qemu_bin (str): path to the QEMU binary
> +    """
> +    return 'tcg' in list_accel(qemu_bin)
> --=20
> 2.21.0
>=20

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--10jrOL3x2xqLmOsH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl3u8kcACgkQZX6NM6Xy
CfPcFQ/+Itv9+qcyo7AlTScK2q2bGjUjeuHzzdmcu/fRqU/+UtlXIJZBJ1QVvdbD
ZA9WqM4JEBepJt4i+Xv/CRUcb+GpPSDcKdOD4X+Q54pMcA0kq7mTZO5NX6z7hq3u
ugbfgTpgHhhq5hQEpyL4jBqPIw9vg9LyXQmok5eXD8vBKvsGD8TCfKZBAmAGGcY1
jZaY4XuRi15ef4Xh4WYkWg+rmh9hIaTzOgfqkPFJRD7LUhUABD6IXY6HjSncc8PR
X9KcURwQy3FY6Od89dDUopO8WhYprtwgUw8O9/MLPNqryZPTaSd0DD61RYRTv8vp
vEUYahjAobjz+mxYatTBprW/11OU4vE+IN3+jVGdY6Y5kURcMVdl0gpqZmnV03FH
vesJUoxtqce6NeauX25CmfkR6XdU4A7LxT9yJZRMcghcwM4+dADWUTtuyO8PB12v
6c4f7H+jOlIomY83LbUFmSLEAeL0e+sDVEDzbIJkPgA0/1zYKbyqZneX7OUiE61g
giJ6Lgk/KRbSs4jBDZN0GG7gm1CHqlgfsSeUyhyA5bexGlOuVxkkuH1fxN2sLL3a
qghPo42vawxVgTHks3syCJV3pGEjOuuTgvzhxSNiANA+RW4sz6LDWnOcyNuhPVYi
vH8kElHznZLIDXie8K1dcJ0zbnnKnsXllsNCeJOe5TlA0HTAGc8=
=YOgg
-----END PGP SIGNATURE-----

--10jrOL3x2xqLmOsH--


