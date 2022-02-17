Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B04BA72D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:33:59 +0100 (CET)
Received: from localhost ([::1]:41468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKkfG-0004Tj-GC
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:33:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKkY6-000524-Uu
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:26:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKkY5-0003yo-10
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645118792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HjuqpVf/Iw3bMxUfmRnvXi5Vt1xaYkbXAvH3yQ4X0Lk=;
 b=bL9+/q2B6pypWHEa5zBTE1kF5IInsvFqwOttShunKf844pSuvf25nPqtVrdCNY1DLo9sxR
 t40v9JWStYWl/wTcKC416P4IQPQ/JBWj4bdWs38fW8FPToXKTEX54N+rTEsPwe/yTIB6M1
 FiClVC9F6k6gTbAft40DCKasHpxtLGE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-YG_FLGTMM-KzgM7kDZg_WA-1; Thu, 17 Feb 2022 12:26:31 -0500
X-MC-Unique: YG_FLGTMM-KzgM7kDZg_WA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k30-20020a05600c1c9e00b0037d1bee4847so4525509wms.9
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 09:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HjuqpVf/Iw3bMxUfmRnvXi5Vt1xaYkbXAvH3yQ4X0Lk=;
 b=UwVgzN39bSw0y20BG9ySzBDSP+gdCDPjhyiwo/Hv1qKCwJopfLkSgYrGyNCkUTMIRZ
 aZnvT02li6aBd/RD7oXqrO7AMJpVa2iLmLj0RD/AQ/FupZ9uiZE8V9hD+Ck2mEQzJOkj
 /esAt9kiDNBZ5wzi5tNVx8hyqAYOoIV/LzemO5re75H6qbxj50F4rZ9CKZE3kF0duLlQ
 X+sA+iR/jfRUhVMQfbwArgAZQXmSQyMqpW0fFJBVvje+G/WMyZcp6XzA70bdnNTJ4ocK
 Rq3/U3YSQzndDV+qmIX9FcyYc/OI0q1fEE418BC/307iyMI6dpsFvN9AfLRYJ9iAZv35
 zA/g==
X-Gm-Message-State: AOAM530z5boOpbJkB6vPFd1usivHieA1n6dOD27XL1aUtwyuwfoh7IvV
 rDPr91UfYE5oX5qC8arm1wGMNNR2xaptP6NJVngGNwbfqv+DoB9GoY8mWvLRMP4rtmpu8x2BdPO
 Dq8sI4EfjC2V0ISYf1R+ij6ajwyON7w33oJrZOxKDYZ09mD3y+qxZlSmSjMQZbC3H+MA=
X-Received: by 2002:a05:6000:1b02:b0:1e6:80c4:effa with SMTP id
 f2-20020a0560001b0200b001e680c4effamr3134175wrz.646.1645118789735; 
 Thu, 17 Feb 2022 09:26:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzRTjXRR8qnvjZTN1HxIdVX1732G2Y5IhgNR7Nl82u82qGgnQHyXbuNWVNkI2VL/hpaTXqpw==
X-Received: by 2002:a05:6000:1b02:b0:1e6:80c4:effa with SMTP id
 f2-20020a0560001b0200b001e680c4effamr3134156wrz.646.1645118789436; 
 Thu, 17 Feb 2022 09:26:29 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id h6sm2161158wmq.8.2022.02.17.09.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 09:26:28 -0800 (PST)
Date: Thu, 17 Feb 2022 17:26:26 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, groug@kaod.org,
 sebastian.hasler@stuvus.uni-stuttgart.de
Subject: Re: [Virtio-fs] [PULL 00/12] virtiofs queue
Message-ID: <Yg6FQuL4RcJ05S45@work-vm>
References: <20220217142402.52819-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220217142402.52819-1-dgilbert@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The following changes since commit c13b8e9973635f34f3ce4356af27a311c993729c:
> 
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20220216' into staging (2022-02-16 09:57:11 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20220217
> 
> for you to fetch changes up to e138ec4ac86ea71d10ecd032edc433290776a5f2:
> 
>   virtiofsd: Add basic support for FUSE_SYNCFS request (2022-02-17 13:35:55 +0000)

NAK again
Some checkpatch fixes slipped through; v3 in flight

> ----------------------------------------------------------------
> V2: virtiofs pull 2022-02-17
> 
> Security label improvements from Vivek
>   - includes a fix for building against new kernel headers
>   [V2: Fix building on old Linux]
> Blocking flock disable from Sebastian
> SYNCFS support from Greg
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> ----------------------------------------------------------------
> Greg Kurz (1):
>       virtiofsd: Add basic support for FUSE_SYNCFS request
> 
> Sebastian Hasler (1):
>       virtiofsd: Do not support blocking flock
> 
> Vivek Goyal (10):
>       virtiofsd: Fix breakage due to fuse_init_in size change
>       linux-headers: Update headers to v5.17-rc1
>       virtiofsd: Parse extended "struct fuse_init_in"
>       virtiofsd: Extend size of fuse_conn_info->capable and ->want fields
>       virtiofsd, fuse_lowlevel.c: Add capability to parse security context
>       virtiofsd: Move core file creation code in separate function
>       virtiofsd: Add helpers to work with /proc/self/task/tid/attr/fscreate
>       virtiofsd: Create new file with security context
>       virtiofsd: Create new file using O_TMPFILE and set security context
>       virtiofsd: Add an option to enable/disable security label
> 
>  docs/tools/virtiofsd.rst                       |  32 ++
>  include/standard-headers/asm-x86/kvm_para.h    |   1 +
>  include/standard-headers/drm/drm_fourcc.h      |  11 +
>  include/standard-headers/linux/ethtool.h       |   1 +
>  include/standard-headers/linux/fuse.h          |  60 +++-
>  include/standard-headers/linux/pci_regs.h      | 142 ++++----
>  include/standard-headers/linux/virtio_gpio.h   |  72 ++++
>  include/standard-headers/linux/virtio_i2c.h    |  47 +++
>  include/standard-headers/linux/virtio_iommu.h  |   8 +-
>  include/standard-headers/linux/virtio_pcidev.h |  65 ++++
>  include/standard-headers/linux/virtio_scmi.h   |  24 ++
>  linux-headers/asm-generic/unistd.h             |   5 +-
>  linux-headers/asm-mips/unistd_n32.h            |   2 +
>  linux-headers/asm-mips/unistd_n64.h            |   2 +
>  linux-headers/asm-mips/unistd_o32.h            |   2 +
>  linux-headers/asm-powerpc/unistd_32.h          |   2 +
>  linux-headers/asm-powerpc/unistd_64.h          |   2 +
>  linux-headers/asm-riscv/bitsperlong.h          |  14 +
>  linux-headers/asm-riscv/mman.h                 |   1 +
>  linux-headers/asm-riscv/unistd.h               |  44 +++
>  linux-headers/asm-s390/unistd_32.h             |   2 +
>  linux-headers/asm-s390/unistd_64.h             |   2 +
>  linux-headers/asm-x86/kvm.h                    |  16 +-
>  linux-headers/asm-x86/unistd_32.h              |   1 +
>  linux-headers/asm-x86/unistd_64.h              |   1 +
>  linux-headers/asm-x86/unistd_x32.h             |   1 +
>  linux-headers/linux/kvm.h                      |  17 +
>  tools/virtiofsd/fuse_common.h                  |   9 +-
>  tools/virtiofsd/fuse_i.h                       |   7 +
>  tools/virtiofsd/fuse_lowlevel.c                | 179 ++++++++--
>  tools/virtiofsd/fuse_lowlevel.h                |  13 +
>  tools/virtiofsd/helper.c                       |   1 +
>  tools/virtiofsd/passthrough_ll.c               | 467 +++++++++++++++++++++++--
>  tools/virtiofsd/passthrough_seccomp.c          |   1 +
>  34 files changed, 1122 insertions(+), 132 deletions(-)
>  create mode 100644 include/standard-headers/linux/virtio_gpio.h
>  create mode 100644 include/standard-headers/linux/virtio_i2c.h
>  create mode 100644 include/standard-headers/linux/virtio_pcidev.h
>  create mode 100644 include/standard-headers/linux/virtio_scmi.h
>  create mode 100644 linux-headers/asm-riscv/bitsperlong.h
>  create mode 100644 linux-headers/asm-riscv/mman.h
>  create mode 100644 linux-headers/asm-riscv/unistd.h
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


