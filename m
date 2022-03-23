Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF844E575F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:23:21 +0100 (CET)
Received: from localhost ([::1]:35794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4hc-0003e7-J7
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:23:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4cW-0001o9-7z
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:18:04 -0400
Received: from [2607:f8b0:4864:20::102d] (port=33750
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4cU-0004S4-LM
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:18:03 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 mp11-20020a17090b190b00b001c79aa8fac4so896109pjb.0
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+l8uJm4CIqAcDOfVATSJ4rR/JXp8ZgwRxCX0NecHXmE=;
 b=CnJlMkzsqA1I0/mH2Lot6kLWsBC+yd0FigFPsBdJnkvWTCH7AGqvoK/3WSA/+IxdaM
 xzOZ/VWLKH2P+0+bY20wQCU1lvUg8UzUPGW8HGCn0xzOLSPN2nt/ryv4GGzFYdN1tA+j
 Dfuv6ALbCgaaTrVsNykkAPPQy1hp0ahfhA/Z6FXCTCwuKYjAFQuE/tkfghxuOvsYEJ2j
 WQXj4PxLPnHgTxgC34WolXx3T6YRrD4OrtlvBepJ+nquWnqnl6jJX+Uq017Y0DtIUEwx
 08sjphUWRYRsamVcoWbigH5wwmpaIogIzsNhOLxSWdBl46U0PoZkNmoYI8GpEX2N1xKE
 KDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+l8uJm4CIqAcDOfVATSJ4rR/JXp8ZgwRxCX0NecHXmE=;
 b=rWRVvfPW7WtlG/8cyLIfKt0EcWuXjKRH87/tGIsjBi6bD1bCu8yjHhOSzBb7NTjrvh
 34b10773BrIB5MddMFV7tKuybMvN0j1bnfzaMFfdxp0EbLu5yqXU9NdNba4mcld5c5Tx
 AcD0RIwv0P0BkjOBqXTFYY6908eF00OmoJT1Xne/D93AK3ctTnL1+n7QM4je4Nh20bFK
 iUqLm/+KFiiKF61pEEvkJJq6I4eUd0CaQeaE1r7rvKlbs0yzutDPX2bzqEusemL+V0pK
 2xedPW6kBZvWuVhxd74qKrZ0w0XoQwmT5jwMCaheNi6v7YD2ZhyGYgh2wNHKWqCcA7lS
 I88A==
X-Gm-Message-State: AOAM533uwR/mKMwrR+eYbukWigTQey248RYJRAPaKHmqZK8qYd1PsoiA
 kJZ01K84+PoiRugc5md8UtGJwddGkyY=
X-Google-Smtp-Source: ABdhPJyfNBPOJNSh1Ki6UbOUdxvcE3eiFy8Opq35BV6fw0og6EdkbvGhNha3qWs7W41vFPcTu8uFnQ==
X-Received: by 2002:a17:902:b902:b0:154:bb05:ddb9 with SMTP id
 bf2-20020a170902b90200b00154bb05ddb9mr1084944plb.14.1648055881126; 
 Wed, 23 Mar 2022 10:18:01 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 p7-20020a17090a2d8700b001c785d6c1ffsm292709pjd.28.2022.03.23.10.17.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:18:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/13] accel: Fix vCPU memory leaks
Date: Wed, 23 Mar 2022 18:17:38 +0100
Message-Id: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 David Hildenbrand <david@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Hi,

This is a respin of Mark 'vCPU hotunplug related memory leaks' v3:
https://lore.kernel.org/qemu-devel/20220321141409.3112932-1-mark.kanda@oracle.com/

Instead I refactored to extract the common common_vcpu_thread_create()
from all accelerators (except TCG/RR, which requires a special-casing).

Not well tested...

Mark Kanda (3):
  cpu: Free cpu->cpu_ases in cpu_address_space_destroy()
  softmmu/cpus: Free cpu->thread in generic_destroy_vcpu_thread()
  softmmu/cpus: Free cpu->halt_cond in generic_destroy_vcpu_thread()

Philippe Mathieu-Daudé (10):
  target/i386/kvm: Free xsave_buf when destroying vCPU
  target/i386/hvf: Free resources when vCPU is destroyed
  accel/hvf: Remove pointless assertion
  accel/tcg: Init TCG cflags in vCPU thread handler
  accel/tcg: Reorganize tcg_accel_ops_init()
  accel-ops: Introduce create_vcpu_thread_precheck / postcheck handlers
  accel/tcg: Extract rr_create_vcpu_thread_precheck()
  accel/all: Extract common_vcpu_thread_create()
  accel-ops: Introduce common_vcpu_thread_destroy() and .precheck
    handler
  accel/tcg: Add rr_destroy_vcpu_thread_precheck()

 accel/accel-softmmu.c             |  2 +-
 accel/dummy-cpus.c                | 15 +----------
 accel/hvf/hvf-accel-ops.c         | 24 +++--------------
 accel/kvm/kvm-accel-ops.c         | 17 +++---------
 accel/qtest/qtest.c               |  3 ++-
 accel/tcg/tcg-accel-ops-mttcg.c   | 27 +++----------------
 accel/tcg/tcg-accel-ops-mttcg.h   |  3 +--
 accel/tcg/tcg-accel-ops-rr.c      | 44 +++++++++++++++----------------
 accel/tcg/tcg-accel-ops-rr.h      |  7 +++--
 accel/tcg/tcg-accel-ops.c         | 22 +++++++++-------
 accel/xen/xen-all.c               |  2 +-
 cpu.c                             |  1 +
 include/exec/cpu-common.h         |  7 +++++
 include/sysemu/accel-ops.h        |  9 ++++++-
 include/sysemu/cpus.h             |  4 +--
 softmmu/cpus.c                    | 40 +++++++++++++++++++++++++---
 softmmu/physmem.c                 |  5 ++++
 target/i386/hax/hax-accel-ops.c   | 20 ++------------
 target/i386/hvf/hvf.c             |  2 ++
 target/i386/kvm/kvm.c             |  2 ++
 target/i386/nvmm/nvmm-accel-ops.c | 17 +++---------
 target/i386/whpx/whpx-accel-ops.c | 20 +++-----------
 22 files changed, 127 insertions(+), 166 deletions(-)

-- 
2.35.1


