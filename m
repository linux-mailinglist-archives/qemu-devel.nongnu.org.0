Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA1352B461
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 10:14:51 +0200 (CEST)
Received: from localhost ([::1]:60400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrEpW-0007kr-Qs
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 04:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nrEmr-0005tj-F8
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nrEmp-00052A-Bk
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652861521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bXG0dQBNdgQAcEox0rb/TFwOsFu+nWT5IJiyUCGSw/I=;
 b=c0USefxn0fVMuvreUgtty141ZRfGSL3ToSQM0UoDf+DHVz1+0ifgyamv6+vkDH3p5oWxUS
 Oa0xGYnUOVntsYLA7sbLnIP0zKcOOcFnUQ3YXkyF2yBmRkbl0abdNRmxXJ4iN8vRQ98fXx
 2vlikxUQERMKz0c7N0qpRIA+aQqIQUY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-lVSSf7_UN22Gyxu2Ye3WoQ-1; Wed, 18 May 2022 04:10:58 -0400
X-MC-Unique: lVSSf7_UN22Gyxu2Ye3WoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02C0A3C10258
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 08:10:58 +0000 (UTC)
Received: from localhost (unknown [10.40.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51FD12026D6A;
 Wed, 18 May 2022 08:10:54 +0000 (UTC)
Date: Wed, 18 May 2022 10:10:48 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <20220518081048.pagopapkd25pvufh@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
 <YnpfuYvBu56CCi7b@redhat.com>
 <CABJz62M2XtbHubdEjiSf-mzEiHbnd=bSotgUBVhtaZFPOtzE7g@mail.gmail.com>
 <YnvbS7psaEjkrN65@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i3rot32kigqcyxfa"
Content-Disposition: inline
In-Reply-To: <YnvbS7psaEjkrN65@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--i3rot32kigqcyxfa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 11, 2022 at 04:50:35PM +0100, Daniel P. Berrang=E9 wrote:
> On Wed, May 11, 2022 at 08:38:04AM -0700, Andrea Bolognani wrote:
> > On Tue, May 10, 2022 at 01:51:05PM +0100, Daniel P. Berrang=E9 wrote:
> > > In 7.0.0 we can now generate
> > >
> > >    type BlockResizeArguments struct {
> > >        V500 *BlockResizeArgumentsV500
> > >        V520 *BlockResizeArgumentsV520
> > >        V700 *BlockResizeArgumentsV700
> > >    }
> > >
> > >    type BlockResizeArgumentsV500 struct {
> > >        Device string
> > >        Size int
> > >    }
> > >
> > >    type BlockResizeArgumentsV520 struct {
> > >        Device *string
> > >        NodeName *string
> > >        Size int
> > >    }
> > >
> > >    type BlockResizeArgumentsV700 struct {
> > >        NodeName string
> > >        Size int
> > >    }
> > >
> > > App can use the same as before, or switch to
> > >
> > >     node :=3D "nodedev0"
> > >     cmd :=3D BlockResizeArguments{
> > >         V700: &BlockResizeArguments700{
> > >             NodeName: node,
> > >             Size: 1 * GiB
> > >         }
> > >     }
> >=20
> > This honestly looks pretty unwieldy.
>=20
> It isn't all that more verbose than without the versions - just
> a single struct wrapper.
>=20
> >=20
> > If the application already knows it's targeting a specific version of
> > the QEMU API, which for the above code to make any sense it will have
> > to, couldn't it do something like
> >=20
> >   import qemu .../qemu/v700
> >=20
> > at the beginning of the file and then use regular old
> >=20
> >   cmd :=3D qemu.BlockResizeArguments{
> >       NodeName: nodeName,
> >       Size: size,
> >   }
> >=20
> > instead?
>=20
> This would lead to a situation where every struct is duplicated
> for every version, even though 90% of the time they'll be identical
> across multiple versions. This is not very ammenable to the desire
> to be able to dynamically choose per-command which version you
> want based on which version of QEMU you're connected to.
>=20
> ie=20
>=20
>=20
>      var cmd Command
>      if qmp.HasVersion(qemu.Version(7, 0, 0)) {
>         cmd =3D BlockResizeArguments{
>            V700: &BlockResizeArguments700{
>              NodeName: node,
>              Size: 1 * GiB
> 	   }
>          }
>      } else {
>         cmd =3D BlockResizeArguments{
>            V520: &BlockResizeArguments520{
>              Device: dev,
>              Size: 1 * GiB
> 	   }
>          }
>      }
>=20
> And of course the HasVersion check is going to be different
> for each command that matters.
>=20
> Having said that, this perhaps shows the nested structs are
> overkill. We could have=20
>=20
>=20
>      var cmd Command
>      if qmp.HasVersion(qemu.Version(7, 0, 0)) {
>          cmd =3D &BlockResizeArguments700{
>              NodeName: node,
>              Size: 1 * GiB
>          }
>      } else {
>         cmd =3D &BlockResizeArguments520{
>              Device: dev,
>              Size: 1 * GiB
>          }
>      }

The else block would be wrong in versions above 7.0.0 where
block_resize changed. There will be a need to know for a specific
Type if we are covered with latest qemu/qapi-go or not. Not yet
sure how to address that, likely we will need to keep the
information that something has been added/changed/removed per
version per Type in qapi-go...

Still, I think the above proposal is a good compromise to make..

> If there was some need for common handling of the different versioned
> variants, we could still have a 'BlockResizeArguments' that has a field
> per version, as an optional thing. Or have a BlockResizeArguments
> interface, implemented by each version </hand-wavey>

Cheers,
Victor

--i3rot32kigqcyxfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmKEqgcACgkQl9kSPeN6
SE/QVw//f87VGTJ/m/Y65AUHjNfwPWRV180q80/ckPJjaaTl6YIIE9HfkEjbfkE9
DxLNYqXGmCz1GmyCrHBoEp4r9YMeczhKKP+/PS8evFENC+Q+2DmLisU8LM8ijg0S
mxdIQIAdBqJ59cg9oe85l9gNQljGp+v4ruIYBGuCDTUlT3rtJdZ5X5C2Ww8NsL5F
sSSdxDJmdNW+eeumijY0ps2pVuA+KAWj4gCcCA/VHrZkJoth5FWiTzBr4HO4n0mn
OzLZyeqiMjV7taVxad+DCvhMj3aGCknDOP+wozbX4BsOoC3F8/qu4+/Sse5ZXHHD
ceXdAxTb+EpHWw6bIwT4+pj4qaqc7cDecEMji2iEWrk4IdJUlaU2+wvW1XwlV5rp
rbRy2ldLico2xsRDrF+Sq8Zhnwl+HF8L8RxoFVZzYL3zfVOWnLbY9BPw9bs1LPOm
vVTwmzw8rv4JnfHzopF5I+MnMPhxCh84Z/nx0g7d3Yq43GVrm1fsaEFr0ITXupwG
DKN50d3Dp67yN4MHS8CVo6rUf0qLqV4juX68wAT1MGkHmaArAQ/d0D+IfkE+qaJZ
INKJwYFzHPYjmfUgydzy3qQYO5rog1sSbizM2p7wX8ueybkUhJAPoCzsBotTTLu9
uXhavwv5HvqKq9aypI1eZXSQPXaTYWdGmShu8n8tBPbIdgTjjCw=
=hNe9
-----END PGP SIGNATURE-----

--i3rot32kigqcyxfa--


