Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B8E3B19AD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:16:43 +0200 (CEST)
Received: from localhost ([::1]:54298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw1oA-0005u0-5h
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m2-0003rB-M7
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:30 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m0-0001xn-U5
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:30 -0400
Received: by mail-ed1-x52f.google.com with SMTP id s6so3106303edu.10
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fa9OjhIJ3U//kVonjxwc0sQUDlQnlh1DEpuQTPjP+iw=;
 b=m25OVf6+ubL1jzqjiOl4o6eXtd9bbte0UGzjGnFQ4STDlTUQhrLn1HYVrrSEV5cUyJ
 yxQD4y2s+J8qDkx3OaNMy7cw1clFBGn6NQXpMHv2LSe/lqsAouWUww90/ZOjG2zhNP7+
 CG0BurgHwPeRjJH1W/05YWCf2AXAlBLIs7YCKbKDA9Gce25R5nJ8z38keL8TC07BJTOz
 12m8UPOZHEhrnybIz1n07+QJY7/u6g+8WTWaf+aeyY5g3k9CYbG/MGF2z9jJBveaTOSy
 XnKJ8VF2i4wAhXdQbOFS/tJXk6SLoamNfKKiDAKnKZjde9HFaJVJnF6xswllawpGz3Gp
 aXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Fa9OjhIJ3U//kVonjxwc0sQUDlQnlh1DEpuQTPjP+iw=;
 b=hLvXziXa463vVzm5hZSn7Nh+uH6MptWzRI4KaWA2HeylduDwHzYU2AUYFeQsGGF5aT
 M5uQmI+6iCtfKSg36buZiAsJP3X1g31LPszW/nLTijpUejw887oPTopvl1cK4XwfftJM
 lyqPxR2gSvSGLkKo/ZpCyLwDGoFlX5jNPjtuw8MtmE0dkRznoHnKxIm9C0AkGDAB277r
 Wxww6ciB5nhP1UcZx2pqq7DIyJA6do74lAjRwjbOCdnP4K26YRL8aOW/bpDVr+LVdScm
 zj2cfyXU3Qy4OKoVczcqBlmLZj50TP6paKc9fsG2X4qyV2rnu5UFRvqJIGzm8pu5EhCx
 JQsg==
X-Gm-Message-State: AOAM533GAgw2vGROt8L1OK6WIiZx19zd2mMGTOuAsaOUH4Gy0LFePyI+
 /4kO0uC+BuF4iU6mf40jxLwwKmHI2uI=
X-Google-Smtp-Source: ABdhPJwKPZUWGlKROZ+hqQhyGA6ZlpymukzKZ27WWyxY0NBmZkcl6OfvxFCQrIGHtunRqU9gCE4WzA==
X-Received: by 2002:a05:6402:520c:: with SMTP id
 s12mr12149268edd.357.1624450465765; 
 Wed, 23 Jun 2021 05:14:25 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o5sm1680778edt.44.2021.06.23.05.14.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:14:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] Misc, mostly meson patches for 2021-06-23
Date: Wed, 23 Jun 2021 14:14:12 +0200
Message-Id: <20210623121424.1259496-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

The following changes since commit b22726abdfa54592d6ad88f65b0297c0e8b363e2:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-06-22 16:07:53 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 0f38448da7ab61a23fc35f57276a7272d6e4d984:

  KVM: Fix dirty ring mmap incorrect size due to renaming accident (2021-06-23 12:20:59 +0200)

----------------------------------------------------------------
* Some Meson test conversions
* KVM dirty page ring buffer fix
* KVM TSC scaling support

----------------------------------------------------------------
Paolo Bonzini (11):
      target/i386: kvm: add support for TSC scaling
      meson: drop unused CONFIG_GCRYPT_HMAC
      configure: drop unused variables for xts
      meson: remove preadv from summary
      tests: remove QCRYPTO_HAVE_TLS_TEST_SUPPORT
      configure, meson: convert crypto detection to meson
      configure, meson: convert libtasn1 detection to meson
      configure, meson: convert pam detection to meson
      configure, meson: convert libusb detection to meson
      configure, meson: convert libcacard detection to meson
      configure, meson: convert libusbredir detection to meson

Peter Xu (1):
      KVM: Fix dirty ring mmap incorrect size due to renaming accident

 accel/kvm/kvm-all.c                   |   4 +-
 authz/meson.build                     |   2 +-
 configure                             | 326 +++-------------------------------
 crypto/meson.build                    |  41 ++---
 hw/usb/meson.build                    |   6 +-
 meson.build                           | 151 +++++++++++-----
 meson_options.txt                     |  14 ++
 target/i386/cpu.c                     |   2 +-
 target/i386/cpu.h                     |   1 +
 target/i386/kvm/kvm.c                 |  12 +-
 tests/unit/crypto-tls-psk-helpers.c   |   6 -
 tests/unit/crypto-tls-psk-helpers.h   |   4 -
 tests/unit/crypto-tls-x509-helpers.c  |   4 -
 tests/unit/crypto-tls-x509-helpers.h  |  11 +-
 tests/unit/meson.build                |  10 +-
 tests/unit/pkix_asn1_tab.c            |   3 -
 tests/unit/test-crypto-tlscredsx509.c |  12 --
 tests/unit/test-crypto-tlssession.c   |  12 --
 tests/unit/test-io-channel-tls.c      |  12 --
 19 files changed, 177 insertions(+), 456 deletions(-)
-- 
2.31.1


