Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E17D132A68
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:49:10 +0100 (CET)
Received: from localhost ([::1]:51870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ior6T-0002jW-4k
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42315)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ioqnP-0006Dt-C8
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:29:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ioqnO-0002sx-Ah
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:29:27 -0500
Received: from 1.mo7.mail-out.ovh.net ([178.33.45.51]:32911)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ioqnO-0002rb-4K
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:29:26 -0500
Received: from player158.ha.ovh.net (unknown [10.109.143.79])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 71110149D78
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 16:29:23 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: groug@kaod.org)
 by player158.ha.ovh.net (Postfix) with ESMTPSA id 806F8DEBA489;
 Tue,  7 Jan 2020 15:29:21 +0000 (UTC)
Date: Tue, 7 Jan 2020 16:29:19 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 5/9] tests/virtio-9p: check file names of R_readdir
 response
Message-ID: <20200107162919.74ec92d1@bahia.lan>
In-Reply-To: <2640807.KD2hu4yizk@silver>
References: <cover.1576678644.git.qemu_oss@crudebyte.com>
 <2a40095340d9536575af8fd214a7ac647b4603c9.1576678644.git.qemu_oss@crudebyte.com>
 <20200106180711.3a665d11@bahia.lan> <2640807.KD2hu4yizk@silver>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11804779049658194240
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehgedgvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.45.51
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

On Tue, 07 Jan 2020 13:28:38 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 6. Januar 2020 18:07:11 CET Greg Kurz wrote:
> > On Wed, 18 Dec 2019 14:35:56 +0100
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > Additionally to the already existing check for expected amount
> > > of directory entries returned by R_readdir response, also check
> > > whether all directory entries have the expected file names (as
> > > created on 9pfs synth driver side), ignoring their precise order
> > > in result list though.
> > > 
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > 
> > LGTM and trivial enough that it can be folded in the previous
> > patch.
> 
> So you want that patch to be squashed. Np.
> 

Yes. Thanks.

> Best regards,
> Christian Schoenebeck
> 
> 


