Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 377D9FB494
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 17:03:30 +0100 (CET)
Received: from localhost ([::1]:46830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUv7A-0002O5-BZ
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 11:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iUv4m-0000zZ-0T
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 11:01:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iUv4k-0007pr-Jq
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 11:00:59 -0500
Received: from 10.mo68.mail-out.ovh.net ([46.105.79.203]:48723)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iUv4k-0007pJ-De
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 11:00:58 -0500
Received: from player750.ha.ovh.net (unknown [10.108.57.95])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id BCB10147AF1
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2019 17:00:55 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 2FBB9C0B6FF6;
 Wed, 13 Nov 2019 16:00:43 +0000 (UTC)
Date: Wed, 13 Nov 2019 17:00:40 +0100
From: Greg Kurz <groug@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] spapr/kvm: Set default cpu model for all machine classes
Message-ID: <20191113170040.7c62fcaf@bahia.lan>
In-Reply-To: <CAFEAcA9+VzDC9N5vGcA9COUaPsSue9VWmtoaPneCqY7drtbVzA@mail.gmail.com>
References: <20191030163243.10644-1-david@gibson.dropbear.id.au>
 <20191113144344.GA4204@orkuz.int.mamuti.net>
 <20191113160900.5f9f5415@bahia.lan>
 <CAFEAcA9+VzDC9N5vGcA9COUaPsSue9VWmtoaPneCqY7drtbVzA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2933813686143588625
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudefuddgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehtddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.79.203
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
Cc: Laurent Vivier <lvivier@redhat.com>, David Hildenbrand <david@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Jiri Denemark <jdenemar@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Nov 2019 15:31:58 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 13 Nov 2019 at 15:10, Greg Kurz <groug@kaod.org> wrote:
> > David is away until the 19th of November, which is the release date
> > of rc2 according to the planning [*]. Then we have rc3 the 26th, and
> > final release (or rc4) the 3rd of December, so it should be ok.
> 
> Please don't actively plan to delay putting changes in
> until later release candidates. The release process
> involves steadily winding up the bar of whether it's
> worth putting in and hopefully reducing the volume
> of changes between rcs. In an ideal world rc3 would
> have very few changes, and then there would be no
> changes at all between rc3 and the final release.
> 

Right. I could discuss with Laurent: David should be back on Monday
actually. Hopefully he can a send a PR before rc2.

> thanks
> -- PMM
> 


