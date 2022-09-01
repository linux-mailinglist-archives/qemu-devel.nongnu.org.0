Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849375A936C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:42:30 +0200 (CEST)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgiT-0002kH-FG
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTfhP-00072b-DL
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTfhM-00023r-KS
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662021435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8RDXT8g3KisK1TCmuPkueQ+F2HXK63Os+tghRf/HG5M=;
 b=YGe/zaK7TFD7co8nZRxRvQ6Nq67QQLC1Hr3V3eJ2kc/u1vXVeSgR9wgyOiae0UknSKGruX
 OKC81Z+BdHq++SENjgTy5Sj9Xv7ekFWxfup26AJENeA2uZQFvxczH2eE2bPtvI1ir3F1ZU
 qcURuE5VvfPrrl3wPo5fZcBmXO9HWAg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-w2xUg5ttOCWf0kkrqjQI9A-1; Thu, 01 Sep 2022 04:37:11 -0400
X-MC-Unique: w2xUg5ttOCWf0kkrqjQI9A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 614A93C11041;
 Thu,  1 Sep 2022 08:37:11 +0000 (UTC)
Received: from localhost (unknown [10.40.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECD3240CF8F2;
 Thu,  1 Sep 2022 08:37:10 +0000 (UTC)
Date: Thu, 1 Sep 2022 10:37:09 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v1 16/16] RFC: add a generator for qapi's examples
Message-ID: <20220901083709.p6jpz3mqnew3rmsr@tapioca>
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-17-victortoso@redhat.com>
 <87ilm8aafh.fsf@pond.sub.org>
 <20220831133255.os2xaxtkolbvmcq5@tapioca>
 <87sflc5ulr.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6l4ltwtytz7oxixv"
Content-Disposition: inline
In-Reply-To: <87sflc5ulr.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


--6l4ltwtytz7oxixv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 31, 2022 at 04:57:20PM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>=20
> > Hi,
> >
> > On Wed, Aug 31, 2022 at 02:01:54PM +0200, Markus Armbruster wrote:
> >> Victor Toso <victortoso@redhat.com> writes:
> >>
> >> > The goal of this generator is to validate QAPI examples and transform
> >> > them into a format that can be used for 3rd party applications to
> >> > validate their QAPI/QMP introspection.
> >> >
> >> > For each Example section, we parse server and client messages into a
> >> > python dictionary. This step alone has found several ill formatted
> >> > JSON messages in the examples.
> >> >
> >> > The generator outputs another JSON file with all the examples in the
> >> > QAPI module that they came from. This can be used to validate the
> >> > introspection between QAPI/QMP to language bindings.
> >> >
> >> > When used with the POC qapi-go branch, we have found bad QMP messages
> >> > with wrong member names, mandatory members that were missing and
> >> > optional members that were being set with null (not needed).
> >> >
> >> > A simple example of the output format is:
> >> >
> >> >  { "examples": [
> >> >    {
> >> >      "id": "ksuxwzfayw",
> >> >      "client": [
> >> >      {
> >> >        "sequence-order": 1
> >> >        "message-type": "command",
> >> >        "message":
> >> >        { "arguments":
> >> >          { "device": "scratch", "size": 1073741824 },
> >> >          "execute": "block_resize"
> >> >        },
> >> >     } ],
> >> >     "server": [
> >> >     {
> >> >       "sequence-order": 2
> >> >       "message-type": "return",
> >> >       "message": { "return": {} },
> >> >     } ]
> >> >     }
> >> >   ] }
> >> >
> >> > If this idea seems reasonable, we can add python-qemu-qmp to validate
> >> > each message at generation time already.
> >> >
> >> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> >>
> >> If I understand you correctly, there are two benefits:
> >>
> >> 1. Mechanical syntax check for examples
> >>
> >>    Love it.
> >
> > Not just JSON syntax but can be extend to the introspection
> > layer. Errors like wrong member names would fail while parsing
> > the examples (issues such as fixed by patches 11 and 13/16 should
> > not happen anymore).
>=20
> It's also a mechanical check against the schema.  Still love it :)

Great :)

> >> 2. Can extract examples for use as test cases
> >>
> >>    Sounds good to me.  Possible redundancy with existing tests.
> >>    Probably nothing to worry about.
> >>
> >>    Can you explain in a bit more detail how the extracted data
> >>    is (to be) used?
> >
> > Sure.
> >
> > The Golang test that consumes this is 152 lines of code [0]. The
> > idea is that we can use the examples to feed Golang unmarshalling
> > code and then marshall it back to JSON and compare input JSON
> > with output JSON and see that their content matches.
> >
> > [0] https://gitlab.com/victortoso/qapi-go/-/blob/wip-v3/test/examples_t=
est.go
> >
> > I have generated the examples with this patch series and stored
> > the output here [1]
> >
> > [1] https://gitlab.com/victortoso/qapi-go/-/tree/wip-v3/test/data/examp=
les
> >
> > The examples are QMP messages that are either sent by Client "->"
> > or sent by Server "<-". The order matters so I take the order set
> > in the examples and store it as "sequence-order".
> >
> > In the Go test code, I follow the sequence-order. One example of
> > this being useful is that we know which Return type to expect
> > after a Command is issued.
> >
> > I've also included metadata about the type of message, which is
> > one of three options: command, event or return. (Errors are
> > return too).
> >
> > This is important because it makes the tests very easy to write.
> > Different Unmarshal/Marshal code can be set in the code block of
> > the specific message type.
> >
> > --
> >
> > The things that makes me quite excited with this idea are:
> >
> >  1. We have valid functional examples documented. If the examples
> >     break, we would have the software in place to know it (plug
> >     to ci or some other ninja check seems reasonable to me)
> >
> >  2. Developers should get more interested in documenting examples
> >     as that alone is is a valid test case, even if only useful
> >     for language binding's syntax.
>=20
> Thanks!  Would you like to work some of this into your commit message?

Yeah. I'll resend this series fixing the style you have proposed
and I'll be removing the patches that might need some extra
discussion, like this rfc and examples that are cut short with a
comment.

I'll improve this generator and send it later, probably after the
next iteration of qapi-go. This also gives some room to feedback
=66rom others, if any.

Cheers,
Victor

--6l4ltwtytz7oxixv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmMQbzUACgkQl9kSPeN6
SE9D3A//V+bjKLfPpp/n0CxS2f85s7GrxoX9vesULniUEaFLJ1OXxI1sntVTFTSs
DgfqGnGvtbBlOw8uLmC8GlZIIzgswA5BPzjbvF6b8aN7/SeY1U9Rz3MoADwxfWeJ
vAi3DVpRQ4TasFKOse5FJXvWncNGBPWz0v5hEK9cxVQ8UtKm55hDGh9MsKQFDM17
uu2dXtnAMC+eVs6D/9k4AKOzPP5hETwVMO0xjFHxJEaU4/Cd2NXNXFiO6d+mpYf7
rHzGGGPMqARr+CvKtoGySHPB/wLVeesz4pc9/d2UHMUICtoRdupfG09XCBb93F/N
4jKpWzX4Y2le56sCbtFzkfRgJKBO2VlLjb0YFtmMra7SYKuaU0OOyze1wQI2oKQS
irTQoksoJdD50aE1J4TvUf8dEMxAtjBSe1q1LcXg7mBMxyPm07dNLnqRry29hmr1
aeqFGgad/CzENBr2pSPOzmmAWd/dVIWoljLa/2fbJviypqSt6H0QvA35ytYBSx3/
iY3CPgq0fvmLKSqp/79y2rcYDy4fy6sCrKKzGSMe5842mOJW7Re2RspQHnZTwW01
H2kkO2T654QY/KfE/1Z9APLGaR8ET0Y94l37os49XWUh/ChGuoxn3SjLN5N0zqW8
L3f+QU9j8v0LOeticoiLL4wuYcKZl/IE7c3hKBmEzGvEbC/lMvk=
=jMCY
-----END PGP SIGNATURE-----

--6l4ltwtytz7oxixv--


