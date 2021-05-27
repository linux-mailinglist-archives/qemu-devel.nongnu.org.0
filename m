Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E36039339A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:22:46 +0200 (CEST)
Received: from localhost ([::1]:36992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmImT-0007UW-99
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIkI-0004mn-GC
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIiL-0006GA-Aj
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622132308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QP1E1/U5qQD1XEszNKIwgTXKSMrzd0jX0MDI5yXNIm8=;
 b=ONTZBHUZu3jfFTzOSa4UjJWf9/6s3QRe26ClQhIx0WLX4lpybFrEuL2CAwNtuxMK6JPWGu
 Xt4OpIfGTcJDwapaaFoPnpJSsBSjnu9Ah8JGUmMH2soYaSUVpP1WkAzaO0MoiqrYpeLzCX
 HU1rThW7tmNB+63yN56a8n2znPFv/eU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-U9_gfN8EMZCQIOTQBwGJLw-1; Thu, 27 May 2021 12:18:25 -0400
X-MC-Unique: U9_gfN8EMZCQIOTQBwGJLw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC90F5131;
 Thu, 27 May 2021 16:18:24 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 819B317A7A;
 Thu, 27 May 2021 16:18:23 +0000 (UTC)
Date: Thu, 27 May 2021 12:01:22 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v7 07/31] python/machine: Trim line length to below 80
 chars
Message-ID: <20210527160122.GA1916721@amachine.somewhere>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-8-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210526002454.124728-8-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 08:24:30PM -0400, John Snow wrote:
> One more little delinting fix that snuck in.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCvwk8ACgkQZX6NM6Xy
CfPYxw/+NiKVxqnXPEfIQT0U2bc89QV3w0cJigt+Tac5BYJ1m2+XqjgoqAJYuHsW
oyW4l6eJocZ84iLHaqrfOH+aNjUlk9w2IEnkcs5Z5HFuEM8KbB/n+LvSYbsTMK0r
0grLhZQ1ROZU7ksJYPKdDMfQfuKuXKT/GAzYW0q+RgHFZjWJwhE3jYLSIe2BZdQP
xlExFFXmniEKHMbI0AWqmLOkbZm9cqJgj4ns1QtHIQNNP8NmueSOYe79LGDwYZuU
rZt1DRgfMVm6Ut4DX3YYNu1RA1sTt8DbdV4WZ6H/n7nI6yotehYfGj76S1TFaiU2
N4BmVDWrIPEi+rbhh6dRq2U4jacHG3xuy8LLCZo8AMQoJQaeevwd5E0EMl2rCVOh
lgFxPuK6ObPTAa8PF0fS87uaiiGfCZWVZI/L+1KS7zBC8VsOCRdHx2bTas70+eHS
nY65h3GA8bOfInJ14oDK8rgBUjZt9RcD0FtvGBg532YEByXAWusrqoWHBFJbkLxg
WHbnujRahBqzGvJO3Q9VXmFVaaPWANyg8p2VdYiqdQCRYkZGYiAwv57uebEwzbVL
GowW3QIupuAOcTuGGleNaAbqIlILvoKqz2CDjw2SVb+duOfqEkvNM6WyLIGJ1Xb0
SwgPSItw+uHKgZ/7+eLSdpG1qXFrRp63cSyl2FPSt37DLb9PASU=
=FJ30
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--


