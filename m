Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B714EEBFE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 13:04:35 +0200 (CEST)
Received: from localhost ([::1]:35238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naF50-0001kr-Ms
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 07:04:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naF1D-0008Rx-Jv
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:00:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naF19-0006Zm-GI
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648810834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1mcgm1eS7sojcyzEsSoSbO/MnKUJySCTuiO198NKGBc=;
 b=gZy8D7o8PCw6rnyBCLVtEN9RwLsFAYXHLbMyhqlW4R2E0Cm5zsLR9akkp9eZcMig8k8sm3
 j5oRO3H1g+SkO9kBtHcgAzv1dks4v+fMwm+Bb54EFXiWBC+UKHOGJZ7g75HSM7Ll/nEjMP
 v8dh+MUjUP7D1VFKBtjfzBsVKd/Zlz8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-Q09pF2zkM5Sqfl4ov4N_Ug-1; Fri, 01 Apr 2022 07:00:31 -0400
X-MC-Unique: Q09pF2zkM5Sqfl4ov4N_Ug-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 247F3185A79C
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 11:00:31 +0000 (UTC)
Received: from localhost (unknown [10.40.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF0795E2546;
 Fri,  1 Apr 2022 11:00:30 +0000 (UTC)
Date: Fri, 1 Apr 2022 13:00:29 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 10/9] qapi: Fix calc-dirty-rate example
Message-ID: <20220401110029.b25kbjcldwnhzo2y@tapioca>
References: <20220331190633.121077-1-victortoso@redhat.com>
 <20220401082028.3583296-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ys3evrjacr4pqywx"
Content-Disposition: inline
In-Reply-To: <20220401082028.3583296-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ys3evrjacr4pqywx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2022 at 10:20:28AM +0200, Markus Armbruster wrote:
> The example shows {"command": ...}, which is wrong.  Fix it to
> {"execute": ...}.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/migration.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/qapi/migration.json b/qapi/migration.json
> index f74777608a..27d7b28158 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1845,7 +1845,7 @@
>  # Since: 5.2
>  #
>  # Example:
> -#   {"command": "calc-dirty-rate", "arguments": {"calc-time": 1,
> +#   {"execute": "calc-dirty-rate", "arguments": {"calc-time": 1,
>  #                                                'sample-pages': 512} }
>  #
>  ##
> --=20
> 2.35.1

Reviewed-by: Victor Toso <victortoso@redhat.com>

Cheers,
Victor

--ys3evrjacr4pqywx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJG200ACgkQl9kSPeN6
SE/QgA/+NKjg13NFsyILckZIoYrQ8cMlXmw21THNsRKmu58KdMGP6beB6fWXOqbd
tB/5TMLAcwVqcY1ZCnO27M2tjnIF+BNp3UqNNUQ3E41KRt2FGZ1EJXFF/6uwrgGR
Ldy7DWL7XP/rADkNC2yh6ERLR1Jq8oPStVDpQvIAEUUurXFmPP2Egpp+ZpJyeCvG
19xn+dFrjrJdmBY0+t7LxnXjyOOOUraRlg8X2xLxR46DWZIBXRhQ727P1OiB5X1P
m0KZFiIKQ7yAhot5FRRF412RxNsMp+0dSnf/B92MsHZBtcGv+WKTommqYeP8EMY5
kwBOB5NiJw6IGecsPF1PAd+sC055bMK+atRqt0tVjEod1blT01vG+0+uTKcl6CmU
9/O9Bhoy80SDa97mH1BAQduLi1/Y7wlXwPk4655RXUgqsuMwKlDi4ASm+qzkUggl
TUFGobZ1LQxybJDSDmcdkx8JY6r4eKxdcG//v4mBPZGQxDmPnOR+6z2CGA4Xyojy
fP6zI4aWa+/sZFMWpG1fi/HOet4NglD2wwTCOFnKDuwSPcpMs9QkcfJG39qZKAEr
i944XW9EbaZejCrRGxMvme1A5Ysul389XJEEfUGeXBN9qX3c/IzYPU9WTu1V6Tpj
xEgHLvXvoWnsO1jJc7h985FKfsOd18x+NV0Sv0R/L+XeuhsDDww=
=2Ttn
-----END PGP SIGNATURE-----

--ys3evrjacr4pqywx--


