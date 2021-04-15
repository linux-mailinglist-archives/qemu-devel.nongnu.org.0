Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB2360642
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 11:53:50 +0200 (CEST)
Received: from localhost ([::1]:39320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWyh4-0007RL-1Q
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 05:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWyfe-0006y1-6A
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:52:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWyfZ-00062s-Gs
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618480336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hB2I/yLaZ3JzKq4qLzrZUh/s+pKai6cmsCmVSaHOFy8=;
 b=Sk9S0gufrsCnGOKRuQ4FyQB2dEdiz4XY7c83d02E3z9P6saHr65suKHnhF7fQjoRSPodmn
 +uk6JTM+QFtFQaEcu2uiHYZTp9KOGZITS2W49zish96OPW+sU2bHuYWBNkkc9w2xOJNqSX
 rMuYiymFNxaaFD5OYYxr7CIXThyrIYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-Kge3GuBDPoKY_qpa2rh8Ig-1; Thu, 15 Apr 2021 05:52:13 -0400
X-MC-Unique: Kge3GuBDPoKY_qpa2rh8Ig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3F7B10054F6
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:52:12 +0000 (UTC)
Received: from localhost (ovpn-114-209.ams2.redhat.com [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97C935C290;
 Thu, 15 Apr 2021 09:52:12 +0000 (UTC)
Date: Thu, 15 Apr 2021 10:52:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH RFC 0/7] RFC: Asynchronous QMP Draft
Message-ID: <YHgMy+Yc5nRDVlGM@stefanha-x1.localdomain>
References: <20210413155553.2660523-1-jsnow@redhat.com>
 <YHaN5JPvjK2Wq6su@stefanha-x1.localdomain>
 <79eb174a-8e08-aac8-6a0c-e0c7b03eb782@redhat.com>
MIME-Version: 1.0
In-Reply-To: <79eb174a-8e08-aac8-6a0c-e0c7b03eb782@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BGzRQu6khKMbCo8I"
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

--BGzRQu6khKMbCo8I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 03:17:48PM -0400, John Snow wrote:
> First and foremost, thank you for reviewing this! It is very helpful to m=
e
> to see what others think of this pet project I've been growing in the
> privacy of my own mind.
>=20
> On 4/14/21 2:38 AM, Stefan Hajnoczi wrote:
> > Below are the API docs that I found helpful for understanding the big
> > picture.
> >=20
> > The QMP.execute() API is nice.
> >=20
>=20
> Yes. It mimics (sync) qmp.command(), which I believe Eduardo Habkost wrot=
e.
> I think it's the correct idea for a generic (QAPI-schema ignorant) QMP
> client library meant to be "used".
>=20
> I think raising RPC in-band execution errors as exceptions is a nice
> "pythonic" way to do it.
>=20
> (And, if desired, it is possible to use the QAPI generator to generate
> wrappers around this interface using type-safe arguments in a low-level S=
DK
> layer. I think that would be pretty swell. We are not there yet, though, =
and
> I'll focus on this layer first.)
>=20
> > Regarding QMP events, I can think of two approaches:
> > 1. Callbacks
> > 2. An async get_event(name=3DOptional[str]) -> object API
> >     (plus get_event_nowait(name=3DOptional[str]) -> object)
> >=20
> > (There's probably a third approach using async iterators but it's
> > similar to get_event().)
> >=20
> > Both approaches are useful. The first is good in larger asynchronous
> > applications that perform many tasks concurrently. The second is good
> > when there is just one specific thing to do, like waiting for a block
> > job to complete.
> >=20
> (1) On callbacks:
>=20
> Callbacks are what I meagerly mocked up; discord.py has a "cute" little h=
ack
> that works like this:
>=20
> bot =3D commands.bot(...)
>=20
> @bot.event
> async def on_ready():
>     print("Logged in as")
>     print(bot.user.name)
>     ...
>=20
> (See https://github.com/Rapptz/discord.py/blob/master/examples/basic_bot.=
py
> )
>=20
> I find this to be extremely cute: the framework uses the name of the
> callback to determine which event you are registering, and uses the
> decorator to merely register the callback.
>=20
> This makes a nice, uncomplicated way to plug coroutines into the state
> machine of the client loop in the most basic cases.
>=20
> I thought it might be nice to try and mimic that design, by perhaps using
> the names of QMP events as their own 'queues', and then dispatching user
> callbacks as desired. (Possibly with one mega-queue that exists for ALL
> callbacks.)
>=20
> For instance, something like this:
>=20
> @qmp.event
> async def job_status_block_job_ready(qmp, event):
>     ...
>=20
> or more generally,
>=20
> @qmp.event_handler
> async def my_own_event_handler(qmp, event):
>     ...
>=20
> I didn't spend much time on the actual queue or dispatch mechanism in my
> draft, though, but it could be "bolstered" into a more full-fledged API i=
f
> desired.
>=20
> One nice thing about this design is that events aren't "consumed" by a
> caller, they are just dispatched to anyone waiting on an event of that ty=
pe.
>=20
> As I recall, events getting "eaten" at the wrong time was a major burden
> when writing iotests that exercised multiple jobs, transactions, etc.
>=20
> (A side note: a higher-level VM class that uses QMP may wish to capture
> certain events to record state changes, such that the state can be querie=
d
> at an arbitrary point by any number of callers without needing to have
> witnessed the state change event personally. That's not really important
> here in the protocol library, though, which will pretend not to know whic=
h
> events exist -- but it's a consideration for making sure the design that =
IS
> chosen can be extensible to support that kind of thing.)
>=20
>=20
> (2) On get_event or async iterators:
>=20
> This is likely a good ad-hoc feature. Should it only work for events that
> are delivered from that moment in time, or should there be a "backlog" of
> events to deliver?
>=20
> Should waiting on events in this manner "consume" the event from the
> backlog, if we have one?
>=20
> My concern::
>=20
>   await qmp.execute('blockdev-backup', {...etc...})
>   async for event in qmp.get_events():
>       ...
>=20
>=20
> It's possible that an event we'd like to see has already occurred by the
> time we get around to invoking the async iterator. You'd really want to
> start checking for events *before* you issue the job request, but that
> involves tasks, and the code doesn't "flow" well anymore.
>=20
> I don't have ideas, at-present, for how to make things like iotests "flow=
"
> well in a linear co-routine sense...
>=20
> ...although, maybe it's worth creating something like an Event Listener
> object that, from its creation, stashes events from that point forward. H=
ow
> about::
>=20
>   async with qmp.event_listener() as events:
>       await qmp.execute('blockdev-backup', {...})
>       async for event in events:
>           ...
>=20
> Actually, that seems pretty cool. What do you think? I think it's fairly
> elegant for ad-hoc use. We could even extend the constructor to accept
> filtering criteria if we wanted to, later.

Yeah, it seems very nice for allowing multiple event listeners that
don't steal each other's events. I like it.

qmp.event_listener() could take a sequence of QMP event names to trigger
on. If the sequence is empty then all QMP events will be reported.

>=20
> Possibly we could also augment the Event Listener object to support a few
> methods to facilitate blocking until a certain event occurs, like::
>=20
>   async with qmp.event_listener() as events:
>       await qmp.execute('blockdev-backup', {...})
>       await events.event('JOB_STATUS_CHANGE', status=3D"pending")
>       await qmp.execute('job-finalize', {...})
>       ...
>=20
>=20
> I think that's pretty workable, actually! And it could co-exist perfectly
> well alongside event callback handlers.

Callbacks and async iterators are equivalent since a callback is
basically a Task with an event_listener() loop that invokes the callback
function. If the boilerplate for setting that up is minimal then there
might be no need to provide both interfaces.

> Pydantic models are definitely optional at this stage, but I am floating
> them here to prepare people for the idea that I might try to get more
> mileage out of them in the future to offer a type-safe, QAPI-aware SDK
> layer.
>=20
> They're definitely only a mild benefit here, for now, as the strict typin=
g
> they help provide is not floated upwards or exposed to the user.

Yes, I can see the benefits for programs that need a lot of data
validation and have complex schemas.

Since this library is oblivious to the QMP schema it's probably not
needed.

An example of why I suggested dropping pydantic: I was trying to figure
out what happens if QMP is extended with new response fields. Will
pydantic raise an exception when it encounters an unexpected field? It's
not obvious from the code so I needed to go study pydantic to find the
answer.

> (4) On combining protocol and qmp_protocol:
>=20
> Maybe. Do you want to look at the qtest implementation? It's somewhat
> ancillary to this project, but felt it would make a nice companion librar=
y.
> It doesn't benefit as strongly as QMP (As it does not offer anything like
> OOB), but it does have async messages it can send, so it can re-use the s=
ame
> infrastructure.
>=20
> (Fully admit that the first draft, of course, did feature a combined
> protocol/qmp_protocol class. It was split out later.)

Sure, it would be interesting to see the qtest code.

> > Things that might be worth adding:
> > 1. File descriptor passing support.
>=20
> Do you have an example workflow that I can use to test this? This is a we=
ak
> spot in my knowledge.

The add-fd QMP command. I guess this patch series cannot execute that
command successfully since it doesn't support fd passing.

It should be easy to do:

  qmp.execute('add-fd', pass_fds=3D[fobj])

where pass_fds is an optional sequence of file descriptors. The file
descriptors can either be int or file-like objects that support the
fileno() method.

I'm not sure if QMP commands also send file descriptors back to the
client in responses.

> > 2. Introspection support to easily check if a command/feature is
> >     available. Users can do this manually by sending QMP commands and
> >     interpreting the response, but this may be common enough to warrant=
 a
> >     friendly API.
> >=20
>=20
> I think this treads into QAPI-specific domain knowledge, and I might leav=
e
> such features to a higher-level object.
>=20
> The QMP spec itself does not define a mechanism by which the QMP protocol
> itself will reveal the valid commands, and so it might be up to a
> machine.py-based extension/capsulation of qmp_protocol to provide that.
>=20
> (Though, I do agree; I want this feature somewhere. We do have such a thi=
ng
> coded into the existing qmp-shell tool, using the query-commands command.
> Maybe I can offer a subclass that offers some of these convenience featur=
es
> using a best-effort guess-and-check style introspection. Please forgive m=
e
> if I focus on shoring up the design of the core implementation first.)

Okay.

> In general, do you feel this design is roughly serviceable and worth
> pursuing cleanups for? I realize it's a bit "much" but as the audience
> extends beyond our castle walls, I wanted to be quite thorough. It's a

I see the complexity mostly as accidental complexity, not essential
complexity. IMO it's not that the current approach is overkill now but
could be necessary later. I think it will always be unnecessarily
complex because there are simpler ways to do it :D.

Stefan

--BGzRQu6khKMbCo8I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB4DMsACgkQnKSrs4Gr
c8hYOggAxb8MLFJfdmMfMz68rHwQcKGCYibftKrpRx/cd8T1T6BThoKMr9h1K05q
WEIzPqxpWdtR6wDnZRdtRQS9O1qa2+F5mVkgI3TkbAgpoWscDcGUedzsH6vhA7IY
1yHwHCaOdi8NCepeZNxxiYVzw5RLPQPvzQFcUFof5R/Pqud0tzi1t0IOJw/oiwFD
JcoOLF9jqwsIazGMN8XU6svtGYmJWDklZucEaYEKgQ7XDsFcSv7T5QAvddY82q1I
gi+hBp7bDDFGm8PBcgv11Bxb+v1G94exPW1J2gV18gQAUnhTzoAhKDK7zf0zCVAY
zcVGchZpdxIQKk2Op9VPlu13jf/+mw==
=Dm1X
-----END PGP SIGNATURE-----

--BGzRQu6khKMbCo8I--


