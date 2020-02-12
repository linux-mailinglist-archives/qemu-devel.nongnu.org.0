Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E5A15A210
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 08:32:41 +0100 (CET)
Received: from localhost ([::1]:32972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1mVk-0006ea-PU
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 02:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55808)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1j1mRB-00057q-D6
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 02:27:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <w@uter.be>) id 1j1mRA-0004kk-EA
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 02:27:57 -0500
Received: from latin.grep.be ([2a01:4f8:140:52e5::2]:34962)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <w@uter.be>)
 id 1j1mRA-0004ZK-8V; Wed, 12 Feb 2020 02:27:56 -0500
Received: from [105.186.91.62] (helo=gangtai.home.grep.be)
 by latin.grep.be with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <w@uter.be>)
 id 1j1mQs-0003OD-RC; Wed, 12 Feb 2020 08:27:38 +0100
Received: from wouter by gangtai.home.grep.be with local (Exim 4.93)
 (envelope-from <w@uter.be>)
 id 1j1mQj-0006QW-NK; Wed, 12 Feb 2020 09:27:29 +0200
Date: Wed, 12 Feb 2020 09:27:29 +0200
From: Wouter Verhelst <w@uter.be>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: Cross-project NBD extension proposal: NBD_INFO_INIT_STATE
Message-ID: <20200212072729.GA22254@grep.be>
References: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
 <20200210221234.GH3888@redhat.com>
 <cc6e1e2e-d3a9-c498-354b-d382b5623ca0@redhat.com>
 <20200210225255.GJ3888@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210225255.GJ3888@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:140:52e5::2
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, "nbd@other.debian.org" <nbd@other.debian.org>,
 "libguestfs@redhat.com" <libguestfs@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Mon, Feb 10, 2020 at 10:52:55PM +0000, Richard W.M. Jones wrote:
> But anyway ... could a flag indicating that the whole image is sparse
> be useful, either as well as NBD_INIT_SPARSE or instead of it?  You
> could use it to avoid an initial disk trim, which is something that
> mke2fs does:

Yeah, I think that could definitely be useful. I honestly can't see a
use for NBD_INIT_SPARSE as defined in this proposal; and I don't think
it's generally useful to have a feature if we can't think of a use case
for it (that creates added complexity for no benefit).

If we can find a reasonable use case for NBD_INIT_SPARSE as defined in
this proposal, then just add a third bit (NBD_INIT_ALL_SPARSE or
something) that says "the whole image is sparse". Otherwise, I think we
should redefine NBD_INIT_SPARSE to say that.

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

