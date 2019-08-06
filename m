Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1557832EF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 15:40:31 +0200 (CEST)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huzhW-0004n6-Vb
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 09:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59976)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1huzh4-0004IC-3z
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:40:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1huzh3-0003Cp-4m
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:40:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55804)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1huzh2-0003CO-VT
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:40:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2548889C34;
 Tue,  6 Aug 2019 13:40:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87EBD5C1D8;
 Tue,  6 Aug 2019 13:39:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7ED9B17446; Tue,  6 Aug 2019 15:39:52 +0200 (CEST)
Date: Tue, 6 Aug 2019 15:39:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190806133952.vcgjaz6zx27b25u6@sirius.home.kraxel.org>
References: <20190806115819.16026-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806115819.16026-1-cohuck@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 06 Aug 2019 13:40:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.1?] compat: disable edid on
 virtio-gpu base device
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
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 06, 2019 at 01:58:19PM +0200, Cornelia Huck wrote:
> 'edid' is a property of the virtio-gpu base device, so turning
> it off on virtio-gpu-pci is not enough (it misses -ccw). Turn
> it off on the base device instead.
> 
> Fixes: 0a71966253c8 ("edid: flip the default to enabled")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

> Only just noticed this... should we still shove this into 4.1?
> Or do we need a compat 4.1.1 dance for this?

I'd say 4.1, doing it in 4.1.1 becomes too messy.

Peter, can you apply this directly, or do you want
a single-patch-pull-req instead?

cheers,
  Gerd


