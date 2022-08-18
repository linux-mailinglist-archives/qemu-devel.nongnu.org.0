Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41948597F93
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 09:55:47 +0200 (CEST)
Received: from localhost ([::1]:59598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOaNW-0004lu-CM
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 03:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOaFf-00015y-UB
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 03:47:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOaFX-0006zf-7N
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 03:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660808850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jlLo8aHa5t/3LsuazCAIjxs/xbF4ydBposCgStsPfHg=;
 b=fYXJLEJ67XHUcUeQAnue6HimNSaIQ/GLMNmoigiKX7lCv49hJaARRpGJqxhrDbBDlRscIF
 py+HnvM6qYfjhH/sGjVcXRjWAw38gj+oBCqdZAbkrPHpkWdtkPEeydiMqN+Rv2Y8spVJNm
 YVZoR7F3obxjKGsUwPxrZ1K1NrwRUlY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-awXLMQASP_q9PKxUWPnICw-1; Thu, 18 Aug 2022 03:47:28 -0400
X-MC-Unique: awXLMQASP_q9PKxUWPnICw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F9FE1C068D2
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 07:47:28 +0000 (UTC)
Received: from localhost (unknown [10.40.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 343381415133;
 Thu, 18 Aug 2022 07:47:27 +0000 (UTC)
Date: Thu, 18 Aug 2022 09:47:26 +0200
From: Victor Toso <victortoso@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 5/8] qapi: golang: Generate qapi's event types in Go
Message-ID: <20220818074726.xx3sg7hzthamymcu@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-6-victortoso@redhat.com>
 <CABJz62MhUS4LNOWNwPdf0vwwL2JMUzkmLrPBotezchyomGg58Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tax64u4tximhntqm"
Content-Disposition: inline
In-Reply-To: <CABJz62MhUS4LNOWNwPdf0vwwL2JMUzkmLrPBotezchyomGg58Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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


--tax64u4tximhntqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Jul 05, 2022 at 08:45:54AM -0700, Andrea Bolognani wrote:
> On Fri, Jun 17, 2022 at 02:19:29PM +0200, Victor Toso wrote:
> > This patch handles QAPI event types and generates data structures in
> > Go that handles it.
> >
> > We also define a Event interface and two helper functions MarshalEvent
> > and UnmarshalEvent.
> >
> > At the moment of this writing, this patch generates 51 structures (50
> > events)
> >
> > Example:
> >
> > qapi:
> >   | { 'event': 'MEMORY_DEVICE_SIZE_CHANGE',
> >   |   'data': { '*id': 'str', 'size': 'size', 'qom-path' : 'str'} }
> >
> > go:
> >   | type MemoryDeviceSizeChangeEvent struct {
> >   |         EventTimestamp Timestamp `json:"-"`
> >   |         Id             *string   `json:"id,omitempty"`
> >   |         Size           uint64    `json:"size"`
> >   |         QomPath        string    `json:"qom-path"`
> >   | }
> >
> > usage:
> >   | input := `{"event":"MEMORY_DEVICE_SIZE_CHANGE",` +
> >   |     `"timestamp":{"seconds":1588168529,"microseconds":201316},` +
> >   |     `"data":{"id":"vm0","size":1073741824,"qom-path":"/machine/unattached/device[2]"}}`
> >   | e, err := UnmarshalEvent([]byte(input)
> >   | if err != nil {
> >   |     panic(err)
> >   | }
> >   | if e.GetName() == `MEMORY_DEVICE_SIZE_CHANGE` {
> >   |     m := e.(*MemoryDeviceSizeChangeEvent)
> >   |     // m.QomPath == "/machine/unattached/device[2]"
> >   | }
>
> Generated code:
>
> > type AcpiDeviceOstEvent struct {
> >     EventTimestamp Timestamp   `json:"-"`
>
> Any reason for naming this EventTimestamp as opposed to just
> Timestamp?

Yes, perhaps one that can be workaround in the next iteration.
IIRC, I've added the type prefix to avoid the possibility of name
clash with generated fields (like Info below).

> >     Info           ACPIOSTInfo `json:"info"`
> > }

This happened with Command's Id that clashed with an Id for one
or several other commands so I've changed it to  "CommandId" and
thought it would be wise to do the same for non generated fields.

> > func (s *AcpiDeviceOstEvent) GetName() string {
> >     return "ACPI_DEVICE_OST"
> > }
>
> Getters in Go don't usually start with "Get", so this could be just
> Name(). And pointer receivers are usually only recommended when the
> underlying object needs to be modified, which is not the case here.

Yeah, thanks. I'll change it.

> > func (s *AcpiDeviceOstEvent) GetTimestamp() Timestamp {
> >     return s.EventTimestamp
> > }
>
> Does this even need a getter? The struct member is public, and Go
> code seems to favor direct member access.

As Daniel pointed out, just for the sake of working with a Event
interface.

> > type Timestamp struct {
> >     Seconds      int64 `json:"seconds"`
> >     Microseconds int64 `json:"microseconds"`
> > }
> >
> > type Event interface {
> >     GetName() string
> >     GetTimestamp() Timestamp
> > }
> >
> > func MarshalEvent(e Event) ([]byte, error) {
> >     baseStruct := struct {
> >         Name           string    `json:"event"`
> >         EventTimestamp Timestamp `json:"timestamp"`
> >     }{
> >         Name:           e.GetName(),
> >         EventTimestamp: e.GetTimestamp(),
> >     }
> >     base, err := json.Marshal(baseStruct)
> >     if err != nil {
> >         return []byte{}, err
> >     }
> >
> >     dataStruct := struct {
> >         Payload Event `json:"data"`
> >     }{
> >         Payload: e,
> >     }
> >     data, err := json.Marshal(dataStruct)
> >     if err != nil {
> >         return []byte{}, err
> >     }
> >
> >     if len(data) == len(`{"data":{}}`) {
> >         return base, nil
> >     }
> >
> >     // Combines Event's base and data in a single JSON object
> >     result := fmt.Sprintf("%s,%s", base[:len(base)-1], data[1:])
> >     return []byte(result), nil
> > }
>
> I have the same concerns about the string manipulation going on
> here as I had for unions. Here's an alternative implementation,
> and this time I've even tested it :)

Yup. I agree that string manipulation was bad decision. I'll
change it here too.

>   func (s AcpiDeviceOstEvent) MarshalJSON() ([]byte, error) {
>       type eventData struct {
>           Info ACPIOSTInfo `json:"info"`
>       }
>       type event struct {
>           Name      string    `json:"event"`
>           Timestamp Timestamp `json:"timestamp"`
>           Data      eventData `json:"data"`
>       }
>
>       tmp := event{
>           Name:      "ACPI_DEVICE_OST",
>           Timestamp: s.EventTimestamp,
>           Data:      eventData{
>               Info: s.Info,
>           },
>       }
>       return json.Marshal(tmp)
>   }
>
> > func UnmarshalEvent(data []byte) (Event, error) {
> >     base := struct {
> >         Name           string    `json:"event"`
> >         EventTimestamp Timestamp `json:"timestamp"`
> >     }{}
> >     if err := json.Unmarshal(data, &base); err != nil {
> >         return nil, errors.New(fmt.Sprintf("Failed to decode event: %s", string(data)))
> >     }
> >
> >     switch base.Name {
> >
> >     case "ACPI_DEVICE_OST":
> >         event := struct {
> >             Data AcpiDeviceOstEvent `json:"data"`
> >         }{}
> >
> >         if err := json.Unmarshal(data, &event); err != nil {
> >             return nil, errors.New(fmt.Sprintf("Failed to unmarshal: %s", string(data)))
> >         }
> >         event.Data.EventTimestamp = base.EventTimestamp
> >         return &event.Data, nil
> >
> >     // more cases here
> >     }
> >     return nil, errors.New("Failed to recognize event")
> > }
>
> While I understand the need to have some way to figure out exactly
> what type of event we're looking at before being able to unmarshal
> the JSON data, I don't like how we force users to go through a
> non-standard API for it.
>
> Here's how I think we should do it:
>
>   func GetEventType(data []byte) (Event, error) {
>       type event struct {
>           Name string `json:"event"`
>       }
>
>       tmp := event{}
>       if err := json.Unmarshal(data, &tmp); err != nil {
>           return nil, errors.New(fmt.Sprintf("Failed to decode event:
> %s", string(data)))
>       }
>
>       switch tmp.Name {
>       case "ACPI_DEVICE_OST":
>           return &AcpiDeviceOstEvent{}, nil
>
>       // more cases here
>       }
>
>       return nil, errors.New("Failed to recognize event")
>   }
>
>   func (s *AcpiDeviceOstEvent) UnmarshalJSON(data []byte) error {
>       type eventData struct {
>           Info ACPIOSTInfo `json:"info"`
>       }
>       type event struct {
>           Name           string    `json:"event"`
>           EventTimestamp Timestamp `json:"timestamp"`
>           Data           eventData `json:"data"`
>       }
>
>       tmp := event{}
>       err := json.Unmarshal(data, &tmp)
>       if err != nil {
>           return err
>       }
>       if tmp.Name != "ACPI_DEVICE_OST" {
>           return errors.New("name")
>       }
>
>       s.EventTimestamp = tmp.EventTimestamp
>       s.Info = tmp.Data.Info
>       return nil
>   }
>
> This way, client code can look like
>
>   in := `{"event":"ACPI_DEVICE_OST","timestamp":{"seconds":1265044230,"microseconds":450486},"data":{"info":{"device":"d1","slot":"0","slot-type":"DIMM","source":1,"status":0}}}`
>
>   e, err := qapi.GetEventType([]byte(in))
>   if err != nil {
>       panic(err)
>   }
>   // e is of type AcpiDeviceOstEvent
>
>   err = json.Unmarshal([]byte(in), &e)
>   if err != nil {
>       panic(err)
>   }
>
> where only the first part (figuring out the type of the event) needs
> custom APIs, and the remaining code looks just like your average JSON
> handling.

I'll reply to this bit in the other email of this thread.

> Speaking of client code, in the commit message you have
>
> > input := `{"event":"MEMORY_DEVICE_SIZE_CHANGE",` +
> >     `"timestamp":{"seconds":1588168529,"microseconds":201316},` +
> >     `"data":{"id":"vm0","size":1073741824,"qom-path":"/machine/unattached/device[2]"}}`
> > e, err := UnmarshalEvent([]byte(input)
> > if err != nil {
> >     panic(err)
> > }
> > if e.GetName() == `MEMORY_DEVICE_SIZE_CHANGE` {
> >     m := e.(*MemoryDeviceSizeChangeEvent)
> >     // m.QomPath == "/machine/unattached/device[2]"
> > }
>
> I don't think we should encourage the use of string comparison for
> the purpose of going from a generic Event instance to a specific one:
> a better way would be to use Go's type switch feature, such as
>
>   switch m := e.(type) {
>       case *MemoryDeviceSizeChangeEvent:
>           // m.QomPath == "/machine/unattached/device[2]"
>   }

Yes, this seems much better/align with Go code. Many thanks for
this!

> In fact, I don't really see a reason to provide the Name() getter
> outside of possibly diagnostics, and given the potential of it being
> misused I would argue that it might be better not to have it.
>
> --
> Andrea Bolognani / Red Hat / Virtualization

Cheers,
Victor

--tax64u4tximhntqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmL97o4ACgkQl9kSPeN6
SE8O1Q/7BWZMdDBoFfmEeqR90Ad4+XRELbVksPeEQ/kxX8aNn8M5pCxKf6xW+l7I
xZ0C8fLU5pqzTN4b2ZAr+YYmaPfRFjsh6t0vSbsTFKr5+Y8zTT2nikwaOo1T7vqK
pJvhBIz49wZ0ciiH5nauqvX8uSyqpSJNE+1+LT6gi+uEOm1jqmpx61kKSOo4SQ/y
hO69rV7s17cdjsxgW3k5YeEmQr0Dbh41VZ/K8sXJYuQf24FZZrfbIw80ZMnsl8Dd
/3BaWNxOmMyh2P+01N+YsBDqOfRGu3d9+zeUDm4uHAoly6g8XOeyJZZjZK5a9j1g
KukMfq40GPpZk+nNKOuHScumeV8JY67r23RaXgh9pa4hkm688lTZlRjqBJ0Td0/y
xi/JOH/XbG4cTZaOlWRUXUkDO4ytgVdD2nNnkzL/UOPutnXtdaohdvWmlcejOGc3
ezdiYcl1EvJC/t3e8Y6XZu3xVgFbB2/fWp8FhM2/gzltCUgzWeJziun7YY6pILsj
P6ej+olr++SaFZE41yQD9/BZD3FI51yX3do990idZ1GrEGOdjdlYaL3NLNVdBB8F
JwTusBLf08uN2/7YKChWAwwtjN6YfhU7PQA3Eoix+NJNWSZx8SuEg3VPrvFyl/zI
cM3qaLbRbdLT2ublcRpNleZcpWwGFhQ0BOgg36ZP14qRn2P3ANA=
=Qha7
-----END PGP SIGNATURE-----

--tax64u4tximhntqm--


