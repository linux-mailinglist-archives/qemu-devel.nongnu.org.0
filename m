Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD965CBF4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 10:21:27 +0200 (CEST)
Received: from localhost ([::1]:50568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiE2Y-0000CM-Qg
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 04:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52641)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hiE0h-0007VF-Ok
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 04:19:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hiE0f-00051G-RF
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 04:19:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55458)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hiE0f-0004zB-Ku
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 04:19:29 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 91C793DE0E;
 Tue,  2 Jul 2019 08:19:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED3445C296;
 Tue,  2 Jul 2019 08:19:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2915E16E05; Tue,  2 Jul 2019 10:19:10 +0200 (CEST)
Date: Tue, 2 Jul 2019 10:19:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190702081910.e35g4aawxp3ofhy6@sirius.home.kraxel.org>
References: <20190628115349.60293-1-slp@redhat.com>
 <20190628115349.60293-3-slp@redhat.com>
 <20190628100145-mutt-send-email-mst@kernel.org>
 <87r27dwi1k.fsf@redhat.com>
 <20190630173354-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190630173354-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 02 Jul 2019 08:19:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/4] hw/virtio: Factorize virtio-mmio
 headers
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
Cc: pbonzini@redhat.com, rth@twiddle.net, qemu-devel@nongnu.org,
 Sergio Lopez <slp@redhat.com>, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > > I am not sure we want a new machine with 0.X mmio devices.
> > > Especially considering that virtio-mmio does not have support for
> > > transitional devices.
> > 
> > What are the practical implications of that?
> 
> On the plus side, this means we don't need to maintain a bunch of hacks
> for old guests with quirky drivers.

Also note that some newer virtio devices require virtio 1.0.

cheers,
  Gerd


