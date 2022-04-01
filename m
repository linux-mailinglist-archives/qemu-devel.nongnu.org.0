Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489E94EEBED
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 13:01:15 +0200 (CEST)
Received: from localhost ([::1]:59984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naF1l-0007Xl-Qz
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 07:01:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naF02-0006r8-Jk
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:59:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naF00-0006Aa-Fe
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648810763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W0x+YxvfEXu6118MthAMbjgO7esFFsnvjWfVw590zbo=;
 b=SzGUqZK5lLjs+/0dPVRC+67dp6ZIEKX1cX6gBdLFWqkMEKDfgdJB9npodNiod2xFIShulN
 z1LRSdowDk3nE0UnXh2ZWPpAWNmlvW/CqdGHcx0f+WD7Tns4cHj+UpOeG7BfsPJuN5ZIPS
 aGTKvSFJN/igxrW+bdbqo+5rbBGvJos=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-CICBkEVcPxq-5wNepJiKxg-1; Fri, 01 Apr 2022 06:59:21 -0400
X-MC-Unique: CICBkEVcPxq-5wNepJiKxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EB583817491
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 10:59:21 +0000 (UTC)
Received: from localhost (unknown [10.40.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16CD1C15D42;
 Fri,  1 Apr 2022 10:59:20 +0000 (UTC)
Date: Fri, 1 Apr 2022 12:59:19 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v1 1/9] qapi: fix example of netdev_add command
Message-ID: <20220401105919.sofirrsttglcvrhr@tapioca>
References: <20220331190633.121077-1-victortoso@redhat.com>
 <20220331190633.121077-2-victortoso@redhat.com>
 <87tubdb5jb.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6ozunwukm4mta5j3"
Content-Disposition: inline
In-Reply-To: <87tubdb5jb.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6ozunwukm4mta5j3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 01, 2022 at 09:56:40AM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>=20
> > Example output has the optional member @dnssearch as string type. It
> > should be an array of strings instead. Fix it.
> >
> > For reference, see NetdevUserOptions.
> >
> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> > ---
> >  qapi/net.json | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 0d4578bd07..efc0bae170 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -51,7 +51,7 @@
> >  #
> >  # -> { "execute": "netdev_add",
> >  #      "arguments": { "type": "user", "id": "netdev1",
> > -#                     "dnssearch": "example.org" } }
> > +#                     "dnssearch": [ "example.org" ] } }
> >  # <- { "return": {} }
> >  #
> >  ##
>=20
> Uh, @dnssearch is ['String']...  shouldn't this be something like
>=20
>    #                     "dnssearch": [ { "str": "example.org" } ] } }
>=20
> ?

Yes, my mistake. Thanks for spotting it.
I'll resend this patch shortly.

Cheers,
Victor

--6ozunwukm4mta5j3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJG2wcACgkQl9kSPeN6
SE/jVQ//YvDprozzfjXyQtV3CDMfvuJXpzOKtcCJWuH/UyBOsN9MifQ7U2EkBvix
qw/Gq3v1pL5250gyMnPtp/g/c5iY71IszvVnlUJOtIvUSy6hRm3rBCcDzCKbgCkN
WPjjLaHSYMJFrwt598xlCoAzCiGkQtiT/8g7d7oGuIaMmRscVpJfGeQLoZS/ZNI5
IhAR0tWGFCMfS1eIETmR7J/SfKbldkX1Zf7WPV/K0sT8/DkqLn0/TngavvsRkFyW
SNpI2q9oScmXMhyB0ixU0YgR7Q/CeJ3VZj0x+8VIJAmA2ZYazwIsdxtbbFV6dyyW
b9XS2MU+4CQUiYd5VRLF8jeeMe+tVD/X8AeOIM2yCahB7hyYbHof53c0vq8IPqvQ
5fZnfJj6uBNOHNAY7iRSS09ELNnid1jTkTiv1RO6m3KR5GJ6Zxa+O8dgFw3T9OJo
n3hnYwrBGh4RMarqMGRIUURBDjf+/B9y+owJCtKSt/AfQEAYsgwBM7CX88gR4fvN
I7ouDRE91N1HmZr7m0AfpPuLApPXgVpPkViwhScyBBTsCvwmIEupKJD5W2+6qz/e
kUko8DKrNQbCnlW7yN5/PKFddt71jnBVGxfWc4knApGKjzOTX9t3Il1jW0jXUL5B
iqwj4nMpotL/QUIVSidnzQfgBLtw/BABhVo5813ajFgV4rmVPpQ=
=CiNx
-----END PGP SIGNATURE-----

--6ozunwukm4mta5j3--


