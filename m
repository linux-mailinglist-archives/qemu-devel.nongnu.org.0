Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8BA5BF02F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:33:10 +0200 (CEST)
Received: from localhost ([::1]:40866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalnh-0008NI-GX
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzw-0006Kx-Nj
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzi-000227-EI
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7KIJ9WTVNgV9guJBtiMqg4+ARPVkPMLgFDIBqvhFnqY=;
 b=hlH8tQ35WjWYUmbilY8TAuI2oa32MIzJQY8QScb0CGH1G8Sc2LnZA+rU6oO4pqpR9wCrv2
 dX/yQ3LXrNAr/K32N0hbvGpk4B5LYoVMFx4A6GgAETTYwFijlhaI6AJtWuGdbFScAuVfGS
 JqN9eeAhALqVRyGZLX+oCVIJR6mpEKc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-241-YBZURryWPMCEqPsHVRftVA-1; Tue, 20 Sep 2022 13:25:11 -0400
X-MC-Unique: YBZURryWPMCEqPsHVRftVA-1
Received: by mail-ej1-f72.google.com with SMTP id
 he41-20020a1709073da900b00780bff831ebso1758219ejc.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=7KIJ9WTVNgV9guJBtiMqg4+ARPVkPMLgFDIBqvhFnqY=;
 b=3E7YPks892fTpN6WAIAQ4S7XKo+qVyiI2iSf/I12RJb0dE3k4n7PGhePs8RGvHFTyB
 GUjeAgkZLvcQRs+ayiIm9F43cORUPHRItH0Y2lxllR93WzA6Lo9xbqZ5ZVuWSFZkzRSy
 UNtD1cqzDpJ3R3HWV2Q2UXHVRIJEFGMDtkJRPn+JVlTf5sg8EPEdp555f/2qkpZN2MLI
 3bjLvHwCl9UfNvuvhw6f1FwoX00d0uGc/LCj3DCwiLjMU0qED09LirQjrYhirWw/9YTZ
 LSBHQmT6ZFZf2VTAemRW8Dps/BO8479ypMaa7OzG5nl2W1TNLvuxxBfwSw9dynadsK+c
 N67w==
X-Gm-Message-State: ACrzQf3zfuewXkkvDUMmlPB7LoOEGswb/MPe/SSdtJyD82hp3RlNYg14
 0shJpLNVY75o7oQf2hqZz7AkJgOQVTp3BG1JeG/3WAOBAeqcZ+rhM4Y19FhWDDZPZY/FfG8wYp9
 AARLqrvpzkhcHXLdnFjCIHcK6w/E+CuWkKmOmRTf85Kd9IqrY1VTwzWEfXyqu4iCACwk=
X-Received: by 2002:a17:907:970a:b0:77d:a10c:e089 with SMTP id
 jg10-20020a170907970a00b0077da10ce089mr17543555ejc.364.1663694710073; 
 Tue, 20 Sep 2022 10:25:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6j52ljQgM4WbZdhepXhFcz3/FW9YhPmLhUxDio5amGX+wpAuvTnP2bpQ0s7QAMmiNNGM+a8g==
X-Received: by 2002:a17:907:970a:b0:77d:a10c:e089 with SMTP id
 jg10-20020a170907970a00b0077da10ce089mr17543531ejc.364.1663694709786; 
 Tue, 20 Sep 2022 10:25:09 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a170906388400b0076feb45e2d7sm150727ejd.135.2022.09.20.10.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 00/37] target/i386: new decoder + AVX implementation
Date: Tue, 20 Sep 2022 19:24:30 +0200
Message-Id: <20220920172507.95568-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This is now mostly ready and has been tested quite heavily, but I expect
to repost a final version once the PC-relative code generation patches
are in.  I also plan to do more testing in the meanwhile, which might
well find other bugs of course.  I also have not looked at all into
XSAVE/XRSTOR support for usermode emulation sigcontext; this is already
a missing feature but it becomes more important for AVX.

Compared to the previous RFC there are a bunch of bugfixes, mostly for
big-endian systems but also for system emulation (XSAVE/XRSTOR, without
which OSes cannot enable AVX even though usermode emulation can cheat).
They are detailed below.  Code generation changes cover mostly what
was pointed out in the review, but also reusing the new functionality
introduced to fix bugs.  3DNow has been converted to the new decoder.


The series is at the i386 branch of https://gitlab.com/bonzini/qemu,
up to commit 94743924ea14103e348eb4ca533945213fa4018a.

The final patch, removing the old SSE decoder, seems to be too big
for the mailing list, so I removed the big hunk in the middle that
just deletes gen_sse and the tables above it.

Paolo


Bugfixes from v1:
* enter MMX for PSHUFW
* categorized MOVNTSS, MOVNTSD as SSE4A
* categorized CVTPI2PS, CVTPI2PD, CVTPS2PI, CVTPD2PI, CVTTPS2PI, CVTTPD2PI
  as non-VEX
* fixed length of argument of CVTPS2PI and CVTTPS2PI 
* fixed X86_SPECIAL_AVXExtMov which reversed MO_128/MO_256
* tested SSE4a and AES
* finished implementation of 256-bit AES instructions
* removed some unnecessary/wrong X86_SPECIAL_MMX annotations
* fix signedness of 0F3Ah immediates
* fixed big-endian support in patch 2 (old decoder)
* fixed big-endian support in MOVLPx, MOVHPx, MOVLHPS, MOVSD, MOVSS, PMOVMSKB,
  VEXTRACTx128, VGATHER (new decoder)
* tested system emulation, which actually covers XSAVE/XRSTOR

Other code generation changes from v1:
* more operations (addus, adds, subus, subs, minu, mins, mullw, mulld,
  broadcast, abs) moved to gvec
* pointer temps for helpers are generated lazily
* implement alignment restrictions for SSE instructions
* PMOVMSKB now uses extract2 or deposit
* looked into using maxsz > oprsz feature, but it does not work on
  big-endian hosts
* change tcg_const to tcg_constant
* fixed register changes before loads; unaligned loads always go through
  a temporary for the same reason
* reimplemented VZEROALL using gen_helper_memset
* reimplemented VZEROUPPER using gvec moves
* introduced new function vector_elem_offset, mostly for big-endian but it has
  a few other uses

Testing changes from v1:
* added more AES and VAES testcases

Decoding changes from v1:
* removed #define of gen_V* to gen_P*
* split group 12/13/14 decoding
* converted 3DNow to new decoder
* used decode_by_prefix where applicable
* interpret prefixes at decode time for 0F5B, 0F77, 0F78, 0F79, 0F7E, 0FE6
* cleaned up 0F6F, splitting 0F7F out of it

Other cleanups from v1:
* added remark on VEX.256 being available for MOVLPx
* changed disas_insn_new to return void
* moved switch labels out of if statements
* changed abort() to g_assert_not_reached()
* left out "default: abort()" altogether when applicable
* fixed spacing around vgather helpers
* removed some (most) inline markers, compiled with clang
* added const markers to all X86OpEntry arrays
* squashed move of scalar VEX operations into a single patch
* fixed checkpatch complaints (outside the table)
* improved some commit messages

Paolo Bonzini (32):
  target/i386: make ldo/sto operations consistent with ldq
  target/i386: REPZ and REPNZ are mutually exclusive
  target/i386: introduce insn_get_addr
  target/i386: add core of new i386 decoder
  target/i386: add ALU load/writeback core
  target/i386: add CPUID[EAX=7,ECX=0].ECX to DisasContext
  target/i386: add CPUID feature checks to new decoder
  target/i386: validate VEX prefixes via the instructions' exception
    classes
  target/i386: validate SSE prefixes directly in the decoding table
  target/i386: move scalar 0F 38 and 0F 3A instruction to new decoder
  target/i386: extend helpers to support VEX.V 3- and 4- operand
    encodings
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

Richard Henderson (2):
  target/i386: Define XMMReg and access macros, align ZMM registers
  target/i386: Use tcg gvec ops for pmovmskb

 target/i386/cpu.c                |   10 +-
 target/i386/cpu.h                |   59 +-
 target/i386/helper.c             |   12 +
 target/i386/helper.h             |    2 +
 target/i386/ops_sse.h            |  700 ++++++----
 target/i386/ops_sse_header.h     |  347 +++--
 target/i386/tcg/decode-new.c.inc | 1791 ++++++++++++++++++++++++
 target/i386/tcg/decode-new.h     |  249 ++++
 target/i386/tcg/emit.c.inc       | 2234 ++++++++++++++++++++++++++++++
 target/i386/tcg/fpu_helper.c     |   82 +-
 target/i386/tcg/translate.c      | 2117 ++--------------------------
 tests/tcg/i386/Makefile.target   |    2 +-
 tests/tcg/i386/test-avx.c        |  201 +--
 tests/tcg/i386/test-avx.py       |    5 +-
 14 files changed, 5298 insertions(+), 2513 deletions(-)
 create mode 100644 target/i386/tcg/decode-new.c.inc
 create mode 100644 target/i386/tcg/decode-new.h
 create mode 100644 target/i386/tcg/emit.c.inc

-- 
2.37.2


