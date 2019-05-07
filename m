Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3515EAC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 09:57:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNuyZ-0008KH-B5
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 03:57:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNux2-0007bA-3r
	for qemu-devel@nongnu.org; Tue, 07 May 2019 03:55:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNux0-0006uR-WC
	for qemu-devel@nongnu.org; Tue, 07 May 2019 03:55:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hNux0-0006pR-8D
	for qemu-devel@nongnu.org; Tue, 07 May 2019 03:55:46 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AE2BC057F32;
	Tue,  7 May 2019 07:55:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D459D272DF;
	Tue,  7 May 2019 07:55:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id C378F11AA3; Tue,  7 May 2019 09:55:43 +0200 (CEST)
Date: Tue, 7 May 2019 09:55:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20190507075543.uyldd7bfaf7pmcnw@sirius.home.kraxel.org>
References: <20190409110732.5C5FF7465DB@zero.eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190409110732.5C5FF7465DB@zero.eik.bme.hu>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 07 May 2019 07:55:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] ati-vga: Fix check for blt outside vram
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
Cc: qemu-devel@nongnu.org, Andrew Randrianasulu <randrianasulu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 09, 2019 at 12:56:18PM +0200, BALATON Zoltan wrote:
> Fix the check preventing calling pixman functions that would access
> memory outside allocated vram. The r128 X driver sometimes seem to try
> blits that span outside vram, this check prevents crashing QEMU in
> that case. (The r128 X driver may have problems even on real hardware
> so I'm not sure if it's a client bug or emulation problem but at least
> QEMU should survive.)

Added to vga queue.

thanks,
  Gerd


