Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F6651008D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 16:34:21 +0200 (CEST)
Received: from localhost ([::1]:35224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njMGi-000682-Dl
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 10:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1njMFo-0005Nb-F1
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:33:24 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1njMFm-0008Ns-Qz
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:33:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d5so10553136wrb.6
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OFhUgNZA9m4MM+64Knx9JT+BRkLgF4H2/kl1pwpLwEk=;
 b=aqE3lMX5kxG6PR3BsCDLL1nKAIw1Tgi4Hd81ykFYguIMi2yiD+XBEqwXN6WdQQI0v/
 s/Zpw0OD9fVW0y9TIpjeVha3UC1urT/rfel1yb4j6pF/SrLphYja5Gvl9b0EOUbEdgw7
 NjwfAcPyovQD4txoMqTivA9TWsBXZi46B/4aElcXiH/dPA/yDe4dn/orQ3xUwynFg/PS
 XZ06uDaKnuYJRouotzM/KIsNt+6qYFyPE+HkmGsB4AIGF4xXM5qR+JLKIsTaocqYowxu
 FNJTowB08ybOWc4BRmyCsYuAL9lQyB4FqJU9EWpLiSFgXqzqK2s4tGzRH7OJ3RpS2y72
 ag+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OFhUgNZA9m4MM+64Knx9JT+BRkLgF4H2/kl1pwpLwEk=;
 b=5kYd8KQmPhZWlRwYURQio0i3ho5paKn1ZuUzV3NdF6lxxj7xXUpErtPt/61XzWug1y
 iL3ps6LeO8XKEBSY+qi14mvygTQgp03qk8P9G+IAENTWcBBfsFrsRxG0MUGTte5FtN4b
 E32fKHbjJa/kbXKIL/gpj+RS4kBtLPa3C8RUHDnX3Qbj+uRXpyd1gAOtMhvdk/ms4oBX
 mCQWVX7TvtQgRc+cm4aqB7ZRPF/ZXEqPO6FS57XNNemrSkhElTomOnIPuTc7i7BeABt5
 tnzCsMDKMsx1pS0qZsFvus7dh8nCbjYJRfQjCsGTuifuNJ3k6miefLozLzGb2bxA8VL8
 AkBQ==
X-Gm-Message-State: AOAM532pLWvV/XLuqC6Bhj1hSOumPSeAiKjgFZZ5zt7V9ThF3qoxb8+q
 c8ZaG5CU9WnZeQvOen951CA=
X-Google-Smtp-Source: ABdhPJw8z5pZ1sqkMhkSkUg9OjB0CEKi/g0MGBpMG8wgsZsNWKS3w2Xh1ZprWFWQk2JLZz89+wU2xg==
X-Received: by 2002:adf:e0c5:0:b0:206:1ba3:26aa with SMTP id
 m5-20020adfe0c5000000b002061ba326aamr18381547wri.645.1650983600251; 
 Tue, 26 Apr 2022 07:33:20 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 20-20020a05600c22d400b0038c8dbdc1a3sm11266663wmg.38.2022.04.26.07.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 07:33:19 -0700 (PDT)
Date: Tue, 26 Apr 2022 15:33:18 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 26/26] util: rename qemu_*block() socket functions
Message-ID: <YmgCrkayyFod+JcS@stefanha-x1.localdomain>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-27-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jqys0Y7eGq2Gz6GP"
Content-Disposition: inline
In-Reply-To: <20220426092715.3931705-27-marcandre.lureau@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Coiby Xu <Coiby.Xu@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jqys0Y7eGq2Gz6GP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 01:27:15PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> The qemu_*block() functions are meant to be be used with sockets (the
> win32 implementation expects SOCKET)
>=20
> Over time, those functions where used with Win32 SOCKET or
> file-descriptors interchangeably. But for portability, they must only be
> used with socket-like file-descriptors. FDs can use
> g_unix_set_fd_nonblocking() instead.
>=20
> Rename the functions with "socket" in the name to prevent bad usages.
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/sockets.h                  |  6 +++---
>  chardev/char-socket.c                   |  2 +-
>  contrib/ivshmem-server/ivshmem-server.c |  2 +-
>  hw/hyperv/syndbg.c                      |  2 +-
>  hw/virtio/vhost-user.c                  |  2 +-
>  io/channel-socket.c                     |  6 +++---
>  net/l2tpv3.c                            |  2 +-
>  net/socket.c                            | 10 +++++-----
>  qga/channel-posix.c                     |  2 +-
>  tests/unit/socket-helpers.c             |  2 +-
>  tests/unit/test-crypto-tlssession.c     |  8 ++++----
>  util/oslib-posix.c                      |  8 ++++----
>  util/oslib-win32.c                      |  8 ++++----
>  util/vhost-user-server.c                |  4 ++--
>  14 files changed, 32 insertions(+), 32 deletions(-)

Thanks for fixing this!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--jqys0Y7eGq2Gz6GP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJoAq4ACgkQnKSrs4Gr
c8hQSgf9EewXxH7LssjNG5PpoaSX8S7KVPebLQm+BUbjGoSmB9UaDsh1R54lfUdf
f9D344IiY/tHZ+FtZ5z/Jeq/qn5BUfKuI0S8RW5G/aSThrZu1aSDSBa5KVbuXhbp
dD1QXmRx5bgrvih4ItDjjPZChWAiKRQMahKV168QzJaV3D0ZCh9b0nyTB2sUq2HP
Z60w+FwLw1Gmua2iaWvpd74te7Mp11nYlRqVmO1kcOQ5AEWLauCXbDL/sdlzNBzp
DVOfhT5gpKto4WZiU9Ge/OtSJQjs7Hh83Xhbn5dlT6sv2xt8BSjDMnpisN2PzTnu
xomgr621N6KkcuOsEUvpEY2c/gyUpw==
=M8x+
-----END PGP SIGNATURE-----

--jqys0Y7eGq2Gz6GP--

