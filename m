Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F35B4B0482
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 21:19:25 +0200 (CEST)
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i889F-0005Zb-3v
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 15:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57180)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1i888K-00056Z-Sl
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:18:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1i888J-0004O5-Eb
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:18:28 -0400
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:36534
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1i888J-0004MW-78
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:18:27 -0400
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <johannes@sipsolutions.net>)
 id 1i888F-0008NC-FI; Wed, 11 Sep 2019 21:18:23 +0200
Message-ID: <24d6940040c4f846eaba2154979fd6658b665c98.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Wed, 11 Sep 2019 21:18:20 +0200
In-Reply-To: <20190911191514.GA2895@work-vm>
References: <20190911134539.25650-1-johannes@sipsolutions.net>
 <20190911134539.25650-2-johannes@sipsolutions.net>
 <20190911191514.GA2895@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:191:4433::2
Subject: Re: [Qemu-devel] [RFC v2 1/2] docs: vhost-user: add in-band
 kick/call messages
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
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2019-09-11 at 20:15 +0100, Dr. David Alan Gilbert wrote:

> > Extend the protocol slightly, so that a message can be used for kick
> > and call instead, if VHOST_USER_PROTOCOL_F_IN_BAND_NOTIFICATIONS is
> > negotiated. This in itself doesn't guarantee synchronisation, but both
> > sides can also negotiate VHOST_USER_PROTOCOL_F_REPLY_ACK and thus get
> > a reply to this message by setting the need_reply flag, and ensure
> > synchronisation this way.
> 
> I'm confused; if you've already got REPLY_ACK, why do we need anything
> else?  We already require the reply on set_mem_table as part of
> postcopy.

Hmm? How's this related to set_mem_table?

For simulation purposes, I need the kick and call (and error perhaps
though it's not really used by anyone now it seems) to be synchronous
messages instead of asynchronous event FD pushes.

But I think enough words have been expended on explaining it already, if
I may kindly ask you to read the discussions with Stefan and Michael
here:

https://lore.kernel.org/qemu-devel/20190902121233.13382-1-johannes@sipsolutions.net/

Thanks,
johannes


