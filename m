Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E314A35E76B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 22:09:05 +0200 (CEST)
Received: from localhost ([::1]:46646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWPLM-0001en-VW
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 16:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWPJy-0000lS-3B
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:07:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWPJv-00034C-TL
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618344454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h1kTwvZUJCVpH6Mv1ZWeZuUHlESleuA12pB8+hNypMA=;
 b=JS9rxsyer7l5TzSK2EyQTR4wo0iV5vaSg5eCL+IYJPel3Kx4yHgPtqGgqLvJ+cDcVjQpQg
 T9cQIgHi6kJkMlRV3zFX6QjaiDc4AvoJzYmqjLbgHi+436feGl9aJehbi3HSQd3Fupns57
 dRj90vkIBohP1InnxKRqqECjbkxtm0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-VHW-3OcNMrG4IlneVuKPkg-1; Tue, 13 Apr 2021 16:07:31 -0400
X-MC-Unique: VHW-3OcNMrG4IlneVuKPkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 737A283DD20
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 20:07:30 +0000 (UTC)
Received: from localhost (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A7DA5D9D0;
 Tue, 13 Apr 2021 20:07:29 +0000 (UTC)
Date: Tue, 13 Apr 2021 21:07:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH RFC 4/7] message: add QMP Message type
Message-ID: <YHX6AbETd6Idbq//@stefanha-x1.localdomain>
References: <20210413155553.2660523-1-jsnow@redhat.com>
 <20210413155553.2660523-5-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210413155553.2660523-5-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GmkueiTVkYIdGTBi"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: armbru@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--GmkueiTVkYIdGTBi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 11:55:50AM -0400, John Snow wrote:
> This is an abstraction that represents a single message either sent to
> or received from the server. It is used to subclass the
> AsyncProtocol(Generic[T]) type.
>=20
> It was written such that it can be populated by either raw data or by a
> dict, with the other form being generated on-demand, as-needed.
>=20
> It behaves almost exactly like a dict, but has some extra methods and a
> special constructor. (It should quack fairly convincingly.)
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  message.py | 196 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 196 insertions(+)
>  create mode 100644 message.py
>=20
> diff --git a/message.py b/message.py
> new file mode 100644
> index 0000000..5c7e828
> --- /dev/null
> +++ b/message.py
> @@ -0,0 +1,196 @@
> +"""
> +QMP Message format and errors.
> +
> +This module provides the `Message` class, which represents a single QMP
> +message sent to or from the server. Several error-classes that depend on
> +knowing the format of this message are also included here.
> +"""
> +
> +import json
> +from json import JSONDecodeError
> +from typing import (
> +    Dict,
> +    ItemsView,
> +    Iterable,
> +    KeysView,
> +    Optional,
> +    Union,
> +    ValuesView,
> +)
> +
> +from error import (
> +    DeserializationError,
> +    ProtocolError,
> +    UnexpectedTypeError,
> +)
> +
> +
> +class Message:
> +    """
> +    Represents a single QMP protocol message.
> +
> +    QMP uses JSON objects as its basic communicative unit; so this
> +    object behaves like a MutableMapping. It may be instantiated from
> +    either another mapping (like a dict), or from raw bytes that still
> +    need to be deserialized.
> +
> +    :param value: Initial value, if any.
> +    :param eager: When true, attempt to serialize (or deserialize) the
> +                  initial value immediately, such that conversion except=
ions
> +                  are raised during the call to the initialization metho=
d.
> +    """

Why define this class instead of using dicts? It's a very fancy way of
calling json.dumps() and json.loads().

--GmkueiTVkYIdGTBi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB1+gAACgkQnKSrs4Gr
c8iKpQf/VGY8HhwmqT0AO8nW65Y3Zj03IbGl0WCDjoPvZtCxnXWO/e6+Uign/ZPn
duimYSOIvA+KdluOdk6IgWJQ7utfUvuUFz5hA5dnbflNNK9I0iYQodCEduLU7NW+
u554lJqoX9/noK13Exte7FEjPClOeyZ/ftYu6nxuXE3M4GZaceBurtMfWDzy0Ikk
kQrC3ACRFhB2BwxgPrKFnkcYmHycqpkhrT1Gkq2Ueo27Kv5r6G0fKBnXkBXzdPi8
LeAhBFmmCmrkJa38D2On2uQdpjDXply2HOjZl520v3Fh3N5J/C7nJT9Tb9w4ZX3S
2LmAODamjkPvDjHTav8QuYGC4Lju5Q==
=I6VY
-----END PGP SIGNATURE-----

--GmkueiTVkYIdGTBi--


