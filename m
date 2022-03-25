Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763C14E7ABF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 22:04:29 +0100 (CET)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXr6i-0001at-7m
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 17:04:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXr5D-0000tH-1s
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 17:02:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXr5A-0001iT-DW
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 17:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648242171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MhSN1+7VZGPqN7iWFwsiYnb/hwLcclfA9UNiORpAdeU=;
 b=VnteINcUN9vMCOrNumh51yTQJgnnsLPIZ4db3TYww6DPwK8tOWr0x7QsX5VOq4vuJNUTy7
 X2fg0uFxUMPUMzbIAnfn3Lcv7q9PAyDiijUI0VPImqEbd6KrEy5hM0k3+vJX0W8Y7XUd57
 1/Qs58NfKhN2oloOufbgLtbyGMDT63E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-jcJ0MSB0Ph-YEEiP0vKAyg-1; Fri, 25 Mar 2022 17:02:50 -0400
X-MC-Unique: jcJ0MSB0Ph-YEEiP0vKAyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2EFF100BAB0
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 21:02:49 +0000 (UTC)
Received: from localhost (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0A2040D2974;
 Fri, 25 Mar 2022 21:02:47 +0000 (UTC)
Date: Fri, 25 Mar 2022 22:02:44 +0100
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 05/14] qapi: fix example of DUMP_COMPLETED event
Message-ID: <20220325210244.udhktkkljmwx4iqz@tapioca>
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-6-victortoso@redhat.com>
 <CAFn=p-bO0Q7466J7SRyDd6eTM_6N8UKLZK38PrucAZqXUxgYeQ@mail.gmail.com>
 <87fsn6nqg1.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bkobm7e3z3prwu36"
Content-Disposition: inline
In-Reply-To: <87fsn6nqg1.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--bkobm7e3z3prwu36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 25, 2022 at 01:53:50PM +0100, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
>=20
> > On Thu, Mar 24, 2022 at 1:50 PM Victor Toso <victortoso@redhat.com> wro=
te:
> >>
> >> * Timestamp is not optional, let's add for completeness.
> >> * Add '<-' to signalize it is receiving the data
> >> * While at it, add extra space before "result" and "total"
> >>
> >> Signed-off-by: Victor Toso <victortoso@redhat.com>
> >> ---
> >>  qapi/dump.json | 7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/qapi/dump.json b/qapi/dump.json
> >> index f7c4267e3f..d3ed79e8cd 100644
> >> --- a/qapi/dump.json
> >> +++ b/qapi/dump.json
> >> @@ -161,9 +161,10 @@
> >>  #
> >>  # Example:
> >>  #
> >> -# { "event": "DUMP_COMPLETED",
> >> -#   "data": {"result": {"total": 1090650112, "status": "completed",
> >> -#                       "completed": 1090650112} } }
> >> +# <- { "event": "DUMP_COMPLETED",
> >> +#      "data": { "result": { "total": 1090650112, "status": "complete=
d",
> >> +#                            "completed": 1090650112} },
>=20
> Add a space after 1090650112, too?

ok!
=20
> Aside: I don't actually like our use of spaces in JSON, but consistently
> ugly beats inconsistently ugly.

Ideally it would be better use some tool to pretty format/sort it
so we don't even bother looking at it too much.
=20
> >> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 }=
 }
> >>  #
> >>  ##
> >>  { 'event': 'DUMP_COMPLETED' ,
> >> --
> >> 2.35.1
> >>
> >
> > Other events seem to use the timestamp as well, so go for it. I agree
> > that being able to programmatically verify docstrings is pretty
> > valuable in an API test suite.
> >
> > (What date did you choose? Does it mean anything to you? :p)
>=20
> Copied from some other example, I suppose.

Yes,
> I'd probably use time of writing, but that's just me.

Never thought about it. Why not, I'll change it.

> > Reviewed-by: John Snow <jsnow@redhat.com>
>=20
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks!

--bkobm7e3z3prwu36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmI+LfQACgkQl9kSPeN6
SE9Q5w/9Fph8XT1ft9OlPOEkKFq2uiT4K0QDzY6Af5oYPp6qmJ7b+Zq3bZtWT9Ms
smfy27hec5mllPr3oFWvfU0O1ASaWhNj8WBpkrUkiOdt31PWkGugHc1OJsYR75Eu
i2oE1bSKNt5qNJbjtkKxOoxomk2IKLQtdVh8ZRGSgMOnrW7YtKb886AKfMSSZt1l
M8FJPVwI90l987QO1eqVrFIG1ea7cikSX0bL00Of0yXMG9t/oz1r5SoD5EBDmcSV
sXdZgtVIzxoKH6SygoL20e/KIjaMzh+QYCmWcudGCubeqmaK4Xa0hnqhq3WwnNyy
fSYdRA9qH9U0lPvNORX79FqV6PfGvIGou+uLRdkgzp1nNicOjGiL9I0jI+uiv6xv
ZuhVhIslVEu24bCamdTrD81N8gCtchejiQ2PBKvh+318/4KgNy57BwqV2F54o7e3
iO3Kk8JwXhDELn3ot2P/iavOjNYYCd+hIukQ6cA5UnaNI6ANZ+7KBLVga5gnERvd
cF8h5LC4gd0JnZaps8k8eXQfS6vLsoOGyYZ5F42r3SwEPqpbROpLekhb6PeucZBh
4k0rwUUZmJjA1dcNym5bSRU9dkTc07wK36WPRutCcOCMm/r0xZQV7coslFnTuWqM
rR9vS4nC1GZi2KOf7WUq9s0vgZpQUftRBIxoBY+A+ZmzPyGkRpc=
=1Rl/
-----END PGP SIGNATURE-----

--bkobm7e3z3prwu36--


