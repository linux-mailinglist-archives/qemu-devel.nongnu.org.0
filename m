Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875A644D5DA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:33:41 +0100 (CET)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8Kp-0003Ll-Cm
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:33:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ml8H9-0005c9-MZ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:29:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ml8H4-0005VJ-PZ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636630181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nU8ZF0q9VYvoSsZCPYzfVteG/oe9jQUieJRaQ/Vas5A=;
 b=WiYMXEVM2uy4ZVfJWv8SAGGVnpDs6mt2D/RQylOv1kKlGg5/g/5ikkz9ocf3mfExTjriMP
 +0Iwdx+AAF91kI6cBPKs09flt00AgZfYx9mrohRyLtqZBUDXRodsgymb4UNZutpXInrIc1
 KvnKnWAVcJVE6UuaCK1680idMuhkZlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-xUHqAkbbM1mzoGY3KYYQXQ-1; Thu, 11 Nov 2021 06:29:38 -0500
X-MC-Unique: xUHqAkbbM1mzoGY3KYYQXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B03B1180830B;
 Thu, 11 Nov 2021 11:29:37 +0000 (UTC)
Received: from localhost (unknown [10.39.195.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73EC960854;
 Thu, 11 Nov 2021 11:29:34 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/5] linux-headers: update to 5.16-rc1
In-Reply-To: <20211111110604.207376-3-pbonzini@redhat.com>
Organization: Red Hat GmbH
References: <20211111110604.207376-1-pbonzini@redhat.com>
 <20211111110604.207376-3-pbonzini@redhat.com>
User-Agent: Notmuch/0.33.1 (https://notmuchmail.org)
Date: Thu, 11 Nov 2021 12:29:32 +0100
Message-ID: <87mtmb7wwz.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, alex.bennee@linaro.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11 2021, Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/standard-headers/drm/drm_fourcc.h     | 121 +++++++++++++++++-
>  include/standard-headers/linux/ethtool.h      |  31 +++++
>  include/standard-headers/linux/fuse.h         |  10 +-
>  include/standard-headers/linux/pci_regs.h     |   6 +
>  include/standard-headers/linux/virtio_gpu.h   |  18 ++-
>  include/standard-headers/linux/virtio_ids.h   |  24 ++++
>  include/standard-headers/linux/virtio_vsock.h |   3 +-
>  linux-headers/asm-arm64/unistd.h              |   1 +
>  linux-headers/asm-generic/unistd.h            |  22 +++-
>  linux-headers/asm-mips/unistd_n32.h           |   1 +
>  linux-headers/asm-mips/unistd_n64.h           |   1 +
>  linux-headers/asm-mips/unistd_o32.h           |   1 +
>  linux-headers/asm-powerpc/unistd_32.h         |   1 +
>  linux-headers/asm-powerpc/unistd_64.h         |   1 +
>  linux-headers/asm-s390/unistd_32.h            |   1 +
>  linux-headers/asm-s390/unistd_64.h            |   1 +
>  linux-headers/asm-x86/kvm.h                   |   5 +
>  linux-headers/asm-x86/unistd_32.h             |   3 +
>  linux-headers/asm-x86/unistd_64.h             |   3 +
>  linux-headers/asm-x86/unistd_x32.h            |   3 +
>  linux-headers/linux/kvm.h                     |  40 +++++-
>  21 files changed, 276 insertions(+), 21 deletions(-)

LGTM.

Acked-by: Cornelia Huck <cohuck@redhat.com>


