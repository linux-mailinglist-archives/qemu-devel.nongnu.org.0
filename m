Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DD0597284
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:07:02 +0200 (CEST)
Received: from localhost ([::1]:52494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKdJ-0001fI-Sw
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOKXC-0003nW-2s
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 11:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oOKX2-0001GO-SO
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 11:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660748431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wyVwvRb+xrcT2IzD+ksVm+iC1OY0juVk/P785IdtPQs=;
 b=N1Gc8q19lwPr2DyQOXxK32vBSAi9zmdhFX1HQqWG8bBUHvYZwNwM6R/RvibV4q6xxuze7u
 w58yx9pWByZpgc0xRyb/Hl5b8RAbnxEMv284dhSpU0XBHG9xWvfVtawuznRU37K9oygYeh
 hV8zaMLahQX8KkdIAkFK4r/6v0QtVMg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-e5raXx8PNyudSynmO5KAhQ-1; Wed, 17 Aug 2022 11:00:28 -0400
X-MC-Unique: e5raXx8PNyudSynmO5KAhQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDB72380665F
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 15:00:27 +0000 (UTC)
Received: from localhost (unknown [10.40.192.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85D622026D07;
 Wed, 17 Aug 2022 15:00:27 +0000 (UTC)
Date: Wed, 17 Aug 2022 17:00:26 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH v2 7/8] qapi: golang: Add CommandResult type to Go
Message-ID: <20220817150026.crnyt6kdyqybulen@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-8-victortoso@redhat.com>
 <CABJz62P5-Dxy5fcb9wh-xo9_EX4K89F+2Pnydayg+T6eAt3pkw@mail.gmail.com>
 <YsRrko9mtESnWISa@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dtwe7c5gjodmi44v"
Content-Disposition: inline
In-Reply-To: <YsRrko9mtESnWISa@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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


--dtwe7c5gjodmi44v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 05, 2022 at 05:49:22PM +0100, Daniel P. Berrang=E9 wrote:
> On Tue, Jul 05, 2022 at 08:46:21AM -0700, Andrea Bolognani wrote:
> > On Fri, Jun 17, 2022 at 02:19:31PM +0200, Victor Toso wrote:
> > > +type EmptyCommandReturn struct {
> > > +    CommandId string          `json:"id,omitempty"`
> > > +    Error     *QapiError      `json:"error,omitempty"`
> > > +    Name      string          `json:"-"`
> > > +}
> >
> > Do we need a specific type for this? Can't we just generate an
> > appropriately-named type for each of the commands that don't return
> > any data? It's not like we would have to write that code manually :)
>
> Yes, I think having an explicit named return struct even for commands
> not /currently/ returning data is good, and anticipates future changes
> that might add extra return data fields to the QAPI schema.

Sure.

Cheers,
Victor

--dtwe7c5gjodmi44v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmL9AooACgkQl9kSPeN6
SE/RgQ//Z1HKMQGLurPUcWw72xY9TRLN+kxKa9rHS+J2+SbQtSgLD/0Fhp5r7HPb
zlAkniZW3ZO8tiG6oclj1JdCwHBFIH0TqM9hvC/CEQqGEL24cub4zYBe0OGlmR65
PHQP3Rrqt25v3wc0u+TO9pHqcYpzQN8Ddi2sdnNauh+ghAswHxu/g29QWL5qHQGK
O9b5OzCuvTuFBZBQHLj5hGq/HBLNdzJF1us79epp0qRny0FSw3BON0qU4GbjI8Hb
jCcx/MGkEpQkP5gEnEnV238IpqzyApXwElWpa2b3Q7cUqIogDUyKBpNAtI6mJASX
Mp03q+CZk7cS7EpxZejZXGC969H3pRm+tTURTXtMAnaj4utFyVD7qZ8ltGl2DvgX
QAqbujip3KeJyIcvFfMZZiwv/g00qoXPPahjr0+CWBvCuZiTzYK74MOOMM05xz7v
ZpO7YqB3uoqT2lVSB5HbZuLWDXc+349rmtxvsRDwUGKakMUoRwNRIbV85mfyLx5L
yUrDYFQZimtKb9QOIHcqskK9Q/624GKTrsEaJuFUjRLbyp84P0nBdL93KdsTetSC
0RO4L1ctG3GUIxnpWwLuO7pk3tn3wyfV+xVOu2RvUVuWy4Pxhm/ot0KJwzCw/AWj
ZuCM1IBTpDAy9ZU6zC3EtMCbK5sLj/OWPQ8+VqGVo8uZhr1bJ+E=
=aevn
-----END PGP SIGNATURE-----

--dtwe7c5gjodmi44v--


