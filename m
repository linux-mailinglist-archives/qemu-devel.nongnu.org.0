Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F8A597408
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:20:55 +0200 (CEST)
Received: from localhost ([::1]:55304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLmo-00064q-Ob
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOLYw-000440-Us
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:06:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOLYt-00069i-O2
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:06:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660752390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=33od86kKkSHaaDtGWmtKvl+sigMyK6qaSw4fOIvzNWI=;
 b=GQu/vcCWHlF7Ky1EAVsuAos5clV6wexg/xRAB1Xhh575cLZc8I/qdnEq1YmXrwF/H7pD+k
 iOHvUK2Me8rGxhjC3XvXJz/OzyhzGGWR8t5GOc93IBVRrF5BzsvRD5MuO1PEXVwoFC+plM
 rEzBqM9o7bRxsrR4jnByxyx4yaiT74o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-JoxrjD0iNwOWF_0Wf0kmWA-1; Wed, 17 Aug 2022 12:06:28 -0400
X-MC-Unique: JoxrjD0iNwOWF_0Wf0kmWA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C2A4811E80
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 16:06:28 +0000 (UTC)
Received: from localhost (unknown [10.40.192.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 224DC1121315;
 Wed, 17 Aug 2022 16:06:27 +0000 (UTC)
Date: Wed, 17 Aug 2022 18:06:26 +0200
From: Victor Toso <victortoso@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH v2 4/8] qapi: golang: Generate qapi's union types in Go
Message-ID: <20220817160626.ngf4k6rvkpkixgsj@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-5-victortoso@redhat.com>
 <CABJz62P_Fy=eyn-QjhOBSvTs_YRgMA=2=teeQwN9SsYGNKGLcQ@mail.gmail.com>
 <YsRoTs/Ev+MPiIoN@redhat.com>
 <CABJz62NwXK7SErZt4520iKpgEaeVH86L7am4GcMyr8PbG29RCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h2fizzect2j6yu75"
Content-Disposition: inline
In-Reply-To: <CABJz62NwXK7SErZt4520iKpgEaeVH86L7am4GcMyr8PbG29RCA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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


--h2fizzect2j6yu75
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 06, 2022 at 04:28:16AM -0500, Andrea Bolognani wrote:
> On Tue, Jul 05, 2022 at 05:35:26PM +0100, Daniel P. Berrang=E9 wrote:
> > On Tue, Jul 05, 2022 at 08:45:30AM -0700, Andrea Bolognani wrote:
> > > All this string manipulation looks sketchy. Is there some reason that
> > > I'm not seeing preventing you for doing something like the untested
> > > code below?
> > >
> > >   func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
> > >       if s.HyperV !=3D nil {
> > >           type union struct {
> > >               Discriminator string                      `json:"type"`
> > >               HyperV        GuestPanicInformationHyperV `json:"hyper-=
v"`
> > >           }
> > >           tmp :=3D union {
> > >               Discriminator: "hyper-v",
> > >               HyperV:        s.HyperV,
> > >           }
> > >           return json.Marshal(tmp)
> > >       } else if s.S390 !=3D nil {
> > >           type union struct {
> > >               Discriminator string                      `json:"type"`
> > >               S390          GuestPanicInformationHyperV `json:"s390"`
> > >           }
> > >           tmp :=3D union {
> > >               Discriminator: "s390",
> > >               S390:          s.S390,
> > >           }
> > >           return json.Marshal(tmp)
> > >       }
> > >       return nil, errors.New("...")
> > >   }
> >
> > Using these dummy structs is the way I've approached the
> > discriminated union issue in the libvirt Golang XML bindings
> > and it works well. It is the bit I like the least, but it was
> > the lesser of many evils, and on the plus side in the QEMU case
> > it'll be auto-generated code.
>
> It appears to be the standard way to approach the problem in Go. It
> sort of comes naturally given how the APIs for marshal/unmarshal have
> been defined.

Yep, string manipulation was bad choice. Some sort of anonymous
struct is a better fit. So I'll be changing this ...

> > > > func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
> > > >     type Alias GuestPanicInformation
> > > >     peek :=3D struct {
> > > >         Alias
> > > >         Driver string `json:"type"`
> > > >     }{}
> > > >
> > > >     if err :=3D json.Unmarshal(data, &peek); err !=3D nil {
> > > >         return err
> > > >     }
> > > >     *s =3D GuestPanicInformation(peek.Alias)
> > > >
> > > >     switch peek.Driver {
> > > >
> > > >     case "hyper-v":
> > > >         s.HyperV =3D new(GuestPanicInformationHyperV)
> > > >         if err :=3D json.Unmarshal(data, s.HyperV); err !=3D nil {
> > > >             s.HyperV =3D nil
> > > >             return err
> > > >         }
> > > >     case "s390":
> > > >         s.S390 =3D new(GuestPanicInformationS390)
> > > >         if err :=3D json.Unmarshal(data, s.S390); err !=3D nil {
> > > >             s.S390 =3D nil
> > > >             return err
> > > >         }
> > > >     }
> > > >     // Unrecognizer drivers are silently ignored.
> > > >     return nil
> > >
> > > This looks pretty reasonable, but since you're only using "peek" to
> > > look at the discriminator you should be able to leave out the Alias
> > > type entirely and perform the initial Unmarshal operation while
> > > ignoring all other fields.
> >
> > Once you've defined the dummy structs for the Marshall case
> > though, you might as well use them for Unmarshall too, so you're
> > not parsing the JSON twice.
>
> You're right, that is undesirable. What about something like this?
>
>   type GuestPanicInformation struct {
>       HyperV *GuestPanicInformationHyperV
>       S390   *GuestPanicInformationS390
>   }
>
>   type jsonGuestPanicInformation struct {
>       Discriminator string                       `json:"type"`
>       HyperV        *GuestPanicInformationHyperV `json:"hyper-v"`
>       S390          *GuestPanicInformationS390   `json:"s390"`
>   }

I didn't test this so I could be wrong but, I think this should
not work in case you want to remove the string manipulation.

The marshalling of either HyperV or S390 fields would return a
JSON Object but QAPI spec expects the fields at the same level as
the discriminator's type [0]. So, with this you still need some
string manipulation to remove the extra {}, like I did poorly
without any comment 0:-)

[0] https://gitlab.com/qemu-project/qemu/-/blob/master/docs/devel/qapi-code=
-gen.rst?plain=3D1#L358

>   func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
>       if (s.HyperV !=3D nil && s.S390 !=3D nil) ||
>           (s.HyperV =3D=3D nil && s.S390 =3D=3D nil) {
>           // client hasn't filled in the struct properly
>           return nil, errors.New("...")
>       }
>
>       tmp :=3D jsonGuestPanicInformation{}
>
>       if s.HyperV !=3D nil {
>           tmp.Discriminator =3D "hyper-v"
>           tmp.HyperV =3D s.HyperV
>       } else if s.S390 !=3D nil {
>           tmp.Discriminator =3D "s390"
>           tmp.S390 =3D s.S390
>       }
>
>       return json.Marshal(tmp)
>   }
>
>   func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
>       tmp :=3D jsonGuestPanicInformation{}
>
>       err :=3D json.Unmarshal(data, &tmp)
>       if err !=3D nil {
>           return err
>       }
>
>       switch tmp.Discriminator {
>       case "hyper-v":
>           if tmp.HyperV =3D=3D nil {
>               return errors.New("...")
>           }
>           s.HyperV =3D tmp.HyperV
>       case "s390":
>           if tmp.S390 =3D=3D nil {
>               return errors.New("...")
>           }
>           s.S390 =3D tmp.S390
>       }
>       // if we hit none of the cases above, that means the
>       // server has produced a variant we don't know about
>
>       return nil
>   }
>
> This avoid parsing the JSON twice as well as having to define
> multiple dummy structs, which keeps the code shorter and more
> readable.

If not too verbose, I'd still use anonymous structs whenever
possible. They are created for a given scope, they are basically
self documented in that given context and don't polluted
package's namespace.

> I've also thrown in some additional error checking for good
> measure, ensuring that we abort when the input is completely
> nonsensical from a semantical standpoint.

Thanks!
Victor

--h2fizzect2j6yu75
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmL9EgIACgkQl9kSPeN6
SE/R5g/9HEIyNHIkqLTiMw2Qyf0ftX4SaTwE1ErN4tnTAS1kW6wHv0KGdnc4xRYD
E7Rooo2BIel7Td01+01fVedepogAGJ8M/IQjOsd7sAuKlzUI86sJZ5UcqoWyl7B4
QwfiVmhHN8UhM348WvxEf6Dh2E2twx2dN9MfdqK1wptIv7KLpQ+vggSANQOVoeL0
IVgSSn1nctwWQgdq7ML0kmBO6bw8+Gv46zZhWdrrm1GL1wGoBOYdHKcJ5VPb3DHt
nZIp3PaPhKaEUDDYYO5ZxH0IlbIR7VCtzeKX0PExMg1Ixp2jL4e9LtLP77IlF1B4
FyQcAUig4Y181niO6mouoQPg+Qd4lFNoEDmzmxNV2nAjGcSN0wTXJ9fZEN+sok08
E5bJYvm/7SGyTIYhm/VXC4+eS8guMcq5tyrgzWdB+L0oPJ+tDRFHeng49UGzanHQ
FTrd0ccyvERm6hyLSvL2Hx2uuAB2OpPy8YMb/4jwuc0b+TaAnYzPMaw07RqBGwe0
eqn71/ZjvAF+txa0IR5YruS+DVGLQD3WsjmKTbLPetDYw577w2nuLFWa9tYIwUWP
FMqtW86COZx5aUgSoonU7Gdubwo9UmWnBlo6eQT4UEMsgC5a8m8iRZv0J9HUGr35
h5Sv1fRIlqq+NDDMmJurBitBw8q4/BEAuJf2PBRR+jnMGqqvCtU=
=ejsr
-----END PGP SIGNATURE-----

--h2fizzect2j6yu75--


