Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DE554DE46
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 11:38:14 +0200 (CEST)
Received: from localhost ([::1]:39354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lx6-0004WR-Ly
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 05:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.pour@hetzner.com>)
 id 1o1lsv-0002GS-Ch; Thu, 16 Jun 2022 05:33:53 -0400
Received: from mail.hetzner.company ([2a01:4f8:d0a:203a::1]:50892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.pour@hetzner.com>)
 id 1o1lss-0003p1-9l; Thu, 16 Jun 2022 05:33:52 -0400
Received: from [2a01:4f8:0:a53b:9775:b751:8e88:cd9d]
 (helo=[IPV6:2a01:4f8:0:a63b:9775:b751:8e88:cd9d])
 by mail.hetzner.company with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <raphael.pour@hetzner.com>)
 id 1o1lsj-0004zl-12; Thu, 16 Jun 2022 11:33:41 +0200
Message-ID: <eb151a37-c471-6c65-c399-a332911d0d2a@hetzner.com>
Date: Thu, 16 Jun 2022 11:33:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
In-Reply-To: <20220413122656.3070251-1-raphael.pour@hetzner.com>
From: Raphael Pour <raphael.pour@hetzner.com>
Autocrypt: addr=raphael.pour@hetzner.com; keydata=
 xjMEXmXjyxYJKwYBBAHaRw8BAQdAtiEYnlLIuIUjvvqOH//nEbhrxSa54ZyAl7Iel403QaXN
 J1JhcGhhZWwgUG91ciA8cmFwaGFlbC5wb3VyQGhldHpuZXIuY29tPsKWBBMWCAA+FiEEvj4O
 DnHb6pxm/uWJzbHrt4XF634FAl5l48sCGwMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwECHgEC
 F4AACgkQzbHrt4XF635TcwD+NEMqL1HZPHP/WRsYujCDtqt0p+7uxGcpvzv//AjqMZ0A+wUh
 0bOYYNdlXWNMMNLA88SsAT2mxAfD+F/paVmLpdoLzjgEXmXjyxIKKwYBBAGXVQEFAQEHQB0z
 JYP6jtTj989IJL1vguinsiIxia5fkW83OB1+Bb4QAwEIB8J+BBgWCAAmFiEEvj4ODnHb6pxm
 /uWJzbHrt4XF634FAl5l48sCGwwFCQlmAYAACgkQzbHrt4XF6372LgEAi3qfceU+R53Ehg/Y
 SSHV4wg+zfPwrD6ylEg/xKabYDcBALrD0E3YX458RPjLIOC8H0u0rcFIvBqNYx/kGaMEmbEG
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:RBD" <qemu-block@nongnu.org>,
 Peter Lieven <pl@kamp.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Subject: [PATCH] block/rbd: support driver-specific reopen
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dZOu0pmNSH5em00wtD8ECh2u"
X-Authenticated-Sender: raphael.pour@hetzner.com
Received-SPF: pass client-ip=2a01:4f8:d0a:203a::1;
 envelope-from=raphael.pour@hetzner.com; helo=mail.hetzner.company
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dZOu0pmNSH5em00wtD8ECh2u
Content-Type: multipart/mixed; boundary="------------FSuViYRQirzdxQswIhDM09DY";
 protected-headers="v1"
From: Raphael Pour <raphael.pour@hetzner.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:RBD" <qemu-block@nongnu.org>,
 Peter Lieven <pl@kamp.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Message-ID: <eb151a37-c471-6c65-c399-a332911d0d2a@hetzner.com>
Subject: [PATCH] block/rbd: support driver-specific reopen

--------------FSuViYRQirzdxQswIhDM09DY
Content-Type: multipart/mixed; boundary="------------oyTYU70EqLpSrmHPkqvXsh6z"

--------------oyTYU70EqLpSrmHPkqvXsh6z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gZXZlcnlvbmUsDQoNCndoYXQgZG8geW91IHRoaW5rPyBUZWxsIG1lIGlmIHNvbWV0
aGluZyBuZWVkcyB0byBiZSBjbGFyaWZpZWQgb3IgaW1wcm92ZWQuDQoNClJhcGhhZWwNCg==

--------------oyTYU70EqLpSrmHPkqvXsh6z
Content-Type: application/pgp-keys; name="OpenPGP_0xCDB1EBB785C5EB7E.asc"
Content-Disposition: attachment; filename="OpenPGP_0xCDB1EBB785C5EB7E.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEXmXjyxYJKwYBBAHaRw8BAQdAtiEYnlLIuIUjvvqOH//nEbhrxSa54ZyAl7Ie
l403QaXNJ1JhcGhhZWwgUG91ciA8cmFwaGFlbC5wb3VyQGhldHpuZXIuY29tPsKW
BBMWCAA+FiEEvj4ODnHb6pxm/uWJzbHrt4XF634FAl5l48sCGwMFCQlmAYAFCwkI
BwIGFQoJCAsCBBYCAwECHgECF4AACgkQzbHrt4XF635TcwD+NEMqL1HZPHP/WRsY
ujCDtqt0p+7uxGcpvzv//AjqMZ0A+wUh0bOYYNdlXWNMMNLA88SsAT2mxAfD+F/p
aVmLpdoLzjgEXmXjyxIKKwYBBAGXVQEFAQEHQB0zJYP6jtTj989IJL1vguinsiIx
ia5fkW83OB1+Bb4QAwEIB8J+BBgWCAAmFiEEvj4ODnHb6pxm/uWJzbHrt4XF634F
Al5l48sCGwwFCQlmAYAACgkQzbHrt4XF6372LgEAi3qfceU+R53Ehg/YSSHV4wg+
zfPwrD6ylEg/xKabYDcBALrD0E3YX458RPjLIOC8H0u0rcFIvBqNYx/kGaMEmbEG
=3D3kgq
-----END PGP PUBLIC KEY BLOCK-----

--------------oyTYU70EqLpSrmHPkqvXsh6z--

--------------FSuViYRQirzdxQswIhDM09DY--

--------------dZOu0pmNSH5em00wtD8ECh2u
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS+Pg4OcdvqnGb+5YnNseu3hcXrfgUCYqr48QUDAAAAAAAKCRDNseu3hcXrfoCm
AQDoTyUMN9UmLFEnsFgCaoAhB1SAnvBUqJ9zNm7QGYr5OgEA/Za+F6GzT+NRZQzf9a3XpAZfO/Xm
+js+JWTC3vff+wI=
=neJh
-----END PGP SIGNATURE-----

--------------dZOu0pmNSH5em00wtD8ECh2u--

