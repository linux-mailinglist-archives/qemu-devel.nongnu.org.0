Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA0EAE42F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 09:02:32 +0200 (CEST)
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7aAZ-0006Xj-OZ
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 03:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43244)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i7a8l-00061B-UZ
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 03:00:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i7a8b-00008J-7x
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 03:00:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40680)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i7a8b-00007p-0x
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 03:00:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 31AA418C427D;
 Tue, 10 Sep 2019 07:00:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E55456092F;
 Tue, 10 Sep 2019 07:00:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2AB6246B2; Tue, 10 Sep 2019 09:00:26 +0200 (CEST)
Date: Tue, 10 Sep 2019 09:00:26 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Message-ID: <20190910070026.v2abijefl3pi5ic7@sirius.home.kraxel.org>
References: <cover.1566847960.git.DirtY.iCE.hu@gmail.com>
 <43076a2afeb0439b607b0631e0bfff77d55bc0cc.1566847960.git.DirtY.iCE.hu@gmail.com>
 <20190827054223.nuiz7fz27tld3hpt@sirius.home.kraxel.org>
 <2fdc616c-0690-a898-0247-765f90153903@gmail.com>
 <20190828095308.GE2991@redhat.com>
 <6a1f7b1dc372abfbbf8efaa7d0ce9c7db1881849.camel@redhat.com>
 <20190828102603.GG2991@redhat.com>
 <ae12796c51767489970f1040d3d86230f01ec79d.camel@redhat.com>
 <5e06cdb9-3215-361f-9a12-9b0f9024dda9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e06cdb9-3215-361f-9a12-9b0f9024dda9@gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 10 Sep 2019 07:00:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 4/4] audio: paaudio: ability to specify
 stream name
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
Cc: qemu-devel@nongnu.org,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Ping.
> 
> If I understand the situation correctly, the current consensus is:
> 
> * use VM name for PA server connection

Yes (most important one IMHO).

> * audiodev id is a good default for PA stream name

Yes.

> What is not clear whether we need a separate qapi option for stream name, or
> just always use the audiodev id.  I don't use pulseaudio or libvirt, so I
> can't really comment about this issue.

No clear consensus.  I'd suggest to just ignore that for now,
or make it a separate patch.

cheers,
  Gerd


