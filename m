Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5331858B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 08:49:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOcsJ-0000pL-FQ
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 02:49:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hOcrL-0000WA-Ao
	for qemu-devel@nongnu.org; Thu, 09 May 2019 02:48:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hOcrK-0003pl-HQ
	for qemu-devel@nongnu.org; Thu, 09 May 2019 02:48:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60640)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hOcrK-0003pO-CI
	for qemu-devel@nongnu.org; Thu, 09 May 2019 02:48:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC2F8309B172;
	Thu,  9 May 2019 06:48:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F86A5D717;
	Thu,  9 May 2019 06:48:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id AAC9E11AA3; Thu,  9 May 2019 08:48:48 +0200 (CEST)
Date: Thu, 9 May 2019 08:48:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Hou Qiming <hqm03ster@gmail.com>
Message-ID: <20190509064848.wjhchsfov7q6komj@sirius.home.kraxel.org>
References: <CABSdmrnNW6f=P64PviPP8CTJ5SVfYS8_6kmAtpw9yPObTEkpxg@mail.gmail.com>
	<CABSdmrnocrqLKWncgy_Lak33__GRPYfs-RzSA14e=vh4cRn2ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABSdmrnocrqLKWncgy_Lak33__GRPYfs-RzSA14e=vh4cRn2ag@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 09 May 2019 06:48:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] Multiple ramfb enhancements
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 09, 2019 at 08:15:44AM +0800, Hou Qiming wrote:
> Pulled back the `qemu_create_displaysurface_guestmem` function to create
> the display surface so that the guest memory gets properly unmaped.
> 
> Only allow one resolution change per guest boot, which prevents a
> crash when the guest writes garbage to the configuration space (e.g.
> when rebooting).
> 
> Write an initial resolution to the configuration space on guest reset,
> which a later BIOS / OVMF patch can take advantage of.

Looks all sensible, but can you split this into one patch per change
please?

thanks,
  Gerd


