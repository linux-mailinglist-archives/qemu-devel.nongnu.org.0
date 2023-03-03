Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DE76AA492
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 23:37:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYE1C-0002oI-Qh; Fri, 03 Mar 2023 17:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pYE1B-0002nz-3N
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:36:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pYE18-0001kf-B6
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677883005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r0UtwVSI7xVWOmDYTfyqiYRYPlpsYPLFglKsiAr4Y40=;
 b=IY3bepccYIJhHvf8gsK+gD1nQiSAyaQbY75IdQnGqGMOn1WDf74TNfHom6iZlh96lst6D/
 Pflv5teTZFIpILP7dyreiRJDpmK3s9JQjXW9usxkkN86u5HqMj23ILOmBQBD5tviXGYxJz
 BKCKLmkurmDnvWJcaTry/dAF8/71z00=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-l-glN6YsMkG7SEIEI8mVEQ-1; Fri, 03 Mar 2023 17:36:44 -0500
X-MC-Unique: l-glN6YsMkG7SEIEI8mVEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACDB785C6F4;
 Fri,  3 Mar 2023 22:36:43 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16E58440D8;
 Fri,  3 Mar 2023 22:36:43 +0000 (UTC)
Date: Fri, 3 Mar 2023 16:36:41 -0600
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libguestfs@redhat.com
Subject: Re: [PATCH v2 3/6] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <20230303223641.utbls7mggek7quqx@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-4-eblake@redhat.com>
 <Y/XlHhLWwm2pZ4RL@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/XlHhLWwm2pZ4RL@pc220518.home.grep.be>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 22, 2023 at 11:49:18AM +0200, Wouter Verhelst wrote:
> On Mon, Nov 14, 2022 at 04:46:52PM -0600, Eric Blake wrote:
> [...]
> > @@ -1370,9 +1475,10 @@ of the newstyle negotiation.
> >      Return a list of `NBD_REP_META_CONTEXT` replies, one per context,
> >      followed by an `NBD_REP_ACK` or an error.
> > 
> > -    This option SHOULD NOT be requested unless structured replies have
> > -    been negotiated first. If a client attempts to do so, a server
> > -    MAY send `NBD_REP_ERR_INVALID`.
> > +    This option SHOULD NOT be requested unless structured replies or
> > +    extended headers have been negotiated first. If a client attempts
> > +    to do so, a server MAY send `NBD_REP_ERR_INVALID` or
> > +    `NBD_REP_ERR_EXT_HEADER_REQD`.
> 
> Is it the intent that NBD_REP_ERR_EXT_HEADER_REQD means structured
> replies are not supported by this server? I think that could be
> clarified here.

My intent here was that a newer server that ONLY wants to talk to
clients that understand extended headers can use
NBD_REP_ERR_EXT_HEADER_REQD as its error message to clients that have
not requested extended headers yet.  Older clients may not know what
that error code means, but our spec already has reasonable constraints
that the client should at least recognize it as an error code.

That way, a server only has to implement extended headers, rather than
maintaining the structured header code in parallel.

> 
> (this occurs twice)
> 
> [...]
> > +* `NBD_OPT_EXTENDED_HEADERS` (11)
> > +
> > +    The client wishes to use extended headers during the transmission
> > +    phase.  The client MUST NOT send any additional data with the
> > +    option, and the server SHOULD reject a request that includes data
> > +    with `NBD_REP_ERR_INVALID`.
> > +
> > +    When successful, this option takes precedence over structured
> > +    replies.  A client MAY request structured replies first, although
> > +    a server SHOULD support this option even if structured replies are
> > +    not negotiated.
> > +
> > +    It is envisioned that future extensions will add other new
> > +    requests that support a data payload in the request or reply.  A
> > +    server that supports such extensions SHOULD NOT advertise those
> > +    extensions until the client has negotiated extended headers; and a
> > +    client MUST NOT make use of those extensions without first
> > +    enabling support for reply payloads.
> > +
> > +    The server replies with the following, or with an error permitted
> > +    elsewhere in this document:
> > +
> > +    - `NBD_REP_ACK`: Extended headers have been negotiated; the client
> > +      MUST use the 32-byte extended request header, with proper use of
> > +      `NBD_CMD_FLAG_PAYLOAD_LEN` for all commands sending a payload;
> > +      and the server MUST use the 32-byte extended reply header.
> > +    - For backwards compatibility, clients SHOULD be prepared to also
> > +      handle `NBD_REP_ERR_UNSUP`; in this case, only the compact
> > +      transmission headers will be used.
> > +
> > +    Note that a response of `NBD_REP_ERR_BLOCK_SIZE_REQD` does not
> > +    make sense in response to this command, but a server MAY fail with
> > +    that error for a later `NBD_OPT_GO` without a client request for
> > +    `NBD_INFO_BLOCK_SIZE`, since the use of extended headers provides
> > +    more incentive for a client to promise to obey block size
> > +    constraints.
> > +
> > +    If the client requests `NBD_OPT_STARTTLS` after this option, it
> > +    MUST renegotiate extended headers.
> > +
> 
> Does it make sense here to also forbid use of NBD_OPT_EXPORT_NAME? I
> think the sooner we get rid of that, the better ;-)

I hadn't thought of that, but it does indeed sound desirable.  I can
touch up the spec to state that NBD_OPT_EXPORT_NAME MUST NOT be used
by a client that requested extended headers.

> 
> [...]
> > @@ -1746,13 +1914,15 @@ unrecognized flags.
> > 
> >  #### Structured reply types
> > 
> > -These values are used in the "type" field of a structured reply.
> > -Some chunk types can additionally be categorized by role, such as
> > -*error chunks* or *content chunks*.  Each type determines how to
> > -interpret the "length" bytes of payload.  If the client receives
> > -an unknown or unexpected type, other than an *error chunk*, it
> > -MUST initiate a hard disconnect.  A server MUST NOT send a chunk
> > -larger than any advertised maximum block payload size.
> > +These values are used in the "type" field of a structured reply.  Some
> > +chunk types can additionally be categorized by role, such as *error
> > +chunks*, *content chunks*, or *status chunks*.  Each type determines
> > +how to interpret the "length" bytes of payload.  If the client
> > +receives an unknown or unexpected type, other than an *error chunk*,
> > +it MAY initiate a hard disconnect on the grounds that the client is
> > +uncertain whether the server handled the request as desired.  A server
> > +MUST NOT send a chunk larger than any advertised maximum block payload
> > +size.
> 
> Why do we make this a MAY rather than a MUST?

Hmm, now I'm trying to remember why I relaxed this from MUST to MAY on
the client side.  Keeping it at MUST makes sense, because a
well-formed server won't be sending unknown reply types.

> 
> Also, should this section say "structured or extended reply"? We use the
> same types for both.

Makes sense.

> 
> [...]
> > +* `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)
> > +
> > +  This chunk type is in the status chunk category.  *length* MUST be
> > +  8 + (a positive multiple of 16).  The semantics of this chunk mirror
> > +  those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
> > +  larger *extent length* field, added padding in each descriptor to
> > +  ease alignment, and the addition of a *descriptor count* field that
> > +  can be used for easier client processing.  This chunk type MUST NOT
> > +  be used unless extended headers were negotiated with
> > +  `NBD_OPT_EXTENDED_HEADERS`.
> > +
> > +  If the *descriptor count* field contains 0, the number of subsequent
> > +  descriptors is determined solely by the *length* field of the reply
> > +  header.  However, the server MAY populate the *descriptor count*
> > +  field with the number of descriptors that follow; when doing this,
> > +  the server MUST ensure that the header *length* is equal to
> > +  *descriptor count* * 16 + 8.
> > +
> > +  The payload starts with:
> > +
> > +  32 bits, metadata context ID  
> > +  32 bits, descriptor count  
> > +
> > +  and is followed by a list of one or more descriptors, each with this
> > +  layout:
> > +
> > +  64 bits, length of the extent to which the status below
> > +     applies (unsigned, MUST be nonzero)  
> > +  32 bits, padding (MUST be zero)  
> > +  32 bits, status flags  
> > +
> > +  Note that even when extended headers are in use, the client MUST be
> > +  prepared for the server to use either the compact or extended chunk
> > +  type, regardless of whether the client's hinted effect length was
> > +  more or less than 32 bits; but the server MUST use exactly one of
> > +  the two chunk types per negotiated metacontext ID.
> 
> Is this last paragraph really a good idea? I would think it makes more
> sense to require the new format if we're already required to support it
> on both sides anyway.

My proof of implementation was easier to code when I didn't have to
resize the block status reply sizing in the same patch as adding the
64-bit headers.  But if you think requiring the 64-bit reply type
always (and forbidding the 32-bit reply) when extended headers are in
force, that's also possible.
> 
> [...]
> > -    The list of block status descriptors within the
> > -    `NBD_REPLY_TYPE_BLOCK_STATUS` chunk represent consecutive portions
> > -    of the file starting from specified *offset*.  If the client used
> 
> I know this was in the old text (hence me mentioning it here), but this
> should probably say "export" rarher than "file". NBD does not deal
> (conceptually) with files...

Agreed - we have been fairly consistent on the term 'export' (whether
that export be a file or some other source of data).  Will fix
(perhaps separately and just push it as trivial).

> 
> > -    the `NBD_CMD_FLAG_REQ_ONE` flag, each chunk contains exactly one
> > -    descriptor where the *length* of the descriptor MUST NOT be
> > -    greater than the *length* of the request; otherwise, a chunk MAY
> > -    contain multiple descriptors, and the final descriptor MAY extend
> > -    beyond the original requested size if the server can determine a
> > -    larger length without additional effort.  On the other hand, the
> > -    server MAY return less data than requested.  In particular, a
> > -    server SHOULD NOT send more than 2^20 status descriptors in a
> > -    single chunk.  However the server MUST return at least one status
> > -    descriptor, and since each status descriptor has a non-zero
> > -    length, a client can always make progress on a successful return.
> > +    The list of block status descriptors within a given status chunk
> > +    represent consecutive portions of the file starting from specified
> > +    *offset*.  If the client used the `NBD_CMD_FLAG_REQ_ONE` flag,
> > +    each chunk contains exactly one descriptor where the *length* of
> > +    the descriptor MUST NOT be greater than the *length* of the
> > +    request; otherwise, a chunk MAY contain multiple descriptors, and
> > +    the final descriptor MAY extend beyond the original requested size
> > +    if the server can determine a larger length without additional
> > +    effort.  On the other hand, the server MAY return less data than
> > +    requested.  In particular, a server SHOULD NOT send more than 2^20
> > +    status descriptors in a single chunk.  However the server MUST
> > +    return at least one status descriptor, and since each status
> > +    descriptor has a non-zero length, a client can always make
> > +    progress on a successful return.
> 
> Other than that, no comments on this one.
> 
> -- 
>      w@uter.{be,co.za}
> wouter@{grep.be,fosdem.org,debian.org}
> 
> I will have a Tin-Actinium-Potassium mixture, thanks.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


