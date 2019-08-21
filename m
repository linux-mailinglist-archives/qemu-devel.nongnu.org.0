Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCEA97591
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 11:05:06 +0200 (CEST)
Received: from localhost ([::1]:45862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0MYD-0000Gw-3N
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 05:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i0MRe-00016c-CF
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:58:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i0MRd-0006SO-GU
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:58:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50756)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i0MRd-0006SD-BI
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 04:58:17 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AFEC2307D88D;
 Wed, 21 Aug 2019 08:58:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75F581FD3A;
 Wed, 21 Aug 2019 08:58:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5FF6816E1A; Wed, 21 Aug 2019 10:58:15 +0200 (CEST)
Date: Wed, 21 Aug 2019 10:58:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20190821085815.4qhuoal222wqoujz@sirius.home.kraxel.org>
References: <cover.1565558093.git.balaton@eik.bme.hu>
 <b2df13655feecd63c0049ec45fd87d1026f67091.1565558093.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2df13655feecd63c0049ec45fd87d1026f67091.1565558093.git.balaton@eik.bme.hu>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 21 Aug 2019 08:58:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/7] ati-vga: Add registers for getting
 apertures
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

On Sun, Aug 11, 2019 at 11:14:53PM +0200, BALATON Zoltan wrote:
> Some drivers (e.g. Linux radeon drm and MacOS) access these to find
> apertures to access card. Try to implement these but not sure these
> are correct yet.

Queued up patch series.

thanks,
  Gerd


