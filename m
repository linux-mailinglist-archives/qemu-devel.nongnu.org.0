Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E05C528A92
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:34:51 +0200 (CEST)
Received: from localhost ([::1]:58294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdgI-00032a-7l
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd4u-0001H2-5t
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd4r-0003JZ-5y
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XvPMULj8H2XDc1ynn7UY9nkZ4VGal7Q5H/aGCRLDnNQ=;
 b=Ow11fFDjxGEHef7Y4yfFgQA185hgA4hXZ1xsT5Hdz7MJLVdnKbx+hQXG3C0e3kxKrbw7s6
 mHLRCbe4IFPpuMX/8fmrktWCEYSxCy7CTT8nIB9La1lRZCCnNXIPKvvkEtodA8szs+kwdW
 5liL96h/WXwXHnqkErDNiK7nVUWRvxk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-J3ZF-9arMDOZeRPKEIhc5w-1; Mon, 16 May 2022 11:56:06 -0400
X-MC-Unique: J3ZF-9arMDOZeRPKEIhc5w-1
Received: by mail-ej1-f69.google.com with SMTP id
 bk16-20020a170906b0d000b006fe34a2e598so1076559ejb.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XvPMULj8H2XDc1ynn7UY9nkZ4VGal7Q5H/aGCRLDnNQ=;
 b=ZBzQOYQ/cWrlMWl1GNo2HKRMdpeCRIHg1B1CNwhoMJxKQm9AUX5UKo1ir+GDj9F48D
 8sGZrW0w73lbP/+QVGMQ+3vM1fDcb47cYQ2kYZSarGCnbgfZhU8OTEWtGnb5JP0seuOA
 o77rqhWhI2g7Ptt89nl1CJoDFiuqOc93LgEpKXYP6iG2VCx2AgHFdZzdqTDmf6n37gA4
 yXoxwwAxjJVJvVyVSNDVljIsDdOUIuOklKK0U/ax0LPtRXmQjBS9qmmC8G3QrCbCkCBj
 N3DqCbU3nZ6xbGajwA8AoSGygRWtWIb1vymrtUrNpMhbz3YVcSG02RpAkYlMsgdA5uzD
 uwWQ==
X-Gm-Message-State: AOAM531warvJck3zEmIHCgwRyUmTSbZhzWRdCbKjzy0/ezD5WyRH0yFt
 BrpfOYbg3P3A/oh4JvLeSLjEYVEjrYysHyRJEvnTjwFo/Dl9qO0eiO6okIyJnTmge7rxyAliDDE
 HOiQ92anBAievRnSPBymqldACTz/OgMGu6K+vHVgaoW57EAF5UmmpWWiMYgWobZId82w=
X-Received: by 2002:a17:907:3f8d:b0:6fa:6a00:b405 with SMTP id
 hr13-20020a1709073f8d00b006fa6a00b405mr15575353ejc.742.1652716565115; 
 Mon, 16 May 2022 08:56:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/j2CeLeIInmXS75sPewMPGpX3HgnHA+43jyD3+TsepLWT7ojlo6qy61JO12yQDHcYrXolPw==
X-Received: by 2002:a17:907:3f8d:b0:6fa:6a00:b405 with SMTP id
 hr13-20020a1709073f8d00b006fa6a00b405mr15575327ejc.742.1652716564698; 
 Mon, 16 May 2022 08:56:04 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a17090664c200b006f3ef214de9sm46282ejn.79.2022.05.16.08.56.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/23] Misc QEMU patches for 2022-05-16
Date: Mon, 16 May 2022 17:55:40 +0200
Message-Id: <20220516155603.1234712-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

The following changes since commit 48de9b0916ef60d5a6bd6ca9288832deff8ee1ee:

  Merge tag 'linux-headers-v5.18-rc6' of https://gitlab.com/alex.williamson/qemu into staging (2022-05-13 09:45:17 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 8eccdb9eb84615291faef1257d5779ebfef7a0d0:

  configure: remove duplicate help messages (2022-05-14 12:33:45 +0200)

----------------------------------------------------------------
* fix WHPX debugging
* misc qga-vss fixes
* remove the deprecated CPU model 'Icelake-Client'
* support for x86 architectural LBR
* remove deprecated properties
* replace deprecated -soundhw with -audio

----------------------------------------------------------------
Ivan Shcherbakov (1):
      WHPX: fixed TPR/CR8 translation issues affecting VM debugging

Konstantin Kostiuk (2):
      qga-vss: Add auto generated headers to dependencies
      qga-vss: Use the proper operator to free memory

Paolo Bonzini (11):
      target/i386: introduce helper to access supported CPUID
      crypto: make loaded property read-only
      rng: make opened property read-only
      soundhw: remove ability to create multiple soundcards
      soundhw: extract soundhw help to a separate function
      soundhw: unify initialization for ISA and PCI soundhw
      soundhw: move help handling to vl.c
      introduce -audio as a replacement for -soundhw
      build: remove useless dependency
      configure: remove another dead variable
      configure: remove duplicate help messages

Robert Hoo (1):
      i386/cpu: Remove the deprecated cpu model 'Icelake-Client'

Yang Weijiang (8):
      qdev-properties: Add a new macro with bitmask check for uint64_t property
      target/i386: Add lbr-fmt vPMU option to support guest LBR
      target/i386: Add kvm_get_one_msr helper
      target/i386: Enable support for XSAVES based features
      target/i386: Add XSAVES support for Arch LBR
      target/i386: Add MSR access interface for Arch LBR
      target/i386: Enable Arch LBR migration states in vmstate
      target/i386: Support Arch LBR in CPUID enumeration

 Makefile                        |   3 -
 audio/audio.c                   |   8 +-
 audio/audio.h                   |   1 +
 backends/rng.c                  |  18 +--
 configure                       |   5 -
 crypto/secret_common.c          |  84 +++++-----
 crypto/tlscredsanon.c           |  20 +--
 crypto/tlscredspsk.c            |  20 +--
 crypto/tlscredsx509.c           |  20 +--
 docs/about/deprecated.rst       |  34 -----
 docs/about/removed-features.rst |  28 ++++
 hw/audio/intel-hda.c            |   5 +-
 hw/audio/soundhw.c              | 136 ++++++++---------
 hw/core/qdev-properties.c       |  19 +++
 include/hw/audio/soundhw.h      |   5 +-
 include/hw/qdev-properties.h    |  12 ++
 qemu-options.hx                 |  51 +++----
 qga/vss-win32/meson.build       |   2 +-
 qga/vss-win32/requester.cpp     |   4 +-
 softmmu/vl.c                    |  30 +++-
 target/i386/cpu.c               | 331 ++++++++++++++++++++--------------------
 target/i386/cpu.h               |  57 ++++++-
 target/i386/kvm/kvm.c           | 113 +++++++++++---
 target/i386/machine.c           |  38 +++++
 target/i386/whpx/whpx-all.c     |  13 +-
 25 files changed, 600 insertions(+), 457 deletions(-)
-- 
2.36.0


