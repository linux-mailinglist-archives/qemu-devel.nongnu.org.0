Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFD551F9BB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:24:48 +0200 (CEST)
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0ZL-0008BK-LX
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1no0Vz-0005ul-Ti
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:21:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1no0Vx-0001Be-EQ
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652091675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SdBxU/khqGuPr1IfFZnJJHX1MiCxuIa+gPo1DwWLRBM=;
 b=W+GPujm9KbJ86exEy0g9wflmPkuGmoZk3mI4GrLASt7YSaifj6ssonzp1axpTpRSJemrtN
 +QZBS8dLVnRAYt7jhDIYNarVWmml/7+bQ8ExJHrKq7+40u9PTrsURddoTRTlAxLpIQQrZC
 O7AIxbrJD7PQrPblFVuaRzFOhixcO7A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-hbRowLWDMQaODpqz1zZ7wg-1; Mon, 09 May 2022 06:21:13 -0400
X-MC-Unique: hbRowLWDMQaODpqz1zZ7wg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 899ED805B25
 for <qemu-devel@nongnu.org>; Mon,  9 May 2022 10:21:13 +0000 (UTC)
Received: from localhost (unknown [10.40.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B00E42D4F3;
 Mon,  9 May 2022 10:21:11 +0000 (UTC)
Date: Mon, 9 May 2022 12:21:10 +0200
From: Victor Toso <victortoso@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <20220509102110.slum5rwtbyve5odk@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sjcdnn2kp2l3ldh5"
Content-Disposition: inline
In-Reply-To: <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
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


--sjcdnn2kp2l3ldh5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Sorry for taking some time to reply.

On Tue, Apr 19, 2022 at 11:12:28AM -0700, Andrea Bolognani wrote:
> On Sat, Apr 02, 2022 at 12:40:56AM +0200, Victor Toso wrote:
> > Thanks for taking a look, let me know if you have questions, ideas
> > or suggestions.
>=20
> Full disclosure: I have only given the actual implementation a very
> cursory look so far, and I've focused on the generated Go API
> instead.
>=20
> Overall things look pretty good.

Glad to hear.

> One concern that I have is about naming struct members: things like
> SpiceInfo.MouseMode and most others are translated from the QAPI
> schema exactly the way you'd expect them, but for example
> ChardevCommon.Logappend doesn't look quite right. Of course there's
> no way to programmatically figure out what to capitalize, but maybe
> there's room for adding this kind of information in the form of
> additional annotations or something like that? Same for the various
> structs or members that have unexpectedly-capitalized "Tls" or "Vnc"
> in them.
>=20
> To be clear, I don't think the above is a blocker - just something to
> be aware of, and think about.

There was a good discussion around this with Markus so I don't
want to break it in another thread.

I'm happy that you have found those inconsistencies. I'll reply
on the other thread about it but I don't mind working towards
fixing it, either at code generator level or at QAPI level.

> My biggest concern is about the interface offered for commands.
>=20
> Based on the example you have in the README and how commands are
> defined, invoking (a simplified version of) the trace-event-get-state
> command would look like
>=20
>   cmd :=3D Command{
>       Name: "trace-event-get-state",
>       Arg: TraceEventGetStateCommand{
>           Name: "qemu_memalign",
>       },
>   }
>   qmp_input, _ :=3D json.Marshal(&cmd)
>   // qmp_input now contains
>   //   {"execute":"trace-event-get-state","arguments":{"name":"qemu_memal=
ign"}}
>   // do something with it
>=20
>   qmp_output :=3D
> ([]byte)(`{"return":{"name":"qemu_memalign","state":"disabled"}}`)
>   ret :=3D cmd.GetReturnType()
>   _ =3D json.Unmarshal(qmp_output, &ret)
>   // ret is a CommandResult instance whose Value member can be cast
>   // to a TraceEventInfo struct
>=20
> First of all, from an application's point of view there are way too
> many steps involved:

It can actually get worse. I've used a lot of nested struct to
define a Base type for a given Type. In Go, If you try to
initialize a Type that has a nested Struct, you'll need to use
the nested struct Type as field name and this is too verbose.

See https://github.com/golang/go/issues/29438 (merged with:
https://github.com/golang/go/issues/12854)

The main reason that I kept it is because it maps very well with
the over-the-wire protocol.

> performing this operation should really be as
> simple as
>=20
>   ret, _ :=3D qmp.TraceEventGetState("qemu_memalign")
>   // ret is a TraceEventInfo instance
>=20
> That's the end state we should be working towards.
>=20
> Of course that assumes that the "qmp" object knows where the
> QMP socket is, knows how to talk the QMP protocol,
> transparently deals with serializing and deserializing data...
> Plus, in some case you might want to deal with the wire
> transfer yourself in an application-specific manner. So it
> makes sense to have the basic building blocks available and
> then build the more ergonomic SDK on top of that - with only
> the first part being in scope for this series.

Right. Indeed, I thought a bit about what I want to fit into the
code generator that will reside in QEMU and what we might want to
develop on top of that.

The goal for this series really is generating the data types that
can be converted to/from QMP messages.

I completely agree with the message below: Type validation is
important at this stage.

> Even with that in mind, the current interface is IMO
> problematic because of its almost complete lack of type safety.
> Both Command.Arg and CommandResult.Value are of type Any and
> CommandBase.Name, which is used to drive the JSON unmarshal
> logic as well as ending up on the wire when executing a
> command, is just a plain string.
>=20
> I think the low-level interface should look more like
>=20
>   cmd :=3D TraceEventGetStateCommand{
>       Name: "qemu_memalign",
>   }
>   qmp_input, _ :=3D json.Marshal(&cmd)
>   // qmp_input looks the same as before

That isn't too hard to implement and I've started with this
design at first. Each QAPI Command can implement a method Name()
which returns the over-the-wire name for that Command.

I'm not yet sure if this is preferable over some other syntactic
sugar function that might be generated (this series) or the next
layer that will be on top of this.

But I agree with you that it should be improved before reaching
actual Applications.

>   qmp_output :=3D
> ([]byte)(`{"return":{"name":"qemu_memalign","state":"disabled"}}`)
>   ret :=3D TraceEventInfo{}
>   _ =3D json.Unmarshal(qmp_output, &ret)
>   // ret is a TraceEventInfo instance
>=20
> The advantages over the current implementation is that the compiler
> will prevent you from doing something silly like passing the wrong
> set of arguments to a commmand, and that the application has to
> explicitly spell out what kind of object it expects to get as output.

I think that, if we know all types that we can have at QAPI spec,
the process of marshalling and unmarshalling should verify it.
So, even if we don't change the expected interface as suggested,
that work needs to be done. For some types, I've already did it,
like for Unions and Alternate types.

Example: https://gitlab.com/victortoso/qapi-go/-/blob/main/pkg/qapi/unions.=
go#L28

This union type can have 4 values for the Any interface type. The
code generator documents it to help user's out.

  | type SocketAddressLegacy struct {
  |     // Base type for this struct
  |     SocketAddressLegacyBase
  |     // Value based on @type, possible types:
  |     // * InetSocketAddressWrapper
  |     // * UnixSocketAddressWrapper
  |     // * VsockSocketAddressWrapper
  |     // * StringWrapper
  |     Value Any
  | }
 =20
On the Marshal function, I used Sprintf as a way to fetch Value's
type. There are other alternatives but to the cost of adding
other deps.

  | func (s SocketAddressLegacy) MarshalJSON() ([]byte, error) {
  |     base, err :=3D json.Marshal(s.SocketAddressLegacyBase)
  |     if err !=3D nil {
  |         return nil, err
  |     }
  |
  |     typestr :=3D fmt.Sprintf("%T", s.Value)
  |     typestr =3D
  |     typestr[strings.LastIndex(typestr, ".")+1:]

=2E..

  |     // "The branches need not cover all possible enum values"
  |     // This means that on Marshal, we can safely ignore empty values
  |     if typestr =3D=3D "<nil>" {
  |         return []byte(base), nil
  |     }
    =20
And then we have some Runtime checks to be sure to avoid the
scenario mismatching Value's type.

  |     // Runtime check for supported value types
  |     if typestr !=3D "StringWrapper" &&
  |         typestr !=3D "InetSocketAddressWrapper" &&
  |         typestr !=3D "UnixSocketAddressWrapper" &&
  |         typestr !=3D "VsockSocketAddressWrapper" {
  |         return nil, errors.New(fmt.Sprintf("Type is not supported: %s",=
 typestr))
  |    }
  |    value, err :=3D json.Marshal(s.Value)
  |    if err !=3D nil {
  |        return nil, err
  |    }

With Alternate type, extra care was need on Unmarshal as we don't
know the underlying type without looking at the message we
received. That's the only reason of StrictDecode() helper
function.

I'm just pointing out with above examples that I agree with you
with Type safety. It is hard to infer everything at compile-time
so we need some Runtime checks. Having some nicer APIs will
definitely help and improve developer experience too.

> I'm attaching an incomplete implementation that I used for
> playing around. It's obviously too simplistic, but hopefully it
> will help illustrate my point.
>=20
> Dealing with errors and commands that don't have a return value
> might require us to have generic CommandResult wrapper after
> all, but we should really try as hard as we can to stick to
> type safe interfaces.

Agree. Many thanks again, for the review, suggestions and
discussions.

Cheers,
Victor

> --=20
> Andrea Bolognani / Red Hat / Virtualization

> package main
>=20
> import (
> 	"encoding/json"
> 	"fmt"
> )
>=20
> type TraceEventGetStateCommand struct {
> 	Name string `json:"name"`
> }
>=20
> func (self *TraceEventGetStateCommand) MarshalJSON() ([]byte, error) {
> 	type Arguments TraceEventGetStateCommand
> 	return json.Marshal(&struct {
> 		Execute   string     `json:"execute"`
> 		Arguments *Arguments `json:"arguments"`
> 	}{
> 		Execute:   "trace-event-get-state",
> 		Arguments: (*Arguments)(self),
> 	})
> }
>=20
> type TraceEventInfo struct {
> 	Name  string `json:"name"`
> 	State string `json:"state"`
> }
>=20
> func (self *TraceEventInfo) UnmarshalJSON(data []byte) error {
> 	type Return TraceEventInfo
> 	ret :=3D struct {
> 		Return Return `json:"return"`
> 	}{}
> 	err :=3D json.Unmarshal(data, &ret)
> 	if err !=3D nil {
> 		return err
> 	}
> 	self.Name =3D ret.Return.Name
> 	self.State =3D ret.Return.State
> 	return nil
> }
>=20
> func main() {
> 	var err error
> 	var qmp_input []byte
> 	var qmp_output []byte
>=20
> 	cmd :=3D TraceEventGetStateCommand{
> 		Name: "qemu_memalign",
> 	}
> 	if qmp_input, err =3D json.Marshal(&cmd); err !=3D nil {
> 		panic(err)
> 	}
> 	fmt.Printf("   cmd: %v\n", cmd)
> 	fmt.Printf("-> qmp_input: %v\n", string(qmp_input))
>=20
> 	qmp_output =3D ([]byte)(`{"return":{"name":"qemu_memalign","state":"disa=
bled"}}`)
> 	ret :=3D TraceEventInfo{}
> 	if err =3D json.Unmarshal(qmp_output, &ret); err !=3D nil {
> 		panic(err)
> 	}
> 	fmt.Printf("<- qmp_output: %v\n", string(qmp_output))
> 	fmt.Printf("   ret: %v\n", ret)
> }


--sjcdnn2kp2l3ldh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJ46xYACgkQl9kSPeN6
SE9W3g//c9rM4GPLX/l1SW3A6X4AFpRXh6LEiISqH89td0Hb/KDIQlL0AuunJSC4
kBR0cFtDuJ+hHhuaLg1mQmI+xyTEEN/afGRa+ZaHvIdaRF1H26N38ktN+09DXcRm
GRXyuEZ60lIxQBIzeWb+KQpuwXcmKq9WBJ/RPfOJPQhMAhwG+scwlk9jnOzYWl9G
L7B0TZlOkbJXy9P4+0oesWkIBmeQ7ul8Nh4OKcySB2pOllNgET/43QTPthAckbNX
xF6KZmhAOuSgYrhTdPh3kPBQUT7CSOwGEuoqPNh2PmqRnLgwHSLgwgWP26a2BE8f
yRtmkRKzhmxE/lZGi62KpWBm/XAQimpr8k3O91bsQlp14ypGTAuBlVcyWewH5JFX
Hf2ESX30VqlsQxfjhdPha8Sd3FXLVky8YFbtQHPRLbj/0ubT+W8J24HjCg+3QAf/
86cFimjVYQhVD3S42yBGzoktSOvUA9etZjcTi41PdBjsg/S8W/1Q4K2z3eR1xbO9
Doz6E1Ui2LeORopasvBmsPG6bg8hwlKUQTRrajVvhNLgdmYXp/sMOS2NhWapX+CY
lcx4DNrly4TKGg8g3BQ1/doOob+xuwsR5rirEQnig9oyook1C0b6Al7DQs2Ay26n
mjCQ7RZXAqt3gz5eEnodDIG5hs1iLkr3Ydeff3RNumHQ5KgyhKo=
=/vV9
-----END PGP SIGNATURE-----

--sjcdnn2kp2l3ldh5--


