Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3EA8D2C8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 14:14:48 +0200 (CEST)
Received: from localhost ([::1]:59968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxsAx-0007lp-QH
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 08:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1hxs9I-00077m-4g
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 08:13:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hxs9H-0000fV-9U
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 08:13:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57388)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hxs9H-0000fC-4V
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 08:13:03 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B9390923AB;
 Wed, 14 Aug 2019 12:13:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76FFA806A7;
 Wed, 14 Aug 2019 12:13:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9214117444; Wed, 14 Aug 2019 14:13:00 +0200 (CEST)
Date: Wed, 14 Aug 2019 14:13:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: hikarupsp@gmail.com
Message-ID: <20190814121300.jft2mepwxydfxf5s@sirius.home.kraxel.org>
References: <20190720060427.50457-1-hikarupsp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190720060427.50457-1-hikarupsp@gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 14 Aug 2019 12:13:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] xhci: Add No Op Command
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

On Sat, Jul 20, 2019 at 03:04:27PM +0900, hikarupsp@gmail.com wrote:
> From: Hikaru Nishida <hikarupsp@gmail.com>
> 
> This commit adds No Op Command (23) to xHC for verifying the operation
> of the Command Ring mechanisms.
> No Op Command is defined in XHCI spec (4.6.2) and just reports Command
> Completion Event with Completion Code == Success.
> Before this commit, No Op Command is not implemented so xHC reports
> Command Completion Event with Completion Code == TRB Error. This commit
> fixes this behaviour to report Completion Code correctly.
> 
> Signed-off-by: Hikaru Nishida <hikarupsp@gmail.com>

Added to usb patch queue.

thanks,
  Gerd


