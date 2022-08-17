Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F8D597108
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 16:26:34 +0200 (CEST)
Received: from localhost ([::1]:34168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOK09-0001Z8-DR
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 10:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOJyQ-0007zT-70
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:24:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOJyM-0002rH-SX
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660746281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FWLqEmhzm1xj0jR/fPEFmedGxZlk7UYDwOQLn4vDgGE=;
 b=cbqAJfS8BnDAbXkHqaC3kiZkSIDNKYkKFSS5UeMa50DlszrKTb3LMQAYpSNLJeoSp0rH5b
 N6T4B3gYak/uP3BUu4621YQ/QaojulseMClsj4ZZU/5/mOigv/Ti3h5FCS3rei7vBrc0Fx
 Yia5vlhwRhd+nC72VHMCifVJ1U0mUJs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-oQdo29DXPG2WEuXt2Evzig-1; Wed, 17 Aug 2022 10:24:40 -0400
X-MC-Unique: oQdo29DXPG2WEuXt2Evzig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F31618039B9
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 14:24:39 +0000 (UTC)
Received: from localhost (unknown [10.40.192.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B092945D2;
 Wed, 17 Aug 2022 14:24:39 +0000 (UTC)
Date: Wed, 17 Aug 2022 16:24:38 +0200
From: Victor Toso <victortoso@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 0/8] qapi: add generator for Golang interface
Message-ID: <20220817142438.lymnqxul6dcp6zbp@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <CABJz62Pay+VzT8gy94bgRJdXHrdGM=GQCWcwVKkj9eso_SzP3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yfowzkjisqh5wla6"
Content-Disposition: inline
In-Reply-To: <CABJz62Pay+VzT8gy94bgRJdXHrdGM=GQCWcwVKkj9eso_SzP3w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yfowzkjisqh5wla6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 05, 2022 at 08:46:34AM -0700, Andrea Bolognani wrote:
> I've commented in detail to the single patches, just a couple of
> additional points.
>
> On Fri, Jun 17, 2022 at 02:19:24PM +0200, Victor Toso wrote:
> > * 7) Flat structs by removing embed types. Discussion with Andrea
> >      Thread: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg0=
1590.html
> >
> >      No one required it but I decided to give it a try. Major issue that
> >      I see with this approach is to have generated a few 'Base' structs
> >      that are now useless. Overall, less nested structs seems better to
> >      me. Opnions?
> >
> >      Example:
> >       | /* This is now useless, should be removed? */
> >       | type InetSocketAddressBase struct {
> >       |     Host string `json:"host"`
> >       |     Port string `json:"port"`
> >       | }
>
> Can we somehow keep track, in the generator, of types that are
> only used as building blocks for other types, and prevent them
> from showing up in the generated code?

I'm not 100% sure it is good to remove them from generated code
because technically it is a valid qapi type. If all @base types
are embed types and they don't show in other way or form, sure we
can remove them from generated code... I'm not sure if it is
possible to guarantee this.

But yes, if possible, I'd like to remove what seems useless type
definitions.

> Finally, looking at the repository containing the generated
> code I see that the generated type are sorted by kind, e.g. all
> unions are in a file, all events in another one and so on. I
> believe the structure should match more closely that of the
> QAPI schema, so e.g.  block-related types should all go in one
> file, net-related types in another one and so on.

That's something I don't mind adding but some hardcoded mapping
is needed. If you look into git history of qapi/ folder, .json
files can come and go, types be moved around, etc. So, we need to
proper map types in a way that the generated code would be kept
stable even if qapi files would have been rearranged. What I
proposed was only the simplest solution.

Also, the generator takes a qapi-schema.json as input. We are
more focused in qemu/qapi/qapi-schema.json generated coded but
would not hurt to think we could even use it for qemu-guest-agent
=66rom qemu/qga/qapi-schema.json -- this to say that the hardcoded
mapping needs to take into account non qemu qapi schemas too.

> Looking forward to the next iteration :)

Me too, thanks again!

Cheers,
Victor

--yfowzkjisqh5wla6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmL8+iYACgkQl9kSPeN6
SE+daxAAi3TYaoPl0eEnE6TrKvTVmVnSdQrPIX+m03g3lA+XPUnHbmEVCaBfyiIg
GF+i/dvCgk6UcJTH/yVGQHadWTnFjfLGzf+Ga773IVMCrYploCz94XWqYpgtn7/B
9hld8dgSOwYWPGj62fPDJ4CNyoDxaDOYL1yfPx8Ct+vEfpajYL1LGiYJqcDc3GxR
bYppuMD3gQDG3ADvOj9KafwT/AQyayFJK1TmIMscmsXfnAdohPtT4jJDBjVzG/3/
QozEUHoXO/A3EBCWTusjuGBAlDFUU7kdu3ia2U4W3KZmhkpFcECfn2ZDf/tcO6pJ
HY7+29r32Nlbo3q/BIjkil0J27czrFdCwvr0OO6wSQ+TJ7T2eA+xy9pla7qttGJH
dAj9LSwE8JLaQ7CEmbS+mowRsV/+rCbCqt/QmQaqJkPY7GobcsDp7wZsnmAmGBRG
1dn0UcSbRtDEXl0199Cqxpx5w4CCNA4DWvbCZVguBXAWsMCVPO69fAKIhejlzHZm
lkSqBiWNDntVJ+4RrRCCkCfR5QAbqpadFoeymtJbuL8tiNn1D0ZZrNF62LOC5YRk
8QZ75HyDJEgigY45KQ6hvgB8pgbeuYN8DI5NuPzZFqwOR2wM1NpYKnUuCZhKbgGM
R3l8GBNHKUN1A+ch9RAyRJtwDAeZ7eRdvMbT5HtC4t5G9miliRo=
=U5T2
-----END PGP SIGNATURE-----

--yfowzkjisqh5wla6--


