Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB23360591
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 11:24:22 +0200 (CEST)
Received: from localhost ([::1]:55056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWyEX-0008Ik-RI
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 05:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWyDW-0007rX-Je
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:23:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWyDR-0005AL-BK
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618478592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/TwA5/Nbm0kXJr4+K94LslpWrBHorsQQ7/QNYsKeSDY=;
 b=W/qN0ukPbdEcCJE+YxnAD1JiTB7ztJbrKLsM0YmXTtva8eUAqbS4GEsYOVuU9BsWBjcism
 suSpxgutSYK/t3Yn8iF8wo3Oh7d5lEiZcMWewsrEtjiMTQAR+VVROxt0JdT9NRH6ioBQ+i
 2SdgTxGBDOA5mVk3JuGfhrfE7Y+wqWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-FkG7N994MIqiPEUvm3Aa3A-1; Thu, 15 Apr 2021 05:23:09 -0400
X-MC-Unique: FkG7N994MIqiPEUvm3Aa3A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB4898143F0
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:23:08 +0000 (UTC)
Received: from localhost (ovpn-114-209.ams2.redhat.com [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C87360657;
 Thu, 15 Apr 2021 09:23:08 +0000 (UTC)
Date: Thu, 15 Apr 2021 10:23:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH RFC 6/7] qmp_protocol: add QMP client implementation
Message-ID: <YHgF+nERxtT0TFWH@stefanha-x1.localdomain>
References: <20210413155553.2660523-1-jsnow@redhat.com>
 <20210413155553.2660523-7-jsnow@redhat.com>
 <YHaBQOYfMSuXoMAj@stefanha-x1.localdomain>
 <6d3a5cf8-838c-bdda-2050-d6d681aec5ea@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6d3a5cf8-838c-bdda-2050-d6d681aec5ea@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HkZ3/K4zZulci4ZO"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: armbru@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--HkZ3/K4zZulci4ZO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 01:50:37PM -0400, John Snow wrote:
> On 4/14/21 1:44 AM, Stefan Hajnoczi wrote:
> > On Tue, Apr 13, 2021 at 11:55:52AM -0400, John Snow wrote:
> > > +    async def _execute(self, msg: Message) -> object:
> > > +        """
> > > +        The same as `execute_msg()`, but without safety mechanisms.
> > > +
> > > +        Does not assign an execution ID and does not check that the =
form
> > > +        of the message being sent is valid.
> > > +
> > > +        This method *Requires* an 'id' parameter to be set on the
> > > +        message, it will not set one for you like `execute()` or
> > > +        `execute_msg()`.
> > > +
> > > +        Do not use "__aqmp#00000" style IDs, use something else to a=
void
> > > +        potential clashes. If this ID clashes with an ID presently
> > > +        in-use or otherwise clashes with the auto-generated IDs, the
> > > +        response routing mechanisms in _on_message may very well fai=
l
> > > +        loudly enough to cause the entire loop to crash.
> > > +
> > > +        The ID should be a str; or at least something JSON
> > > +        serializable. It *must* be hashable.
> > > +        """
> > > +        exec_id =3D cast(str, msg['id'])
> > > +        self.logger.debug("Execute(%s): '%s'", exec_id,
> > > +                          msg.get('execute', msg.get('exec-oob')))
> > > +
> > > +        queue: asyncio.Queue[Message] =3D asyncio.Queue(maxsize=3D1)
> > > +        task =3D create_task(self._bh_execute(msg, queue))
> >=20
> > We're already in a coroutine, can we await queue.get() ourselves instea=
d
> > of creating a new task?
> >=20
> > I guess this is done in order to use Task.cancel() in _bh_disconnect()
> > but it seems simpler to use queue both for success and cancellation.
> > Fewer tasks are easier to reason about.
> >=20
>=20
> ...queues do not have a cancellation signal :( :( :( :(
>=20
> There's no way to "cancel" a queue:
> https://docs.python.org/3/library/asyncio-queue.html#queue
>=20
> You *could* craft a special message and inject an exception into the queu=
e
> to notify the reader that the message will never arrive, but it feels lik=
e
> working against the intended mechanism of that primitive. It really feels
> like it wants to be wrapped in a *task*.

That's what I meant by "it seems simpler to use the queue both for
success and cancellation". Just queue a message that says the execution
has been cancelled.

Stefan

--HkZ3/K4zZulci4ZO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB4BfoACgkQnKSrs4Gr
c8jfyQf/Xn5etqeGKyaKORLtHItzOZli5dFFflU0YwRYMWklX/0KGi47J/fCL408
ZvES3nETr4h47s1HC3xGhUEuTItibY3IlU/+4cERSE7ynshsEv5d8mU/AgaSBcmx
WmG+hMUZOJBabqma+beB7EO4qanU+Q3H+ApHtLjSNMygRakwB4mnd4cywaNEI2kA
d2MGquuhHz+42rsRNyPyoW4YxDwHoIkwZJVOSRUhabjayfJbFo3crHYnBTJp1Szu
NsNs0KZjbGgE3XdOGIXmZJIAhnkrkNH/JVnzmhwZ2Gy4lgR/AvLXj1tC0G3izKgV
xiM6D0b+W4kHuvvPbGeOOk4CZ97i0w==
=Ij13
-----END PGP SIGNATURE-----

--HkZ3/K4zZulci4ZO--


