Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526F0BDA45
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 10:53:26 +0200 (CEST)
Received: from localhost ([::1]:47246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD337-0006pJ-8x
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 04:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56017)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iD31i-0006Mk-Ce
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 04:51:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iD31g-0000tw-Ku
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 04:51:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47162)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iD31g-0000tN-DW
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 04:51:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 93A572105;
 Wed, 25 Sep 2019 08:51:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C679460C5D;
 Wed, 25 Sep 2019 08:51:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C3D9F9D69; Wed, 25 Sep 2019 10:51:46 +0200 (CEST)
Date: Wed, 25 Sep 2019 10:51:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v4 7/8] docs/microvm.txt: document the new microvm
 machine type
Message-ID: <20190925085146.jqovhnpaeisr65f6@sirius.home.kraxel.org>
References: <20190924124433.96810-1-slp@redhat.com>
 <20190924124433.96810-8-slp@redhat.com>
 <20190925050629.lg5w6vvikxtgddy6@sirius.home.kraxel.org>
 <87impgsudj.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87impgsudj.fsf@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 25 Sep 2019 08:51:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: ehabkost@redhat.com, kvm@vger.kernel.org, mst@redhat.com, lersek@redhat.com,
 mtosatti@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> For microvm that's simply not worth it. Fiddling with the command line
> achieves the same result without any significant drawbacks,

Assuming you actually can fiddle with the command line, which is only
the case with direct kernel boot.

> > To fix that the firmware must be able to find the virtio-mmio devices.
> 
> No FW supports modern virtio-mmio transports anyway.

Well, we change that if we want ...

> And, from microvm's perspective, there's little incentive to change
> this situation, given that it's main use cases (serverless computing
> and VM-isolated containers) will run with an external kernel.

If direct kernel boot is the only use case microvm ever wants support,
then there is little reason to go the extra mile for optional seabios
support.

cheers,
  Gerd


