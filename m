Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1600A602D86
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:57:24 +0200 (CEST)
Received: from localhost ([::1]:35752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn5u-0001lM-AI
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgU-000226-AV
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgE-0004wr-Up
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CD1zBqAg6nvG2guy+ngIYW33Ag9uH/cxYgILvw8a/gs=;
 b=N1dgluwtZ2o/jyweVThE+ArJ6hbFRPliHX9KRRt9TAC48PttcJ5Wz+R1r71vIvP2+xs4Rp
 d7xp5bG6++m3iclT1gvLqE89y62IGSq64d7G1gftm37b/NSXIK02Wne4X63/0ff8pEkLzC
 6Y3DKVFUR2ZtZCUr65COVEhxSggH3Xg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-pfP41Pn5MI61TQZXrSeuQQ-1; Tue, 18 Oct 2022 09:30:48 -0400
X-MC-Unique: pfP41Pn5MI61TQZXrSeuQQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 nc4-20020a1709071c0400b0078a5ceb571bso6341859ejc.4
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CD1zBqAg6nvG2guy+ngIYW33Ag9uH/cxYgILvw8a/gs=;
 b=tVzrSsi53lEYL9Zw8mvfRlkpxIT7iqzncLUZhloM6S45k1QCah8OBQKNzXFaxw3u/Y
 vYvEunYEXRkp1YHQENHKdYF6y2msMG6uElyBgha2uWtV5Nyp8uiQ+sKd84o1ioOIT+t8
 dG370YoSzsSGQopXKEAQFmM+PXFPHSdgOFoAUXAkiqJvXbbIwlyouZHqQP+wV4Z7s4zp
 VBD11LS86H4im2o27KuiFZ9DQ/9t1aVCgSvgqqmqsHg9NIrW2IbMdzYVHod9qHJy4Ol6
 VaFnRX+8GeuzVxtEEm3IPNnjKC3Bs2j3A2+bgxr5RvsYlO/DV/8Q1DoX5Wi+dLBqI0rM
 owNg==
X-Gm-Message-State: ACrzQf0cKtcUK2nb8tjTFAbGUAk6q1TuaXlEDStt57hD7Z2hppU6cEs3
 YKx1MJMqhsUVejkgoAIDNAn5Fc/lAn48WnNGR2Q8k+1I4UBaNmxpsGFASXtuFybm6uYlQ5rPWg7
 ++4EptOQvh0fKX+/L5Uz6pfI8EUhqVjt3hWgpoEMJy7IzD+bhKob+7B7wLmg9JudT7Dw=
X-Received: by 2002:a17:907:3201:b0:741:94f2:aeaf with SMTP id
 xg1-20020a170907320100b0074194f2aeafmr2407021ejb.505.1666099846849; 
 Tue, 18 Oct 2022 06:30:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ipHuznVlAvUpMMMxUHWnHStlkf14MKAHRG7ZwO/nJS+PvYwCqxY/0p4U0GQE9j5b83Tgxbg==
X-Received: by 2002:a17:907:3201:b0:741:94f2:aeaf with SMTP id
 xg1-20020a170907320100b0074194f2aeafmr2406983ejb.505.1666099846291; 
 Tue, 18 Oct 2022 06:30:46 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 fd13-20020a056402388d00b0045b3853c4b7sm8888667edb.51.2022.10.18.06.30.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:30:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/53] target/i386, scsi, build patches for 2022-10-18
Date: Tue, 18 Oct 2022 15:29:49 +0200
Message-Id: <20221018133042.856368-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 2ba341b3694cf3cff7b8a1df4cc765900d5c4f60:

  Merge tag 'kraxel-20221013-pull-request' of https://gitlab.com/kraxel/qemu into staging (2022-10-13 13:55:53 -0400)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 653fad2497bed71d938827299cb9ac38ac333f9b:

  target/i386: remove old SSE decoder (2022-10-18 13:58:05 +0200)

----------------------------------------------------------------
* configure: don't enable firmware for targets that are not built
* configure: don't use strings(1)
* scsi, target/i386: switch from device_legacy_reset() to device_cold_reset()
* target/i386: AVX support for TCG
* target/i386: fix SynIC SINT assertion failure on guest reset
* target/i386: Use atomic operations for pte updates and other cleanups
* tests/tcg: extend SSE tests to AVX
* virtio-scsi: send "REPORTED LUNS CHANGED" sense data upon disk hotplug events

----------------------------------------------------------------
Maciej S. Szmigiero (1):
      hyperv: fix SynIC SINT assertion failure on guest reset

Michal Privoznik (1):
      configure: Avoid using strings binary

Paolo Bonzini (32):
      configure: don't enable firmware for targets that are not built
      target/i386: make ldo/sto operations consistent with ldq
      target/i386: make rex_w available even in 32-bit mode
      target/i386: add core of new i386 decoder
      target/i386: add ALU load/writeback core
      target/i386: add CPUID[EAX=7,ECX=0].ECX to DisasContext
      target/i386: add CPUID feature checks to new decoder
      target/i386: validate VEX prefixes via the instructions' exception classes
      target/i386: validate SSE prefixes directly in the decoding table
      target/i386: move scalar 0F 38 and 0F 3A instruction to new decoder
      target/i386: extend helpers to support VEX.V 3- and 4- operand encodings
      target/i386: support operand merging in binary scalar helpers
      target/i386: provide 3-operand versions of unary scalar helpers
      target/i386: implement additional AVX comparison operators
      target/i386: Introduce 256-bit vector helpers
      target/i386: reimplement 0x0f 0x60-0x6f, add AVX
      target/i386: reimplement 0x0f 0xd8-0xdf, 0xe8-0xef, 0xf8-0xff, add AVX
      target/i386: reimplement 0x0f 0x50-0x5f, add AVX
      target/i386: reimplement 0x0f 0x78-0x7f, add AVX
      target/i386: reimplement 0x0f 0x70-0x77, add AVX
      target/i386: reimplement 0x0f 0xd0-0xd7, 0xe0-0xe7, 0xf0-0xf7, add AVX
      target/i386: clarify (un)signedness of immediates from 0F3Ah opcodes
      target/i386: reimplement 0x0f 0x3a, add AVX
      target/i386: reimplement 0x0f 0x38, add AVX
      target/i386: reimplement 0x0f 0xc2, 0xc4-0xc6, add AVX
      target/i386: reimplement 0x0f 0x10-0x17, add AVX
      target/i386: reimplement 0x0f 0x28-0x2f, add AVX
      target/i386: implement XSAVE and XRSTOR of AVX registers
      target/i386: implement VLDMXCSR/VSTMXCSR
      tests/tcg: extend SSE tests to AVX
      target/i386: move 3DNow to the new decoder
      target/i386: remove old SSE decoder

Paul Brook (3):
      target/i386: add AVX_EN hflag
      target/i386: Prepare ops_sse_header.h for 256 bit AVX
      target/i386: Enable AVX cpuid bits when using TCG

Peter Maydell (3):
      scsi: Use device_cold_reset() and bus_cold_reset()
      hw/scsi/vmw_pvscsi.c: Use device_cold_reset() to reset SCSI devices
      target/i386: Use device_cold_reset() to reset the APIC

Richard Henderson (12):
      target/i386: Save and restore pc_save before tcg_remove_ops_after
      target/i386: Use MMUAccessType across excp_helper.c
      target/i386: Direct call get_hphys from mmu_translate
      target/i386: Introduce structures for mmu_translate
      target/i386: Reorg GET_HPHYS
      target/i386: Add MMU_PHYS_IDX and MMU_NESTED_IDX
      target/i386: Use MMU_NESTED_IDX for vmload/vmsave
      target/i386: Combine 5 sets of variables in mmu_translate
      target/i386: Use atomic operations for pte updates
      target/i386: Use probe_access_full for final stage2 translation
      target/i386: Define XMMReg and access macros, align ZMM registers
      target/i386: Use tcg gvec ops for pmovmskb

Venu Busireddy (1):
      virtio-scsi: Send "REPORTED LUNS CHANGED" sense data upon disk hotplug events

 configure                            |   55 +-
 hw/i386/microvm.c                    |    4 +-
 hw/i386/pc.c                         |    5 +-
 hw/scsi/esp.c                        |    2 +-
 hw/scsi/lsi53c895a.c                 |    4 +-
 hw/scsi/megasas.c                    |    2 +-
 hw/scsi/mptsas.c                     |    8 +-
 hw/scsi/scsi-bus.c                   |   18 +
 hw/scsi/spapr_vscsi.c                |    2 +-
 hw/scsi/virtio-scsi.c                |    8 +-
 hw/scsi/vmw_pvscsi.c                 |    6 +-
 include/hw/scsi/scsi.h               |    1 +
 target/i386/cpu-param.h              |    2 +-
 target/i386/cpu.c                    |   23 +-
 target/i386/cpu.h                    |   66 +-
 target/i386/helper.c                 |   12 +
 target/i386/helper.h                 |    3 +-
 target/i386/kvm/hyperv.c             |    4 +
 target/i386/kvm/kvm.c                |   26 +-
 target/i386/kvm/kvm_i386.h           |    1 +
 target/i386/ops_sse.h                |  700 +++++++----
 target/i386/ops_sse_header.h         |  347 +++---
 target/i386/tcg/decode-new.c.inc     | 1795 +++++++++++++++++++++++++++
 target/i386/tcg/decode-new.h         |  249 ++++
 target/i386/tcg/emit.c.inc           | 2234 ++++++++++++++++++++++++++++++++++
 target/i386/tcg/fpu_helper.c         |   88 +-
 target/i386/tcg/sysemu/excp_helper.c |  706 +++++++----
 target/i386/tcg/sysemu/svm_helper.c  |  234 ++--
 target/i386/tcg/translate.c          | 2094 ++-----------------------------
 tests/tcg/i386/Makefile.target       |    2 +-
 tests/tcg/i386/test-avx.c            |  201 +--
 tests/tcg/i386/test-avx.py           |    5 +-
 32 files changed, 5978 insertions(+), 2929 deletions(-)
 create mode 100644 target/i386/tcg/decode-new.c.inc
 create mode 100644 target/i386/tcg/decode-new.h
 create mode 100644 target/i386/tcg/emit.c.inc
-- 
2.37.3


