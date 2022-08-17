Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B12597473
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:49:39 +0200 (CEST)
Received: from localhost ([::1]:39256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOMEb-00062N-M2
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOLrn-00072q-T8
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:26:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOLrk-00078D-IY
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660753559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PNB2nEyanzsGF2twoWfghN+9SBcBZ/TQtdoALWDuuPs=;
 b=GOwYo0pyfx4TZ8k6ArcRmKwmhFz+3oNUZQjJpSvobBifAb4tjHC9avHWZWtD4bgRnv8eDf
 yNjSHWhc0HoZjJ8fUUHTvTlg5I32TqSzmU8IfJf7/bvTdmf/T+gYvMNDGgz8OuGTKdewwH
 MV5w2/dc3cEGOH3nqME82xlZgsGWfHA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-6c23logwP6a1zj19AljJKg-1; Wed, 17 Aug 2022 12:25:57 -0400
X-MC-Unique: 6c23logwP6a1zj19AljJKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A85BC1C068C3
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 16:25:57 +0000 (UTC)
Received: from localhost (unknown [10.40.192.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FC9B400E122;
 Wed, 17 Aug 2022 16:25:57 +0000 (UTC)
Date: Wed, 17 Aug 2022 18:25:56 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH v2 4/8] qapi: golang: Generate qapi's union types in Go
Message-ID: <20220817162556.fqjq74dtgi2uuyla@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-5-victortoso@redhat.com>
 <CABJz62P_Fy=eyn-QjhOBSvTs_YRgMA=2=teeQwN9SsYGNKGLcQ@mail.gmail.com>
 <YsRoTs/Ev+MPiIoN@redhat.com>
 <CABJz62NwXK7SErZt4520iKpgEaeVH86L7am4GcMyr8PbG29RCA@mail.gmail.com>
 <YsVX7ir+41NPA6Xy@redhat.com> <YsVaVpXPE4YVjmVt@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tucddwqkmu245qr4"
Content-Disposition: inline
In-Reply-To: <YsVaVpXPE4YVjmVt@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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


--tucddwqkmu245qr4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2022 at 10:48:06AM +0100, Daniel P. Berrang=E9 wrote:
> On Wed, Jul 06, 2022 at 10:37:54AM +0100, Daniel P. Berrang=E9 wrote:
> > On Wed, Jul 06, 2022 at 04:28:16AM -0500, Andrea Bolognani wrote:
> > > You're right, that is undesirable. What about something like this?
> > >
> > >   type GuestPanicInformation struct {
> > >       HyperV *GuestPanicInformationHyperV
> > >       S390   *GuestPanicInformationS390
> > >   }
> > >
> > >   type jsonGuestPanicInformation struct {
> > >       Discriminator string                       `json:"type"`
> > >       HyperV        *GuestPanicInformationHyperV `json:"hyper-v"`
> > >       S390          *GuestPanicInformationS390   `json:"s390"`
> > >   }
> >
> > It can possibly be even simpler with just embedding the real
> > struct
> >
> >    type jsonGuestPanicInformation struct {
> >        Discriminator string
> >        GuestPanicInformation
> >    }

Similar to what I said in previous email (same thread) to Andrea,
this would not work because the end result does not match with
QAPI spec, where HyperV or S390 fields should be at the same
level as 'type'.

If we embed either HyperV or S390, then it should work, like:

    tmp :=3D struct {
        GuestPanicInformationHyperV
        Discriminator string "type"
    }{}

But I intend to try the json.RawMessage too as with description
it seems like we can avoid looking the whole json data twice.

> > >   func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
> > >       if (s.HyperV !=3D nil && s.S390 !=3D nil) ||
> > >           (s.HyperV =3D=3D nil && s.S390 =3D=3D nil) {
> > >           // client hasn't filled in the struct properly
> > >           return nil, errors.New("...")
> > >       }
> > >=20
> > >       tmp :=3D jsonGuestPanicInformation{}
> > >=20
> > >       if s.HyperV !=3D nil {
> > >           tmp.Discriminator =3D "hyper-v"
> > >           tmp.HyperV =3D s.HyperV
> > >       } else if s.S390 !=3D nil {
> > >           tmp.Discriminator =3D "s390"
> > >           tmp.S390 =3D s.S390
> > >       }
> > >=20
> > >       return json.Marshal(tmp)
> > >   }
> >=20
> > And...
> >=20
> >        var discriminator string
> >        if s.HyperV !=3D nil {
> >            discriminator =3D "hyper-v"
> >        } else if s.S390 !=3D nil {
> >            discriminator =3D "s390"
> >        }
> >=20
> >        tmp :=3D jsonGuestPanicInformation{ discriminator, s}
> >        return json.Marshal(tmp)
> >=20
> > >=20
> > >   func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
> > >       tmp :=3D jsonGuestPanicInformation{}
> > >=20
> > >       err :=3D json.Unmarshal(data, &tmp)
> > >       if err !=3D nil {
> > >           return err
> > >       }
> > >=20
> > >       switch tmp.Discriminator {
> > >       case "hyper-v":
> > >           if tmp.HyperV =3D=3D nil {
> > >               return errors.New("...")
> > >           }
> > >           s.HyperV =3D tmp.HyperV
> > >       case "s390":
> > >           if tmp.S390 =3D=3D nil {
> > >               return errors.New("...")
> > >           }
> > >           s.S390 =3D tmp.S390
> > >       }
> >
> > I'm not actually sure this works, because the first json.Unmarshal
> > call won't know which branch to try unmarhsalling. So it might be
> > unavoidable to parse twice.  With the XML parser this wouldn't be
> > a problem as it has separated the parse phase and then fills the
> > struct after.
>=20
> Right afer sending, I remember how this is supposed to be done. It
> involves use of 'json.RawMessage' eg examples at:
>=20
>   https://pkg.go.dev/encoding/json#example-RawMessage-Unmarshal
>=20
> So it would look like:
>=20
>    type GuestPanicInformation struct {
>        HyperV *GuestPanicInformationHyperV
>        S390   *GuestPanicInformationS390
>    }
> =20
>    type jsonGuestPanicInformation struct {
>        Discriminator string   `json:"type"`
>        Payload *json.RawMessage
>    }
>=20
>=20
>     func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
>         var p *json.RawMesage
>         var err error
>         if s.HyperV !=3D nil {
>             d =3D "hyper-v"
>             p, err =3D json.Marshal(s.HyperV)
>         } else if s.S390 !=3D nil {
>             d =3D "s390"
>             p, err =3D json.Marshal(s.S390)
>         } else {
> 	    err =3D fmt.Errorf("No payload defined")
> 	}
>         if err !=3D nil {
>             return []byte{}, err
>         }
>  =20
>         return json.Marshal(jsonGuestPanicInformation{d, p}), nil
>     }
>=20
>=20
> =20
>    func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
>        tmp :=3D jsonGuestPanicInformation{}
> =20
>        err :=3D json.Unmarshal(data, &tmp)
>        if err !=3D nil {
>            return err
>        }
> =20
>        switch tmp.Discriminator {
>        case "hyper-v":
>            s.HyperV :=3D GuestPanicInformationHyperV{}
>            err :=3D json.Unmarshal(tmp.Payload, s.HyperV)
>            if err !=3D nil {
>               return err
>            }
>        case "s390":
>            s.S390 :=3D GuestPanicInformationS390{}
>            err :=3D json.Unmarshal(tmp.Payload, s.S390)
>            if err !=3D nil {
>               return err
>            }
>        }
>=20
>        return fmt.Errorf("Unknown type '%s'", tmp.Discriminator)
>   }
>=20
> With regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

Cheers,
Victor

--tucddwqkmu245qr4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmL9FpQACgkQl9kSPeN6
SE/fIg/+P/xs+Kze2y0vTq57PBBI4Te5hBQ+bF3HZZCw7uIeBJwRWgPDxCTm9oyf
z3c8OmQpxYz/WSFasQ8zj0JzaZQ+KqPuPO0gPrB3pHMBi066HZMAOUgtSjxWulYU
56NVmck75YcdcfV1VZ/JBOO405T+Ly3RZ7YW+vhX2Y3LUQq9zmN/0qVbwRJwy7/N
KoLSmXkp4MW0fL+V7BC50lid4Xh8eO26PdGSezyWEhabYjbalC/+7o24r/1byXjA
aV1v8efFkHXPj4ZOqLvlmL9TnuX/hVCrahGUbIr2yNLDxEmlp2ehGA9w+4/YrTw2
A8uweE5OzewbOm5KHMT7LZR7qEQXkizg6q77ZGP6CA11TE9IFbKb67vgLOawVrBw
GmF/11492Ii2KyGrm5OoJ/x1xtXC3+lXBm6P6k5GCbZyCtjndhhO9zJd3KZv7P2/
9e0m1+UCAUEUb9E12B3fmyBqbuHZ8u0j+8qe7QsmlaaAxOk15P6DHHD9Jah9igIT
rhVDjqL1ih6ciDSGZeNX9ntEeKuOLJH8Co5KboT0NRX04JbDVyR82ycinkZKcmCI
NQqmKFVFkyA0lKFPJm1hP6XYd/ql+oBPzmbMHDXNQ4KO3sI85QHZMo9LMikDRVJu
cMVLQPhhtGJSR9eaEFVM/8jYu9e4uom53fY0FLX27xvceP0T36Q=
=Kj9B
-----END PGP SIGNATURE-----

--tucddwqkmu245qr4--


