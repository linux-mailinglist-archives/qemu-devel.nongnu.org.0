Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E2746C089
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 17:16:38 +0100 (CET)
Received: from localhost ([::1]:33388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mud8v-0005jh-QC
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 11:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1mud7C-0004sS-Rg; Tue, 07 Dec 2021 11:14:50 -0500
Received: from lounge.grep.be ([144.76.219.42]:41471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1mud7A-0006v7-KC; Tue, 07 Dec 2021 11:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
 s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=25a1o2WYOQYbCP2CdxCrYiQ1cGWDx5GwMdekaJBLEZk=; b=A9n9CPe3MJYzvynRukUGPcS0F4
 FTM60J7mAyKo+SDiz8ba+HHN4HEz9epcZgHZogUe4gjQwySxkdt8o0h4kBWNlSwMPEu1E/E4Ife5f
 0lo1zKpOTKWTfqx6xc4syuk+vPaghNbLigG2A67Zqr2X5yNKDFVzFcqAzM/RBsNNPQy603H1n3CdN
 y4H2+4dV/wu+1d0uMXZSlxStb//iMudKX11JxTqW03tjcZow9JHbYKI9TIMXWF0ILrKUzdysZBjsz
 kVMbSoNverTUu2zEeHUFzF/LsGvvnfKTVCZlyXpUGBMgg1FaLgn+aSMDMUWzToJMQAM799O/37VSK
 3SvR0iEg==;
Received: from [209.203.16.11] (helo=pc181009)
 by lounge.grep.be with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <w@uter.be>)
 id 1mud6t-003Gd0-1A; Tue, 07 Dec 2021 17:14:31 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
 (envelope-from <w@uter.be>) id 1mud6l-000Wf4-V0;
 Tue, 07 Dec 2021 18:14:23 +0200
Date: Tue, 7 Dec 2021 18:14:23 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <Ya+IXzVAfS98M0dq@pc181009.grep.be>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
 <f05c680a-73c3-b0d2-dbdf-c0bcf1ca3530@virtuozzo.com>
 <20211206230047.q5xc5enodbicf3gw@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206230047.q5xc5enodbicf3gw@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
Received-SPF: pass client-ip=144.76.219.42; envelope-from=w@uter.be;
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, nbd@other.debian.org,
 nsoffer@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 06, 2021 at 05:00:47PM -0600, Eric Blake wrote:
> On Mon, Dec 06, 2021 at 02:40:45PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > >   #### Simple reply message
> > > 
> > >   The simple reply message MUST be sent by the server in response to all
> > >   requests if structured replies have not been negotiated using
> > > -`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been negotiated, a simple
> > > -reply MAY be used as a reply to any request other than `NBD_CMD_READ`,
> > > -but only if the reply has no data payload.  The message looks as
> > > -follows:
> > > +`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been
> > > +negotiated, a simple reply MAY be used as a reply to any request other
> > > +than `NBD_CMD_READ`, but only if the reply has no data payload.  If
> > > +extended headers were not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> > > +the message looks as follows:
> > > 
> > >   S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
> > >      `NBD_REPLY_MAGIC`)
> > > @@ -369,6 +398,16 @@ S: 64 bits, handle
> > >   S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
> > >       *error* is zero)
> > > 
> > > +If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> > > +the message looks like:
> > > +
> > > +S: 32 bits, 0x60d12fd6, magic (`NBD_SIMPLE_REPLY_EXT_MAGIC`)
> > > +S: 32 bits, error (MAY be zero)
> > > +S: 64 bits, handle
> > > +S: 128 bits, padding (MUST be zero)
> > > +S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
> > > +    *error* is zero)
> > > +
> > 
> > If we go this way, let's put payload length into padding: it will help to make the protocol context-independent and less error-prone.

Agreed.

> Easy enough to do (the payload length will be 0 except for
> NBD_CMD_READ).

Indeed.

> > Or, the otherway, may be just forbid the payload for simple-64bit ? What's the reason to allow 64bit requests without structured reply negotiation?
> 
> The two happened to be orthogonal enough in my implementation.  It was
> easy to demonstrate either one without the other, and it IS easier to
> write a client using non-structured replies (structured reads ARE
> tougher than simple reads, even if it is less efficient when it comes
> to reading zeros).  But you are also right that we could require
> structured reads prior to allowing 64-bit operations, and then have
> only one supported reply type on the wire when negotiated.  Wouter,
> which way do you prefer?

Given that I *still* haven't gotten around to implementing structured
replies for nbd-server, I'd prefer not to require it, but that's not
really a decent argument IMO :-)

[... I haven't read this in much detail yet, intend to do that later...]

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

