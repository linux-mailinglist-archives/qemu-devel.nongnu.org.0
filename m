Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7856F6B9C76
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:06:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc85X-0003J1-7J; Tue, 14 Mar 2023 13:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc85P-0003HS-2O
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:05:19 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc85M-0005Zv-EQ
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:05:18 -0400
Received: by mail-pl1-x633.google.com with SMTP id p20so17254674plw.13
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 10:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678813515;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sMG7llfNtooNocOJENG6MuSVf6E1WqgGs6wzJsB+Zs0=;
 b=wyEcx1PCTRmcJX3a68BxmG2ik+nrga9JPDQxJ1iEYlGsBEqJUYs2Oy06rQr44ReUD7
 47AFT5LWff8aCf0HishlREJxFad6aIH1RKovYRLri9tasZgHJEIOGC232YtjTYv4AouG
 dw09TttNHyY3wS0HBwg8E1VlBdvvrNUajI28t2qx0S+oTIQc/BdGG8v2V2oj46gHWDiW
 rLLa58rLDGjHlJPQ+jDJ8bv8iN7VY7XutTfGfdm3glqZb14PLutpTK/sGxg5bav/orms
 K2D406tp1csV7L/FKeJKNYQJ90gkXdJnkrdSTFu8zayRcnT4aPI7AAoPunZ/A9eXXL2i
 nyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678813515;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sMG7llfNtooNocOJENG6MuSVf6E1WqgGs6wzJsB+Zs0=;
 b=7z2Ut/VivK4OaTOsx6Qk79Jw1QT/nMTRSdV15dE9CIXGI+Hxmv9tA/1K8l1MciNx5v
 RjVN/x9R1hko+bjjaKL9UApoZKOMggdAiuJ2iHz2/uEcs3AqDqd1PIFAHclnSptcMlQT
 rWPeGyfgRbzXesEO70jg7wEKUoPOnGIRO1dCwDBr1bg6I4XdafAdLcU237hbPWv9uTQ1
 dNQ4YAyh0LihDGIhRNQE8pGkYqaXcR40gTaI8qnS60CQ8b2R2Et+g32uR42GQSPesaGN
 am3CEDNHAXwGN0tJI1BJrRYPbgzS5PxDsASJS3w3630j7jOT1e1UBG+n38iqkq/qDosI
 PjJQ==
X-Gm-Message-State: AO0yUKV7uRobiHmfwq7b3MSreAlA1f13Y+LmC8zjiv3EDooqN/6cHqAQ
 8UfDby+habhsqOBUf3+rgjQPIPfNLEsmZ7kXHfvSpw==
X-Google-Smtp-Source: AK7set/VPczAChgz1n6aJ2RbGlEEqH8LtHPaAfoq1VYqHLANiboTY7Tji72dZsPduZTy/QTZnbpTYn9or7a4wJCXj6Q=
X-Received: by 2002:a17:902:fac6:b0:19f:3b0e:a463 with SMTP id
 ld6-20020a170902fac600b0019f3b0ea463mr3959106plb.9.1678813514827; Tue, 14 Mar
 2023 10:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230227042629.339747-1-gshan@redhat.com>
 <a4a28aca-449e-0b95-c3ca-e036b82d76e7@redhat.com>
In-Reply-To: <a4a28aca-449e-0b95-c3ca-e036b82d76e7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2023 17:05:03 +0000
Message-ID: <CAFEAcA_heAVWgcc8MsXovbOoea4NziBXZjNDLKpd1rF7cFoVDg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hw/arm/virt: Support dirty ring
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com, 
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org, 
 zhenyzha@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Mar 2023 at 07:13, Gavin Shan <gshan@redhat.com> wrote:
>
> On 2/27/23 12:26 PM, Gavin Shan wrote:
> > This series intends to support dirty ring for live migration for arm64. The
> > dirty ring use discrete buffer to track dirty pages. For arm64, the speciality
> > is to use backup bitmap to track dirty pages when there is no-running-vcpu
> > context. It's known that the backup bitmap needs to be synchronized when
> > KVM device "kvm-arm-gicv3" or "arm-its-kvm" has been enabled. The backup
> > bitmap is collected in the last stage of migration. The policy here is to
> > always enable the backup bitmap extension. The overhead to synchronize the
> > backup bitmap in the last stage of migration, when those two devices aren't
> > used, is introduced. However, the overhead should be very small and acceptable.
> > The benefit is to support future cases where those two devices are used without
> > modifying the code.
> >
> > PATCH[1] add migration last stage indicator
> > PATCH[2] synchronize the backup bitmap in the last stage of migration
> > PATCH[3] add helper kvm_dirty_ring_init() to enable dirty ring
> > PATCH[4] enable dirty ring for arm64
> >
> >     v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00434.html
> > RFCv1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00171.html
> >
> > Testing
> > =======
> > (1) kvm-unit-tests/its-pending-migration and kvm-unit-tests/its-migration with
> >      dirty ring or normal dirty page tracking mechanism. All test cases passed.
> >
> >      QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm \
> >      ./its-pending-migration
> >
> >      QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm \
> >      ./its-migration
> >
> >      QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm,dirty-ring-size=65536 \
> >      ./its-pending-migration
> >
> >      QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm,dirty-ring-size=65536 \
> >      ./its-migration
> >
> > (2) Combinations of migration, post-copy migration, e1000e and virtio-net
> >      devices. All test cases passed.
> >
> >      -netdev tap,id=net0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown  \
> >      -device e1000e,bus=pcie.5,netdev=net0,mac=52:54:00:f1:26:a0
> >
> >      -netdev tap,id=vnet0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown \
> >      -device virtio-net-pci,bus=pcie.6,netdev=vnet0,mac=52:54:00:f1:26:b0
> >
> > Changelog
> > =========
> > v2:
> >    * Drop PATCH[v1 1/6] to synchronize linux-headers                            (Gavin)
> >    * More restrictive comments about struct MemoryListener::log_sync_global     (PeterX)
> >    * Always enable the backup bitmap extension                                  (PeterM)
> > v1:
> >    * Combine two patches into one PATCH[v1 2/6] for the last stage indicator    (PeterX)
> >    * Drop the secondary bitmap and use the original one directly                (Juan)
> >    * Avoid "goto out" in helper kvm_dirty_ring_init()                           (Juan)
> >
>
> Ping, Paolo and Peter Maydell. Please take a look to see if it can be
> merged, thanks!

No objections here; I'm assuming that since it's only touching
KVM core code that it would go via Paolo. However, as a new
feature it has missed softfreeze for 8.0, so it'll have to
wait until the tree re-opens for 8.1.

thanks
-- PMM

