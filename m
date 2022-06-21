Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8181553BE9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:50:18 +0200 (CEST)
Received: from localhost ([::1]:50334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3kpF-0000MI-Om
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3klw-0006br-1u
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:57 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:55116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3klq-000151-64
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:51 -0400
Received: by mail-pj1-x102e.google.com with SMTP id cv13so11408707pjb.4
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 13:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1egIKG1EQvT+rizECCkKqqYfjsX4BF8LJJB+4bwXsfU=;
 b=Cyk2FyWSV3FyebFRUi4Olfwau37amZQRvgKLBBNYPUw65K4Rfv4Y2IaxCEEMNmM0Z9
 fZbpfgx14rW4/yg3s2PDV6ZngBHjKIIF+B9i3PRUY6NJM2KN+eH2KPGBei32nHRsvPGs
 7oz3ovUdVVM8INXMwFLjjJ0eBZnTmDau7kdIQO7+cVHlt+kOHO/7LUL8PljYm9Y146ix
 W5PO+uhkVsNFs5b1gg3h9zdxyUsQhv5kfrR4w1N+BIhDr23wYcM28ecbLLJTqH9CG0vJ
 MtgwJOpS/sl6p5UtWE6CrNpNxwyzRxbituui2Z6i31Tgru8t7WJxFFgJ4Ee8A1gpvjt5
 zW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1egIKG1EQvT+rizECCkKqqYfjsX4BF8LJJB+4bwXsfU=;
 b=JHDkqmE5MUrsh9xedNTBf3K0ja1jG7MxZEWHv3AaRFJuyMwuFdxl67VCiMzg/SxMkL
 xkMyMNGcWDyxASsle3x753z4svmoPHnzRWtWBr/8KYUcE3OsL1nhyWNhr5Xe7Cax4Zxp
 FdH3V86zxK/Fs7mmhbxJib7jDeV+101Agt5p5ktBj8kJSHgx7KSNZx9qI0TsNUq2+F+C
 /IAhrGtJyNJHXhHcTpMFytomzTWcWsMrHX0EsKsP7C7r8ZeNxzj45IC7splddqED1a6g
 Xvo6ReeBSc0Gm/OqiOESb52hR9B/TaGGW9RaasAOhJBASt4zy5sFaFZemujEZhIx03Sd
 S5Og==
X-Gm-Message-State: AJIora87YROiDioKPhSi0IgyKKJTRCkgqAOFqrt0wbIuTCgxPuDKhaKz
 XWPTYnzkLpmORESSmOPx1gjwxLzIqx3axA==
X-Google-Smtp-Source: AGRyM1tev7e2+74Se+NH/Uo66b4uwrPxa0Pjz3TtI3bDBpqTbL8sygoYET5vpwWEsZqrxDO1hcUjUg==
X-Received: by 2002:a17:902:e749:b0:16a:2839:9e5 with SMTP id
 p9-20020a170902e74900b0016a283909e5mr11481042plf.48.1655844404492; 
 Tue, 21 Jun 2022 13:46:44 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a625b45000000b005252defb016sm3649674pfb.122.2022.06.21.13.46.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:46:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] tcg patch queue for 2022-06-21
Date: Tue, 21 Jun 2022 13:46:34 -0700
Message-Id: <20220621204643.371397-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The following changes since commit c8b2d413761af732a0798d8df45ce968732083fe:

  Merge tag 'bsd-user-syscall-2022q2-pull-request' of ssh://github.com/qemu-bsd-user/qemu-bsd-user into staging (2022-06-19 13:56:13 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220621

for you to fetch changes up to c79a8e840c435bc26a251e34b043318e8b2081db:

  util/cacheflush: Optimize flushing when ppc host has coherent icache (2022-06-21 09:28:41 -0700)

----------------------------------------------------------------
Speed empty timer list in qemu_clock_deadline_ns_all.
Implement remainder for Power3.1 hosts.
Optimize ppc host icache flushing.
Cleanups to tcg_accel_ops_init.
Fix mmio crash accessing unmapped physical memory.

----------------------------------------------------------------
Bin Meng (1):
      target/avr: Drop avr_cpu_memory_rw_debug()

Idan Horowitz (1):
      qemu-timer: Skip empty timer lists before locking in qemu_clock_deadline_ns_all

Matheus Kowalczuk Ferst (1):
      tcg/ppc: implement rem[u]_i{32,64} with mod[su][wd]

Nicholas Piggin (1):
      util/cacheflush: Optimize flushing when ppc host has coherent icache

Philippe Mathieu-Daudé (2):
      accel/tcg: Init TCG cflags in vCPU thread handler
      accel/tcg: Reorganize tcg_accel_ops_init()

Richard Henderson (3):
      softmmu: Always initialize xlat in address_space_translate_for_iotlb
      util: Merge cacheflush.c and cacheinfo.c
      util/cacheflush: Merge aarch64 ctr_el0 usage

 target/avr/cpu.h                |   2 -
 tcg/ppc/tcg-target.h            |   4 +-
 accel/tcg/tcg-accel-ops-mttcg.c |   5 +-
 accel/tcg/tcg-accel-ops-rr.c    |   7 +-
 accel/tcg/tcg-accel-ops.c       |  15 +--
 softmmu/physmem.c               |  13 ++-
 target/avr/cpu.c                |   1 -
 target/avr/helper.c             |   6 -
 util/cacheflush.c               | 247 +++++++++++++++++++++++++++++++++++++---
 util/cacheinfo.c                | 200 --------------------------------
 util/qemu-timer.c               |   3 +
 tcg/ppc/tcg-target.c.inc        |  22 ++++
 util/meson.build                |   2 +-
 13 files changed, 284 insertions(+), 243 deletions(-)
 delete mode 100644 util/cacheinfo.c

