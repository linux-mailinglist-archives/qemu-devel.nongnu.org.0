Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5D369E50D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:47:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVmX-0008Vy-8b; Tue, 21 Feb 2023 11:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pUV8w-0001bJ-Hi
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:05:27 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pUV8t-0007kY-OD
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:05:26 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso5294373pjb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 08:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=njL1mmILWaUaw9pHU8/DZfgyhs6GtPjUMA51LctlJKo=;
 b=qeK6DIrxvvFjprB21XPw83dKkZSg7afc5JkWIazEmq8+JWkkYQaHoQJyovu8B7GVBT
 71QJDh41as9dSnjAELwjCtYDtFaIFnjuu1Y4n/jNhLarBzhR4Npq0mCy0/fzk5hN/75J
 RwCwUD+TMC+He2Cd9GDuJbtXkXxOvWt/WUYvJlvACfZ+H0dogXqcPOZDA8zPckhJMQlG
 Md7rEq+NRlg4ZZyCXGhShEwuCYdWTspsc5TPqtS2S8Ogz0arJurtViZceDFpAzASzqCf
 +FrLR3owedHkloQJ2aZbdKBRyY65CigPws4K839MzbMKgZRW6uOcInPQa4yKh1lhK7YC
 zMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=njL1mmILWaUaw9pHU8/DZfgyhs6GtPjUMA51LctlJKo=;
 b=cKy6wLz6ntOl4JZeuuYJ1EdfG6bDzghdkdkk2yhBcQ2JkOTRgh0HEizpK/JaKQ5+b1
 diALRNENtatmSZUos1dgeyGQwsTwuW9YLYdkMLPRQe88U+2mMNv2TFg1VdJn+QZTg4p8
 q8UK4pWfeoAD9oHAfH6gb/EpktLbcKs1Z1jzKIs5d2NLdNAzpWwfPBNJ1G/Y+tex+aym
 72Fl3TJ8IKzcqOBnOCNmFoq3H19qP7gNOz/Yvn9ptNFHcr/2x0HZeErpvM0qZ6+5zQhz
 tAYeQ5Il0ksIsenyXNsi6nhj7YjdrCtzTXKmtOGF1S2cQCiLY+C8BW3IRB3p9IRA03Ec
 lzfw==
X-Gm-Message-State: AO0yUKUc847p+HEBh7Yf4ATQf8br+8O+x+wm5StQfVU1/7ATL1H43o2U
 wu8MyMVR/LJZWNcebA5HtFHAmFPT4NtzHw==
X-Google-Smtp-Source: AK7set9krmr02dm1mX+UlgVw333JOTduPnsIzTbAm7LZMyrSERRdlvoBx4si1zAafFjk3wzNAzSVKA==
X-Received: by 2002:a17:902:ea07:b0:19a:887d:98ac with SMTP id
 s7-20020a170902ea0700b0019a887d98acmr7262108plg.46.1676995520660; 
 Tue, 21 Feb 2023 08:05:20 -0800 (PST)
Received: from localhost.localdomain ([113.173.97.170])
 by smtp.googlemail.com with ESMTPSA id
 b15-20020a170902650f00b001943d58268csm10076295plk.55.2023.02.21.08.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 08:05:20 -0800 (PST)
From: Bui Quang Minh <minhquangbui99@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Subject: [PATCH 0/4] Support x2APIC mode with TCG accelerator
Date: Tue, 21 Feb 2023 23:04:56 +0700
Message-Id: <20230221160500.30336-1-minhquangbui99@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Feb 2023 11:46:12 -0500
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

This series implements x2APIC mode in userspace local APIC and the
RDMSR/WRMSR helper to access x2APIC registers in x2APIC mode. With this
series, we can now boot up Linux kernel in x2APIC with TCG accelerator.

Bui Quang Minh (4):
  apic: add support for x2APIC mode
  i386/tcg: implement x2APIC registers MSR access
  intel_iommu: allow Extended Interrupt Mode when using userspace local
    APIC
  test/avocado: test Linux boot up in x2APIC with userspace local APIC

 hw/i386/intel_iommu.c                |  11 --
 hw/intc/apic.c                       | 211 +++++++++++++++++++++------
 hw/intc/apic_common.c                |   2 +-
 include/hw/i386/apic.h               |   5 +-
 include/hw/i386/apic_internal.h      |   2 +-
 target/i386/cpu-sysemu.c             |   5 +
 target/i386/cpu.c                    |   5 +-
 target/i386/cpu.h                    |   4 +
 target/i386/tcg/sysemu/misc_helper.c |  27 ++++
 tests/avocado/tcg_x2apic.py          |  91 ++++++++++++
 10 files changed, 302 insertions(+), 61 deletions(-)
 create mode 100644 tests/avocado/tcg_x2apic.py

-- 
2.25.1


