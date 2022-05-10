Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E151952141A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 13:44:31 +0200 (CEST)
Received: from localhost ([::1]:59426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noOI3-0005WQ-1T
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 07:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noOCc-00020M-39
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:38:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noOCL-0006wn-O7
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652182716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Il3zKnO7+XPfYLqjVGKM++TF6CfvQj5wyS3uc0gbKiU=;
 b=MfjAqb8oJ33sDxObB/DbIqPM5BTnhvWjzh0w7NSrqU3YjyGH/pef1Lm3hPDD2UwDUbwGFr
 jz6IFI3Oe2kwAWLsowCroeC0MtvAevYBNHFu+Yt/wntaMkxYKHNpjLWZ5TTzm+2/yIxOSn
 i/0tVYTRL09B2egddhl3cnwReewcEfY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-f8_KlhyKOWmEFEfRQUuM9w-1; Tue, 10 May 2022 07:38:35 -0400
X-MC-Unique: f8_KlhyKOWmEFEfRQUuM9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 112758015BA
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 11:38:35 +0000 (UTC)
Received: from localhost (unknown [10.40.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 517A62166B4C;
 Tue, 10 May 2022 11:38:34 +0000 (UTC)
Date: Tue, 10 May 2022 13:38:33 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 5/8] qapi: golang: Generate qapi's event types in Go
Message-ID: <20220510113833.qai6p4h3p76te6i3@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <20220401224104.145961-6-victortoso@redhat.com>
 <YnpBghiwJCBVDqAm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j32jl2vmchz3jzxy"
Content-Disposition: inline
In-Reply-To: <YnpBghiwJCBVDqAm@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
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


--j32jl2vmchz3jzxy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 10, 2022 at 11:42:10AM +0100, Daniel P. Berrang=E9 wrote:
> On Sat, Apr 02, 2022 at 12:41:01AM +0200, Victor Toso wrote:
> > This patch handles QAPI event types and generates data structures in
> > Go that handles it.
> >=20
> > At the moment of this writing, it generates 51 structures (49 events)
> >=20
> > In Golang, each event is handled as a Go structure and there is no big
> > difference, in the Go generated code, between what is a QAPI event
> > type and what is a QAPI struct.
> >=20
> > Each QAPI event has the suffix 'Event' in its Golang data structure
> > and contains the fields, mandatory and optional, that can be
> > sent or received.
> >=20
> > In addition, there are two structures added to handle QAPI
> > specification for event types: 'Event' and 'EventBase'.
> >=20
> > 'EventBase' contains @Name and @Timestamp fields and then 'Event'
> > extends 'EventBase' with an @Arg field of type 'Any'.
>=20
> Again, I don't think we should need to use an Any type here.
>=20
> Rather than=20
>=20
>   type EventBase struct {
>         Name      string `json:"event"`
>         Timestamp struct {
>                 Seconds      int64 `json:"seconds"`
>                 Microseconds int64 `json:"microseconds"`
>         } `json:"timestamp"`
>   }
>=20
>   type Event struct {
>         EventBase
>         Arg Any `json:"data,omitempty"`
>   }
>=20
>   type ShutdownEvent struct {
>         Guest  bool          `json:"guest"`
>         Reason ShutdownCause `json:"reason"`
>   }
>=20
>=20
> I think we should just embed EventBase directly in each specific
> event eg
>=20
>=20
>   type Event struct {
>         Name      string `json:"event"`
>         Timestamp struct {
>                 Seconds      int64 `json:"seconds"`
>                 Microseconds int64 `json:"microseconds"`
>         } `json:"timestamp"`
>   }
>=20
>   type ShutdownEvent struct {
>         Event Event
>         Guest  bool          `json:"guest"`
>         Reason ShutdownCause `json:"reason"`
>   }
>=20
>=20
> Or perhaps better still, use an interface=20
>=20
>   type Event interface {
>       GetName() string
>       GetTimestamp() string
>   }
>=20
>   type Timestamp struct {
>       Seconds      int64 `json:"seconds"`
>       Microseconds int64 `json:"microseconds"`
>   }
>=20
>   type ShutdownEvent struct {
>         Timestamp Timestamp  `json:"timestamp"`
>         Guest  bool          `json:"guest"`
>         Reason ShutdownCause `json:"reason"`
>   }
>=20
>   func (ev *ShutdownEvent) GetName() string {
>         return "SHUTDOWN"
>   }
>=20
> That way you can define public APIs taking 'Event' as a type,
> and impls of the events can be passed directly in/out.
>=20
> Similar comment for the Command type.

Yeah, if we are removing Any for Unions and Alternates, we can
sure do the same for Events and Commands.


> > The 'Event' type implements the Unmarshaler to decode the QMP JSON
> > Object into the correct Golang (event) struct. The goal here is to
> > facilitate receiving Events.
> >=20
> > A TODO for this type is to implement Marshaler for 'Event'. It'll
> > containt runtime checks to validate before transforming the struct
> > into a JSON Object.
> >=20
> > Example:
> > ```go
> >     qmpMsg :=3D `{
> >     "event" : "MIGRATION",
> >     "timestamp":{
> >         "seconds": 1432121972,
> >         "microseconds": 744001
> >     },
> >     "data":{
> >         "status": "completed"
> >     }
> > }`
> >=20
> >     e :=3D Event{}
> >     _ =3D json.Unmarshal([]byte(qmpMsg), &e)
> >     // e.Name =3D=3D "MIGRATION"
> >     // e.Arg.(MigrationEvent).Status =3D=3D MigrationStatusCompleted
> > ```
> >=20
> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> > ---
> >  scripts/qapi/golang.py | 92 ++++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 84 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
> > index 0a1bf430ba..3bb66d07c7 100644
> > --- a/scripts/qapi/golang.py
> > +++ b/scripts/qapi/golang.py
> > @@ -31,9 +31,10 @@ class QAPISchemaGenGolangVisitor(QAPISchemaVisitor):
> > =20
> >      def __init__(self, prefix: str):
> >          super().__init__()
> > -        self.target =3D {name: "" for name in ["alternate", "enum", "h=
elper", "struct", "union"]}
> > +        self.target =3D {name: "" for name in ["alternate", "enum", "e=
vent", "helper", "struct", "union"]}
> >          self.objects_seen =3D {}
> >          self.schema =3D None
> > +        self.events =3D {}
> >          self._docmap =3D {}
> >          self.golang_package_name =3D "qapi"
> > =20
> > @@ -57,6 +58,24 @@ def visit_begin(self, schema):
> >      def visit_end(self):
> >          self.schema =3D None
> > =20
> > +        # EventBase and Event are not specified in the QAPI schema,
> > +        # so we need to generate it ourselves.
> > +        self.target["event"] +=3D '''
> > +type EventBase struct {
> > +    Name      string `json:"event"`
> > +    Timestamp struct {
> > +        Seconds      int64 `json:"seconds"`
> > +        Microseconds int64 `json:"microseconds"`
> > +    } `json:"timestamp"`
> > +}
> > +
> > +type Event struct {
> > +    EventBase
> > +    Arg       Any    `json:"data,omitempty"`
> > +}
> > +'''
> > +        self.target["event"] +=3D generate_marshal_methods('Event', se=
lf.events)
> > +
> >          self.target["helper"] +=3D '''
> >  // Creates a decoder that errors on unknown Fields
> >  // Returns true if successfully decoded @from string @into type
> > @@ -279,7 +298,28 @@ def visit_command(self,
> >          pass
> > =20
> >      def visit_event(self, name, info, ifcond, features, arg_type, boxe=
d):
> > -        pass
> > +        assert name =3D=3D info.defn_name
> > +        type_name =3D qapi_to_go_type_name(name, info.defn_meta)
> > +        self.events[name] =3D type_name
> > +
> > +        doc =3D self._docmap.get(name, None)
> > +        self_contained =3D True if not arg_type or not arg_type.name.s=
tartswith("q_obj") else False
> > +        content =3D ""
> > +        if self_contained:
> > +            doc_struct, _ =3D qapi_to_golang_struct_docs(doc)
> > +            content =3D generate_struct_type(type_name, "", doc_struct)
> > +        else:
> > +            assert isinstance(arg_type, QAPISchemaObjectType)
> > +            content =3D qapi_to_golang_struct(name,
> > +                                            doc,
> > +                                            arg_type.info,
> > +                                            arg_type.ifcond,
> > +                                            arg_type.features,
> > +                                            arg_type.base,
> > +                                            arg_type.members,
> > +                                            arg_type.variants)
> > +
> > +        self.target["event"] +=3D content
> > =20
> >      def write(self, output_dir: str) -> None:
> >          for module_name, content in self.target.items():
> > @@ -351,15 +391,41 @@ def generate_marshal_methods_enum(members: List[Q=
APISchemaEnumMember]) -> str:
> >  }}
> >  '''
> > =20
> > -# Marshal methods for Union types
> > +# Marshal methods for Event and Union types
> >  def generate_marshal_methods(type: str,
> >                               type_dict: Dict[str, str],
> >                               discriminator: str =3D "",
> >                               base: str =3D "") -> str:
> > -    assert base !=3D ""
> > -    discriminator =3D "base." + discriminator
> > -
> > -    switch_case_format =3D '''
> > +    type_is_union =3D False
> > +    json_field =3D ""
> > +    struct_field =3D ""
> > +    if type =3D=3D "Event":
> > +        base =3D type + "Base"
> > +        discriminator =3D "base.Name"
> > +        struct_field =3D "Arg"
> > +        json_field =3D "data"
> > +    else:
> > +        assert base !=3D ""
> > +        discriminator =3D "base." + discriminator
> > +        type_is_union =3D True
> > +
> > +    switch_case_format =3D ""
> > +    if not type_is_union:
> > +        switch_case_format =3D '''
> > +    case "{name}":
> > +        tmp :=3D struct {{
> > +            Value {isptr}{case_type} `json:"{json_field},omitempty"`
> > +        }}{{}}
> > +        if err :=3D json.Unmarshal(data, &tmp); err !=3D nil {{
> > +            return err
> > +        }}
> > +        if tmp.Value =3D=3D nil {{
> > +            s.{struct_field} =3D nil
> > +        }} else {{
> > +            s.{struct_field} =3D {isptr}tmp.Value
> > +        }}'''
> > +    else:
> > +        switch_case_format =3D '''
> >      case {name}:
> >          value :=3D {case_type}{{}}
> >          if err :=3D json.Unmarshal(data, &value); err !=3D nil {{
> > @@ -374,12 +440,17 @@ def generate_marshal_methods(type: str,
> >          case_type =3D type_dict[name]
> >          isptr =3D "*" if case_type[0] not in "*[" else ""
> >          switch_cases +=3D switch_case_format.format(name =3D name,
> > +                                                  struct_field =3D str=
uct_field,
> > +                                                  json_field =3D json_=
field,
> > +                                                  isptr =3D isptr,
> >                                                    case_type =3D case_t=
ype)
> >          if case_type not in added:
> >              if_supported_types +=3D f'''typestr !=3D "{case_type}" &&\=
n\t\t'''
> >              added[case_type] =3D True
> > =20
> > -    marshalfn =3D f'''
> > +    marshalfn =3D ""
> > +    if type_is_union:
> > +        marshalfn =3D f'''
> >  func (s {type}) MarshalJSON() ([]byte, error) {{
> >  	base, err :=3D json.Marshal(s.{base})
> >  	if err !=3D nil {{
> > @@ -564,4 +635,9 @@ def qapi_to_go_type_name(name: str, meta: str) -> s=
tr:
> >      words =3D [word for word in name.replace("_", "-").split("-")]
> >      name =3D words[0].title() if words[0].islower() or words[0].isuppe=
r() else words[0]
> >      name +=3D ''.join(word.title() for word in words[1:])
> > +
> > +    if meta =3D=3D "event":
> > +        name =3D name[:-3] if name.endswith("Arg") else name
> > +        name +=3D meta.title()
> > +
> >      return name
> > --=20
> > 2.35.1
> >=20
> >=20
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

--j32jl2vmchz3jzxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJ6TrkACgkQl9kSPeN6
SE8RyA//cYiObrydemCrqNmOo5YjExsWtFVvUVWOUC1c045P5cTI1bzk1EPyIyUH
0YchtJ3Z1Z88fQLwCitmKOjAKeJObrf9w+SOw0Dr3kaWBFrJbkl+ZVqYK1nzgdeI
JeF6vXuSgBmzqgQQ5/28n6cx89BPaD3+rqWSC7B5eOfkrHRrVxleHbIc2AZIYGyv
SunZd4RTxz0Mjx9q3Javwgp6OoiHT4MU/V8RDkmpKLrO50h6II603Jk183qcTJUX
PPxDGjomxguQ3dbC7SOQKb4eLSP8qSzggyu3az6t4w/nzKFw33+DONg0Wg/usEvJ
PSl/qBa54SpaDLtQtyn21KmV61fq1RoOImiBcImk/qYQGDZTpvmluOBq8eKJhpLh
KSCHlFVdd+yg40kslz+ApSe5/TC0OuUCXtA2YY6wjziqq3PChjT2M+CubqeRDo+E
NP0OTONyZJ92EUORoFZe1YgPFjjyV8XJQKlKrM/hSLxE31ZFjHgtZC9TBwhk0uZ2
bViDibDtVuRKCgspR7FS1ww0ZJKN+VipVk/iEvyfh66gqjzVLFOIQOAnJryCx0VY
xdGEGK8ncXpDvpidXKoIAf5GJbRqip9kVGqhawfp7HVL2VihorjFDmK/LpTIgPCu
YS8Zo5ukRO4nMD9fid1hQTajUpv4sOBTLGwJdJqJjWo5lDKmqt0=
=e++r
-----END PGP SIGNATURE-----

--j32jl2vmchz3jzxy--


