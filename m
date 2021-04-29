Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B358536EDB7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 17:56:40 +0200 (CEST)
Received: from localhost ([::1]:50178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc91r-00064A-QI
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 11:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lc8wx-0003T0-KV
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lc8wu-0007LV-6V
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619711491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4YnSvyCj85L4kUDLME8OO9VZroxvkYERO5HzwSn37DY=;
 b=hudl3/JUMMQPwsOUY3qhntZGLUFIr12i67KmOgTSRogmx7uotT1KM+c3rYsh0FpDGksWD7
 fOH6K6USZqeMr8QebtCJ21iuHwpKIAuWeKIn3NPAgsegZIVXl0ZeUWsXfw4aZHuKSkeRTg
 UI28IQkvSDue13ml8lYAdK63T7kxv94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-xuCGz-JFOUStvd8H8ePJPQ-1; Thu, 29 Apr 2021 11:51:29 -0400
X-MC-Unique: xuCGz-JFOUStvd8H8ePJPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 793728014C1;
 Thu, 29 Apr 2021 15:51:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-217.ams2.redhat.com [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E6725D6DC;
 Thu, 29 Apr 2021 15:51:17 +0000 (UTC)
Date: Thu, 29 Apr 2021 17:51:16 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <YIrV9MqlqwUhJR+B@merkur.fritz.box>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bUxbtpLEQjw4SYOv"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pkrempa@redhat.com, Alberto Garcia <berto@igalia.com>, slp@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, rjones@redhat.com,
 mreitz@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Klaus Jensen <its@irrelevant.dk>, philmd@redhat.com,
 Markus Armbruster <armbru@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--bUxbtpLEQjw4SYOv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 29.04.2021 um 16:05 hat Stefan Hajnoczi geschrieben:
> Hi,
> A preview release of libblkio, a library for high-performance block I/O,
> is now available:
>=20
>   https://gitlab.com/libblkio/libblkio/-/tree/v0.1.0
>=20
> Applications are increasingly integrating high-performance I/O
> interfaces such as Linux io_uring, userspace device drivers, and
> vhost-user device support. The effort required to add each of these
> low-level interfaces into an application is relatively high. libblkio
> provides a single API for efficiently accessing block devices and
> eliminates the need to write custom code for each one.
>=20
> The library is not yet ready to use and currently lacks many features.
> In fact, I hope this news doesn't spread too far yet because libblkio is
> at a very early stage, but feedback from the QEMU community is necessary
> at this time.

I'm a bit worried about the configuration interface. This looks an awful
lot like plain QOM properties, which have proven to result in both very
verbose (not to say messy) and rather error prone implementations.

You have to write setters/getters for every property, even if it usually
ends up doing the same thing, storing the value somewhere. Worse, these
getters and setters have to work in very different circumstances, namely
initialisation where you usually have to store the value away so that it
can be checked for consistency with other properties in .realize() or
.complete(), and property updates during runtime. Often enough, we
forget the latter and create bugs. If we don't create bugs, we usually
start with 'if (realized)' and have two completely different code paths.
Another common bug in QOM objects is forgetting to check if mandatory
properties were actually set.

Did you already consider these problems and decided to go this way
anyway, or is this more of an accidental design? And if the former, what
were the reasons that made it appealing?

Alternatives in QEMU are qdev properties (which are internally QOM
properties, but provide default implementations and are at least
automatically read-only after realize, avoiding that whole class of
bugs) and QAPI.
If this was QEMU code, I would of course go for QAPI, but a library is
something different and adding the code generator would probably be a
bit too much anyway. But the idea in the resulting code would be dealing
with native structs instead of a bunch of function calls. This would
probably be the least error prone way for the implementation, but of
course, it would make binary compatibility a bit harder when adding new
properties.

Thinking a bit further, we'll likely get the same problems as with QOM
in other places, too, e.g. how do you introspect which properties exist
in a given build?

Kevin

--bUxbtpLEQjw4SYOv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmCK1fQACgkQfwmycsiP
L9YJYhAArSKbZvzJ4xqUXf++guf6rpZ6f6xiBWfeEG/kgTYtuDYWbOKTnVA0BbID
A9pawuywfYVe6G7GYikR7EnPz7V3gZSGuMYQcdHPRjyi6GNOArprnYrblrbTpTWA
8BXK9YfJIt/gGEAmydo8xgZR+iZ3oh/uwijJ5qqMdHpoHnB2vgVPu/2d5YwAsl5c
msHXP+/YAiTx4Sm78IIKc439P2PY3Mh6UCz2ZHCKudcs3IjU+NBbYfe0ZvvtjRdl
4M252GcEslG+ghfEg8lS+sVPLAE7Sa1aX7Nbdv25dRE0ZK8cUSPnOs8Cz/m8qM9e
ePnJxqzMZkLvrEmUmXzbQL1IKPO78jINj4ntT2VKtofX+al7fpKl9d02w3QKe0iR
MevcCa4NqN73gFB7mxkzsqQuD/HCUzi9P5UGqqQ6dZHYBz6EKau4qRm10tAYsepZ
7QktKYqAgV+DMFDbNgSzjeFkdLwrkS5CRrojpwsmt8zTCYzeM0RXuA9crBSbbmDJ
8wEsXfdzDXqeann5h9vkQdDKm1h18lbLO6OlMM/FSW/Ly3uhHOK9dX9ixe3Fe93l
bNnw6/5yHrcT1nZQFqv34HjfbFOLIIfVmuAfqcp3xLizqf76PG5uUlrZnrBDhHLq
VAdfffcWBlv0su6HEpW6t8eqCwXrQZOoTc8cY1AvG12QXVvE7bs=
=8fSE
-----END PGP SIGNATURE-----

--bUxbtpLEQjw4SYOv--


