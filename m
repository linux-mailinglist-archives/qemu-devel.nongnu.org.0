Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8764F10E3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 10:29:24 +0200 (CEST)
Received: from localhost ([::1]:48456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbI5S-0008U7-Sx
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 04:29:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nbI46-0007mj-Hi
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nbI43-0006wM-Ie
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649060874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HSWPp2qIrRJFr4x+PSouTf9vH3L4iwwYz4U9BUZdVzE=;
 b=ZtDUiBsJ0Vrv4A1eEjfNlNl/xz9MabcAL3v1AY3bayMO2lQz5XdoTcb//qOLSrB9JaB0ie
 FDIUuRHzBza+2g9VyNdfoCheAHfpOSHfIMMkub7iueEuVn6ee5KMHGmpgSulGZoORXu7rh
 A06FO03rVAWj78NAWL5wj4dZiAnzRpo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-RHGDh8M1M_yvD7uHnwcFYQ-1; Mon, 04 Apr 2022 04:27:52 -0400
X-MC-Unique: RHGDh8M1M_yvD7uHnwcFYQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D147F899EDE
 for <qemu-devel@nongnu.org>; Mon,  4 Apr 2022 08:27:51 +0000 (UTC)
Received: from localhost (unknown [10.40.192.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7797D43F4E7;
 Mon,  4 Apr 2022 08:27:51 +0000 (UTC)
Date: Mon, 4 Apr 2022 10:27:50 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v1.1 1/9] qapi: fix example of netdev_add command
Message-ID: <20220404082750.vshb7w7nkipd5eoj@tapioca>
References: <20220331190633.121077-2-victortoso@redhat.com>
 <20220401110712.26911-1-victortoso@redhat.com>
 <87ilrp1iks.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uz4fxjctw7w6ngfm"
Content-Disposition: inline
In-Reply-To: <87ilrp1iks.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uz4fxjctw7w6ngfm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 04, 2022 at 08:14:11AM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>=20
> > Example output has the optional member @dnssearch as string type. It
> > should be an array of strings instead. Fix it.
>=20
> "of String objects".  Happy to fix this in my tree.

Sure

>=20
> >
> > For reference, see NetdevUserOptions.
> >
> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> > ---
> >  qapi/net.json | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 0d4578bd07..b92f3f5fb4 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -51,7 +51,7 @@
> >  #
> >  # -> { "execute": "netdev_add",
> >  #      "arguments": { "type": "user", "id": "netdev1",
> > -#                     "dnssearch": "example.org" } }
> > +#                     "dnssearch": [ { "str": "example.org" } ] } }
> >  # <- { "return": {} }
> >  #
> >  ##
>=20
> Preferably with the commit message tweak:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks,
Victor

--uz4fxjctw7w6ngfm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJKrAYACgkQl9kSPeN6
SE/2MA//U7ocz5Yh+eFeqSgbLgXRht9yLjwqUfBRS9Crm1EEAzNviLaCP47f4wuD
RSbhAcE7/0d1ZpfuHRP2unWpl6pAl5mEG4FQtkPJIL3zrWyDTfok20P+mMys7S8n
lN5ORhv3NfvuGnAscztNQbZYFoIIeUm76egKmA7P5syw0EBoKyFG+NELWALrLgT3
x6CmPDc01hlX//BJF99DQeo+tIewTcGB+YaGdR4KR4aznT+RHukF9lUAyYhhWC4a
FvSYN5E7ZDlftxFKfPGrmzISIgcGxXhwDliT5qKZa36ahjydVheascArsAlRqf56
Y+kjsTk+OMVSNGa2deOfP2khISiEeBj5vUHjypHlkw9XkF6cXoIWlC+EPv9O1FZV
YEJvVj1DNTmYkWOU+h9V+Jva5MOxdCzWtjLST8n6a/jLNAIdakHCaA46I8gOTvSr
0/sSLCoG3G4sBt0Z7GVvmAKqb7/XuVsrnEe0tQ1YL2DgSX3T1hWgryZ4MUyArP9F
bvaTNRV1oMJroBNsopplBLuuxvFFM1B95JF12CiNNBb1vnn3OOCocLv5NqMVhsBl
Irwp5PvCkzLCmf2Vl8rA5t9U5qTOnJhqjh7CrCZiStc5FpVZmZ/ThQTa6CMd18T7
vcF9HnY+zmSp9swK1SL4ZX6REcELaBtGbmmyT8UHh1Oo9VQQkso=
=P1Zt
-----END PGP SIGNATURE-----

--uz4fxjctw7w6ngfm--


