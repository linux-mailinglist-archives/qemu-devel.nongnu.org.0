Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08233DA357
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:49:17 +0200 (CEST)
Received: from localhost ([::1]:60620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95TQ-0005wH-QB
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95RW-0003Rg-MU
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:18 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95RU-0007Ui-Qm
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:18 -0400
Received: by mail-ed1-x52d.google.com with SMTP id d6so407215edt.7
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bw7wQV8E3r9meBLjeXgKkIQSj8X97H9oa4SoLHZiz5U=;
 b=Lud6FhtBmy8juU3ooYdMYAUpHMIj5ji4SY7O3z2HUrW9E2hLVARcFug0/dVDzwl5Fh
 NSRNEurEaozZ7uzgjVgkzzyzRmak3uGgdLqqJJeq6F5yqA83OcrNr2/nAo4NXOnq16oz
 G462gsr0euq09Xn772DTPvHhyGqOu3xHq2HjG+bNPwRCC5TeVngTYSUo+eRs9n/ICoyO
 sh1vKjXBA8oNN1TAAV1lfG2dc/remOTFm6GhEH6CDT5WaQJhwvKWK23BNzsByNewuHWa
 JuIqr3U+TbWRfNROMK8SIqRKw/qpJVLbdqAYqLygkvBwONmDdIlVkhRuLwCx0F9Qd8At
 GeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=bw7wQV8E3r9meBLjeXgKkIQSj8X97H9oa4SoLHZiz5U=;
 b=BkeJZsN5/3Dxo4ScaN4IPFUhSwfo0e8xq0POwF6rLUIC99+m8WwQ/Znr+bbHSDPWv0
 8092yasH5rfYE4DTD0T16gK9qveDYckRRT6zvKRka+Z93Mtt9zVdC92sKJ+QfcffJHDH
 LD6k1J6+gf4k/ow3Wot2uQiYueUQAX1Lv61w9owNlRV0YQ+E5/Y+njrEh3bVHPRX/3Xn
 l5mZ7Gpbv7Nn0baYjGjcG7KfH381XuLWSIY1xC7TTKhiyAHr33smjA7PcUXX8BVIUVp2
 Tb3CcVn71udM70BlfYZ+zKHEBzASqZjLCeMGhYWIq7QKMLgHChgCd7QevxWaBMncwodX
 LbYQ==
X-Gm-Message-State: AOAM530OxOfSIbtq2vqnLECHrJY3RiSe6avMELyCIDxoowlm6uhC2/ah
 rKutr5M/nto8nHWfYEopgZ1xgTJ1BLbFLw==
X-Google-Smtp-Source: ABdhPJw3reu5Bnd9uqYVfPBZ2Zm/3nbSSyh6Xg++ryI4dPXHdj4oBrXa7nBODtjWBBv4v77XnrO+Gw==
X-Received: by 2002:a05:6402:2228:: with SMTP id
 cr8mr5845101edb.309.1627562835027; 
 Thu, 29 Jul 2021 05:47:15 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id m12sm954659ejd.21.2021.07.29.05.47.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 05:47:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Misc patches for QEMU 6.1-rc2
Date: Thu, 29 Jul 2021 14:47:06 +0200
Message-Id: <20210729124713.208422-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 69ea12b19a15ae006521cd5cc0f627f27f738746:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2021-07-27' into staging (2021-07-28 13:32:12 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 4fe29344bef6c54a6eff7aa0343754f8a9df5715:

  libvhost-user: fix -Werror=format= warnings with __u64 fields (2021-07-29 10:15:52 +0200)

----------------------------------------------------------------
Bugfixes.

----------------------------------------------------------------
Alexey Neyman (1):
      Makefile: ignore long options

Lara Lazier (1):
      target/i386: Added consistency checks for event injection

Marc-André Lureau (2):
      meson: fix meson 0.58 warning with libvhost-user subproject
      libvhost-user: fix -Werror=format= warnings with __u64 fields

Paolo Bonzini (1):
      target/i386: fix typo in ctl_has_irq

Richard Henderson (1):
      configure: Add -Werror to avx2, avx512 tests

Vitaly Kuznetsov (1):
      i386: assert 'cs->kvm_state' is not null

 Makefile                                         |  8 +++++---
 configure                                        |  4 ++--
 subprojects/libvhost-user/include/atomic.h       |  1 +
 subprojects/libvhost-user/libvhost-user.c        | 10 +++++-----
 subprojects/libvhost-user/meson.build            |  6 +-----
 subprojects/libvhost-user/standard-headers/linux |  1 +
 target/i386/kvm/kvm.c                            | 14 ++++++++++++++
 target/i386/tcg/sysemu/svm_helper.c              |  8 +++++++-
 8 files changed, 36 insertions(+), 16 deletions(-)
 create mode 120000 subprojects/libvhost-user/include/atomic.h
 create mode 120000 subprojects/libvhost-user/standard-headers/linux
-- 
2.31.1


