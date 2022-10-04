Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E23C5F3E95
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 10:41:23 +0200 (CEST)
Received: from localhost ([::1]:38792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofdUP-000759-Nm
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 04:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1ofd3a-0001xD-GV
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:13:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1ofd3M-00072c-QG
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:13:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664871201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q/Z4B5NIEXqoR81UfxKB23lVvlF77Gt/fnO1VkG6ZAA=;
 b=YpzTQXQzcHx1tVTzD6xk3acUvqYwIfrnBricILPa7TfxkaDRQFxyP1332RWZtvpw7TSGj4
 Zw2RNEKcsp53s6kW3T1QeBxT1o4mBYeJ/TcSC1C3NWO24JPdtBjyNT6cGw2pDISx3POopW
 dDXMs8Pkl+PLQdRVuWZHqVNcWoPUIi4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-SRpQykvVOV6grrl18lqbNg-1; Tue, 04 Oct 2022 04:13:19 -0400
X-MC-Unique: SRpQykvVOV6grrl18lqbNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 026E6299E74F
 for <qemu-devel@nongnu.org>; Tue,  4 Oct 2022 08:13:19 +0000 (UTC)
Received: from localhost (unknown [10.40.194.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2731415137;
 Tue,  4 Oct 2022 08:13:18 +0000 (UTC)
Date: Tue, 4 Oct 2022 10:13:17 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com
Subject: Re: [PATCH] Revert "qapi: fix examples of blockdev-add with qcow2"
Message-ID: <20221004081317.m7zewxcqbwabntkr@tapioca>
References: <20220930171908.846769-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w2mnxtnrvvaf37pu"
Content-Disposition: inline
In-Reply-To: <20220930171908.846769-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--w2mnxtnrvvaf37pu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry taking some time to reply.

On Fri, Sep 30, 2022 at 07:19:08PM +0200, Markus Armbruster wrote:
> This reverts commit b6522938327141235b97ab38e40c6c4512587373.

Which is:
```
  qapi: fix examples of blockdev-add with qcow2

  The examples use "qcow2" driver with the wrong member name for
  BlockdevRef alternate type. This patch changes all wrong member names
  from "file" to "data-file" which is the correct member name in
  BlockdevOptionsQcow2 for the BlockdevRef field.

  Problem was noticed when using the example as a test case for Go
  bindings.
```

> Kevin Wolf NAKed this patch, because:
>
>     'file' is a required member (defined in BlockdevOptionsGenericFormat),
>     removing it makes the example invalid. 'data-file' is only an additio=
nal
>     optional member to be used for external data files (i.e. when the gue=
st
>     data is kept separate from the metadata in the .qcow2 file).

You are correct. I apologize for the mistake. I trusted a bit too
much on the Go bindings and didn't realize that @file member was
actually present:
    @BlockdevOptionsQcow2 >
    @BlockdevOptionsGenericCOWFormat >
    @BlockdevOptionsGenericCOWFormat >
    @BlockdevOptionsGenericFormat

> However, it had already been merged then.  Revert.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Victor Toso <victortoso@redhat.com>

> ---
>  qapi/block-core.json | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index f21fa235f2..882b266532 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1541,8 +1541,8 @@
>  # -> { "execute": "blockdev-add",
>  #      "arguments": { "driver": "qcow2",
>  #                     "node-name": "node1534",
> -#                     "data-file": { "driver": "file",
> -#                                    "filename": "hd1.qcow2" },
> +#                     "file": { "driver": "file",
> +#                               "filename": "hd1.qcow2" },
>  #                     "backing": null } }
>  #
>  # <- { "return": {} }
> @@ -4378,7 +4378,7 @@
>  #      "arguments": {
>  #           "driver": "qcow2",
>  #           "node-name": "test1",
> -#           "data-file": {
> +#           "file": {
>  #               "driver": "file",
>  #               "filename": "test.qcow2"
>  #            }
> @@ -4395,7 +4395,7 @@
>  #           "cache": {
>  #              "direct": true
>  #            },
> -#           "data-file": {
> +#            "file": {
>  #              "driver": "file",
>  #              "filename": "/tmp/test.qcow2"
>  #            },
> @@ -4477,7 +4477,7 @@
>  #      "arguments": {
>  #           "driver": "qcow2",
>  #           "node-name": "node0",
> -#           "data-file": {
> +#           "file": {
>  #               "driver": "file",
>  #               "filename": "test.qcow2"
>  #           }
> --=20
> 2.37.2
>=20

--w2mnxtnrvvaf37pu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmM76x0ACgkQl9kSPeN6
SE/COQ/9HG2bLlVmZVCLqDLBlLwN5g2N3yXbMmaZB54OshxEvM9L9vE44nn0nqTy
b1pRAss6M5Mi3yn+H37+jq+0XoOOF9C+d4tv1PU2rjg3Vc+TtmVzQ7C2Npt0dr2+
S81IlR0pdVS92OYZhDJhhkdDSivdIjGogqkYlxnjctk6bX0eFXrLiXmMBTyTRn+s
a7IdCqRF6r/JvPNqaiB/ugv5A4/wn2NTH+pn7fzH9W9wg6so31qQdcer646GsDsW
Vgs1JIAKy6JPG9QZSd0jl/08TxKdWUE/FTruG1vwt2pmKWxrO/e/ns1F0DN0O+3S
B7gv0Dz2gUwrsIr1QAFtkosUfqW8YzwtKcFWj1hDaNURG6toOGoQcTlYTmK7ES2Q
dafv1rDhcv1rczBeK+Swc7Bto0TOC24EeZbS4kwz7dhkaWbbpwDTRGe8nrId59AW
ena2DreDcY/BoYNZpluZskxgFOO0FXj57HExgVK7+tlLqW/xPhXmq0ldPBACZ/J1
LL6saX1BwAx16Zi5kz3O76icNHgH77M4fgmVsB9Y4jtCI6ZyumcGDpC6gWbmFcot
r0EfJ/o3gOiWXDD8gvSJ2JGUSo2spgyJsxA6sP4AxlanQRrzJxGQqQZkGwLb0KM9
0q72+XRfiPc6D7viKJmrLq8IcP/FuuGynjyIblMsjiuwkw5ebp0=
=b133
-----END PGP SIGNATURE-----

--w2mnxtnrvvaf37pu--


