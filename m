Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E2B4E67DE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:34:25 +0100 (CET)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRLs-0004Pl-Ag
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:34:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1nXRJr-0002nM-Ml; Thu, 24 Mar 2022 13:32:21 -0400
Received: from lounge.grep.be ([144.76.219.42]:32857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1nXRJp-0002Ek-7Q; Thu, 24 Mar 2022 13:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
 s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u5sPssR6LFWnK8abW58smZkWt9oyANLFAfbGfMaOlfY=; b=dHezyUlaBK99GqS+jl+cUQL/ie
 Q+rpSoDYwquBEuYRQaT897LCB6l6juGtkXVnQPhHzNhglhhIa8DqoH8Gp6n+GQqpo313+eDJfVyuH
 mPMiAswRg6r1W/RPcFVlCPMWzu9z1Dlf1Lj5u73rTvveSwUSG1pLBvm9sOf5lqvqFX92O/w7WunPm
 b8w0RKsdBIBP+/nwyDhW4NqP3QHuhdMlK+5OiyLMK3x9UAEP/lCQ0fTgQbMcIJkRBEPvRjFs881sO
 PypvwRn5hbmoEapjBTVYtAW+8zxGspQ6gjYaXWwpmT9JNsd1iX14cO5tTMkDyffizq7BQoN3yLaeZ
 N+tQ6BhQ==;
Received: from [197.245.197.46] (helo=pc181009)
 by lounge.grep.be with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <w@uter.be>)
 id 1nXRJZ-009awk-73; Thu, 24 Mar 2022 18:32:01 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
 (envelope-from <w@uter.be>) id 1nXRJM-0002by-Ah;
 Thu, 24 Mar 2022 19:31:48 +0200
Date: Thu, 24 Mar 2022 19:31:48 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <YjyrBLhG5ph6UA/E@pc181009.grep.be>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203231434.3900824-1-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
Received-SPF: pass client-ip=144.76.219.42; envelope-from=w@uter.be;
 helo=lounge.grep.be
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 nbd@other.debian.org, nsoffer@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

Thanks for the ping; it had slipped my mind.

On Fri, Dec 03, 2021 at 05:14:34PM -0600, Eric Blake wrote:
>  #### Request message
> 
> -The request message, sent by the client, looks as follows:
> +The compact request message, sent by the client when extended
> +transactions are not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> +looks as follows:
> 
>  C: 32 bits, 0x25609513, magic (`NBD_REQUEST_MAGIC`)  
>  C: 16 bits, command flags  
> @@ -353,14 +370,26 @@ C: 64 bits, offset (unsigned)
>  C: 32 bits, length (unsigned)  
>  C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  
> 
> +If negotiation agreed on extended transactions with
> +`NBD_OPT_EXTENDED_HEADERS`, the client instead uses extended requests:
> +
> +C: 32 bits, 0x21e41c71, magic (`NBD_REQUEST_EXT_MAGIC`)  
> +C: 16 bits, command flags  
> +C: 16 bits, type  
> +C: 64 bits, handle  
> +C: 64 bits, offset (unsigned)  
> +C: 64 bits, length (unsigned)  
> +C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  
> +

Perhaps we should decouple the ideas of "effect length" and "payload
length"? As in,

C: 32 bits, 0x21e41c71, magic (`NBD_REQUEST_EXT_MAGIC`)
C: 16 bits, command flags
C: 16 bits, type
C: 64 bits, handle
C: 64 bits, offset
C: 64 bits, effect length
C: 64 bits, payload length
C: (*payload length* bytes of data)

This makes the protocol more context free. With the current set of
commands, only NBD_CMD_WRITE would have payload length be nonzero, but
that doesn't have to remain the case forever; e.g., we could have a
command that extends NBD_CMD_BLOCK_STATUS to only query a subset of the
metadata contexts that we declared (if that is wanted, of course).

Of course, that does have the annoying side effect of no longer fitting
in 32 bytes, requiring a 40-byte header instead. I think it would be
worth it though.

(This is obviously not relevant for reply messages, only for request
messages)

>  #### Simple reply message
> 
>  The simple reply message MUST be sent by the server in response to all
>  requests if structured replies have not been negotiated using
> -`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been negotiated, a simple
> -reply MAY be used as a reply to any request other than `NBD_CMD_READ`,
> -but only if the reply has no data payload.  The message looks as
> -follows:
> +`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been
> +negotiated, a simple reply MAY be used as a reply to any request other
> +than `NBD_CMD_READ`, but only if the reply has no data payload.  If
> +extended headers were not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> +the message looks as follows:
> 
>  S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
>     `NBD_REPLY_MAGIC`)  
> @@ -369,6 +398,16 @@ S: 64 bits, handle
>  S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
>      *error* is zero)  
> 
> +If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> +the message looks like:
> +
> +S: 32 bits, 0x60d12fd6, magic (`NBD_SIMPLE_REPLY_EXT_MAGIC`)  
> +S: 32 bits, error (MAY be zero)  
> +S: 64 bits, handle  
> +S: 128 bits, padding (MUST be zero)  

Should all these requirements about padding not be a SHOULD rather than
a MUST?

[...]
> +* `NBD_OPT_EXTENDED_HEADERS` (11)
> +
> +    The client wishes to use extended headers during the transmission
> +    phase.  The client MUST NOT send any additional data with the
> +    option, and the server SHOULD reject a request that includes data
> +    with `NBD_REP_ERR_INVALID`.
> +
> +    The server replies with the following, or with an error permitted
> +    elsewhere in this document:
> +
> +    - `NBD_REP_ACK`: Extended headers have been negotiated; the client
> +      MUST use the 32-byte extended request header, and the server
> +      MUST use the 32-byte extended reply header.
> +    - For backwards compatibility, clients SHOULD be prepared to also
> +      handle `NBD_REP_ERR_UNSUP`; in this case, only the compact
> +      transmission headers will be used.
> +
> +    If the client requests `NBD_OPT_STARTTLS` after this option, it
> +    MUST renegotiate extended headers.
> +

Two thoughts here:

- We should probably allow NBD_REP_ERR_BLOCK_SIZE_REQD as a reply to
  this message; I could imagine a server might not want to talk 64-bit
  lengths if it doesn't know that block sizes are going to be
  reasonable.
- In the same vein, should we perhaps also add an error message for when
  extended headers are negotiated without structured replies? Perhaps a
  server implementation might not want to implement the "extended
  headers but no structured replies" message format.

On that note, while I know I had said earlier that I would prefer not
making this new extension depend on structured replies, in hindsight
perhaps it *is* a good idea to add that dependency; otherwise we create
an extra message format that is really a degenerate case of "we want to
be modern in one way but not in another", and that screams out to me
"I'm not going to be used much, look at me for security issues!"

Which perhaps is not a very good idea.

[...]
-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

