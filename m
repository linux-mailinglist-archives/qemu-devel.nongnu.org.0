Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236941F8DFC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 08:40:31 +0200 (CEST)
Received: from localhost ([::1]:58778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkinG-0007FT-8A
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 02:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jkilu-0006Tv-Hi
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 02:39:06 -0400
Received: from 13.mo3.mail-out.ovh.net ([188.165.33.202]:33053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jkils-00055u-LN
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 02:39:06 -0400
Received: from player789.ha.ovh.net (unknown [10.110.103.18])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 58CE22592DB
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 08:38:54 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id 4707A136379BC;
 Mon, 15 Jun 2020 06:38:36 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0023cd0aa35-8cad-4a04-9371-86d222787d89,F1BB0E26B38E3581C3F8E07DA172D6E56B46BED4)
 smtp.auth=groug@kaod.org
Date: Mon, 15 Jun 2020 08:38:35 +0200
From: Greg Kurz <groug@kaod.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v10 1/9] error: auto propagated local_err
Message-ID: <20200615083835.54e3fcb1@bahia.lan>
In-Reply-To: <877dw8dhvk.fsf@dusky.pond.sub.org>
References: <20200317151625.20797-1-vsementsov@virtuozzo.com>
 <20200317151625.20797-2-vsementsov@virtuozzo.com>
 <20200610163921.28d824aa@bahia.lan>
 <877dw8dhvk.fsf@dusky.pond.sub.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1692509037167942030
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudeijedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehkefhtdehgeehheejledufeekhfdvleefvdeihefhkefhudffhfeuuedvffdthfenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.33.202; envelope-from=groug@kaod.org;
 helo=13.mo3.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 02:38:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Jun 2020 07:21:03 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Greg Kurz <groug@kaod.org> writes:
> 
> > On Tue, 17 Mar 2020 18:16:17 +0300
> > Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> >
> >> Introduce a new ERRP_AUTO_PROPAGATE macro, to be used at start of
> >> functions with an errp OUT parameter.
> >> 
> >> It has three goals:
> >> 
> >> 1. Fix issue with error_fatal and error_prepend/error_append_hint: user
> >> can't see this additional information, because exit() happens in
> >> error_setg earlier than information is added. [Reported by Greg Kurz]
> >> 
> >
> > I have more of these coming and I'd really like to use ERRP_AUTO_PROPAGATE.
> >
> > It seems we have a consensus on the macro itself but this series is gated
> > by the conversion of the existing code base.
> >
> > What about merging this patch separately so that people can start using
> > it at least ?
> 
> Please give me a few more days to finish the work I feel should go in
> before the conversion.  With any luck, Vladimir can then rebase /
> recreate the conversion easily, and you can finally use the macro for
> your own work.
> 

Sure. Thanks.

