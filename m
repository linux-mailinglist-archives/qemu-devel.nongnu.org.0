Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6024D293
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 17:57:07 +0200 (CEST)
Received: from localhost ([::1]:49792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdzQw-0007Zk-KR
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 11:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54608)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hdzMY-0003zz-V7
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:52:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hdzMY-0004Vn-1E
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:52:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38002)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hdzMX-0004Ut-NV
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:52:33 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8F5B988319;
 Thu, 20 Jun 2019 15:52:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 526D860BE0;
 Thu, 20 Jun 2019 15:52:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7C37E17446; Thu, 20 Jun 2019 17:52:28 +0200 (CEST)
Date: Thu, 20 Jun 2019 17:52:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20190620155228.2nlxxrhdlw5n7wpn@sirius.home.kraxel.org>
References: <cover.1561028123.git.balaton@eik.bme.hu>
 <046ddebb7ec8db48c4e877ee444ec1c41e385a74.1561028123.git.balaton@eik.bme.hu>
 <20190620150923.gpe4rqn3qc54gcsn@sirius.home.kraxel.org>
 <alpine.BSF.2.21.9999.1906201729320.50442@zero.eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.BSF.2.21.9999.1906201729320.50442@zero.eik.bme.hu>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 20 Jun 2019 15:52:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 2/2] ati-vga: Implement DDC and EDID
 info from monitor
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > > +                addr <= GPIO_MONID + 2 && addr + size > GPIO_MONID + 2) {
> > 
> > Hmm, isn't this just "addr == GPIO_MONID + 2" ?
> 
> No because there could be all kinds of unalligned or multibyte access and we
> only want to trigger this when the byte with the enable bits are touched.
> (The MacOS NDRV accesses this 1 byte at a time so this is needed to avoid
> spurious i2c bit banging but other drivers write 4 bytes so then addr is not
> equal but covering above byte which is what this test allows.

Can you add a comment explaining this (no need to respin, incremental patch is fine)?

thanks,
  Gerd


