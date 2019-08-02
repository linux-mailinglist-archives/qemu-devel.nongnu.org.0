Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85E97EFDC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 11:05:59 +0200 (CEST)
Received: from localhost ([::1]:32842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htTVf-0002hl-05
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 05:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48204)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jfreimann@redhat.com>) id 1htTUz-0001in-0l
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 05:05:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1htTUx-00035o-AJ
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 05:05:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47742)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1htTTF-0002Ip-7w
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 05:05:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 359923082137;
 Fri,  2 Aug 2019 09:03:28 +0000 (UTC)
Received: from localhost (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D8D85C219;
 Fri,  2 Aug 2019 09:03:20 +0000 (UTC)
Date: Fri, 2 Aug 2019 11:03:19 +0200
From: Jens Freimann <jfreimann@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Message-ID: <20190802090319.qja4f23xmrigzow7@jenstp.localdomain>
References: <20190802040606.22573-1-jasowang@redhat.com>
 <20190802040606.22573-3-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190802040606.22573-3-jasowang@redhat.com>
User-Agent: NeoMutt/20180716-1376-5d6ed1
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 02 Aug 2019 09:03:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V5 2/6] virtio: device/driverr area size
 calculation refactor for split ring
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
Cc: yang.zhong@intel.com, tiwei.bie@intel.com, mst@redhat.com,
 qemu-devel@nongnu.org, maxime.coquelin@redhat.com, Wei Xu <wexu@redhat.com>,
 weiyshay@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In subject s/driverr/driver


On Fri, Aug 02, 2019 at 12:06:02AM -0400, Jason Wang wrote:
>From: Wei Xu <wexu@redhat.com>
>
>There is slight size difference between split/packed rings.
>
>This is the refactor of split ring as well as a helper to expanding
>device and driver area size calculation for packed ring.
>
>Signed-off-by: Wei Xu <wexu@redhat.com>
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>---
> hw/virtio/virtio.c | 16 ++++++++++------
> 1 file changed, 10 insertions(+), 6 deletions(-)
>

Reviewed-by: Jens Freimann <jfreimann@redhat.com>



