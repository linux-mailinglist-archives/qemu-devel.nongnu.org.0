Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2780193D24
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 11:43:09 +0100 (CET)
Received: from localhost ([::1]:49192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHPye-0003lQ-IQ
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 06:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jHPxv-0003Mv-Fy
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 06:42:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jHPxu-0007n0-50
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 06:42:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:47952)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jHPxu-0007mJ-1J
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 06:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585219340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SMOUI+bvAPqK1BfD7RNWCSWqgZw9IrmuuEDiPkLMo8o=;
 b=c1RV+JYkg+0DhQnTwAHziNKGo7EyHFAG2EkW9G/gwelhavv1m0xM9GnkPSs1ecYN0q2Yzh
 2TUndEV6HO4jp41g6Cnf0ifhHPZRmqmThNwsXDGOnsdOmpgA4xOVZdk0woftc79Bx8ULgZ
 qUKqQaTbWX4VDYs024e5vT0SVJw5Y4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-CBT80w8hODW5QOrUM5d4VQ-1; Thu, 26 Mar 2020 06:42:17 -0400
X-MC-Unique: CBT80w8hODW5QOrUM5d4VQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8059DB94;
 Thu, 26 Mar 2020 10:42:08 +0000 (UTC)
Received: from gondolin (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2E7B1001F43;
 Thu, 26 Mar 2020 10:41:53 +0000 (UTC)
Date: Thu, 26 Mar 2020 11:41:50 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v16 Kernel 1/7] vfio: KABI for migration interface for
 device state
Message-ID: <20200326114150.2b5430b9.cohuck@redhat.com>
In-Reply-To: <1585078359-20124-2-git-send-email-kwankhede@nvidia.com>
References: <1585078359-20124-1-git-send-email-kwankhede@nvidia.com>
 <1585078359-20124-2-git-send-email-kwankhede@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: kevin.tian@intel.com, yi.l.liu@intel.com, cjia@nvidia.com,
 kvm@vger.kernel.org, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, Zhengxiao.zx@Alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, dgilbert@redhat.com, zhi.a.wang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 alex.williamson@redhat.com, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, yan.y.zhao@intel.com, changpeng.liu@intel.com,
 Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Mar 2020 01:02:33 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> - Defined MIGRATION region type and sub-type.
> 
> - Defined vfio_device_migration_info structure which will be placed at the
>   0th offset of migration region to get/set VFIO device related
>   information. Defined members of structure and usage on read/write access.
> 
> - Defined device states and state transition details.
> 
> - Defined sequence to be followed while saving and resuming VFIO device.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> ---
>  include/uapi/linux/vfio.h | 228 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 228 insertions(+)

(...)

> +struct vfio_device_migration_info {
> +	__u32 device_state;         /* VFIO device state */
> +#define VFIO_DEVICE_STATE_STOP      (0)
> +#define VFIO_DEVICE_STATE_RUNNING   (1 << 0)
> +#define VFIO_DEVICE_STATE_SAVING    (1 << 1)
> +#define VFIO_DEVICE_STATE_RESUMING  (1 << 2)
> +#define VFIO_DEVICE_STATE_MASK      (VFIO_DEVICE_STATE_RUNNING | \
> +				     VFIO_DEVICE_STATE_SAVING |  \
> +				     VFIO_DEVICE_STATE_RESUMING)
> +
> +#define VFIO_DEVICE_STATE_VALID(state) \
> +	(state & VFIO_DEVICE_STATE_RESUMING ? \
> +	(state & VFIO_DEVICE_STATE_MASK) == VFIO_DEVICE_STATE_RESUMING : 1)
> +
> +#define VFIO_DEVICE_STATE_IS_ERROR(state) \
> +	((state & VFIO_DEVICE_STATE_MASK) == (VFIO_DEVICE_STATE_SAVING | \
> +					      VFIO_DEVICE_STATE_RESUMING))
> +
> +#define VFIO_DEVICE_STATE_SET_ERROR(state) \
> +	((state & ~VFIO_DEVICE_STATE_MASK) | VFIO_DEVICE_SATE_SAVING | \
> +					     VFIO_DEVICE_STATE_RESUMING)
> +
> +	__u32 reserved;
> +	__u64 pending_bytes;
> +	__u64 data_offset;
> +	__u64 data_size;
> +} __attribute__((packed));

The 'packed' should not even be needed, I think?

> +
>  /*
>   * The MSIX mappable capability informs that MSIX data of a BAR can be mmapped
>   * which allows direct access to non-MSIX registers which happened to be within

Generally, this looks sane to me; however, we should really have
something under Documentation/ in the long run that describes how this
works, so that you can find out about the protocol without having to
dig through headers.


