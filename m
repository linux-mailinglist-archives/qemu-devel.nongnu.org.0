Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED563D68EC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:48:53 +0200 (CEST)
Received: from localhost ([::1]:45730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88Sy-0004Gd-Ni
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rk-0002Le-7F
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:36 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Ri-00064d-FX
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:35 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so980269pjb.3
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 14:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XkkMpDBXhAYyPCcb4zqpBx/YrT6Q370X+NlgFKUoQu8=;
 b=DyVq7Uz3VDv4+iWRtNMmWQQBEaPDUlmvbtFpjGYaYgiT+llty6gUdSS6ynUt1klF7b
 WvP9/RfRTzoR8sU3TeOS1GAXp0s9/+4gPJARUBul48tVgIwr6ouNlrupuHwECGRdvN/y
 x/w3dEXv1IklaFkfZM9gPtlvx8f8bxZ/8kriVBs0WleNGtqMursal+Xo8hUb6DHAgYmU
 JF9CDCMf9sqjsUhD5ca5vphg6n6v2gncOKQ31vsPrure2j4nTtIPDN7klG5rIVZ5XHcD
 /DHKJ97oesjivvqxn4mQs4pfZQRPA0QNaWdxiIDwJRlDpUei1hLkR3JLasztdvSQTpLM
 QqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XkkMpDBXhAYyPCcb4zqpBx/YrT6Q370X+NlgFKUoQu8=;
 b=TfpRQeQ5WPZCGGV+r7EobiN1c1g5ILeAx55DWKjviicnGQSOk8EvbNCqUq2aK0KUy3
 6gMiAmppuYf9JZ+is+V0ae21mprF/8wkodYhulerKQVygBHmz7v7ghLXfKvqmitBWdO1
 W/1EOs2SxLB3/02uK193aL/S0CTm3x5niMF+JP2EFbdb7dYWzSN/ASsYo2348VTTKWUp
 rKIIFeQfn+CsTJiz0JqZ+InNWjtnTe1dSDmMPIC4yQmLeXp0YIDdr51jHwDIP9MIgPbI
 2d/kW9XFWCBVBi+u0mYtjOcHigBqXps02uq7syQJgyGflp6pXP2JVIWiiAjfxncUJuvz
 GYmQ==
X-Gm-Message-State: AOAM532v0jbl4QkYNSOP7jt99esya1/RUNY6c9FtYyTDT1qX3tJnJ+YV
 uGRLs4xPZsnIYh2pvttqwyhr0MrFiYFpPA==
X-Google-Smtp-Source: ABdhPJx1BAphabBRVG04WcIn1Htem1z2EWV6SrfuqB985HWDkeyEJ0X0glo5BuWcVrk9rcag6EBeVA==
X-Received: by 2002:a17:90a:5141:: with SMTP id
 k1mr934368pjm.185.1627336052878; 
 Mon, 26 Jul 2021 14:47:32 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id e8sm997679pfm.218.2021.07.26.14.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:47:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.1 00/12] tcg and misc patch queue
Date: Mon, 26 Jul 2021 11:47:17 -1000
Message-Id: <20210726214729.2062862-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 34fd92ab4142bde5b54adacd16e6682f4ea83da1:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-for-6.1-rc1-230721-1' into staging (2021-07-26 11:00:15 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210726

for you to fetch changes up to 2bf07e788eb69bee843be274386fb20f4ab6b0f6:

  tests/unit: Remove unused variable from test_io (2021-07-26 07:07:28 -1000)

----------------------------------------------------------------
Fix icount accounting.
Replace bitrev8 with revbit8.
Fixes for set but not used warnings.

----------------------------------------------------------------
Mark Cave-Ayland (1):
      bitops.h: revert db1ffc32dd ("qemu/bitops.h: add bitrev8 implementation")

Peter Maydell (2):
      accel/tcg: Don't use CF_COUNT_MASK as the max value of icount_decr.u16.low
      accel/tcg: Remove unnecessary check on icount_extra in cpu_loop_exec_tb()

Richard Henderson (9):
      nbd/server: Mark variable unused in nbd_negotiate_meta_queries
      accel/tcg: Remove unused variable in cpu_exec
      util/selfmap: Discard mapping on error
      net/checksum: Remove unused variable in net_checksum_add_iov
      hw/audio/adlib: Remove unused variable in adlib_callback
      hw/ppc/spapr_events: Remove unused variable from check_exception
      hw/pci-hist/pnv_phb4: Fix typo in pnv_phb4_ioda_write
      linux-user/syscall: Remove unused variable from execve
      tests/unit: Remove unused variable from test_io

 include/qemu/bitops.h  | 22 ----------------------
 accel/tcg/cpu-exec.c   | 16 ++++++----------
 hw/audio/adlib.c       |  3 +--
 hw/m68k/q800.c         |  2 +-
 hw/pci-host/pnv_phb4.c |  2 +-
 hw/ppc/spapr_events.c  |  5 -----
 linux-user/syscall.c   |  3 ---
 nbd/server.c           |  3 ++-
 net/checksum.c         |  4 +---
 tests/unit/test-iov.c  |  5 +----
 util/selfmap.c         | 29 +++++++++++++++++------------
 11 files changed, 30 insertions(+), 64 deletions(-)

