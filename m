Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE44819AE65
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 17:00:25 +0200 (CEST)
Received: from localhost ([::1]:33254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJequ-0005Qi-Pk
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 11:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38479)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kbusch@kernel.org>) id 1jJepw-0004eE-B9
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 10:59:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kbusch@kernel.org>) id 1jJepv-0002do-9m
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 10:59:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:60306)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kbusch@kernel.org>)
 id 1jJeps-0002Uz-O1; Wed, 01 Apr 2020 10:59:21 -0400
Received: from dhcp-10-100-145-180.wdl.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12312206F5;
 Wed,  1 Apr 2020 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585753158;
 bh=1XKO8iCLVx4LoWJGZNcFfMEw1ZUH8Pl9r+vip/nsK48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j9Ly6XalNQAuL14IJ91S/xYGXqiJL8qmJrdl8PpgUgzFK8jHJTR9Y4K+sKzOhTVqK
 Zwv4tHn6qA4tpcGjV4YncKKQRcvFdbvHv8eUQfnbBCRLyRfVB4YxDRWPu0E27D/uC/
 mqFc/D5oWwT+pjBcZUgDXx9IrQYTuyLnywaMcuts=
Date: Wed, 1 Apr 2020 07:59:16 -0700
From: Keith Busch <kbusch@kernel.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH v4] block/nvme: introduce PMR support from NVMe 1.4 spec
Message-ID: <20200401145916.GA1144965@dhcp-10-100-145-180.wdl.wdc.com>
References: <20200320215029.32727-1-andrzej.jakowski@linux.intel.com>
 <20200323132829.GJ261260@stefanha-x1.localdomain>
 <ce4e1dd3-1053-d487-0bc4-539174583b13@linux.intel.com>
 <20200401145005.GA4122@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401145005.GA4122@stefanha-x1.localdomain>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 198.145.29.99
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
Cc: kwolf@redhat.com, haozhong.zhang@intel.com, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, dgilbert@redhat.com,
 qemu-devel@nongnu.org, yi.z.zhang@linux.intel.com,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>, mreitz@redhat.com,
 junyan.he@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 01, 2020 at 03:50:05PM +0100, Stefan Hajnoczi wrote:
> On Tue, Mar 24, 2020 at 10:05:26AM -0700, Andrzej Jakowski wrote:
> > On 3/23/20 6:28 AM, Stefan Hajnoczi wrote:
> > > Excellent, thank you!
> > > 
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > 
> > Awesome, thx! Not sure about process...
> > Is this patch now staged for inclusion in QEMU?
> 
> Kevin or Max would normally merge it.
> 
> A review or ack from Keith Busch would be great, too.
> 
> Stefan

Yes, I reviewed this patch on this thread, and looks good to me:
https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg08816.html

