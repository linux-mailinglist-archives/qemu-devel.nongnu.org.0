Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49BB146230
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 08:01:03 +0100 (CET)
Received: from localhost ([::1]:51926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuWUA-0002eT-Mj
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 02:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iuWTE-0002A8-Br
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:00:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iuWTD-0005BD-9H
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:00:04 -0500
Received: from 5.mo68.mail-out.ovh.net ([46.105.62.179]:49971)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iuWTD-00057C-3E
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:00:03 -0500
Received: from player691.ha.ovh.net (unknown [10.108.57.23])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 8C58D158335
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 08:00:00 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id CB17EE9CC33D;
 Thu, 23 Jan 2020 06:59:57 +0000 (UTC)
Date: Thu, 23 Jan 2020 07:59:56 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v4 06/11] tests/virtio-9p: added splitted readdir test
Message-ID: <20200123075956.69c52d8a@bahia.lan>
In-Reply-To: <35106419.zRHx49BoVS@silver>
References: <cover.1579567019.git.qemu_oss@crudebyte.com>
 <f6394833fa66bf6a73d204db34302732a5f6b98a.1579567020.git.qemu_oss@crudebyte.com>
 <5dac4bf8-64aa-708e-d546-1eaea85bd792@redhat.com>
 <35106419.zRHx49BoVS@silver>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4931441593146579264
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrvddugdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeluddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.62.179
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

On Wed, 22 Jan 2020 22:29:12 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 22. Januar 2020 22:14:39 CET Eric Blake wrote:
> > On 1/20/20 6:16 PM, Christian Schoenebeck wrote:
> > > The previous, already existing readdir test simply used a 'count'
> > > parameter big enough to retrieve all directory entries with a
> > > single Treaddir request.
> > > 
> > > In this new 'splitted' readdir test, directory entries are
> > 
> > English is weird; the past tense of 'split' is 'split', not 'splitted'
> 

Heh.. My irregular verb detector module is a bit tired. I should
replace it ;-)

> Just an attempt to fix a language defect. You're right of course Eric.
> 
> Greg, should I resend that patch fixed or can you just awk it? Whatever is 
> more comfortable to you.
> 

Yeah, I'll fix this in my tree.

> Best regards,
> Christian Schoenebeck
> 
> 


