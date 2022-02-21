Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A33B4BD784
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 09:24:23 +0100 (CET)
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM3zZ-0006Ob-Qp
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 03:24:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nM3wZ-0004BS-Vv
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 03:21:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nM3wY-0006cw-Ii
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 03:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645431673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EoV0B70IiSEnQzh26yYKCQLeYv9NQLGH4TNmuQ108TI=;
 b=d87JdyVXgwCyq/S7mgYF+bg+Zw3aVOZww8D12NKCD/G2AkptSIprgDKKArbCa9dwGrUB1D
 ndlJGW8L8Th0mDziUwGYmpSu4W8i02ZcI10I60ej4B4kj8Cfhf6zRBR/iMLes4dM01xwkQ
 c2EJI88JAOI/6MTTb1vOZBswepuYe5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-hxTYxUzKO4G93s1J-PqufQ-1; Mon, 21 Feb 2022 03:21:12 -0500
X-MC-Unique: hxTYxUzKO4G93s1J-PqufQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69BD91475C
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 08:21:11 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10B4A7B6C6;
 Mon, 21 Feb 2022 08:21:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] linux-headers: update to 5.17
In-Reply-To: <20220217102753.42951-1-pbonzini@redhat.com>
Organization: Red Hat GmbH
References: <20220217102753.42951-1-pbonzini@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Mon, 21 Feb 2022 09:21:09 +0100
Message-ID: <87wnho7hqi.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Thu, Feb 17 2022, Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/standard-headers/asm-x86/kvm_para.h   |   1 +
>  include/standard-headers/drm/drm_fourcc.h     |  11 ++
>  include/standard-headers/linux/ethtool.h      |   1 +
>  include/standard-headers/linux/fuse.h         |  60 +++++++-
>  include/standard-headers/linux/pci_regs.h     | 142 +++++++++---------
>  include/standard-headers/linux/virtio_iommu.h |   8 +-
>  linux-headers/asm-generic/unistd.h            |   5 +-
>  linux-headers/asm-mips/unistd_n32.h           |   2 +
>  linux-headers/asm-mips/unistd_n64.h           |   2 +
>  linux-headers/asm-mips/unistd_o32.h           |   2 +
>  linux-headers/asm-powerpc/unistd_32.h         |   2 +
>  linux-headers/asm-powerpc/unistd_64.h         |   2 +
>  linux-headers/asm-s390/unistd_32.h            |   2 +
>  linux-headers/asm-s390/unistd_64.h            |   2 +
>  linux-headers/asm-x86/kvm.h                   |  19 ++-
>  linux-headers/asm-x86/unistd_32.h             |   1 +
>  linux-headers/asm-x86/unistd_64.h             |   1 +
>  linux-headers/asm-x86/unistd_x32.h            |   1 +
>  linux-headers/linux/kvm.h                     |  18 +++
>  19 files changed, 206 insertions(+), 76 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>


