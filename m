Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24A7597FE5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 10:16:34 +0200 (CEST)
Received: from localhost ([::1]:52866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOahd-0001ut-SW
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 04:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOaVe-0002Nb-7z
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 04:04:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOaVZ-0004fT-Sp
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 04:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660809845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CbiLutxfDLCyx977f8+D5aBKRsM6WELareBWMbNcIs4=;
 b=BPMdIPrUVbiEJQOQiTPd4x8wtOnBhrcIVEvtWnOTRWwQD9svhkgM9qN4JfVVAbIz9euwvF
 H+wTXxRlq5NOdCRa8YlHVjwGXcWeUEwG+xgDDStaNNIYNOHd4UxlTE/39OchIIwnmfPK8v
 7LQzyHsAiEMzvD6nZGOlFT6v8PW7hYY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-vVoR7WZtOZaP7_5Pk8z_9g-1; Thu, 18 Aug 2022 04:04:03 -0400
X-MC-Unique: vVoR7WZtOZaP7_5Pk8z_9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F976811E76
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 08:04:03 +0000 (UTC)
Received: from localhost (unknown [10.40.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DA8C400E86C;
 Thu, 18 Aug 2022 08:04:02 +0000 (UTC)
Date: Thu, 18 Aug 2022 10:04:01 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 0/8] qapi: add generator for Golang interface
Message-ID: <20220818080401.bcj72i2i3xkyb3i3@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <87fsjq60gm.fsf@pond.sub.org>
 <20220627124839.fliskdn4twbazqqk@tapioca>
 <87sfnq15wp.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wcohdz6oypfbm73v"
Content-Disposition: inline
In-Reply-To: <87sfnq15wp.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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


--wcohdz6oypfbm73v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 27, 2022 at 05:29:26PM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>
> > Hi Markus,
> >
> > On Mon, Jun 27, 2022 at 09:15:53AM +0200, Markus Armbruster wrote:
> >> Victor Toso <victortoso@redhat.com> writes:
> >>=20
> >> > Hi,
> >> >
> >> > This is the second iteration of RFC v1:
> >> >   https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00226.html
> >> >
> >> >
> >> > # What this is about?
> >> >
> >> > To generate a simple Golang interface that could communicate with QE=
MU
> >> > over QMP. The Go code that is generated is meant to be used as the b=
are
> >> > bones to exchange QMP messages.
> >> >
> >> > The goal is to have this as a Go module in QEMU gitlab namespace,
> >> > similar to what have been done to pyhon-qemu-qmp
> >> >   https://gitlab.com/qemu-project/python-qemu-qmp
> >>
> >> Aspects of review:
> >>=20
> >> (1) Impact on common code, if any
> >>=20
> >>     I care, because any messes made there are likely to affect me down
> >>     the road.
> >
> > For the first version of the Go generated interface, my goal is
> > to have something that works and can be considered alpha to other
> > Go projects.
> >
> > With this first version, I don't want to bring huge changes to
> > the python library or to the QAPI spec and its usage in QEMU.
> > Unless someone finds that a necessity.
> >
> > So I hope (1) is simple :)
> >
> >> (2) The generated Go code
> >>=20
> >>     Is it (close to) what we want long term?  If not, is it good enough
> >>     short term, and how could we make necessary improvements?
> >>=20
> >>     I'd prefer to leave this to folks who actually know their Go.
> >> (3) General Python sanity
> >>=20
> >>     We need eyes, but not necessarily mine.  Any takers?
> >>=20
> >> [...]
> >>=20
> >> >  scripts/qapi/golang.py | 765 ++++++++++++++++++++++++++++++++++++++=
+++
> >> >  scripts/qapi/main.py   |   2 +
> >> >  2 files changed, 767 insertions(+)
> >> >  create mode 100644 scripts/qapi/golang.py
> >>=20
> >> This adds a new generator and calls it from generate(), i.e.
> >> review aspect (1) is empty.  "Empty" is a quick & easy way to
> >> get my ACK!
> >>=20
> >> No tests?
> >
> > I've added tests but on the qapi-go module, those are the files
> > with _test.go prefix on them. Example for commands:
> >
> >     https://gitlab.com/victortoso/qapi-go/-/blob/main/pkg/qapi/commands=
_test.go
> >
> > Should the generator itself have tests or offloading that to the
> > qapi-go seems reasonable?
>
> Offloading may be reasonable, but how am I to run the tests then?
> Documentation should tell me.
>
> We have roughly three kinds of tests so far:
>
> 1. Front end tests in tests/qapi-schema
>
> 2. Unit tests in tests/unit/
>
>    To find them:
>
>         $ git-grep '#include ".*qapi-.*\.h"' tests/unit/
>
> 3. Many tests talking QMP in tests/qtest/

I'm thinking on the tests in QEMU side. Perhaps adding something
with Avocado that generates the qapi-go and communicates with a
running QEMU with that generated Go module?

One thing that I try to keep in mind is to not add Go
dependencies in QEMU and this Golang work is not internal to QEMU
itself.

> Since you leave the front end alone, you don't need the first
> kind.
>
> The other two kinds are less clear.

I'm open for suggestions. I thought that, if we have a qapi-go Go
module in Gitlab's qemu-project namespace, we could leverage most
of the tests to the consumer of the actual generated code but I
agree that it is necessary to have something in qemu too.

> >> No documentation?
> >
> > Yes, this iteration removed the documentation of the generated
> > types. I'm a bit sad about that. I want to consume the
> > documentation in the QAPI files to provide the latest info from
> > types/fields but we can't 'copy' it, the only solution is 'refer'
> > to it with hyperlink, which I haven't done yet.
>
> Two kinds of documentation: generated documentation for the generated Go
> code, and documentation about the generator.  I was thinking of the
> latter.  Specifically, docs/devel/qapi-code-gen.rst section "Code
> generation".  Opinions on its usefulness differ.  I like it.

Me too. I'll add documentation for the next iteration, thanks for
pointing it out.

Cheers,
Victor

--wcohdz6oypfbm73v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmL98nEACgkQl9kSPeN6
SE+Vyg/+LUAEezRmEBxmkYsxLtYDffG6aiinIR8ovTd5ZR2C2N4BaKROgsGEGFvO
7I04ja/I0xeoc+sNKkTNYj79Y3MQ1YVlBtTaV7hyg0ZI4HUgkH6t/42w4dxz+6cr
aDDUB0DLi7BaOHRuS6VhzqRXxJiqgfmfuctYUaheN445AcEkenDe2gUSgGALK0iC
hcMgRAoG/s3yfe/b5mR5cOeMchW6p4dMgP/sq0oLRKbwYYqxQQJ6bc3By5qE8kKs
OnD/uPG2lKO9sJ8slNcp2YwMWMcltTzavdGffU+FTc9bI0OorTSA1yVN9GRFLtvg
M09X0uOqr61988AdjgLIAIz2YZuUZH9upja8WBN/zO8wcQf6wHGPhAdZiif/1wFc
CEV5BvEKgeiZk24QZJWqgvfGFCBVHJOztZVzBdGxTGl5Stsdl4JD6ZUn+cgBwv4X
fT179ZWfYf3HyXwBW/971zJVl+us7M4uRfz6/nNiUQtzBQ3ESxo8qt4la5cGQdfg
oPoTGLSP9cM8XPfqlqalrajnr3Brehxx8mlIdC3L6WhOEJT3RcEdBEY03tJyhYaX
cnOXN1s/fVQn+kci/485XKPpaop4rjnF95De50qTKxrKXoWJdITvIJssW7PCqFvD
+ASoLhV9yevM8HQP+ZzrfzmoYOfXQMd4WtXlnMvPH7BwBpo9BqU=
=gxyw
-----END PGP SIGNATURE-----

--wcohdz6oypfbm73v--


