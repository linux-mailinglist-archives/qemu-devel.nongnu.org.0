Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE655DF88
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 10:16:19 +0200 (CEST)
Received: from localhost ([::1]:33566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiaR7-0000k5-W6
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 04:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44589)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hiaPf-0000Cf-Op
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:14:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hiaPe-0001hR-Sy
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:14:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47494)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1hiaPe-0001dR-Ls
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:14:46 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 370623082141;
 Wed,  3 Jul 2019 08:14:45 +0000 (UTC)
Received: from gondolin (dhcp-192-192.str.redhat.com [10.33.192.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E91FE18B39;
 Wed,  3 Jul 2019 08:14:40 +0000 (UTC)
Date: Wed, 3 Jul 2019 10:14:38 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190703101438.49f9b6c0.cohuck@redhat.com>
In-Reply-To: <20190702171816.11939-1-eric.auger@redhat.com>
References: <20190702171816.11939-1-eric.auger@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 03 Jul 2019 08:14:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] vfio/pci: Trace vfio_set_irq_signaling()
 failure in vfio_msix_vector_release()
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
Cc: peter.maydell@linaro.org, alex.williamson@redhat.com, qemu-devel@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  2 Jul 2019 19:18:16 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Report an error in case we fail to set a trigger action
> on any VFIO_PCI_MSIX_IRQ_INDEX subindex. This might be
> useful in debugging a device that is not working properly.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/vfio/pci.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

