Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E888346AE32
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 00:02:31 +0100 (CET)
Received: from localhost ([::1]:53462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muN0A-0005Yw-KQ
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 18:02:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1muMyl-0004je-9q
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 18:01:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1muMyg-0002lr-90
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 18:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638831656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f9+Axcx+mDkx6OoPg8wVI3GXIuUzhuzdjeAmfM+RuUU=;
 b=gOwEWw+vmxv5aik37XoFJluuTAEghUe6QhTGKVmZeqMQu5pN7k3Ak9rmwhUJPUxwkknPrE
 /3rRStDQLf0pTf+H/ZQRE4wSud26uETK1LPwg/jEWDAGzzevGNbL6NyQ2QRNnAPfcxZZNd
 xNHegttZ8kg+CBMqhpMI3LfdCLyVU6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-m2Mz0M5DOUC8xeI3_SW_-Q-1; Mon, 06 Dec 2021 18:00:51 -0500
X-MC-Unique: m2Mz0M5DOUC8xeI3_SW_-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 965D01006AA1;
 Mon,  6 Dec 2021 23:00:50 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4328110016F5;
 Mon,  6 Dec 2021 23:00:49 +0000 (UTC)
Date: Mon, 6 Dec 2021 17:00:47 -0600
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <20211206230047.q5xc5enodbicf3gw@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
 <f05c680a-73c3-b0d2-dbdf-c0bcf1ca3530@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <f05c680a-73c3-b0d2-dbdf-c0bcf1ca3530@virtuozzo.com>
User-Agent: NeoMutt/20211029-46-a5fba3
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: nsoffer@redhat.com, libguestfs@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 06, 2021 at 02:40:45PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> >   #### Simple reply message
> > 
> >   The simple reply message MUST be sent by the server in response to all
> >   requests if structured replies have not been negotiated using
> > -`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been negotiated, a simple
> > -reply MAY be used as a reply to any request other than `NBD_CMD_READ`,
> > -but only if the reply has no data payload.  The message looks as
> > -follows:
> > +`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been
> > +negotiated, a simple reply MAY be used as a reply to any request other
> > +than `NBD_CMD_READ`, but only if the reply has no data payload.  If
> > +extended headers were not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> > +the message looks as follows:
> > 
> >   S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
> >      `NBD_REPLY_MAGIC`)
> > @@ -369,6 +398,16 @@ S: 64 bits, handle
> >   S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
> >       *error* is zero)
> > 
> > +If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> > +the message looks like:
> > +
> > +S: 32 bits, 0x60d12fd6, magic (`NBD_SIMPLE_REPLY_EXT_MAGIC`)
> > +S: 32 bits, error (MAY be zero)
> > +S: 64 bits, handle
> > +S: 128 bits, padding (MUST be zero)
> > +S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
> > +    *error* is zero)
> > +
> 
> If we go this way, let's put payload length into padding: it will help to make the protocol context-independent and less error-prone.

Easy enough to do (the payload length will be 0 except for
NBD_CMD_READ).

> 
> Or, the otherway, may be just forbid the payload for simple-64bit ? What's the reason to allow 64bit requests without structured reply negotiation?

The two happened to be orthogonal enough in my implementation.  It was
easy to demonstrate either one without the other, and it IS easier to
write a client using non-structured replies (structured reads ARE
tougher than simple reads, even if it is less efficient when it comes
to reading zeros).  But you are also right that we could require
structured reads prior to allowing 64-bit operations, and then have
only one supported reply type on the wire when negotiated.  Wouter,
which way do you prefer?

> 
> >   #### Structured reply chunk message
> > 
> >   Some of the major downsides of the default simple reply to
> > @@ -410,7 +449,9 @@ considered successful only if it did not contain any error chunks,
> >   although the client MAY be able to determine partial success based
> >   on the chunks received.
> > 
> > -A structured reply chunk message looks as follows:
> > +If extended headers were not negotiated using
> > +`NBD_OPT_EXTENDED_HEADERS`, a structured reply chunk message looks as
> > +follows:
> > 
> >   S: 32 bits, 0x668e33ef, magic (`NBD_STRUCTURED_REPLY_MAGIC`)
> >   S: 16 bits, flags
> > @@ -423,6 +464,17 @@ The use of *length* in the reply allows context-free division of
> >   the overall server traffic into individual reply messages; the
> >   *type* field describes how to further interpret the payload.
> > 
> > +If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> > +the message looks like:
> > +
> > +S: 32 bits, 0x6e8a278c, magic (`NBD_STRUCTURED_REPLY_EXT_MAGIC`)
> > +S: 16 bits, flags
> > +S: 16 bits, type
> > +S: 64 bits, handle
> > +S: 64 bits, length of payload (unsigned)
> 
> Maybe, 64bits is too much for payload. But who knows. And it's good that it's symmetric to 64bit length in request.

Indeed, both qemu and libnbd implementations explicitly kill the
connection to any server that replies with more than the max buffer
used for NBD_CMD_READ/WRITE (32M for qemu, 64M for libnbd).  And if
the spec is not already clear on the topic, I should add an
independent patch to NBD_CMD_BLOCK_STATUS to make it obvious that a
server cannot reply with too many extents because of such clients.

So none of my proof-of-concept code ever used the full 64-bits of the
reply header length.  On the other hand, there is indeed the symmetry
argument - if someone writes a server willing to accept a 4G
NBD_CMD_WRITE, then it should also support a 4G NBD_CMD_READ, even if
no known existing server or client allows buffers that large..

> 
> > +S: 64 bits, padding (MUST be zero)
> 
> Hmm. Extra 8 bytes to be power-of-2. Does 32 bytes really perform better than 24 bytes?

Consider:
struct header[100];

if sizeof(header[0]) is a power of 2 <= the cache line size (and the
compiler prefers to start arrays aligned to the cache line) then we
are guaranteed that all array members each reside in a single cache
line.  But if it is not a power of 2, some of the array members
straddle two cache lines.

Will there be code that wants to create an array of headers?  Perhaps
so, because that is a logical way (along with scatter/gather to
combine the header with variable-sized payloads) of tracking the
headers for multiple commands issued in parallel.

Do I have actual performance numbers?  No. But there's plenty of
google hits for why sizing structs to a power of 2 is a good idea.

> 
> > +S: *length* bytes of payload data (if *length* is nonzero)
> 
> Hmm2: we probably may move "handle" to the start of payload. This way we can keep 16bytes header for simple reply and 16bytes header for structured. So structured are read in two shots: 1. the header, 2. handle + payload.. But that means deeper restructuring of the client code.. So seems not worth it.

Right now, the handle is in the same offset for both simple and
structured replies, and for both normal and extended headers.  My
proof-of-concept for qemu always reads just the magic number and
handle, then decides how many more bytes to read (if any) (1 syscall
for simple compact headers, 2 syscalls for compact structured and for
both extended styles); while my proof-of-concept for libnbd actually
decides up front to only do a 32-byte read if extended headers are in
use for fewer syscalls.  I don't know if one way is better than the
other, but the differences in styles fell out naturally from the rest
of those code bases, and certainly anything that can be done with
fewer syscalls per transaction is going to show a modest improvement.

But you are right that repositioning the handle to live at some other
offset (including forcing it to live in the payload with a 16-byte
header, instead of having a 32-byte header) would be more invasive.
Doable?  Maybe.  That's why this is an RFC.  But unless there is a
compelling reason to try, I'd rather not go to that effort.

> 
> 
> > +
> >   #### Terminating the transmission phase
> > 
> >   There are two methods of terminating the transmission phase:
> > @@ -870,15 +922,19 @@ The procedure works as follows:
> >     server supports.
> >   - During transmission, a client can then indicate interest in metadata
> >     for a given region by way of the `NBD_CMD_BLOCK_STATUS` command,
> > -  where *offset* and *length* indicate the area of interest. The
> > -  server MUST then respond with the requested information, for all
> > +  where *offset* and *length* indicate the area of interest.
> > +- The server MUST then respond with the requested information, for all
> >     contexts which were selected during negotiation. For every metadata
> > -  context, the server sends one set of extent chunks, where the sizes
> > -  of the extents MUST be less than or equal to the length as specified
> > -  in the request.
> 
> I'm not sure we can simply drop this requirement.. It seems like an incompatible change, isn't it? May be, we should allow any size of extent only for 64bit mode?

I'm not dropping the requirement; what was listed here is redundant
with what appears elsewhere under NBD_REPLY_TYPE_BLOCK_STATUS, where
the addition of NBD_REPLY_TYPE_BLOCK_STATUS_EXT made it too wordy to
keep the redundancy here.  But yes, I can try and separate the patch
into minor cleanups separate from new additions.

...
> >   #### Structured reply types
> > 
> > -These values are used in the "type" field of a structured reply.
> > -Some chunk types can additionally be categorized by role, such as
> > -*error chunks* or *content chunks*.  Each type determines how to
> > -interpret the "length" bytes of payload.  If the client receives
> > -an unknown or unexpected type, other than an *error chunk*, it
> > -MUST initiate a hard disconnect.
> > +These values are used in the "type" field of a structured reply.  Some
> > +chunk types can additionally be categorized by role, such as *error
> > +chunks*, *content chunks*, or *status chunks*.  Each type determines
> > +how to interpret the "length" bytes of payload.  If the client
> > +receives an unknown or unexpected type, other than an *error chunk*,
> > +it MUST initiate a hard disconnect.
> 
> Just add "status chunks" to the list. Seems unrelated, better be in a separate patch.

Previously, only NBD_REPLY_TYPE_BLOCK_STATUS counts as a status chunk,
now we have two reply types with that qualification.  But I can indeed
split up the terminology addition from the addition of the second type
of status chunk.

> 
> > 
> >   * `NBD_REPLY_TYPE_NONE` (0)
> > 
> > @@ -1761,13 +1837,34 @@ MUST initiate a hard disconnect.
> >     64 bits: offset (unsigned)
> >     32 bits: hole size (unsigned, MUST be nonzero)
> > 
> > +* `NBD_REPLY_TYPE_OFFSET_HOLE_EXT` (3)
> > +
> > +  This chunk type is in the content chunk category.  *length* MUST be
> > +  exactly 16.  The semantics of this chunk mirror those of
> > +  `NBD_REPLY_TYPE_OFFSET_HOLE`, other than the use of a larger *hole
> > +  size* field.  This chunk type MUST NOT be used unless extended
> > +  headers were negotiated with `NBD_OPT_EXTENDED_HEADERS`.
> 
> Why do you call all such things _EXT, not _64 ? _64 seems more informative.

_64 would be fine with me.  As this is an RFC, the naming is not
locked in stone.

> 
> > +
> > +  The payload is structured as:
> > +
> > +  64 bits: offset (unsigned)
> > +  64 bits: hole size (unsigned, MUST be nonzero)
> > +
> > +  Note that even when extended headers are in use, a server may
> > +  enforce a maximum block size that is smaller than 32 bits, in which
> > +  case no valid `NBD_CMD_READ` will have a *length* large enough to
> s/nc/no/ ? But hard to read any way, as sounds very similar to "not valid", which breaks the meaning.
> 
> may be just "in which case valid NBD_CMD_READ will not have"

I like that.

> 
> > +  require the use of this chunk type.  However, a client using
> > +  extended headers MUST be prepared for the server to use either the
> > +  compact or extended chunk type.
> > +
> >   * `NBD_REPLY_TYPE_BLOCK_STATUS` (5)
> > 
> > -  *length* MUST be 4 + (a positive integer multiple of 8).  This reply
> > -  represents a series of consecutive block descriptors where the sum
> > -  of the length fields within the descriptors is subject to further
> > -  constraints documented below. This chunk type MUST appear
> > -  exactly once per metadata ID in a structured reply.
> > +  This chunk type is in the status chunk category.  *length* MUST be
> > +  4 + (a positive integer multiple of 8).  This reply represents a
> > +  series of consecutive block descriptors where the sum of the length
> > +  fields within the descriptors is subject to further constraints
> > +  documented below.  Each negotiated metadata ID must have exactly one
> > +  status chunk in the overall structured reply.
> 
> just rewording, no semantic changes, yes?

The change is that it is no longer to have exactly one of these per
reply (you can have a BLOCK_STATUS_EXT instead).  True, not much of a
change, but it is because of the new type.  Again, adding the notion
of exactly one status chunk per metadata id (even with only one
possible status chunk) in one patch, then adding the second status
chunk with extended headers, may be easier to review, so I'll try that
for v2.

> 
> > 
> >     The payload starts with:
> > 
> > @@ -1796,9 +1893,36 @@ MUST initiate a hard disconnect.
> >     information to the client, if looking up the information would be
> >     too resource-intensive for the server, so long as at least one
> >     extent is returned. Servers should however be aware that most
> > -  clients implementations will then simply ask for the next extent
> > +  client implementations will then simply ask for the next extent
> >     instead.
> 
> So you keep all restrictions about NBD_CMD_FLAG_REQ_ONE and about sum of lenghts of extents as is here..

Yes.

> 
> > 
> > +* `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)
> > +
> > +  This chunk type is in the status chunk category.  *length* MUST be
> > +  4 + (a positive multiple of 16).  The semantics of this chunk mirror
> > +  those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
> > +  larger *extent length* field, as well as added padding to ease
> > +  alignment.
> 
> But what about restrictions on chunk lengths and cumulative chunk length?

That is supposed to still be in effect.  If I deleted that
restriction, it was unintentional.  That is, the cumulative length
(and thus each individual extent length, since no extent can be larger
than the cumulative length) is not allowed to exceed the client's
length request except in the case of the last extent, and even then
only when REQ_ONE was not in use.

> 
> > +  This chunk type MUST NOT be used unless extended headers
> > +  were negotiated with `NBD_OPT_EXTENDED_HEADERS`.
> > +
> > +  The payload starts with:
> > +
> > +  32 bits, metadata context ID
> > +
> > +  and is followed by a list of one or more descriptors, each with this
> > +  layout:
> > +
> > +  64 bits, length of the extent to which the status below
> > +     applies (unsigned, MUST be nonzero)
> > +  32 bits, status flags
> > +  32 bits, padding (MUST be zero)
> > +
> > +  Note that even when extended headers are in use, the client MUST be
> > +  prepared for the server to use either the compact or extended chunk
> > +  type, regardless of whether the client's hinted length was more or
> > +  less than 32 bits, but the server MUST use exactly one of the two
> > +  chunk types per negotiated metacontext ID.
> 
> But we have anyway one chunk per ID in a reply.. Or you mean that the type of reply for the ID should be selected once for the whole session?

I envision the following as valid:

OPT_SET_META_CONTEXT("base:allocation", "my:extension")
=> id 1: "base:allocation", id 2: "my:extension"
OPT_GO
...

CMD_BLOCK_STATUS(offset=0, length=3G)
=> REPLY_TYPE_BLOCK_STATUS(id=1, extent[2] { length=2G flags=0, length=2G flags=1 })
=> REPLY_TYPE_BLOCK_STATUS_EXT(id=2, extent[1] { length=3G flags=0 })
CMD_BLOCK_STATUS(offset=3G, length=6G)
=> REPLY_TYPE_BLOCK_STATUS_EXT(id 1, extent[1] { length=5G flags=0 })
=> REPLY_TYPE_BLOCK_STATUS(id 2, extent[2] { length=3.5G flags=0, length=3.5G flags=1 })

Note that the first id=1 responded with a cumulative length larger
than the client's request, and the cumulative length is > 4G, but the
response itself gets away with only 32-bit extents.  The first id=2
response is < 3G, but the server chose to use a 64-bit extent anyway.
The second id=1 response has to use the 64-bit response (because even
though 5G is shorter than the client's request for 6G, it is larger
than the 4G maximum of a 32-bit response). The second id=2 is similar
to the first id=1 in that it uses a 32-bit response even though the
cumulative length is >4G.  There is no requirement that the cumulative
lengths of the two ids be identical.  And since REQ_ONE is not in
effect, the last extent of a given extent array can cause the
cumulative value to exceed the client's request.

What is invalid:
CMD_BLOCK_STATUS(offset=0, length=3G)
=> REPLY_TYPE_BLOCK_STATUS(id=1, extent[2] { length=2G flags=0, length=2G flags=1 })
=> REPLY_TYPE_BLOCK_STATUS_EXT(id=1, extent[1] { length=3G flags=0 })

because it used two status chunks both for context id=1.

Maybe I need to add the phrase "within a given NBD_CMD_BLOCK_STATUS
response", to make it clear that exactly one status chunk per id is
chosen, but whether the server chooses a 32- or 64-bit status chunk is
dependent solely on the server's whims, and the client must be
prepared for either, regardless of the length the client used
originally.

...
> 
> Overall, seems good to me.

Glad to hear it!

> 
> 1. Could we move some fixes / rewordings to a preaparation patch?

Yes, I'll do that for v2.

> 
> 2. I see you want also to overcome unpleasant restrictions we had around lengths / cumulative lengths of BLOCK_STATUS replies. I like the idea. But I think, it should be clarified that without 64bit extension negotiated all stay as is. And with 64bit extension negotiated, BLOCK_STATUS works in a slighter new way, so it may return what server wants, and original "length" is simply a hint. Or, at least that new behavior is only about NBD_REPLY_TYPE_BLOCK_STATUS_EXT.. Also, some clarifications may need around NBD_CMD_FLAG_REQ_ONE flag, what changes for it? You don't mention it at all in new version of BLOCK_STATUS reply.

That's not new behavior.  The client's length has always been a mere
hint to the server, where the only constraints are that the server
must make progress on success, and that if REQ_ONE is in use, the
server may not report more than then length the client asked about.

Or are you proposing that we relax REQ_ONE, and allow a server to
report additional length in 64-bit mode even when REQ_ONE is in use?
The 32-bit limitation on not sending back too much length with compact
structured replies was because qemu as client at one point would abort
if the cumulative length was too long (and qemu has always used
REQ_ONE).  But if extended headers are in use, qemu no longer aborts
on oversize answers, and no other client is new enough to have
extended headers.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


