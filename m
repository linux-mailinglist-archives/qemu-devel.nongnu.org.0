Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8763F47B892
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 03:51:59 +0100 (CET)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzVFu-0005aj-Mm
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 21:51:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEH-0003an-O7
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:17 -0500
Received: from [2607:f8b0:4864:20::102c] (port=40870
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEG-00009w-7r
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:17 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 o63-20020a17090a0a4500b001b1c2db8145so1071219pjo.5
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 18:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/oHt1+8v6mAbfLXzY0EZ0V5CLrO1igvqnsQslKdSg/Q=;
 b=eTr27oTjE8fZdFEUuB0Ne7I/hUw4JNHejIyq4+TqgkoK7xI0myXpT6G1TLLwY4zwgm
 icN5Cj+j0j23CYuz7vRQm8wr6jRT+C11gjV4jZ3ArQO4JDTmZpj6H+lUistXDWvdmEm3
 CNgH6idDBgXzSnLKINFOEsHKpwFMYU+kwApFHFesudDCN2ef/g7/Y3IwvDPDhDQ3Sg1+
 1AWCaPb8GwhJ+ZN4s+awsKXx0OBnKk6TLaQ6HH6AlnAks7FTnLDnZqViaxQbmX+m++7c
 PWKz3e4yVDawIitF5HoAoa2ZtcsmLKFzU45+Fyce6cxBNXaDa+aHWg88/JlF3wYHj4Tj
 Ixjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/oHt1+8v6mAbfLXzY0EZ0V5CLrO1igvqnsQslKdSg/Q=;
 b=k42tINCl4opwoB0TtXBP89v+KGTwWIiHG632Z1j76BteyPDohldaYUkBI9SIbRB1Bg
 G0AzLkk8WDwvPENFhaG27hqK23TEXM55FZi8pCRlmOXd+3plarNxXg++x6LSzPNKb02D
 qPF/mcsMNd/3/7sEmT979HgEQGMJ07daO6+Y35dF3nB8RYdhtudG1g8Dd9FkaHvpExCT
 wvpJClcIZxDIjtpsbVdQHVh3I2tbk3tPWw1mUHjiaiynHDm79Q2N6/KT8WqW8dFhVo5r
 YUEkgF6+pP4JIbvCghmkfY10ljvIa8uDDBpWt3NrQN6pNv0eKy2hFUMpGZdkl7JCd56l
 FZpA==
X-Gm-Message-State: AOAM53121u9ZRBFLKjsARVA9GXxZ0OTOHihAAQFf+6XcLHukoeiHBwgr
 GLJnLnpFhUM/Hd8e2nWEEMFRVh0FBdzMuw==
X-Google-Smtp-Source: ABdhPJwJR0L2iPIDFBBEeilsQl4YgoU2FvcoHibHcRtZiOauUtS0/Py1lBs/rHMJm667qj75Uq535g==
X-Received: by 2002:a17:90a:f682:: with SMTP id
 cl2mr1334420pjb.124.1640055014688; 
 Mon, 20 Dec 2021 18:50:14 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id bg23sm694025pjb.24.2021.12.20.18.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 18:50:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] linux-user: nios2 fixes
Date: Mon, 20 Dec 2021 18:50:05 -0800
Message-Id: <20211221025012.1057923-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes syscalls and signals for nios2.
Works with the docker cross-compile toolchain that has been committed.

r~

Richard Henderson (7):
  linux-user/nios2: Properly emulate EXCP_TRAP
  linux-user/nios2: Fixes for signal frame setup
  linux-user/elfload: Rename ARM_COMMPAGE to HI_COMMPAGE
  linux-user/nios2: Map a real kuser page
  linux-user/nios2: Fix EA vs PC confusion
  linux-user/nios2: Fix sigmask in setup_rt_frame
  linux-user/nios2: Use set_sigmask in do_rt_sigreturn

 target/nios2/cpu.h          |  2 +-
 linux-user/elfload.c        | 66 ++++++++++++++++++++++----
 linux-user/nios2/cpu_loop.c | 93 +++++++++++++++++++------------------
 linux-user/nios2/signal.c   | 56 +++++++++-------------
 linux-user/signal.c         |  2 -
 target/nios2/translate.c    | 26 +++++++----
 6 files changed, 146 insertions(+), 99 deletions(-)

-- 
2.25.1


