Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF155A4ED1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 16:08:31 +0200 (CEST)
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSfRF-00011R-U7
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 10:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oSfOZ-0007iw-Qf
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 10:05:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oSfOV-0005as-6g
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 10:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661781938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cRwAycbnBhuZw/VPfQy7XT5ATezLWYEz9ObjTOihU1E=;
 b=Qov3ndFmRwP+mqlCEgzBxCjjj9w+BpuwOYMgY+TEJGtdUz5DV+o3FS9Pbi8WMPA7iOMtml
 2RvYVVPtOI3ECAWgWlKdyT4onCuTG+FjMCv0HS5fp0IEx7mppdpkz/BJyHFuH3DF3HbIbA
 xitoUGe8Z5iHrMiT4e8IYpOc9fNdiyo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-hBZ_r2ORNP6L_pU9L5JphA-1; Mon, 29 Aug 2022 10:05:36 -0400
X-MC-Unique: hBZ_r2ORNP6L_pU9L5JphA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F09F811E87
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 14:05:36 +0000 (UTC)
Received: from localhost (unknown [10.40.194.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CE8E1121314;
 Mon, 29 Aug 2022 14:05:35 +0000 (UTC)
Date: Mon, 29 Aug 2022 16:05:34 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 0/8] qapi: add generator for Golang interface
Message-ID: <20220829140534.ibvdsu4zh2n5akkz@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <CABJz62Pay+VzT8gy94bgRJdXHrdGM=GQCWcwVKkj9eso_SzP3w@mail.gmail.com>
 <20220817142438.lymnqxul6dcp6zbp@tapioca>
 <87tu5vp8og.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i75rt2dgb4sno6qv"
Content-Disposition: inline
In-Reply-To: <87tu5vp8og.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


--i75rt2dgb4sno6qv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Aug 29, 2022 at 01:53:51PM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>
> > Hi,
> >
> > On Tue, Jul 05, 2022 at 08:46:34AM -0700, Andrea Bolognani wrote:
> >> I've commented in detail to the single patches, just a couple of
> >> additional points.
> >>
> >> On Fri, Jun 17, 2022 at 02:19:24PM +0200, Victor Toso wrote:
> >> > * 7) Flat structs by removing embed types. Discussion with Andrea
> >> >      Thread: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg01590.html
> >> >
> >> >      No one required it but I decided to give it a try. Major issue that
> >> >      I see with this approach is to have generated a few 'Base' structs
> >> >      that are now useless. Overall, less nested structs seems better to
> >> >      me. Opnions?
> >> >
> >> >      Example:
> >> >       | /* This is now useless, should be removed? */
> >> >       | type InetSocketAddressBase struct {
> >> >       |     Host string `json:"host"`
> >> >       |     Port string `json:"port"`
> >> >       | }
> >>
> >> Can we somehow keep track, in the generator, of types that are
> >> only used as building blocks for other types, and prevent them
> >> from showing up in the generated code?
> >
> > I'm not 100% sure it is good to remove them from generated code
> > because technically it is a valid qapi type. If all @base types
> > are embed types and they don't show in other way or form, sure we
> > can remove them from generated code... I'm not sure if it is
> > possible to guarantee this.
> >
> > But yes, if possible, I'd like to remove what seems useless type
> > definitions.
>
> The existing C generators have to generate all the types, because the
> generated code is for QEMU's own use, where we need all the types.
>
> The existing introspection generator generates only the types visible in
> QAPI/QMP introspection.
>
> The former generate for internal use (where we want all the types), and
> the latter for external use (where only the types visible in the
> external interface are actually useful).

My doubt are on types that might be okay to be hidden because
they are embed in other types, like InetSocketAddressBase.

Note that what I mean with the struct being embed is that the
actual fields of InetSocketAddressBase being added to the type
which uses it, like InetSocketAddress.

  | type InetSocketAddressBase struct {
  |     Host string `json:"host"`
  |     Port string `json:"port"`
  | }
  |
  | type InetSocketAddress struct {
  |     // Base fields
  |     Host string `json:"host"`
  |     Port string `json:"port"`
  |
  |     Numeric   *bool   `json:"numeric,omitempty"`
  |     To        *uint16 `json:"to,omitempty"`
  |     Ipv4      *bool   `json:"ipv4,omitempty"`
  |     Ipv6      *bool   `json:"ipv6,omitempty"`
  |     KeepAlive *bool   `json:"keep-alive,omitempty"`
  |     Mptcp     *bool   `json:"mptcp,omitempty"`
  | }

Andrea's suggestions is to have the generator to track if a given
type is always embed in which case we can skip generating it in
the Go module.

I think that could work indeed. In the hypothetical case that
hiddens structs like InetSocketAddressBase becomes a parameter on
command in the future, the generator would know and start
generating this type from that point onwards.

> >> Finally, looking at the repository containing the generated
> >> code I see that the generated type are sorted by kind, e.g. all
> >> unions are in a file, all events in another one and so on. I
> >> believe the structure should match more closely that of the
> >> QAPI schema, so e.g.  block-related types should all go in one
> >> file, net-related types in another one and so on.
> >
> > That's something I don't mind adding but some hardcoded mapping
> > is needed. If you look into git history of qapi/ folder, .json
> > files can come and go, types be moved around, etc. So, we need to
> > proper map types in a way that the generated code would be kept
> > stable even if qapi files would have been rearranged. What I
> > proposed was only the simplest solution.
> >
> > Also, the generator takes a qapi-schema.json as input. We are
> > more focused in qemu/qapi/qapi-schema.json generated coded but
> > would not hurt to think we could even use it for qemu-guest-agent
> > from qemu/qga/qapi-schema.json -- this to say that the hardcoded
> > mapping needs to take into account non qemu qapi schemas too.
>
> In the beginning, the QAPI schema was monolithic.
> qga/qapi-schema.json still is.
>
> When keeping everything in a single qapi-schema.json became
> unwieldy, we split it into "modules" tied together with a
> simple include directive.  Generated code remained monolithic.

> When monolithic generated code became too annoying (touch
> schema, recompile everything), we made it match the module
> structure: code for FOO.json goes into *-FOO.c and *-FOO.h,
> where the *-FOO.h #include the generated headers for the .json
> modules FOO.json includes.
>
> Schema code motion hasn't been much of a problem.  Moving from
> FOO.json to one of the modules it includes is transparent.
> Non-transparent moves are relatively rare as long as the split
> into modules actually makes sense.

To be honest, splitting it into different files based on their
module names should not be a problem if we keep them in a single
Go module as do intend to for this generated go code.

So I'll go ahead and split it.

Cheers,
Victor

--i75rt2dgb4sno6qv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmMMx64ACgkQl9kSPeN6
SE/8+g//e32sgeDpxxuXj8U+CKOnCKzrBoEJItQd8/XgtMU8N2loeJneMuBeoigk
RuAeCnn+u5m7qNtw4poY2QsId/Dl0PPVovitcNTfbXKqKJN6KUEGBH+4U4+fp/Ub
sCMKlgAxA5EAwQAkUpZc9wkuqbaHlZuvqqEO1vx3hxPJR0EGTMFaJ5rOjaGDlbcs
FpBKgI5t3acVbdEl+CDMt3nAd8f6Cx5xGTQKWHY1kL1j4XwF6Vqp44D2rxw0gdhw
XcBGWCPTEmWDGKzcCDcObamkY3v3VcE7wzOH9Ej/FqJtXpq/aeiuOGHMVSzytEOe
JQQW6fVLQbkFG1nJ3cW+odQDy4N39PyIlJFcBSkMqT2izE0B/ioIfHFBh+n7TeV4
kBr+gcvc/V4esHM22CzIIj/+TgkSaLpctx+UJVyCD7q95KmXMfqjy9liMY8Je3p0
SBu+eiQA+RzjsfhEYgrkbpTLPaMbRhCA7Uyl0JsWjvVdyy3qDWuLKmL1P7qVepey
FMtUMrMtbzP5MJ8suu6h/RhUyBD6RerfFdYcl4Fj0md9etVANm0PMz16bq+8oHrl
juYM8KXxO9zsVEwADf/dA6f8kzEucWgh8xinyClGIK45hdjJCMjDyK8gajXEvwzF
mfTqQvEU0RdRCODZXPPXjJqSZ+oaj9dkcp9xm4900DtGopynMeI=
=/4vq
-----END PGP SIGNATURE-----

--i75rt2dgb4sno6qv--


