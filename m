Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25C560EFAA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 07:51:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onvjY-0003w0-Id; Thu, 27 Oct 2022 01:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1onvjW-0003m2-B3
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 01:47:14 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1onvjQ-0003et-Bu
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 01:47:14 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so5259255pjk.2
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 22:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J5GKiDqHKleGB+xWflIlAg134Iv//iu/IfRAvfEVvew=;
 b=WXjgEtKQQykO1j283HlDMKZ4oK1NxC8MLPKMrWj8LTNXwUpsxgT0wW6odwA2hVpvcQ
 3ldSc6DIVO3qPBAmR5DWX4AmLpV1TOAT7dnYShz9qLZ5rjAR/UaNgPrNVbFwH5NT9dL5
 s7rb3oJxCEQumD97H1q0iYnSdepcU3jvq8l2+2VfEUOG8nX8YltBfmZaOMH5xM4AXDfB
 Nw2Rqx+yxlJ8E8f1MCsZlhxnWZgJ10Nz3dYpOQfSg9uC+vs47fB2Ll9bje0TjeIS/h4p
 V8JLxX4Fg7ywV3gJeF6rDEiuUluduVdym48Mw9cTunsh+uaFHn2yzRMbCigBP9nzQ/Mb
 n43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J5GKiDqHKleGB+xWflIlAg134Iv//iu/IfRAvfEVvew=;
 b=Dvfx1Z6885DNMK9cdmHcCCnKMK2Do+IjMSJQ4e4+3F3iznDtqN3lIXVh3q/ehBuShy
 53VANOnVtkn8t63/9ugnWBqECCH7/vUczsMGyzO/gK3KSXxTifvZ0znnJUyJx9gPdoNL
 CRvAmR6fxFXnyFye5lpNIuIVPi2xR5umA85cCL+1oV3dKMa74pZaDWNJLKnf7yQkjp4P
 0In5K7SLGzO4sd6P7BTm+Xc+6MQdiI2KYfYHeyw/N3j3Rz6NqsCZ5S821RRrmykC14q4
 6mAOlZmUepA5EZDBE5jYSo8J2Z3AV+gR8GAWiRRjBm5+Ptt8dsVOjDBlHyoXNDgYQAUQ
 Fyug==
X-Gm-Message-State: ACrzQf35ChfMDs0SU3LzI6ZSAibpEsieq7wgqwDAf3ScU/u+VSZWnJo0
 YfcbaBc9TJo1UbAoW+2g7ivcgpiLDk5i5Q==
X-Google-Smtp-Source: AMsMyM4Me7/X2t5701CtKJyYzsS2aNALDpQEf/9tXAlALzqRUGuMcdQxP8EQUitZmLasjHxtJdpJhQ==
X-Received: by 2002:a17:902:bf46:b0:179:eba5:90ba with SMTP id
 u6-20020a170902bf4600b00179eba590bamr48027509pls.16.1666849624011; 
 Wed, 26 Oct 2022 22:47:04 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:519a:c85:c94:7c26:ac49:6811])
 by smtp.googlemail.com with ESMTPSA id
 188-20020a6204c5000000b00562784609fbsm328217pfe.209.2022.10.26.22.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 22:47:03 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v1 0/3] target/riscv: Apply KVM policy to ISA extensions
Date: Thu, 27 Oct 2022 11:16:46 +0530
Message-Id: <20221027054649.69228-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1032.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently the single and multi letter ISA extensions exposed to the guest
vcpu don't confirm to the KVM policies. This patchset updates the kvm headers
and applies policies set in KVM to the extensions exposed to the guest.

Mayuresh Chitale (3):
  update-linux-headers: Version 6.1-rc2
  target/riscv: Extend isa_ext_data for single letter extensions
  target/riscv: kvm: Support selecting VCPU extensions

 include/standard-headers/drm/drm_fourcc.h     |  34 ++++-
 include/standard-headers/linux/ethtool.h      |  63 +++++++-
 include/standard-headers/linux/fuse.h         |   6 +-
 .../linux/input-event-codes.h                 |   1 +
 include/standard-headers/linux/virtio_blk.h   |  19 +++
 linux-headers/asm-generic/hugetlb_encode.h    |  26 ++--
 linux-headers/asm-generic/mman-common.h       |   2 +
 linux-headers/asm-mips/mman.h                 |   2 +
 linux-headers/asm-riscv/kvm.h                 |   4 +
 linux-headers/linux/kvm.h                     |   1 +
 linux-headers/linux/psci.h                    |  14 ++
 linux-headers/linux/userfaultfd.h             |   4 +
 linux-headers/linux/vfio.h                    | 142 ++++++++++++++++++
 target/riscv/cpu.c                            |  52 ++++---
 target/riscv/kvm.c                            |  88 +++++++++--
 target/riscv/kvm_riscv.h                      |   2 +-
 16 files changed, 408 insertions(+), 52 deletions(-)

-- 
2.34.1


