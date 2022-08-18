Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6B0597FB3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 10:04:09 +0200 (CEST)
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOaVb-0002Cv-Sy
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 04:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOaN9-0004lC-Ta
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 03:55:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOaN7-00012x-4m
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 03:55:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660809319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+su47h9/MWHiG9p/BnXdV34s9EShHoG6LdNmnIsAIhA=;
 b=Rj07v+5di4oA85nRax7/BQ6WM7v+A0XqVCvaMeKdCBy7XJGJAbKGzExQl64tXVtP77p4Gs
 C1J/+LURWjiYwukRaFUz8vtzAEX7Zbn9IJGCpsEVIzvd9N2/1lKxEZniWP0E9Jmt5xrEhv
 PHFCalyA5mQ5JrglFOwW1P89fCN7xIg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-D_2eUw_aPZqYt264NUz7Ew-1; Thu, 18 Aug 2022 03:55:17 -0400
X-MC-Unique: D_2eUw_aPZqYt264NUz7Ew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B40B85A597
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 07:55:17 +0000 (UTC)
Received: from localhost (unknown [10.40.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD07D2026D07;
 Thu, 18 Aug 2022 07:55:16 +0000 (UTC)
Date: Thu, 18 Aug 2022 09:55:15 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH v2 5/8] qapi: golang: Generate qapi's event types in Go
Message-ID: <20220818075515.3tsorfrxlgpjba6l@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-6-victortoso@redhat.com>
 <CABJz62MhUS4LNOWNwPdf0vwwL2JMUzkmLrPBotezchyomGg58Q@mail.gmail.com>
 <YsRrHbNAZCjmQUcL@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tkncn6qup6ilnxa3"
Content-Disposition: inline
In-Reply-To: <YsRrHbNAZCjmQUcL@redhat.com>
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


--tkncn6qup6ilnxa3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 05, 2022 at 05:47:25PM +0100, Daniel P. Berrang=E9 wrote:
> On Tue, Jul 05, 2022 at 08:45:54AM -0700, Andrea Bolognani wrote:
> > On Fri, Jun 17, 2022 at 02:19:29PM +0200, Victor Toso wrote:
> > > This patch handles QAPI event types and generates data structures in
> > > Go that handles it.
> > >
> > > We also define a Event interface and two helper functions MarshalEvent
> > > and UnmarshalEvent.
> > >
> > > At the moment of this writing, this patch generates 51 structures (50
> > > events)
> > >
> > > Example:
> > >
> > > qapi:
> > >   | { 'event': 'MEMORY_DEVICE_SIZE_CHANGE',
> > >   |   'data': { '*id': 'str', 'size': 'size', 'qom-path' : 'str'} }
> > >
> > > go:
> > >   | type MemoryDeviceSizeChangeEvent struct {
> > >   |         EventTimestamp Timestamp `json:"-"`
> > >   |         Id             *string   `json:"id,omitempty"`
> > >   |         Size           uint64    `json:"size"`
> > >   |         QomPath        string    `json:"qom-path"`
> > >   | }
> > >
> > > usage:
> > >   | input :=3D `{"event":"MEMORY_DEVICE_SIZE_CHANGE",` +
> > >   |     `"timestamp":{"seconds":1588168529,"microseconds":201316},` +
> > >   |     `"data":{"id":"vm0","size":1073741824,"qom-path":"/machine/un=
attached/device[2]"}}`
> > >   | e, err :=3D UnmarshalEvent([]byte(input)
> > >   | if err !=3D nil {
> > >   |     panic(err)
> > >   | }
> > >   | if e.GetName() =3D=3D `MEMORY_DEVICE_SIZE_CHANGE` {
> > >   |     m :=3D e.(*MemoryDeviceSizeChangeEvent)
> > >   |     // m.QomPath =3D=3D "/machine/unattached/device[2]"
> > >   | }
>=20
>=20
> > > func (s *AcpiDeviceOstEvent) GetTimestamp() Timestamp {
> > >     return s.EventTimestamp
> > > }
> >=20
> > Does this even need a getter? The struct member is public, and Go
> > code seems to favor direct member access.
>=20
> It satisfies the 'Event' interface, so you can fetch timestamp
> without needing to know the specific event struct you're dealing
> with.
>=20
> >=20
> > > type Timestamp struct {
> > >     Seconds      int64 `json:"seconds"`
> > >     Microseconds int64 `json:"microseconds"`
> > > }
> > >
> > > type Event interface {
> > >     GetName() string
> > >     GetTimestamp() Timestamp
> > > }
> > >
>=20
>=20
> > > func UnmarshalEvent(data []byte) (Event, error) {
> > >     base :=3D struct {
> > >         Name           string    `json:"event"`
> > >         EventTimestamp Timestamp `json:"timestamp"`
> > >     }{}
> > >     if err :=3D json.Unmarshal(data, &base); err !=3D nil {
> > >         return nil, errors.New(fmt.Sprintf("Failed to decode event: %=
s", string(data)))
> > >     }
> > >
> > >     switch base.Name {
> > >
> > >     case "ACPI_DEVICE_OST":
> > >         event :=3D struct {
> > >             Data AcpiDeviceOstEvent `json:"data"`
> > >         }{}
> > >
> > >         if err :=3D json.Unmarshal(data, &event); err !=3D nil {
> > >             return nil, errors.New(fmt.Sprintf("Failed to unmarshal: =
%s", string(data)))
> > >         }
> > >         event.Data.EventTimestamp =3D base.EventTimestamp
> > >         return &event.Data, nil
> > >
> > >     // more cases here
> > >     }
> > >     return nil, errors.New("Failed to recognize event")
> > > }
> >=20
> > While I understand the need to have some way to figure out exactly
> > what type of event we're looking at before being able to unmarshal
> > the JSON data, I don't like how we force users to go through a
> > non-standard API for it.
> >=20
> > Here's how I think we should do it:
> >=20
> >   func GetEventType(data []byte) (Event, error) {
> >       type event struct {
> >           Name string `json:"event"`
> >       }
> >=20
> >       tmp :=3D event{}
> >       if err :=3D json.Unmarshal(data, &tmp); err !=3D nil {
> >           return nil, errors.New(fmt.Sprintf("Failed to decode event:
> > %s", string(data)))
> >       }
> >=20
> >       switch tmp.Name {
> >       case "ACPI_DEVICE_OST":
> >           return &AcpiDeviceOstEvent{}, nil
> >=20
> >       // more cases here
> >       }
> >=20
> >       return nil, errors.New("Failed to recognize event")
> >   }
> >=20
> >   func (s *AcpiDeviceOstEvent) UnmarshalJSON(data []byte) error {
> >       type eventData struct {
> >           Info ACPIOSTInfo `json:"info"`
> >       }
> >       type event struct {
> >           Name           string    `json:"event"`
> >           EventTimestamp Timestamp `json:"timestamp"`
> >           Data           eventData `json:"data"`
> >       }
> >=20
> >       tmp :=3D event{}
> >       err :=3D json.Unmarshal(data, &tmp)
> >       if err !=3D nil {
> >           return err
> >       }
> >       if tmp.Name !=3D "ACPI_DEVICE_OST" {
> >           return errors.New("name")
> >       }
> >=20
> >       s.EventTimestamp =3D tmp.EventTimestamp
> >       s.Info =3D tmp.Data.Info
> >       return nil
> >   }
> >=20
> > This way, client code can look like
> >=20
> >   in :=3D `{"event":"ACPI_DEVICE_OST","timestamp":{"seconds":1265044230=
,"microseconds":450486},"data":{"info":{"device":"d1","slot":"0","slot-type=
":"DIMM","source":1,"status":0}}}`
> >=20
> >   e, err :=3D qapi.GetEventType([]byte(in))
> >   if err !=3D nil {
> >       panic(err)
> >   }
> >   // e is of type AcpiDeviceOstEvent
> >=20
> >   err =3D json.Unmarshal([]byte(in), &e)
> >   if err !=3D nil {
> >       panic(err)
> >   }
> >=20
> > where only the first part (figuring out the type of the event) needs
> > custom APIs, and the remaining code looks just like your average JSON
> > handling.
>=20
> I don't think this kind of detail really needs to be exposed to
> clients. Also parsing the same json doc twice just feels wrong.
>=20
> I think using the dummy union structs is the right approach, but
> I'd just call it 'EventFromJSON' rather than 'UnmarshalJSON' to
> make it clear this is different from a normal 'UnmarshalJSON'
> method.

The current method signatures are:

    func MarshalEvent(e Event) ([]byte, error)
    func UnmarshalEvent(data []byte) (Event, error)

the suggestion is to change it to

    func EventToJSON(e Event) ([]byte, error)
    func EventFromJSON(data []byte) (Event, error)

or

    func JSONFromEvent(e Event) ([]byte, error)
    func EventFromJSON(data []byte) (Event, error)

? :)

I'm not picky with names so, what you find is best is okay for
me.

I'll be changing the function to avoid string manipulation in
favor of some anonymous structs.

Thanks you all for the review, really appreciate it!
Victor

--tkncn6qup6ilnxa3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmL98GMACgkQl9kSPeN6
SE9V1A/9Fhq/ZVbB4uOy/gxH2x1NEM5sApOaofOh8I4PO214kC6PFi5LG27fPMOF
dwlyyFl38GNVD/SWHznIOjuRIUB2Ta0L3/2rRQ3uVYAs1qciRC24yuLpxVjNU2hw
xb8dgxDpBv6G9EKXkNplNgh11a933B8nyPg3keoB/Hb/iIDgfx4HQIycfdn+qqnh
uKOK+9yLR7P47ANnOEjyxTCGQLrk+fV6UUZelAlaqr8o47ZON/Y49mtuWIv7JYmh
ZmdSoKmlCdp1b+E7J9HO9vOAaeO7tpA6pyEXMokXg976zTgo39Mn5LWOX5XtAfwP
YWEEaQAtQ6dZXTdAwn2XZHjtXfQPHXV1N4nrR8OZJ3fULSZZ5R/xdSVtMIPU/DO5
SXuvbJdeNctmimBW1tvQ/3Vrgu4PgcyHBJ5brTxjkwwjvH0F8Lc6I35BKE184BrN
T3kmyrbSKujbEZpnvpLD8B88MxJpTKisfXVfnl9soCC7cIUVQteGyjHJAJu5xAP2
KoHFydkHQwXaztRd2MQGZ/BQkwDMmFhYeygvUO3M9xRrRDztHDY8adSbdcAczuVJ
OtgMQfU0/CMeevE5sndzj7ipcBbJLMK84M1pQX0B9vgL6OH9+I+PT5Plho2TABa7
htalU8XG3lonVs+LesUfizk4kqA1Z+wWZNNmAt+CqPCZ4DAWo60=
=LnOS
-----END PGP SIGNATURE-----

--tkncn6qup6ilnxa3--


