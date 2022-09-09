Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408DC5B35C3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 12:59:20 +0200 (CEST)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWbjD-0007Wv-3y
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 06:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oWbft-0005Yt-1D
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 06:55:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oWbfr-0004BZ-14
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 06:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662720950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HbOIvqjIYc94Pf9Vjelq1l/iflzdDGwG5iEFkV0PwNU=;
 b=US67DvS4U9f7e72GdrAxdmE3MsIzddZlwJHdZwWDZHtXQd94KNi2jRkwLgud1Nn8NqbssF
 rOo3QU2NDoQTsWzSooRlvdPeLRi2IxWwMMtYwY04brm0Hd8+cUOJrBJlxNcc95VVpaQjvr
 9kBqW88kitK46+tfwxntKdQlcQt4s1M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-AHleCrXGMi-UCY5NBdH0yw-1; Fri, 09 Sep 2022 06:55:49 -0400
X-MC-Unique: AHleCrXGMi-UCY5NBdH0yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B25CC811E76;
 Fri,  9 Sep 2022 10:55:48 +0000 (UTC)
Received: from localhost (unknown [10.39.193.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62537945D0;
 Fri,  9 Sep 2022 10:55:48 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, =?utf-8?Q?Daniel?=
 =?utf-8?Q?_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/2] Update linux headers to v6.0-rc4
In-Reply-To: <20220909035758.17434-3-chenyi.qiang@intel.com>
Organization: Red Hat GmbH
References: <20220909035758.17434-1-chenyi.qiang@intel.com>
 <20220909035758.17434-3-chenyi.qiang@intel.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 09 Sep 2022 12:55:46 +0200
Message-ID: <875yhwolzh.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 09 2022, Chenyi Qiang <chenyi.qiang@intel.com> wrote:

> commit 7e18e42e4b280c85b76967a9106a13ca61c16179
>
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
> ---
>  include/standard-headers/asm-x86/bootparam.h  |   7 +-
>  include/standard-headers/drm/drm_fourcc.h     |  73 +++++++-
>  include/standard-headers/linux/ethtool.h      |  29 +--
>  include/standard-headers/linux/input.h        |  12 +-
>  include/standard-headers/linux/pci_regs.h     |  30 ++-
>  include/standard-headers/linux/vhost_types.h  |  17 +-
>  include/standard-headers/linux/virtio_9p.h    |   2 +-
>  .../standard-headers/linux/virtio_config.h    |   7 +-
>  include/standard-headers/linux/virtio_ids.h   |  14 +-
>  include/standard-headers/linux/virtio_net.h   |  34 +++-
>  include/standard-headers/linux/virtio_pci.h   |   2 +
>  include/standard-headers/linux/virtio_ring.h  |  16 +-
>  linux-headers/asm-arm64/kvm.h                 |  33 +++-
>  linux-headers/asm-generic/unistd.h            |   4 +-
>  linux-headers/asm-riscv/kvm.h                 |  22 +++
>  linux-headers/asm-riscv/unistd.h              |   3 +-
>  linux-headers/asm-s390/kvm.h                  |   1 +
>  linux-headers/asm-x86/kvm.h                   |  33 ++--
>  linux-headers/asm-x86/mman.h                  |  14 --
>  linux-headers/linux/kvm.h                     | 172 +++++++++++++++++-
>  linux-headers/linux/userfaultfd.h             |  10 +-
>  linux-headers/linux/vduse.h                   |  47 +++++
>  linux-headers/linux/vfio.h                    |   4 +-
>  linux-headers/linux/vfio_zdev.h               |   7 +
>  linux-headers/linux/vhost.h                   |  35 +++-
>  25 files changed, 538 insertions(+), 90 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


