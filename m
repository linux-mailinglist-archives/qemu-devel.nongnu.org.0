Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ED1AEF05
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 17:53:33 +0200 (CEST)
Received: from localhost ([::1]:41614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7iSS-0001fd-5N
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 11:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1i7iRd-00013X-Nn
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 11:52:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1i7iRc-0001Vu-NT
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 11:52:41 -0400
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:56420
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1i7iRc-0001Tu-H3
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 11:52:40 -0400
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <johannes@sipsolutions.net>)
 id 1i7iRZ-0001bK-AG; Tue, 10 Sep 2019 17:52:37 +0200
Message-ID: <1f28c61e5caf6fc2a2125664043d1f7b9b769149.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: "Michael S. Tsirkin" <mst@redhat.com>
Date: Tue, 10 Sep 2019 17:52:36 +0200
In-Reply-To: <d2e750aaec396bd0aa7ea8c05ef5705567d16595.camel@sipsolutions.net>
References: <20190902121233.13382-1-johannes@sipsolutions.net>
 <20190906121350.29202-1-johannes@sipsolutions.net>
 <20190906102217-mutt-send-email-mst@kernel.org>
 <be405c3ba658cdac7f68c91213c3b714ac24c1e3.camel@sipsolutions.net>
 <20190906110340-mutt-send-email-mst@kernel.org>
 <fe0f3f7bfa730088454790dc2d863285c4461134.camel@sipsolutions.net>
 <20190908091207-mutt-send-email-mst@kernel.org>
 <8a9cf8a1726afce7fed8992a4f19fc808004ef88.camel@sipsolutions.net>
 <20190909083902-mutt-send-email-mst@kernel.org>
 <89f25546ffa71c799c533e50658a3a58e066f436.camel@sipsolutions.net>
 <20190909094609-mutt-send-email-mst@kernel.org>
 <d2e750aaec396bd0aa7ea8c05ef5705567d16595.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:191:4433::2
Subject: Re: [Qemu-devel] [RFC] libvhost-user: implement
 VHOST_USER_PROTOCOL_F_KICK_CALL_MSGS
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2019-09-09 at 15:50 +0200, Johannes Berg wrote:

> > We can document how to behave in case of inconsistent protocol features,
> > yes.
> 
> OK.

Coming back to this, I was just looking at it.

How/where would you like to see this done?

There isn't really any section that lists and explains the various
protocol features, there's only a list. I could add a new section for
"Simulation" or something like that that explains it, but then most
people would probably skip that and not ever read the text about how you
shouldn't implement F_KICK_CALL_MSGS :-)

Any thoughts?

johannes


