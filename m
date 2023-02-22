Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3138769F22D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 10:50:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUlku-0004Q8-AE; Wed, 22 Feb 2023 04:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1pUlkq-0004Pr-98; Wed, 22 Feb 2023 04:49:40 -0500
Received: from lounge.grep.be ([2a01:4f8:200:91e8::2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1pUlkn-0003YF-Mt; Wed, 22 Feb 2023 04:49:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
 s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EbBMKAnTWe+s3mdJi9bAs0O++03SbP6Btd81X8uSdgA=; b=SeAB/lHUGU9BsQBfHU1/4fh601
 n7Q7kIV0LSz548wUYyxZvMthP7JHioW8l+uIoCUGl89dQjSknljAYEsXdbYOIPkFb6cuEHZB9VlkC
 wFJMMDOmbUyAs5FDNISemOqnIF8BTE+pvNI7e/spfKOLJNGC/rRNJ2PdRbiFdyI4P+VsU9cO7IN3z
 W+2EbT+wnn1+SxiDEWW8OPoStL1TP3SG1dOl2e7OLKdYtV4VLYYirOKNaoGwF18NOb8BPsMv9s0UM
 p5efvR7ynzW7ZAxQ1jxIwD3SHPcr6LNJa63K6CmosYlnYdQOBLJvGzvEiI21S4xZwUtynwu4dTstY
 Rs/inaYA==;
Received: from [102.39.141.34] (helo=pc220518)
 by lounge.grep.be with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <w@uter.be>)
 id 1pUlke-0097vC-Hr; Wed, 22 Feb 2023 10:49:28 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
 (envelope-from <w@uter.be>) id 1pUlkU-000VbS-37;
 Wed, 22 Feb 2023 11:49:18 +0200
Date: Wed, 22 Feb 2023 11:49:18 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libguestfs@redhat.com
Subject: Re: [PATCH v2 3/6] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <Y/XlHhLWwm2pZ4RL@pc220518.home.grep.be>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-4-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114224655.2186173-4-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
Received-SPF: pass client-ip=2a01:4f8:200:91e8::2; envelope-from=w@uter.be;
 helo=lounge.grep.be
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Mon, Nov 14, 2022 at 04:46:52PM -0600, Eric Blake wrote:
[...]
> @@ -1370,9 +1475,10 @@ of the newstyle negotiation.
>      Return a list of `NBD_REP_META_CONTEXT` replies, one per context,
>      followed by an `NBD_REP_ACK` or an error.
> 
> -    This option SHOULD NOT be requested unless structured replies have
> -    been negotiated first. If a client attempts to do so, a server
> -    MAY send `NBD_REP_ERR_INVALID`.
> +    This option SHOULD NOT be requested unless structured replies or
> +    extended headers have been negotiated first. If a client attempts
> +    to do so, a server MAY send `NBD_REP_ERR_INVALID` or
> +    `NBD_REP_ERR_EXT_HEADER_REQD`.

Is it the intent that NBD_REP_ERR_EXT_HEADER_REQD means structured
replies are not supported by this server? I think that could be
clarified here.

(this occurs twice)

[...]
> +* `NBD_OPT_EXTENDED_HEADERS` (11)
> +
> +    The client wishes to use extended headers during the transmission
> +    phase.  The client MUST NOT send any additional data with the
> +    option, and the server SHOULD reject a request that includes data
> +    with `NBD_REP_ERR_INVALID`.
> +
> +    When successful, this option takes precedence over structured
> +    replies.  A client MAY request structured replies first, although
> +    a server SHOULD support this option even if structured replies are
> +    not negotiated.
> +
> +    It is envisioned that future extensions will add other new
> +    requests that support a data payload in the request or reply.  A
> +    server that supports such extensions SHOULD NOT advertise those
> +    extensions until the client has negotiated extended headers; and a
> +    client MUST NOT make use of those extensions without first
> +    enabling support for reply payloads.
> +
> +    The server replies with the following, or with an error permitted
> +    elsewhere in this document:
> +
> +    - `NBD_REP_ACK`: Extended headers have been negotiated; the client
> +      MUST use the 32-byte extended request header, with proper use of
> +      `NBD_CMD_FLAG_PAYLOAD_LEN` for all commands sending a payload;
> +      and the server MUST use the 32-byte extended reply header.
> +    - For backwards compatibility, clients SHOULD be prepared to also
> +      handle `NBD_REP_ERR_UNSUP`; in this case, only the compact
> +      transmission headers will be used.
> +
> +    Note that a response of `NBD_REP_ERR_BLOCK_SIZE_REQD` does not
> +    make sense in response to this command, but a server MAY fail with
> +    that error for a later `NBD_OPT_GO` without a client request for
> +    `NBD_INFO_BLOCK_SIZE`, since the use of extended headers provides
> +    more incentive for a client to promise to obey block size
> +    constraints.
> +
> +    If the client requests `NBD_OPT_STARTTLS` after this option, it
> +    MUST renegotiate extended headers.
> +

Does it make sense here to also forbid use of NBD_OPT_EXPORT_NAME? I
think the sooner we get rid of that, the better ;-)

[...]
> @@ -1746,13 +1914,15 @@ unrecognized flags.
> 
>  #### Structured reply types
> 
> -These values are used in the "type" field of a structured reply.
> -Some chunk types can additionally be categorized by role, such as
> -*error chunks* or *content chunks*.  Each type determines how to
> -interpret the "length" bytes of payload.  If the client receives
> -an unknown or unexpected type, other than an *error chunk*, it
> -MUST initiate a hard disconnect.  A server MUST NOT send a chunk
> -larger than any advertised maximum block payload size.
> +These values are used in the "type" field of a structured reply.  Some
> +chunk types can additionally be categorized by role, such as *error
> +chunks*, *content chunks*, or *status chunks*.  Each type determines
> +how to interpret the "length" bytes of payload.  If the client
> +receives an unknown or unexpected type, other than an *error chunk*,
> +it MAY initiate a hard disconnect on the grounds that the client is
> +uncertain whether the server handled the request as desired.  A server
> +MUST NOT send a chunk larger than any advertised maximum block payload
> +size.

Why do we make this a MAY rather than a MUST?

Also, should this section say "structured or extended reply"? We use the
same types for both.

[...]
> +* `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)
> +
> +  This chunk type is in the status chunk category.  *length* MUST be
> +  8 + (a positive multiple of 16).  The semantics of this chunk mirror
> +  those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
> +  larger *extent length* field, added padding in each descriptor to
> +  ease alignment, and the addition of a *descriptor count* field that
> +  can be used for easier client processing.  This chunk type MUST NOT
> +  be used unless extended headers were negotiated with
> +  `NBD_OPT_EXTENDED_HEADERS`.
> +
> +  If the *descriptor count* field contains 0, the number of subsequent
> +  descriptors is determined solely by the *length* field of the reply
> +  header.  However, the server MAY populate the *descriptor count*
> +  field with the number of descriptors that follow; when doing this,
> +  the server MUST ensure that the header *length* is equal to
> +  *descriptor count* * 16 + 8.
> +
> +  The payload starts with:
> +
> +  32 bits, metadata context ID  
> +  32 bits, descriptor count  
> +
> +  and is followed by a list of one or more descriptors, each with this
> +  layout:
> +
> +  64 bits, length of the extent to which the status below
> +     applies (unsigned, MUST be nonzero)  
> +  32 bits, padding (MUST be zero)  
> +  32 bits, status flags  
> +
> +  Note that even when extended headers are in use, the client MUST be
> +  prepared for the server to use either the compact or extended chunk
> +  type, regardless of whether the client's hinted effect length was
> +  more or less than 32 bits; but the server MUST use exactly one of
> +  the two chunk types per negotiated metacontext ID.

Is this last paragraph really a good idea? I would think it makes more
sense to require the new format if we're already required to support it
on both sides anyway.

[...]
> -    The list of block status descriptors within the
> -    `NBD_REPLY_TYPE_BLOCK_STATUS` chunk represent consecutive portions
> -    of the file starting from specified *offset*.  If the client used

I know this was in the old text (hence me mentioning it here), but this
should probably say "export" rarher than "file". NBD does not deal
(conceptually) with files...

> -    the `NBD_CMD_FLAG_REQ_ONE` flag, each chunk contains exactly one
> -    descriptor where the *length* of the descriptor MUST NOT be
> -    greater than the *length* of the request; otherwise, a chunk MAY
> -    contain multiple descriptors, and the final descriptor MAY extend
> -    beyond the original requested size if the server can determine a
> -    larger length without additional effort.  On the other hand, the
> -    server MAY return less data than requested.  In particular, a
> -    server SHOULD NOT send more than 2^20 status descriptors in a
> -    single chunk.  However the server MUST return at least one status
> -    descriptor, and since each status descriptor has a non-zero
> -    length, a client can always make progress on a successful return.
> +    The list of block status descriptors within a given status chunk
> +    represent consecutive portions of the file starting from specified
> +    *offset*.  If the client used the `NBD_CMD_FLAG_REQ_ONE` flag,
> +    each chunk contains exactly one descriptor where the *length* of
> +    the descriptor MUST NOT be greater than the *length* of the
> +    request; otherwise, a chunk MAY contain multiple descriptors, and
> +    the final descriptor MAY extend beyond the original requested size
> +    if the server can determine a larger length without additional
> +    effort.  On the other hand, the server MAY return less data than
> +    requested.  In particular, a server SHOULD NOT send more than 2^20
> +    status descriptors in a single chunk.  However the server MUST
> +    return at least one status descriptor, and since each status
> +    descriptor has a non-zero length, a client can always make
> +    progress on a successful return.

Other than that, no comments on this one.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

