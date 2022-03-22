Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C4E4E4293
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 16:12:20 +0100 (CET)
Received: from localhost ([::1]:43422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWgBG-0000rt-HY
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 11:12:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWg9x-0008JC-Mt
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:10:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWg9u-0004mz-Eh
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647961853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=24vopU2nCxpNO0/WjXJ4JxhnGnriAqV7Xv6XhexP7q0=;
 b=L1lZD3ryZz/yPR2y2RaOswt6N8RBoOXA2iH5OmgDBTOCCUIH10P8XbgNt/EAGM26Q2pZVw
 9eDPWWjOtjiNoec70ZBJ1vryYAZDri3FW8xxJ9cOPGonYGOqOkx2XVSqdybaNzOV1fk497
 c9ay6J9OjAbj7Gt3jYzljFIyffUhCsI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-xiSBH1iNP0WuZtfQuI4ZHg-1; Tue, 22 Mar 2022 11:10:48 -0400
X-MC-Unique: xiSBH1iNP0WuZtfQuI4ZHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 124A380159B;
 Tue, 22 Mar 2022 15:10:48 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2071112132C;
 Tue, 22 Mar 2022 15:10:40 +0000 (UTC)
Date: Tue, 22 Mar 2022 10:10:38 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <20220322151038.hjfcvhdxbfy5jjid@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
 <f05c680a-73c3-b0d2-dbdf-c0bcf1ca3530@virtuozzo.com>
 <20211206230047.q5xc5enodbicf3gw@redhat.com>
 <Ya+IXzVAfS98M0dq@pc181009.grep.be>
MIME-Version: 1.0
In-Reply-To: <Ya+IXzVAfS98M0dq@pc181009.grep.be>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, nbd@other.debian.org,
 nsoffer@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 07, 2021 at 06:14:23PM +0200, Wouter Verhelst wrote:
> On Mon, Dec 06, 2021 at 05:00:47PM -0600, Eric Blake wrote:
> > On Mon, Dec 06, 2021 at 02:40:45PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > >   #### Simple reply message
> > > > 
> > > >   The simple reply message MUST be sent by the server in response to all
> > > >   requests if structured replies have not been negotiated using
> > > > -`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been negotiated, a simple
> > > > -reply MAY be used as a reply to any request other than `NBD_CMD_READ`,
> > > > -but only if the reply has no data payload.  The message looks as
> > > > -follows:
> > > > +`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been
> > > > +negotiated, a simple reply MAY be used as a reply to any request other
> > > > +than `NBD_CMD_READ`, but only if the reply has no data payload.  If
> > > > +extended headers were not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> > > > +the message looks as follows:
> > > > 
> > > >   S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
> > > >      `NBD_REPLY_MAGIC`)
> > > > @@ -369,6 +398,16 @@ S: 64 bits, handle
> > > >   S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
> > > >       *error* is zero)
> > > > 
> > > > +If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> > > > +the message looks like:
> > > > +
> > > > +S: 32 bits, 0x60d12fd6, magic (`NBD_SIMPLE_REPLY_EXT_MAGIC`)
> > > > +S: 32 bits, error (MAY be zero)
> > > > +S: 64 bits, handle
> > > > +S: 128 bits, padding (MUST be zero)
> > > > +S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
> > > > +    *error* is zero)
> > > > +
> > > 
> > > If we go this way, let's put payload length into padding: it will help to make the protocol context-independent and less error-prone.
> 
> Agreed.
> 
> > Easy enough to do (the payload length will be 0 except for
> > NBD_CMD_READ).
> 
> Indeed.
> 
> > > Or, the otherway, may be just forbid the payload for simple-64bit ? What's the reason to allow 64bit requests without structured reply negotiation?
> > 
> > The two happened to be orthogonal enough in my implementation.  It was
> > easy to demonstrate either one without the other, and it IS easier to
> > write a client using non-structured replies (structured reads ARE
> > tougher than simple reads, even if it is less efficient when it comes
> > to reading zeros).  But you are also right that we could require
> > structured reads prior to allowing 64-bit operations, and then have
> > only one supported reply type on the wire when negotiated.  Wouter,
> > which way do you prefer?
> 
> Given that I *still* haven't gotten around to implementing structured
> replies for nbd-server, I'd prefer not to require it, but that's not
> really a decent argument IMO :-)
> 
> [... I haven't read this in much detail yet, intend to do that later...]

Ping - any other responses on this thread, before I start working on
version 2 of the cross-project patches?

And repeating a comment from my original cover letter:

> with 64-bit commands, we may want to also make it easier to let
> servers advertise an actual maximum size they are willing to accept
> for the commands in question (for example, a server may be happy with
> a full 64-bit block status, but still want to limit non-fast zero and
> cache to a smaller limit to avoid denial of service).

Is it worth enhancing NBD_OPT_INFO in my v2?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


