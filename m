Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBA56AAEA0
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 09:50:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYk4P-00029h-VH; Sun, 05 Mar 2023 03:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1pYk4N-00027h-Pl; Sun, 05 Mar 2023 03:50:15 -0500
Received: from lounge.grep.be ([2a01:4f8:200:91e8::2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1pYk4M-0002Ke-83; Sun, 05 Mar 2023 03:50:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
 s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tp4pZPSq6rNgQROm93gbPxqatAHIwtyqkMWTrPcWtx8=; b=Inwd9MfClmxCwozKE0+vNUL+0q
 j8dv/8/A8DzAhtvpRwotI5gelU1g5wANzoHfqz58gMiE/NdPbwR4sIiTeQEym5En5Y1zgdAqfm/K7
 Jq2IShLUHnx/kMZiNa3n4KgrRRQLVnGN3oR/DhqLWNUp4eHEwGGCpPN07MTf7JBWTmObZTxAIic7m
 YXAWCTCYdrNtdDciJuKJQc72gjEwZCjzuDWW8dWbmRNL61yePuad3lgZTRg0Lj/wSiLcSO+PRmXju
 FsTjTSRLZC11E2017CTur+Hs9jfNGnxPX4h9FK37kHJFsaaJE7nO+PVHYBQ64d3vdJPb41N5mVrgf
 frI/Jt4g==;
Received: from [102.39.141.34] (helo=pc220518)
 by lounge.grep.be with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <w@uter.be>)
 id 1pYk4I-0007IE-3K; Sun, 05 Mar 2023 09:50:10 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
 (envelope-from <w@uter.be>) id 1pYk4A-000Shz-2e;
 Sun, 05 Mar 2023 10:50:02 +0200
Date: Sun, 5 Mar 2023 10:50:02 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libguestfs@redhat.com
Subject: Re: [PATCH v2 5/6] spec: Introduce NBD_FLAG_BLOCK_STATUS_PAYLOAD
Message-ID: <ZARXutZx3uhr0oPy@pc220518.home.grep.be>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-6-eblake@redhat.com>
 <Y/Xo+DGAYSZ4bQvK@pc220518.home.grep.be>
 <20230303224038.sxhd6enenp4v7gpa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303224038.sxhd6enenp4v7gpa@redhat.com>
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

On Fri, Mar 03, 2023 at 04:40:38PM -0600, Eric Blake wrote:
> On Wed, Feb 22, 2023 at 12:05:44PM +0200, Wouter Verhelst wrote:
> > On Mon, Nov 14, 2022 at 04:46:54PM -0600, Eric Blake wrote:
> > >  #### Simple reply message
> > > 
> > > @@ -1232,6 +1235,19 @@ The field has the following format:
> > >    will be faster than a regular write). Clients MUST NOT set the
> > >    `NBD_CMD_FLAG_FAST_ZERO` request flag unless this transmission flag
> > >    is set.
> > > +- bit 12, `NBD_FLAG_BLOCK_STATUS_PAYLOAD`: Indicates that the server
> > > +  understands the use of the `NBD_CMD_FLAG_PAYLOAD_LEN` flag to
> > > +  `NBD_CMD_BLOCK_STATUS` to allow the client to request that the
> > > +  server filters its response to a specific subset of negotiated
> > > +  metacontext ids passed in via a client payload, rather than the
> > > +  default of replying to all metacontext ids. Servers MUST NOT
> > > +  advertise this bit unless the client successfully negotiates
> > > +  extended headers via `NBD_OPT_EXTENDED_HEADERS`, and SHOULD NOT
> > > +  advertise this bit in response to `NBD_OPT_EXPORT_NAME` or
> > > +  `NBD_OPT_GO` if the client does not negotiate metacontexts with
> > > +  `NBD_OPT_SET_META_CONTEXT`; clients SHOULD NOT set the
> > > +  `NBD_CMD_FLAG_PAYLOAD_LEN` flag for `NBD_CMD_BLOCK_STATUS` unless
> > > +  this transmission flag is set.
> > 
> > Given that we are introducing this at the same time as the extended
> > headers (and given that we're running out of available flags in this
> > 16-bit field), isn't it better to make the ability to understand
> > PAYLOAD_LEN be implied by extended headers? Or is there a use case for
> > implementing extended headers but not a payload length on
> > CMD_BLOCK_STATUS that I'm missing?
> 
> In my proof of implementation, this was a distinct feature addition on
> top of 64-bit headers.
> 
> It is easy to write a server that does not want to deal with a client
> payload on a block status request (for example, a server that only
> knows about one metacontext, and therefore never needs to deal with a
> client wanting a subset of negotiated metacontexts).  Forcing a server
> to have to support a client-side filtering request on block status
> commands, merely because the server now supports 64-bit lengths,
> seemed like a stretch too far, which is why I decided to use a feature
> bit for this one.

Okay, yes, that makes sense. Thanks.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

