Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8D62758B0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 15:28:52 +0200 (CEST)
Received: from localhost ([::1]:37320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL4pH-0001CI-BC
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 09:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kL4oE-0000hd-GZ
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 09:27:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kL4oC-0004bu-21
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 09:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600867661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dHpkkORT3nk2wlVZ/X3NZDAQbRPpzoU2x6y7Fj4LjpA=;
 b=bEctRATsM26aftCJ/UbH4DaBB/q+O4BWuFpcuzjh5neahrnwKm8jv3zQU2t1RVyyDN8hXN
 bbT8obUwZaiDLLKaEt8sB83f27y42X9UerCTt6YLkYNAFgISKMCCsaaGTVNQu+L6DgPinE
 ghegfbihjhe8hTZ9kKuZVP/EJV0h8ac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-osHhzzdzNPWtbG3GdRxFvQ-1; Wed, 23 Sep 2020 09:27:39 -0400
X-MC-Unique: osHhzzdzNPWtbG3GdRxFvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE132100A60E;
 Wed, 23 Sep 2020 13:27:37 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01C6F60C04;
 Wed, 23 Sep 2020 13:27:36 +0000 (UTC)
Date: Wed, 23 Sep 2020 09:27:35 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 05/38] qapi: Remove wildcard includes
Message-ID: <20200923132735.GE191229@localhost.localdomain>
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-6-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200922210101.4081073-6-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Q8BnQc91gJZX4vDc"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Q8BnQc91gJZX4vDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 05:00:28PM -0400, John Snow wrote:
> Wildcard includes become hard to manage when refactoring and dealing
> with circular dependencies with strictly typed mypy.
>=20
> flake8 also flags each one as a warning, as it is not smart enough to
> know which names exist in the imported file.
>=20
> Remove them and include things explicitly by name instead.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/commands.py   |  6 +++++-
>  scripts/qapi/events.py     |  7 ++++++-
>  scripts/qapi/gen.py        | 12 +++++++++---
>  scripts/qapi/introspect.py |  7 ++++++-
>  scripts/qapi/types.py      |  8 +++++++-
>  scripts/qapi/visit.py      | 10 +++++++++-
>  6 files changed, 42 insertions(+), 8 deletions(-)
>=20
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index ce5926146a..e1df0e341f 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -13,7 +13,11 @@
>  See the COPYING file in the top-level directory.
>  """
> =20
> -from .common import *
> +from .common import (
> +    build_params,
> +    c_name,
> +    mcgen,
> +)
>  from .gen import QAPIGenCCode, QAPISchemaModularCVisitor, ifcontext
> =20
> =20

Is this import style being suggested or enforced by any tool?  I've
been using isort with very good results (both as a check tool, and as
an emacs extension).  For instance, the block about would look like:

   from .common import build_params, c_name, mcgen
   from .gen import QAPIGenCCode, QAPISchemaModularCVisitor, ifcontext

> diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> index 0467272438..6b3afa14d7 100644
> --- a/scripts/qapi/events.py
> +++ b/scripts/qapi/events.py
> @@ -12,7 +12,12 @@
>  See the COPYING file in the top-level directory.
>  """
> =20
> -from .common import *
> +from .common import (
> +    build_params,
> +    c_enum_const,
> +    c_name,
> +    mcgen,
> +)
>  from .gen import QAPISchemaModularCVisitor, ifcontext
>  from .schema import QAPISchemaEnumMember
>  from .types import gen_enum, gen_enum_lookup
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 8df19a0df0..11472ba043 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -11,13 +11,19 @@
>  # This work is licensed under the terms of the GNU GPL, version 2.
>  # See the COPYING file in the top-level directory.
> =20
> -
> +from contextlib import contextmanager
>  import errno
>  import os
>  import re
> -from contextlib import contextmanager
> =20
> -from .common import *
> +from .common import (
> +    c_fname,
> +    gen_endif,
> +    gen_if,
> +    guardend,
> +    guardstart,
> +    mcgen,
> +)
>  from .schema import QAPISchemaVisitor
> =20
> =20
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 2a34cd1e8e..b036fcf9ce 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -10,7 +10,12 @@
>  See the COPYING file in the top-level directory.
>  """
> =20
> -from .common import *
> +from .common import (
> +    c_name,
> +    gen_endif,
> +    gen_if,
> +    mcgen,
> +)
>  from .gen import QAPISchemaMonolithicCVisitor
>  from .schema import (QAPISchemaArrayType, QAPISchemaBuiltinType,
>                       QAPISchemaType)
> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> index ca9a5aacb3..53b47f9e58 100644
> --- a/scripts/qapi/types.py
> +++ b/scripts/qapi/types.py
> @@ -13,7 +13,13 @@
>  # See the COPYING file in the top-level directory.
>  """
> =20
> -from .common import *
> +from .common import (
> +    c_enum_const,
> +    c_name,
> +    gen_endif,
> +    gen_if,
> +    mcgen,
> +)
>  from .gen import QAPISchemaModularCVisitor, ifcontext
>  from .schema import QAPISchemaEnumMember, QAPISchemaObjectType
> =20
> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index 7850f6e848..ea277e7704 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -13,7 +13,15 @@
>  See the COPYING file in the top-level directory.
>  """
> =20
> -from .common import *
> +from .common import (
> +    c_enum_const,
> +    c_name,
> +    gen_endif,
> +    gen_if,
> +    mcgen,
> +    pop_indent,
> +    push_indent,
> +)

And here, isort will add the paranthesis (it does so based on space demands=
):

   from .common import (c_enum_const, c_name, gen_endif, gen_if, mcgen,
                        pop_indent, push_indent)
   from .gen import QAPISchemaModularCVisitor, ifcontext
   from .schema import QAPISchemaObjectType

Other than those suggestions, it LGTM.

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--Q8BnQc91gJZX4vDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl9rTUQACgkQZX6NM6Xy
CfMkYw/8Coe+qqh6HENVxUtJvSg8lo1tI53GcCo3OdFuoZs9xjcWxAh9Qj0bCDei
pp2Cu/3Xu4qoPOTFrSRb7pH2oXfc7Bqm17E9rAucrE11dceKGIP+lB+0+LuP3AR7
okocH6TOvDrsySOD5q4MAggZvT/CmR8asguBWJ4lgexkPSO+t8zRDkkxMEEVejTX
b5N9w8s6Uwgc3lZrMsBpTuC90pU5LcrfHfnIOhx8xRH+A4BjccxpS1tNcPpi9DCY
5dJ5O/uacp7TmhWIT/LIy/hyae/XSUvLIcHqZgiKcDJFtL7L+4GpcGTHnpxTTLFc
04dANaOmbgOQTfVRqStURSh5kmd8wbgz4P3qqcJUX8gLKIdUOFF20Bo0D6wJ2krV
fFFvjaI6mOcRtBPurhVhqiHLjuTqvH5Aksr8TyUkqzJyGrJRp2B8x6JebpjCauwn
VVOOKuteYCYgxLrqMpGoJWZghFdhIyG1MnJNwJIabuQQn2Aq/kGIKZo8QHfIrC8L
vFJhKgjv3aAwdPbHaUsoUlkiM4q64V7cVxKZBZJn1wyBQ4ev4u8DEKOJqSeYPMyr
oL+P+ZBD3Iu+iccDt9go678ip4/Vf9fCS4Rau1dLCe1I/noX52WuCbEZ2Fg4iNnK
YLqVWTlAFD1xuWW/WwfEWjDLbFqxwWpQNL1s3Nv1nI5NbceHP/A=
=i0B2
-----END PGP SIGNATURE-----

--Q8BnQc91gJZX4vDc--


