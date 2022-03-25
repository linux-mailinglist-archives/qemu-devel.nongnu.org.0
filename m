Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2270D4E7ABE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 22:01:49 +0100 (CET)
Received: from localhost ([::1]:40560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXr47-00088f-VC
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 17:01:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXr1y-0007Ko-Vu
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXr1x-00016M-7c
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648241972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hgXzazyBJinErOOU6FKvVjxasa7rUIBsEDqjSXpubxg=;
 b=WNw/BsXrfKDU1A7AfGYgjGe2RSXxFfAS4EjLreJjt1nROYIJWyFIA1+Fzs0U3HSy6cvDkV
 U97DG0P+6ePOhu/41flPIlTcCMPxeb4KI7Q/DcIprPjd5srCbdOBGir2YFEoWWPw8d8kTV
 4YozyAeJHJe7qlPe7e2sN3Ad/HP6s0Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-nZrDvqDwNh-vo3oqws4Zdg-1; Fri, 25 Mar 2022 16:59:30 -0400
X-MC-Unique: nZrDvqDwNh-vo3oqws4Zdg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2EFE3C163E1
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 20:59:29 +0000 (UTC)
Received: from localhost (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3704D7AEE;
 Fri, 25 Mar 2022 20:59:26 +0000 (UTC)
Date: Fri, 25 Mar 2022 21:59:25 +0100
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 02/14] qapi: fix example of BLOCK_IMAGE_CORRUPTED event
Message-ID: <20220325205925.7nevlaxooltv7ly7@tapioca>
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-3-victortoso@redhat.com>
 <CAFn=p-bXtNoJ=WpYk6s3Wkkq6QCoQ4YjbLKegAB6xgMxCO+CDg@mail.gmail.com>
 <CAFn=p-bMTFpikwR5JMQWCP1rPSnn55JPpfy-QuREO91MD6jKmg@mail.gmail.com>
 <87o81unqxx.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l5q7sdamy275h2rq"
Content-Disposition: inline
In-Reply-To: <87o81unqxx.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--l5q7sdamy275h2rq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 25, 2022 at 01:43:06PM +0100, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
>=20
> > On Thu, Mar 24, 2022 at 3:15 PM John Snow <jsnow@redhat.com> wrote:
> >>
> >>
> >>
> >> On Thu, Mar 24, 2022, 1:50 PM Victor Toso <victortoso@redhat.com> wrot=
e:
> >>>
> >>> Fatal is not optional.
> >>>
> >>> Signed-off-by: Victor Toso <victortoso@redhat.com>
> >>> ---
> >>>  qapi/block-core.json | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/qapi/block-core.json b/qapi/block-core.json
> >>> index e89f2dfb5b..585a9e020e 100644
> >>> --- a/qapi/block-core.json
> >>> +++ b/qapi/block-core.json
> >>> @@ -5008,7 +5008,7 @@
> >>>  # <- { "event": "BLOCK_IMAGE_CORRUPTED",
> >>>  #      "data": { "device": "ide0-hd0", "node-name": "node0",
> >>>  #                "msg": "Prevented active L1 table overwrite", "offs=
et": 196608,
> >>> -#                "size": 65536 },
> >>> +#                "size": 65536, "fatal": false },
> >>>  #      "timestamp": { "seconds": 1378126126, "microseconds": 966463 =
} }
> >>>  #
> >>>  # Since: 1.7
> >>> --
> >>> 2.35.1
> >>
> >>
> >> Is this the correct fatality setting for this particular case? Default=
 is implied to be true.
> >
> > (1) We don't seem to actually emit this particular message anymore. I
> > don't think it exists in the tree.
>=20
> I doubt we ever emitted it.

Out of curiosity, shouldn't we deprecate it then?

> > (2) The only fatal=3DFalse messages I can see is
> > "Cannot free unaligned cluster %#llx"
> >
> > (Try grepping for qcow2_signal_corruption)
> >
> > so maybe we should pick a new example that might really exist. iotest
> > 060 seems to test this, so that can be used as a guide.
>=20
> Yes, please.

I'll be changing it on v2

--l5q7sdamy275h2rq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmI+LS0ACgkQl9kSPeN6
SE+NgA/7Bb273YhSEaB5FobZCroQy02jz00dKtutnpgdLcljuAt2ugz0iwWVAXf4
s7gzrxP8L+TNPMqE4VOQd3oOOhUBaDRh0fJKWCdHCarpY9qCqjL94Ehlvr9Yw5pH
QiTy+pIDBfmFyYXoOHviUDGxghK6RllCITrD39G2OYer00bygpyJXlPxt3mf7Nok
AenIdPlkEoKw91S1sU1TnsAc69CFN/qYWk43uOZ+VUAd/qIkg+L8wKjMnNfc3WoY
qcx3UMTHOf6+LckaQ7eckQ3n5PEEp3uw1IR3+sNfCVB1f+iSx1Tj69CuOSCe0wH8
qCKWNfoYoMVWa1j+V0rYwGoNakYqY3OOHEFW3YRRPZ6QZz7RUmOyyAr4R5k0KRgY
6H7Wxz5dqWQZKZW9sZbORkvNpDVy4mA1lvUzY6PTTIaUHK4EGmRWqHNGU1OMPKFJ
8fNqQJxGZvm+Q0woRUOwTUD8YBqXDOt73+uc3E07ETwTCc7cL4NsJdBpKcDFbOVD
0eX9yHTE8ErbpcS7ySX9t1g7I+IXNVmlBSYAby1jUdJABmS6LpQx8WsNAxiwPcNa
SZWrrmq52kcWFgHLFWUBf0y7YfETWOwQ2JensKhyCgn+n74L3Tato3T/TV7KiaKS
Bf9I3mifp3kNc3frdI3gNGE8mm6R+irNYXfhAKVHlXuP7gGSMqs=
=E6zV
-----END PGP SIGNATURE-----

--l5q7sdamy275h2rq--


