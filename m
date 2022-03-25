Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F524E6B60
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 01:01:44 +0100 (CET)
Received: from localhost ([::1]:52400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXXOg-00064f-AT
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 20:01:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXXNO-0005Bs-7p
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 20:00:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXXNK-0005He-GK
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 20:00:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648166416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wGv5/YFeYT8NsV7sZ7cUJLgc0xvlmXWf0KI+/r3s5XQ=;
 b=JTgVGQ0QWl3aBaok3CfbbACRimVd1Enr4Q4dSxB0FL85v+53SUcq6puhXB8EL3hejfbnxC
 rxzBF7Sm0Go7GKnY5KxmbgqL86Kd+G/bLNMFqFwZzDOVrhrMC8yQKPHZrr1Wh61SSIy/OX
 36SLarB9BDTcp1sFL1402Qzkq4+XDPY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-TwfOp_FbOdmFJU-nFtSRQA-1; Thu, 24 Mar 2022 20:00:13 -0400
X-MC-Unique: TwfOp_FbOdmFJU-nFtSRQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDC7F95470A;
 Fri, 25 Mar 2022 00:00:12 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E6E8409B3F8;
 Fri, 25 Mar 2022 00:00:11 +0000 (UTC)
Date: Thu, 24 Mar 2022 19:00:09 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <20220325000009.dbtpp2owoqdbjf2q@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
 <YjyrBLhG5ph6UA/E@pc181009.grep.be>
MIME-Version: 1.0
In-Reply-To: <YjyrBLhG5ph6UA/E@pc181009.grep.be>
User-Agent: NeoMutt/20211029-512-43304b
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: v.sementsov-og@mail.ru, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 nbd@other.debian.org, nsoffer@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Updating Vladimir's new preferred address in cc list]

On Thu, Mar 24, 2022 at 07:31:48PM +0200, Wouter Verhelst wrote:
> Hi Eric,
> 
> Thanks for the ping; it had slipped my mind.
> 
> On Fri, Dec 03, 2021 at 05:14:34PM -0600, Eric Blake wrote:
> >  #### Request message
> > 
> > -The request message, sent by the client, looks as follows:
> > +The compact request message, sent by the client when extended
> > +transactions are not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> > +looks as follows:
> > 
> >  C: 32 bits, 0x25609513, magic (`NBD_REQUEST_MAGIC`)  
> >  C: 16 bits, command flags  
> > @@ -353,14 +370,26 @@ C: 64 bits, offset (unsigned)
> >  C: 32 bits, length (unsigned)  
> >  C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  
> > 
> > +If negotiation agreed on extended transactions with
> > +`NBD_OPT_EXTENDED_HEADERS`, the client instead uses extended requests:
> > +
> > +C: 32 bits, 0x21e41c71, magic (`NBD_REQUEST_EXT_MAGIC`)  
> > +C: 16 bits, command flags  
> > +C: 16 bits, type  
> > +C: 64 bits, handle  
> > +C: 64 bits, offset (unsigned)  
> > +C: 64 bits, length (unsigned)  
> > +C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  
> > +
> 
> Perhaps we should decouple the ideas of "effect length" and "payload
> length"? As in,
> 
> C: 32 bits, 0x21e41c71, magic (`NBD_REQUEST_EXT_MAGIC`)
> C: 16 bits, command flags
> C: 16 bits, type
> C: 64 bits, handle
> C: 64 bits, offset
> C: 64 bits, effect length
> C: 64 bits, payload length
> C: (*payload length* bytes of data)
> 
> This makes the protocol more context free. With the current set of
> commands, only NBD_CMD_WRITE would have payload length be nonzero, but
> that doesn't have to remain the case forever; e.g., we could have a
> command that extends NBD_CMD_BLOCK_STATUS to only query a subset of the
> metadata contexts that we declared (if that is wanted, of course).
> 
> Of course, that does have the annoying side effect of no longer fitting
> in 32 bytes, requiring a 40-byte header instead. I think it would be
> worth it though.

Could we still keep a 32-byte header, by having a new command (or new
command flag to the existing NBD_CMD_BLOCK_STATUS), such that the
payload itself contains the needed extra bytes?

Hmm - right now, the only command with a payload is NBD_CMD_WRITE, and
all other commands use the length field as an effect length.  So maybe
what we do is have a single command flag that says whether the length
field is serving as payload length or as effect length.  NBD_CMD_WRITE
would always set the new flag (if extended headers were negotiated),
and most other NBD_CMD_* would leave the flag unset, but in the case
of BLOCK_STATUS wanting only a subset of id status reported, we could
then have:

HEADER:
C: 32 bits, 0x21e41c71, magic (`NBD_REQUEST_EXT_MAGIC`)
C: 16 bits, command flags, NBD_CMD_FLAG_PAYLOAD
C: 16 bits, type, NBD_CMD_BLOCK_STATUS
C: 64 bits, handle
C: 64 bits, offset
C: 64 bits, payload length = 12 + 4*n
PAYLOAD:
C: 64 bits, effect length (hint on desired range)
C: 32 bits, number of ids = n
C: 32 bits, id[0]
...
C: 32 bits, id[n-1]

vs.

HEADER:
C: 32 bits, 0x21e41c71, magic (`NBD_REQUEST_EXT_MAGIC`)
C: 16 bits, command flags, 0
C: 16 bits, type, NBD_CMD_BLOCK_STATUS
C: 64 bits, handle
C: 64 bits, offset
C: 64 bits, effect length (hint on desired range)

HEADER:
C: 32 bits, 0x21e41c71, magic (`NBD_REQUEST_EXT_MAGIC`)
C: 16 bits, command flags, NBD_CMD_FLAG_PAYLOAD
C: 16 bits, type, NBD_CMD_WRITE
C: 64 bits, handle
C: 64 bits, offset
C: 64 bits, payload length = n
PAYLOAD:
C: n*8 bits data


> 
> (This is obviously not relevant for reply messages, only for request
> messages)

Staying at a power of 2 may still be worth the expense of a new cmd
flag which must always be set for writes when extended headers are in
use.

> 
> >  #### Simple reply message
> > 
> >  The simple reply message MUST be sent by the server in response to all
> >  requests if structured replies have not been negotiated using
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
> >  S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
> >     `NBD_REPLY_MAGIC`)  
> > @@ -369,6 +398,16 @@ S: 64 bits, handle
> >  S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
> >      *error* is zero)  
> > 
> > +If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> > +the message looks like:
> > +
> > +S: 32 bits, 0x60d12fd6, magic (`NBD_SIMPLE_REPLY_EXT_MAGIC`)  
> > +S: 32 bits, error (MAY be zero)  
> > +S: 64 bits, handle  
> > +S: 128 bits, padding (MUST be zero)  
> 
> Should all these requirements about padding not be a SHOULD rather than
> a MUST?

Elsewhere in the thread, we talked about having
NBD_SIMPLE_REPLY_EXT_MAGIC have 64 bits length (only non-zero when
replying to NBD_CMD_READ) and 64 bits pad, instead of 128 bits pad.

For future extensibility, it's probably safest to require the server
to send 0 bits in the pad now, so that we can use them later.  Should
clients then ignore unknown padding bits, or is there a risk that a
future definition of non-zero values in what is now padding bits may
confuse an existing client that merely ignores those bits?

If we don't think extensibility is needed, then using SHOULD instead
of MUST means a non-careful server can leak data through the padding.
But it is certainly less restrictive to use SHOULD instead of MUST
(well-written servers won't leak, sloppy servers might, clients must
ignore the padding, and extension is not possible because of sloppy
servers).

> 
> [...]
> > +* `NBD_OPT_EXTENDED_HEADERS` (11)
> > +
> > +    The client wishes to use extended headers during the transmission
> > +    phase.  The client MUST NOT send any additional data with the
> > +    option, and the server SHOULD reject a request that includes data
> > +    with `NBD_REP_ERR_INVALID`.
> > +
> > +    The server replies with the following, or with an error permitted
> > +    elsewhere in this document:
> > +
> > +    - `NBD_REP_ACK`: Extended headers have been negotiated; the client
> > +      MUST use the 32-byte extended request header, and the server
> > +      MUST use the 32-byte extended reply header.
> > +    - For backwards compatibility, clients SHOULD be prepared to also
> > +      handle `NBD_REP_ERR_UNSUP`; in this case, only the compact
> > +      transmission headers will be used.
> > +
> > +    If the client requests `NBD_OPT_STARTTLS` after this option, it
> > +    MUST renegotiate extended headers.
> > +
> 
> Two thoughts here:
> 
> - We should probably allow NBD_REP_ERR_BLOCK_SIZE_REQD as a reply to
>   this message; I could imagine a server might not want to talk 64-bit
>   lengths if it doesn't know that block sizes are going to be
>   reasonable.

Good addition.  I'll include it in v2.

> - In the same vein, should we perhaps also add an error message for when
>   extended headers are negotiated without structured replies? Perhaps a
>   server implementation might not want to implement the "extended
>   headers but no structured replies" message format.

Seems reasonable.

> 
> On that note, while I know I had said earlier that I would prefer not
> making this new extension depend on structured replies, in hindsight
> perhaps it *is* a good idea to add that dependency; otherwise we create
> an extra message format that is really a degenerate case of "we want to
> be modern in one way but not in another", and that screams out to me
> "I'm not going to be used much, look at me for security issues!"
> 
> Which perhaps is not a very good idea.

Yeah, the more I read back over Vladimir's message, the more I am
agreeing that just because we CAN be orthogonal doesn't mean we WANT
to be orthogonal.  Every degree of orthogonality increases the testing
burden.  I'm happy to rework v2 along those lines (structured replies
mandatory, and only one extended reply header, so that only compact
style has two header types).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


