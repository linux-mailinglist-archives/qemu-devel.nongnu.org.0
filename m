Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A86F78CF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 00:12:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puhAT-0003Es-HD; Thu, 04 May 2023 18:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1puhAR-0003DE-Jn
 for qemu-devel@nongnu.org; Thu, 04 May 2023 18:11:15 -0400
Received: from mout.web.de ([212.227.17.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1puhAP-0002bL-OP
 for qemu-devel@nongnu.org; Thu, 04 May 2023 18:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683238265; i=lukasstraub2@web.de;
 bh=KZD9LRCcCHukAFCJ09WgeW2DeCK3LXQfUeY0LW1LYnw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=aGUM1P55vDcFoPYrKt46ds7cF4qEgDIaP3iJ6YGHXKOaTn4/jISql9/PyDabH6+7y
 NDGvE/Bz67BNuzyFivUn3OnbDnrwN9tW4e7X1JR6gOqW7SZ+eBCNl66yo+VrXDcfAA
 VKdWXvpilAToHJ4FCVcQE31PsYy9t28Or0xN19T+CUFzkPXqz64Y4R+q6vlQV7xdll
 g6RIbQkVRDdP8uhwrvQIkUFxKXwI1Lo50S+ZhRz9AE49lP+UTiPSeG8tzGals9vreU
 MuRhVyzQ6M1gw4QKARFhCG/HVFvxwzLApUfRRnKb2oG37AKHMAe3HJrdEoIn5vsu0T
 qu5ufDmG032CQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.112]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mq1CC-1qYxv03Am2-00nCtB; Fri, 05
 May 2023 00:11:04 +0200
Date: Fri, 5 May 2023 00:10:54 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, chen.zhang@intel.com, Peter
 Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 10/10] migration: block incoming colo when capability
 is disabled
Message-ID: <20230504221054.616e4fe6@gecko.fritz.box>
In-Reply-To: <20230428194928.1426370-11-vsementsov@yandex-team.ru>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-11-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O7EE9SqN8Fug7_j5ZA95U1.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:C3BLSfRKG+qDv8xUpYEhPfc/+s6v7xJtwdCfKl+MYITExuJsbky
 oe31RMVBz3RFf1iQ5Cyj1oFfzT38hbxa553oquezVO/wnKCUKOlw5zu3wPCzllPF0GvWJJQ
 j31fVzhdqCXcyEnz7OtCC9kDlfIMG1+VXAGZoT/wXxcjnAipPmKW07Ok920tPQDx6WVyvyq
 DTEJKZ9wCjaMv31mSqn0A==
UI-OutboundReport: notjunk:1;M01:P0:yXONtsax/2o=;pDvnSN4u+ulmSs6M4tdMZAw9Edj
 2d2/zDVxDQwSsKQy8O62nkAUY2pCneI7LDxBEqRQIhyfwk5L7EZmkEiKdU1CL8hXO4f135WX6
 0YKL8KLYYL4TG7U0VwQ4kZeWFPQ6EbxXJaOnBzvmZwjDcgk5EtZR1BIeP7d1SBbv7+J6BS5jM
 HRG6pv94pcG3IfzCyjYzZNGmbqL8/lTbNy28awwY65rz193uGhPpC9uo8XMmBXN9Ugwp3v0no
 h9LMVpBgoqbYYbUCn7LIs9SOpsR3tFCWrn3m5KZ3OMiDqHPZswiW3b2lcwaY8hRkqJGbd7n+K
 ipvmf0di5oC9RmtaOzWo1q+/0weahvZlipkeua75kU02BVgA/MWy3tB7jWOZKNdNeikkshpj0
 sNjO91DDSO9C28iV/vEfnmuQdh4nb2XraqaNctfM2ZLwYReXqA7nR2Z7JGkiw75pQyfdPU1Sz
 l4pnBhG+9F1veukrUvxoHBMLn+b5lFb73re8/NL0DgSLdJfijdCzWsrjGdn7cdRNVvCvCFBko
 6TV3mxC5f/NZ7dumclrCe/8N1GvTZwEYz/05c5RwA1yj8XCD2FijxxM2nJMPGSjXu7cAWlIAj
 Hsdw1p/6rQgpB1l6thVF7nkmabUXKzFHHMfzqYhdOFpFiq+7oKO09soZVRrSevMSOY0UvOhQ9
 f02mLYBWqednHrJ1c2Zbbv6SiHHojLF91gE3qbX1f0URk3StS2zQaHw4E+gLA/HdAAUAkFXCF
 dv1waUp5kddpScnYwmhDsJdo6TL/8Sk9YPhX9q2y+s1zVN8h2lQIQT7uckeQk4i1/DRKraJEi
 buqtfKPpyKaCRuyh44mncPnYoZrSiB5BUgW2FxYQFDZQhS6GpnVlAEgbp7t+MfCrJUuctBFXg
 Jkz5M1HqvINhNtD3aDRn2wTxFSJ/Q4ePeP1FLUlzmzIeBmF1rJQIKCEmjVCq1tonaxEet9/08
 8PcoiJH3/3sX9hKqvXMnIchXeDU=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/O7EE9SqN8Fug7_j5ZA95U1.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Apr 2023 22:49:28 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:

> We generally require same set of capabilities on source and target.
> Let's require x-colo capability to use COLO on target.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Good patch, this is needed anyway for COLO with multifd.

Also, it allows to remove a some code, like
migration_incoming_enable_colo(), qemu_savevm_send_colo_enable() etc.
I will send patches for that. Or you can do it if you like.

Please update the docs like below, then:
Reviewed-by: Lukas Straub <lukasstraub2@web.de>

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index 8ec653f81c..2e760a4aee 100644
--- a/docs/COLO-FT.txt
+++ b/docs/COLO-FT.txt
@@ -210,6 +210,7 @@ children.0=3Dchilds0 \
=20
 3. On Secondary VM's QEMU monitor, issue command
 {"execute":"qmp_capabilities"}
+{"execute": "migrate-set-capabilities", "arguments": {"capabilities": [ {"=
capability": "x-colo", "state": true } ] } }
 {"execute": "nbd-server-start", "arguments": {"addr": {"type": "inet", "da=
ta": {"host": "0.0.0.0", "port": "9999"} } } }
 {"execute": "nbd-server-add", "arguments": {"device": "parent0", "writable=
": true } }


> ---
>  migration/migration.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/migration/migration.c b/migration/migration.c
> index 8c5bbf3e94..5e162c0622 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -395,6 +395,12 @@ int migration_incoming_enable_colo(void)
>      return -ENOTSUP;
>  #endif
> =20
> +    if (!migrate_colo()) {
> +        error_report("ENABLE_COLO command come in migration stream, but =
c-colo "
> +                     "capability is not set");
> +        return -EINVAL;
> +    }
> +
>      if (ram_block_discard_disable(true)) {
>          error_report("COLO: cannot disable RAM discard");
>          return -EBUSY;



--=20


--Sig_/O7EE9SqN8Fug7_j5ZA95U1.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRULW4ACgkQNasLKJxd
slhd9g//dRpgGu8p4ZBaz32xdiQeIJZHabn4Bn7dwvUTlZLBPz4d2QsnrwpmcQJ5
iTOdK6t8TrdIpyW0gcV24H5igDU2TMAV5RdRhFEbJPf1fPeU2HTH9OM2w0DVYoMS
YWQ1r9N+eUOHawXf7soxYT8LofiBKxVwF937nGtGQzlf35EPJvr976JE3A9Jqye4
W3mDfsX2yKr9qyvBGBji9VTY3QKrPMW/dRNJQAm5Zo7phHNc/ed8XNwSTiMTeEDh
LiTUzORjNkUqAt3fOx6uM9VrIYSsSz54Xs2Q4VijBVelf7esluthW3BuG0IVW0hh
0Kst+ZwWLN5s3sqA2ICRcaEbv2KS4rOns7d8zoFwMzjcfKaaVjAQOjRX4AKFkjZq
/CVttx9slqKl4qzJL+ybEXDsiG1mUadogbqAiXwQrz4ercB1BexTOk/wKl1nhFKA
H9+4br+eCr3PGlo+839xwO5o6RO4fEBBRJw9bvyjwp4gIruSAbqsjPSmlypZhzOE
qnieU+SyshZroZbe2zILQLgd7zwPjFYw5jiJW0hCHs+z8Bj4uuRKCzjogLWM+YKt
iDSpbYfVbxa6czeYK4Bpa1FdpgOle5QW5iJLm8OrhiAf8Tbfki75OcKkviSA8VMM
h0oAcCJcV5EF4/O36QMXQvVr0EN3jQDTpwPcb+lvKdBjtgja7TY=
=/p3Z
-----END PGP SIGNATURE-----

--Sig_/O7EE9SqN8Fug7_j5ZA95U1.--

