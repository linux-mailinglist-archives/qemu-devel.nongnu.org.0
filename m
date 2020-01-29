Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9622514CADD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 13:30:14 +0100 (CET)
Received: from localhost ([::1]:45720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwmU1-0002bW-NC
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 07:30:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32790)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iwmSy-00029A-5X
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 07:29:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iwmSx-0004gy-6E
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 07:29:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31447
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iwmSx-0004gS-2i
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 07:29:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580300946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D6pDmYXo35nTvtnL6PMZ8gTak+ufVaorXRiG1stOEQ8=;
 b=dHcCc9ouNtHlNDQUbBFOQPXbjsUAf7Np7MFDMveV1NwQ1EJ4G6KEZ0mJhnclLviH6GEJMN
 jBCehvbM1LWYXIhc/fG1J8KJnEedBz6FxUGwzOO3wMIPjd8HAQRRawzDHxBT3P4GEeLcZe
 xV+7sir5sOdO7aazBECBspch6j+KrDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-db-xxJQnN2CgKUG7Yj58Qw-1; Wed, 29 Jan 2020 07:29:04 -0500
X-MC-Unique: db-xxJQnN2CgKUG7Yj58Qw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 829AB63ADB;
 Wed, 29 Jan 2020 12:29:02 +0000 (UTC)
Received: from gondolin (ovpn-116-225.ams2.redhat.com [10.36.116.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F67C5C545;
 Wed, 29 Jan 2020 12:28:44 +0000 (UTC)
Date: Wed, 29 Jan 2020 13:28:41 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [RFC v3 07/25] header file update VFIO/IOMMU vSVA APIs
Message-ID: <20200129132841.6900963f.cohuck@redhat.com>
In-Reply-To: <1580300216-86172-8-git-send-email-yi.l.liu@intel.com>
References: <1580300216-86172-1-git-send-email-yi.l.liu@intel.com>
 <1580300216-86172-8-git-send-email-yi.l.liu@intel.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kevin.tian@intel.com, Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Yi Sun <yi.y.sun@linux.intel.com>, kvm@vger.kernel.org, mst@redhat.com,
 jun.j.tian@intel.com, qemu-devel@nongnu.org, peterx@redhat.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, pbonzini@redhat.com,
 hao.wu@intel.com, yi.y.sun@intel.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Jan 2020 04:16:38 -0800
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> From: Liu Yi L <yi.l.liu@intel.com>
> 
> The kernel uapi/linux/iommu.h header file includes the
> extensions for vSVA support. e.g. bind gpasid, iommu
> fault report related user structures and etc.
> 
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Yi Sun <yi.y.sun@linux.intel.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> ---
>  linux-headers/linux/iommu.h | 372 ++++++++++++++++++++++++++++++++++++++++++++
>  linux-headers/linux/vfio.h  | 148 ++++++++++++++++++
>  2 files changed, 520 insertions(+)
>  create mode 100644 linux-headers/linux/iommu.h

Please add a note that this is to be replaced with a full headers
update, so that it doesn't get missed :)


