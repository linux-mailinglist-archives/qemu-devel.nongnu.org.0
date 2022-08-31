Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7E5A7EFE
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:37:21 +0200 (CEST)
Received: from localhost ([::1]:40942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNuA-0006Zz-8G
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTNq7-0003ou-JC
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:33:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTNq2-000867-CF
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661952781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yuNJHbVa7Q5rL93WrBtWfhFcOknzW65kh8D++HyBpBE=;
 b=C7D0LyvOSKiivCYcv9M8gNARFWORsY/3TkTm5vfvdxsmR9zBvx7qcZYn4X5Gdknrkv4SS7
 jefaomo8I50S/33PTjhkNu16aGJqz3/EFy/nR5Q0QcfouwYZ/su51yerpsUzW4CPAeXFyn
 3f97VlJpoZSVbgiHCsurTencjRQKpgQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-r5geG4nAPn6g7I1kuRg7AQ-1; Wed, 31 Aug 2022 09:32:57 -0400
X-MC-Unique: r5geG4nAPn6g7I1kuRg7AQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC01B10395C1;
 Wed, 31 Aug 2022 13:32:56 +0000 (UTC)
Received: from localhost (unknown [10.40.195.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63938945D2;
 Wed, 31 Aug 2022 13:32:56 +0000 (UTC)
Date: Wed, 31 Aug 2022 15:32:55 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v1 16/16] RFC: add a generator for qapi's examples
Message-ID: <20220831133255.os2xaxtkolbvmcq5@tapioca>
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-17-victortoso@redhat.com>
 <87ilm8aafh.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bwhs5hgubp7re4qj"
Content-Disposition: inline
In-Reply-To: <87ilm8aafh.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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


--bwhs5hgubp7re4qj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Aug 31, 2022 at 02:01:54PM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>
> > The goal of this generator is to validate QAPI examples and transform
> > them into a format that can be used for 3rd party applications to
> > validate their QAPI/QMP introspection.
> >
> > For each Example section, we parse server and client messages into a
> > python dictionary. This step alone has found several ill formatted
> > JSON messages in the examples.
> >
> > The generator outputs another JSON file with all the examples in the
> > QAPI module that they came from. This can be used to validate the
> > introspection between QAPI/QMP to language bindings.
> >
> > When used with the POC qapi-go branch, we have found bad QMP messages
> > with wrong member names, mandatory members that were missing and
> > optional members that were being set with null (not needed).
> >
> > A simple example of the output format is:
> >
> >  { "examples": [
> >    {
> >      "id": "ksuxwzfayw",
> >      "client": [
> >      {
> >        "sequence-order": 1
> >        "message-type": "command",
> >        "message":
> >        { "arguments":
> >          { "device": "scratch", "size": 1073741824 },
> >          "execute": "block_resize"
> >        },
> >     } ],
> >     "server": [
> >     {
> >       "sequence-order": 2
> >       "message-type": "return",
> >       "message": { "return": {} },
> >     } ]
> >     }
> >   ] }
> >
> > If this idea seems reasonable, we can add python-qemu-qmp to validate
> > each message at generation time already.
> >
> > Signed-off-by: Victor Toso <victortoso@redhat.com>
>
> If I understand you correctly, there are two benefits:
>
> 1. Mechanical syntax check for examples
>
>    Love it.

Not just JSON syntax but can be extend to the introspection
layer. Errors like wrong member names would fail while parsing
the examples (issues such as fixed by patches 11 and 13/16 should
not happen anymore).

> 2. Can extract examples for use as test cases
>
>    Sounds good to me.  Possible redundancy with existing tests.
>    Probably nothing to worry about.
>
>    Can you explain in a bit more detail how the extracted data
>    is (to be) used?

Sure.

The Golang test that consumes this is 152 lines of code [0]. The
idea is that we can use the examples to feed Golang unmarshalling
code and then marshall it back to JSON and compare input JSON
with output JSON and see that their content matches.

[0] https://gitlab.com/victortoso/qapi-go/-/blob/wip-v3/test/examples_test.go

I have generated the examples with this patch series and stored
the output here [1]

[1] https://gitlab.com/victortoso/qapi-go/-/tree/wip-v3/test/data/examples

The examples are QMP messages that are either sent by Client "->"
or sent by Server "<-". The order matters so I take the order set
in the examples and store it as "sequence-order".

In the Go test code, I follow the sequence-order. One example of
this being useful is that we know which Return type to expect
after a Command is issued.

I've also included metadata about the type of message, which is
one of three options: command, event or return. (Errors are
return too).

This is important because it makes the tests very easy to write.
Different Unmarshal/Marshal code can be set in the code block of
the specific message type.

--

The things that makes me quite excited with this idea are:

 1. We have valid functional examples documented. If the examples
    break, we would have the software in place to know it (plug
    to ci or some other ninja check seems reasonable to me)

 2. Developers should get more interested in documenting examples
    as that alone is is a valid test case, even if only useful
    for language binding's syntax.

Cheers,
Victor

--bwhs5hgubp7re4qj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmMPYwcACgkQl9kSPeN6
SE9JEg//XSYAUg3DLCPVAvldcvF9cDR3m1DJoVY5NFYEmJrVs6E6s5hXOkJw1V30
HSojtj1nt9wy9QyCF1a1yr0R0pizscT2TSxD2hBY+Wn1sDEAy4b2onMlAc7k5f6f
/8nTY3yIBLenT83NXcDOkgZkp4NfmfdIn8FESzI+S5a1tmZerQQg44myR2fS2Vf5
9fnaf/BUyvZHldbrscRe0FSZm4Jta/8Gd3C4p46bQq6c+j+vxE9GUBb/oTMtfY9L
SGBz2NITg3O/C7hsceI4zKq9Yeh1ZyOTKtSb/6s9lhfV7m99AGoFSa1wmyQQ1ZLZ
5n8Fnw79IhHXYv8nAEqG5GfCMw4nCmsfONU1Yd8l3hmVazNme/ACKeTtmN+CU6DR
kWx0MVTGi5dtEwkXM9tlRqxYvcUyHPPNjLfwXFm5/fWCWTmpXBC4FuJ+Hel68zLT
L+hNoLPhOwU8+BQo1ZDRnvDSSNVvzNtV9M8oolExc4rInlEF1faliHob6lWCg4Af
zf/1FjcMy1xvD2opT4sBgPAIQVC+r+pNuxq2Qn45g7bsiE7KNc1ZUqlHaWgizsx7
Xw+woS/TwMMNrUo61jTtVdegbZmHUPHNSvkpaS0f2n/xI1yG8xU51a+tXiSjboK6
46znmk6ChhqqJCaW+FIY02Sbj94L//dxuQXQNwvfeTev32m2IFs=
=HckA
-----END PGP SIGNATURE-----

--bwhs5hgubp7re4qj--


