Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBF769F27A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:07:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUm0g-0000cK-WB; Wed, 22 Feb 2023 05:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1pUm0e-0000bt-SM; Wed, 22 Feb 2023 05:06:00 -0500
Received: from lounge.grep.be ([2a01:4f8:200:91e8::2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1pUm0c-0001kM-C6; Wed, 22 Feb 2023 05:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
 s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aua56B4RKM1vd0PJ+AuIl6KUyNHA9PXJ0x5XRVOUHfE=; b=nD+HsUWXjUb29aZO//NQTm4kIC
 eadO/a5CCiuZ4BKZe5S7/WffIYOWSgdw0onHKL/CKYHICq0pc3E/5jzEZbiUN/K9k57TCHrmThZuU
 uW/F/BMbOnc6Xvqlfg89xRi8o0AQDMb8+3u/pWIUWDcacig3mwbaXIaDi0AI9Uc/Qu8Y3fUOxC2o3
 50o4djg6g9qBMmuWV4veBrOUpc24kH1KqeAQc5wmEjQAyJfNCX9h4+vlFAMDcV5WWgx8q+W91o9QQ
 RJdChLdcLozAYWsdg1xU4dH8fV8X0FW5CQHpPJ4dCyb1FLxMkX6ICnyZLiFaUaTM1PWUFm+j/Pc9+
 lfjPB4zA==;
Received: from [102.39.141.34] (helo=pc220518)
 by lounge.grep.be with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <w@uter.be>)
 id 1pUm0V-009Hv4-DO; Wed, 22 Feb 2023 11:05:51 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
 (envelope-from <w@uter.be>) id 1pUm0O-000Xgg-0i;
 Wed, 22 Feb 2023 12:05:44 +0200
Date: Wed, 22 Feb 2023 12:05:44 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libguestfs@redhat.com
Subject: Re: [PATCH v2 5/6] spec: Introduce NBD_FLAG_BLOCK_STATUS_PAYLOAD
Message-ID: <Y/Xo+DGAYSZ4bQvK@pc220518.home.grep.be>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-6-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114224655.2186173-6-eblake@redhat.com>
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

On Mon, Nov 14, 2022 at 04:46:54PM -0600, Eric Blake wrote:
>  #### Simple reply message
> 
> @@ -1232,6 +1235,19 @@ The field has the following format:
>    will be faster than a regular write). Clients MUST NOT set the
>    `NBD_CMD_FLAG_FAST_ZERO` request flag unless this transmission flag
>    is set.
> +- bit 12, `NBD_FLAG_BLOCK_STATUS_PAYLOAD`: Indicates that the server
> +  understands the use of the `NBD_CMD_FLAG_PAYLOAD_LEN` flag to
> +  `NBD_CMD_BLOCK_STATUS` to allow the client to request that the
> +  server filters its response to a specific subset of negotiated
> +  metacontext ids passed in via a client payload, rather than the
> +  default of replying to all metacontext ids. Servers MUST NOT
> +  advertise this bit unless the client successfully negotiates
> +  extended headers via `NBD_OPT_EXTENDED_HEADERS`, and SHOULD NOT
> +  advertise this bit in response to `NBD_OPT_EXPORT_NAME` or
> +  `NBD_OPT_GO` if the client does not negotiate metacontexts with
> +  `NBD_OPT_SET_META_CONTEXT`; clients SHOULD NOT set the
> +  `NBD_CMD_FLAG_PAYLOAD_LEN` flag for `NBD_CMD_BLOCK_STATUS` unless
> +  this transmission flag is set.

Given that we are introducing this at the same time as the extended
headers (and given that we're running out of available flags in this
16-bit field), isn't it better to make the ability to understand
PAYLOAD_LEN be implied by extended headers? Or is there a use case for
implementing extended headers but not a payload length on
CMD_BLOCK_STATUS that I'm missing?

>  Clients SHOULD ignore unknown flags.
> 
> @@ -1915,8 +1931,11 @@ valid may depend on negotiation during the handshake phase.
>    header.  With extended headers, the flag MUST be set for
>    `NBD_CMD_WRITE` (as the write command always sends a payload of the
>    bytes to be written); for other commands, the flag will trigger an
> -  `NBD_EINVAL` error unless the server has advertised support for an
> -  extension payload form for the command.
> +  `NBD_EINVAL` error unless the command documents an optional payload
> +  form for the command and the server has implemented that form (an
> +  example being `NBD_CMD_BLOCK_STATUS` providing a payload form for
> +  restricting the response to a particular metacontext id, when the
> +  server advertises `NBD_FLAG_BLOCK_STATUS_PAYLOAD`).
> 
>  ##### Structured reply flags
> 
> @@ -2464,6 +2483,23 @@ The following request types exist:
>      The server MAY send chunks in a different order than the context
>      ids were assigned in reply to `NBD_OPT_SET_META_CONTEXT`.
> 
> +    If extended headers were negotiated, a server MAY optionally
> +    advertise, via the transmission flag
> +    `NBD_FLAG_BLOCK_STATUS_PAYLOAD`, that it supports an alternative
> +    request form where the client sets `NBD_CMD_FLAG_PAYLOAD_LEN` in
> +    order to pass a payload that informs the server to limit its
> +    replies to the metacontext id(s) in the client's request payload,
> +    rather than giving an answer on all possible metacontext ids.  If
> +    the server does not support the payload form, or detects duplicate
> +    or unknown metacontext ids in the client's payload, the server
> +    MUST gracefully consume the client's payload before failing with
> +    `NBD_EINVAL`.  The payload form MUST occupy 8 + n*4 bytes, where n
> +    is the number of metacontext ids the client is interested in (as
> +    implied by the payload length), laid out as:
> +
> +    64 bits, effect length  
> +    n * 32 bits, list of metacontext ids to use  
> +
>      The list of block status descriptors within a given status chunk
>      represent consecutive portions of the file starting from specified
>      *offset*.  If the client used the `NBD_CMD_FLAG_REQ_ONE` flag,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

