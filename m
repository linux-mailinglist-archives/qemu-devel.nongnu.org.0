Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFCCFB33A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 16:10:42 +0100 (CET)
Received: from localhost ([::1]:46240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUuI4-0001C2-Bn
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 10:10:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iUuGp-0000b4-Gy
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 10:09:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iUuGo-0001XI-6b
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 10:09:23 -0500
Received: from 1.mo69.mail-out.ovh.net ([178.33.251.173]:50776)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iUuGo-0001V0-02
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 10:09:22 -0500
Received: from player732.ha.ovh.net (unknown [10.109.159.69])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 132AA6D677
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2019 16:09:12 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player732.ha.ovh.net (Postfix) with ESMTPSA id 3CB85BF5D4FF;
 Wed, 13 Nov 2019 15:09:01 +0000 (UTC)
Date: Wed, 13 Nov 2019 16:09:00 +0100
From: Greg Kurz <groug@kaod.org>
To: Jiri Denemark <jdenemar@redhat.com>
Subject: Re: [PATCH] spapr/kvm: Set default cpu model for all machine classes
Message-ID: <20191113160900.5f9f5415@bahia.lan>
In-Reply-To: <20191113144344.GA4204@orkuz.int.mamuti.net>
References: <20191030163243.10644-1-david@gibson.dropbear.id.au>
 <20191113144344.GA4204@orkuz.int.mamuti.net>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2060396833202149643
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudefuddgjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehqvghmuhdrohhrghenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.251.173
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
Cc: Laurent Vivier <lvivier@redhat.com>, david@redhat.com,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Nov 2019 15:43:44 +0100
Jiri Denemark <jdenemar@redhat.com> wrote:

> Hi David.
> 
> On Wed, Oct 30, 2019 at 17:32:43 +0100, David Gibson wrote:
> > We have to set the default model of all machine classes, not just for the
> > active one. Otherwise, "query-machines" will indicate the wrong CPU model
> > ("qemu-s390x-cpu" instead of "host-s390x-cpu") as "default-cpu-type".
> > 
> > s390x already fixed this in de60a92e "s390x/kvm: Set default cpu model for
> > all machine classes".  This patch applies a similar fix for the pseries-*
> > machine types on ppc64.
> > 
> > Doing a
> >     {"execute":"query-machines"}
> > under KVM now results in
> >     {
> >       "hotpluggable-cpus": true,
> >       "name": "pseries-4.2",
> >       "numa-mem-supported": true,
> >       "default-cpu-type": "host-powerpc64-cpu",
> >       "is-default": true,
> >       "cpu-max": 1024,
> >       "deprecated": false,
> >       "alias": "pseries"
> >     },
> >     {
> >       "hotpluggable-cpus": true,
> >       "name": "pseries-4.1",
> >       "numa-mem-supported": true,
> >       "default-cpu-type": "host-powerpc64-cpu",
> >       "cpu-max": 1024,
> >       "deprecated": false
> >     },
> >     ...
> > 
> > Libvirt probes all machines via "-machine none,accel=kvm:tcg" and will
> > currently see the wrong CPU model under KVM.
> 
> Will this patch make it into 4.2.0?
> 

David is away until the 19th of November, which is the release date
of rc2 according to the planning [*]. Then we have rc3 the 26th, and
final release (or rc4) the 3rd of December, so it should be ok.

If David cannot make it for some reason, I guess Laurent Vivier or
myself can send a PR with this patch, as already suggested by David
in the past.

Cheers,

--
Greg

[*] https://wiki.qemu.org/Planning/4.2

> Jirka
> 
> 


