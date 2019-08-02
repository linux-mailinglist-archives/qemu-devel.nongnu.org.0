Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6F67EFDD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 11:06:43 +0200 (CEST)
Received: from localhost ([::1]:32852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htTWM-0003z8-T6
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 05:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48251)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jfreimann@redhat.com>) id 1htTV0-0001j2-27
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 05:05:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1htTUx-00036d-JG
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 05:05:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60198)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1htTTl-0002Tc-Qu
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 05:05:15 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 27999F0AA0;
 Fri,  2 Aug 2019 09:04:01 +0000 (UTC)
Received: from localhost (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B1DF600C8;
 Fri,  2 Aug 2019 09:03:55 +0000 (UTC)
Date: Fri, 2 Aug 2019 11:03:54 +0200
From: Jens Freimann <jfreimann@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Message-ID: <20190802090354.vcfuexpffyzvlqxr@jenstp.localdomain>
References: <20190802040606.22573-1-jasowang@redhat.com>
 <20190802040606.22573-6-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190802040606.22573-6-jasowang@redhat.com>
User-Agent: NeoMutt/20180716-1376-5d6ed1
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 02 Aug 2019 09:04:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V5 5/6] vhost_net: enable packed ring
 support
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
 qemu-devel@nongnu.org, maxime.coquelin@redhat.com, weiyshay@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 02, 2019 at 12:06:05AM -0400, Jason Wang wrote:
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>---
> hw/net/vhost_net.c | 2 ++
> 1 file changed, 2 insertions(+)
>

Reviewed-by: Jens Freimann <jfreimann@redhat.com>



