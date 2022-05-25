Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396E653443A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:32:34 +0200 (CEST)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwkC-0007DB-Jy
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwgr-0004Zk-8P
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwgo-0003pB-A6
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=58lVi1JJ3KzJM2JUU3DXCqJfG3Go87fh2c6j2omaDyM=;
 b=GtLFcAg1kibBu8TKufnub9GzLogqvfCUsEgC7VYTNM1yiilhtcfwIfaxQLH/tALLb5OQ3+
 1WKBAAjvTdOJ7oOmQETKllvIaNwkevWuHu3PbVlPdxZmoXNZNSdkWZFMrF2kE3KvpCYNfv
 UOT6aWgGniu3LHE5yEHShDQX/r6pGTk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-k4RIkGb_O62iyxprWehBhA-1; Wed, 25 May 2022 15:28:57 -0400
X-MC-Unique: k4RIkGb_O62iyxprWehBhA-1
Received: by mail-ej1-f70.google.com with SMTP id
 oz9-20020a1709077d8900b006f3d9488090so9975480ejc.6
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=58lVi1JJ3KzJM2JUU3DXCqJfG3Go87fh2c6j2omaDyM=;
 b=3b+WJQdCEYXvCn4dQ/vODhKgSJ7QI0uywgyPkmmFWXIJ9wIOi5gLwV0T6YW8aFeCJe
 Yuy1mHd5hGPwvwIWkN1rLoWBCbIrlgBPQZuU9yU/kMv6TcNfaEMr8op+GhyaxIMtvoka
 e7tk8VFMSE+uez4mJKBEjmfs1lFMwwb0OzP8Tmflf6WIS2xYAojDoTMjrhlOpipoDfCB
 k+AHHzeB+Q0cOrmlaxfkgUQRPDm4u6O+FrlnB8IOUSHcSZu/kAuV52Pz66H09ekZ0uaQ
 2ApfMaXhwYDBY0ZB7j3/P86DPbiN5nvo4/VoXrdIXoMnPLuRjOiFtDgOtn+FpMeLdFt3
 rHXQ==
X-Gm-Message-State: AOAM530ibf41calkkwdhd63nLxndtjgLfZDfk5FFxAY/U47S6aPAjKXF
 YvopFpGMALYnAykrfpSXKarQwcVWS6Mv+0LA7EadNUq7IMOtC84duO3XF8ARzcZyInS2TomykMi
 qd1QiZWIyNIPVc5w/SbK5jlN3v28pCSpQjN4Kj4nDYHJ3e1LWhpRB8Vy2NDK85b3tACY=
X-Received: by 2002:aa7:de8a:0:b0:42a:b51a:554c with SMTP id
 j10-20020aa7de8a000000b0042ab51a554cmr36943329edv.318.1653506935722; 
 Wed, 25 May 2022 12:28:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLRDQwkdPYwVnxSBG+JyNgGhf2nQ1T8GWdD7DsiyMsFIBt5xJDtLku2QfTJs31m/1lk4vMSw==
X-Received: by 2002:aa7:de8a:0:b0:42a:b51a:554c with SMTP id
 j10-20020aa7de8a000000b0042ab51a554cmr36943301edv.318.1653506935342; 
 Wed, 25 May 2022 12:28:55 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 25-20020a508759000000b0042bc5e8f7fdsm1340391edv.16.2022.05.25.12.28.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:28:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/17] Misc patches for 2022-05-25
Date: Wed, 25 May 2022 21:28:35 +0200
Message-Id: <20220525192852.301633-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit 3757b0d08b399c609954cf57f273b1167e5d7a8d:

  Merge tag 'pull-request-2022-05-18' of https://gitlab.com/thuth/qemu into staging (2022-05-20 08:04:30 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 9ad6634ec956bcf3558059aae8c6b2b5ee985307:

  i386: docs: Convert hyperv.txt to rST (2022-05-25 21:26:35 +0200)

----------------------------------------------------------------
* ac97 cleanups (Zoltan)
* default the amount of prealloc-threads to smp-cpus (Jaroslav)
* fix disabling MPX on "-cpu host" with MPX-capable host (Maciej)
* thread-pool performance optimizations (myself)
* Hyper-V enlightenment enabling and docs (Vitaly)
* check ELF header in elf2dmp (Viktor)
* tweak LBREn migration (Weijiang)

----------------------------------------------------------------
BALATON Zoltan (3):
      hw/audio/ac97: Coding style fixes to avoid checkpatch errors
      hw/audio/ac97: Remove unimplemented reset functions
      hw/audio/ac97: Remove unneeded local variables

Jaroslav Jindrak (1):
      hostmem: default the amount of prealloc-threads to smp-cpus

Lev Kujawski (1):
      ide_ioport_read: Return lower octet of data register instead of 0xFF

Maciej S. Szmigiero (1):
      target/i386/kvm: Fix disabling MPX on "-cpu host" with MPX-capable host

Paolo Bonzini (3):
      thread-pool: optimize scheduling of completion bottom half
      thread-pool: replace semaphore with condition variable
      thread-pool: remove stopping variable

Viktor Prutyanov (1):
      contrib/elf2dmp: add ELF dump header checking

Vitaly Kuznetsov (6):
      i386: Use hv_build_cpuid_leaf() for HV_CPUID_NESTED_FEATURES
      i386: Hyper-V Enlightened MSR bitmap feature
      i386: Hyper-V XMM fast hypercall input feature
      i386: Hyper-V Support extended GVA ranges for TLB flush hypercalls
      i386: Hyper-V Direct TLB flush hypercall
      i386: docs: Convert hyperv.txt to rST

Yang Weijiang (1):
      target/i386: Remove LBREn bit check when access Arch LBR MSRs

 docs/hyperv.txt                | 270 ---------------
 docs/system/i386/hyperv.rst    | 288 ++++++++++++++++
 docs/system/target-i386.rst    |   1 +
 target/i386/cpu.h              |   5 +-
 target/i386/kvm/hyperv-proto.h |   9 +-
 backends/hostmem.c             |   2 +-
 contrib/elf2dmp/qemu_elf.c     |  53 +++
 hw/audio/ac97.c                | 752 ++++++++++++++++++++---------------------
 hw/ide/core.c                  |   6 +-
 hw/ide/macio.c                 |   4 +-
 target/i386/cpu.c              |  16 +
 target/i386/kvm/kvm.c          |  76 +++--
 util/thread-pool.c             |  74 ++--
 13 files changed, 823 insertions(+), 733 deletions(-)
 delete mode 100644 docs/hyperv.txt
 create mode 100644 docs/system/i386/hyperv.rst
-- 
2.36.1


