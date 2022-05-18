Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E0D52B59B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:12:48 +0200 (CEST)
Received: from localhost ([::1]:41386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFjc-0004He-0Q
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nrFYJ-00054C-32
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:01:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nrFYH-0003tx-7H
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652864464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qxD6XvAeyEY79jx1YdwQAXsTIeOaSu11QhnIiny8FtY=;
 b=eqrLQEiXDyMuIN0j1O9HMwaBg2HinR2ceP2Z5Rp86ZisHHYjesMQSEe0GVNdfevUUdNG8m
 +JwxsS/JUT2hpVKx5Xsb0RxybUVzjw0KtELIZO0fFrvD7Kyt+P8IQ9nL/eCM9ICbPjqxMz
 TE/hS91CCGmkpLRpFta6MhHDrVkxyo0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-h89nxlbdNVy0-6sOtVHeRQ-1; Wed, 18 May 2022 05:01:02 -0400
X-MC-Unique: h89nxlbdNVy0-6sOtVHeRQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B4CC811E76
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 09:01:02 +0000 (UTC)
Received: from localhost (unknown [10.40.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11A8C492C3B;
 Wed, 18 May 2022 09:01:01 +0000 (UTC)
Date: Wed, 18 May 2022 11:01:01 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <20220518090101.oyd3ej6utehjx7wj@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
 <YnpfuYvBu56CCi7b@redhat.com>
 <CABJz62M2XtbHubdEjiSf-mzEiHbnd=bSotgUBVhtaZFPOtzE7g@mail.gmail.com>
 <YnvbS7psaEjkrN65@redhat.com>
 <20220518081048.pagopapkd25pvufh@tapioca>
 <YoSzrL7/sGyqYcMn@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="io7mjiohz3esce77"
Content-Disposition: inline
In-Reply-To: <YoSzrL7/sGyqYcMn@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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


--io7mjiohz3esce77
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

HI,

On Wed, May 18, 2022 at 09:51:56AM +0100, Daniel P. Berrang=E9 wrote:
> On Wed, May 18, 2022 at 10:10:48AM +0200, Victor Toso wrote:
> > Hi,
> >=20
> > On Wed, May 11, 2022 at 04:50:35PM +0100, Daniel P. Berrang=E9 wrote:
> > > On Wed, May 11, 2022 at 08:38:04AM -0700, Andrea Bolognani wrote:
> > > > On Tue, May 10, 2022 at 01:51:05PM +0100, Daniel P. Berrang=E9 wrot=
e:
> > > > > In 7.0.0 we can now generate
> > > > >
> > > > >    type BlockResizeArguments struct {
> > > > >        V500 *BlockResizeArgumentsV500
> > > > >        V520 *BlockResizeArgumentsV520
> > > > >        V700 *BlockResizeArgumentsV700
> > > > >    }
> > > > >
> > > > >    type BlockResizeArgumentsV500 struct {
> > > > >        Device string
> > > > >        Size int
> > > > >    }
> > > > >
> > > > >    type BlockResizeArgumentsV520 struct {
> > > > >        Device *string
> > > > >        NodeName *string
> > > > >        Size int
> > > > >    }
> > > > >
> > > > >    type BlockResizeArgumentsV700 struct {
> > > > >        NodeName string
> > > > >        Size int
> > > > >    }
> > > > >
> > > > > App can use the same as before, or switch to
> > > > >
> > > > >     node :=3D "nodedev0"
> > > > >     cmd :=3D BlockResizeArguments{
> > > > >         V700: &BlockResizeArguments700{
> > > > >             NodeName: node,
> > > > >             Size: 1 * GiB
> > > > >         }
> > > > >     }
> > > >=20
> > > > This honestly looks pretty unwieldy.
> > >=20
> > > It isn't all that more verbose than without the versions - just
> > > a single struct wrapper.
> > >=20
> > > >=20
> > > > If the application already knows it's targeting a specific version =
of
> > > > the QEMU API, which for the above code to make any sense it will ha=
ve
> > > > to, couldn't it do something like
> > > >=20
> > > >   import qemu .../qemu/v700
> > > >=20
> > > > at the beginning of the file and then use regular old
> > > >=20
> > > >   cmd :=3D qemu.BlockResizeArguments{
> > > >       NodeName: nodeName,
> > > >       Size: size,
> > > >   }
> > > >=20
> > > > instead?
> > >=20
> > > This would lead to a situation where every struct is duplicated
> > > for every version, even though 90% of the time they'll be identical
> > > across multiple versions. This is not very ammenable to the desire
> > > to be able to dynamically choose per-command which version you
> > > want based on which version of QEMU you're connected to.
> > >=20
> > > ie=20
> > >=20
> > >=20
> > >      var cmd Command
> > >      if qmp.HasVersion(qemu.Version(7, 0, 0)) {
> > >         cmd =3D BlockResizeArguments{
> > >            V700: &BlockResizeArguments700{
> > >              NodeName: node,
> > >              Size: 1 * GiB
> > > 	   }
> > >          }
> > >      } else {
> > >         cmd =3D BlockResizeArguments{
> > >            V520: &BlockResizeArguments520{
> > >              Device: dev,
> > >              Size: 1 * GiB
> > > 	   }
> > >          }
> > >      }
> > >=20
> > > And of course the HasVersion check is going to be different
> > > for each command that matters.
> > >=20
> > > Having said that, this perhaps shows the nested structs are
> > > overkill. We could have=20
> > >=20
> > >=20
> > >      var cmd Command
> > >      if qmp.HasVersion(qemu.Version(7, 0, 0)) {
> > >          cmd =3D &BlockResizeArguments700{
> > >              NodeName: node,
> > >              Size: 1 * GiB
> > >          }
> > >      } else {
> > >         cmd =3D &BlockResizeArguments520{
> > >              Device: dev,
> > >              Size: 1 * GiB
> > >          }
> > >      }
> >=20
> > The else block would be wrong in versions above 7.0.0 where
> > block_resize changed. There will be a need to know for a specific
> > Type if we are covered with latest qemu/qapi-go or not. Not yet
> > sure how to address that, likely we will need to keep the
> > information that something has been added/changed/removed per
> > version per Type in qapi-go...
>=20
> I put that in the "nice to have" category. No application can
> predict the future, and nor do they really need to try in
> general.=20
>=20
> If the application code was written when the newest QEMU was
> 7.1.0, and the above code is correct for QEMU <=3D 7.1.0, then
> that's good enough. If the BlockResizeArguments struct changed
> in a later QEMU version 8.0.0, that doesn't matter at the point
> the app code was written.

I'm not thinking at runtime, I'm thinking at compile time.

I update $myproject's qpai-go to 8.0.0 and get a warnings that
some types would not work with 8.0.0 (e.g: because there is a new
BlockResizeArguments800)

> Much of the time the changes are back compatible, ie just adding
> a new field, and so everything will still work fine if the app
> carries on using BlockResizeArguments700, despite a new
> BlockResizeArguments800 arriving with a new field.
>=20
> Only in the cases where a field was removed or changed in a
> non-compatible manner would an app have problems, and QEMU will
> happily report an error at runtime if the app sends something
> incompatible.

Yeah, runtime error is fine but if we can provide some extra
checks at the time someone wants to move qapi-go from 7.2.0 to
8.0.0, that would be great.

Cheers,
Victor

--io7mjiohz3esce77
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmKEtcwACgkQl9kSPeN6
SE/Oww//bHT7vmYk8Z+VrBwZbd6m4Me/PA4AYqGGHSh6/iUph81F+H4SEMt27drd
s0Xir8cseK11yOwdjAIJ1l8wfg97AZEKzPE1ygkW+ku2ff8tXfeEoVBV5FJv3pmQ
OssmZ2WNd0LYEvyXAJuPV4U1sMf//Tczu9J1TpYj1Lkovv2Rc21KnAsjye4apF44
Ic9IC9HWxoaEKWvrVL/qnpMlnit/Np0CCidTCBmWe1ghLJ3cpRTpEPTHiOflSAhd
5JpX8DkiJf5MRCowNllFQ5EJgLmAfG5X6fRw0nj6c1Di+y7Ld2B+xArHK5XwEwSG
fnPJd4BEIQx0AN85LBnbPiOnWGt25zXPhd6PJMYgCeGrVIveRodM6RcGdJe39Z2S
jpPmRZ/JBIMvesFlYSQ/YK27SmL/4P9iUQKFiMQYUqMcWHo0IsgiKjkn9D0oLPp4
g7r/CslHbV8axef1b/pytWFnekO5oj390+DxrWZBHLPc9nm2lCNBhPbXwczF2pwR
MEQcz1+n1wkC9sw96hCfADHAIpdPefyNpj0pk2eA2cwO89uXEYIGZXvCQTQuuqvn
hl3KMNfLSWVLbKsIU9Fv1VxKWqwOnMNmpeFzvR/hs7ATvCbqZp5iqDmeRjNLOnRR
mMEwY+6KCrfkTpv9nRF7MXzxPXoHJ+fatxgRyGCN+7PRbnrSDx0=
=kklo
-----END PGP SIGNATURE-----

--io7mjiohz3esce77--


