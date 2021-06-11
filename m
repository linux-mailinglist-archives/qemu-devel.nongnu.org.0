Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958393A4B44
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:36:33 +0200 (CEST)
Received: from localhost ([::1]:58620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqhU-0006pR-2J
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqet-0004HA-LP
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:33:52 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqes-0006NB-01
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:33:51 -0400
Received: by mail-pf1-x42e.google.com with SMTP id q25so5680941pfh.7
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Su2+lNrIYiIwUqosKkObvIfBLeTcjXELFCaL6bYLt4g=;
 b=c77UcsjqfLycJKXeg9Yex4heanTKKzv1tTeNjRoWdHFSu8zQd3dv+0HhZ2uaWvMkjC
 Kgq4xfECVP+dtqwgp2uVaysVRjox6swnGAyaI7yZDU+CLMYhSsFFimXWGX0abj98o7MT
 m9HDy+552opbkGJy3bRRGHw9/SnZ62NzYkQD7i3oHcXwXz9VCQ9MXYTP51PluV8qRHii
 dJthkRPXXq1c9bt0bXR5SkL9INv5jsOfduB8LMGFoDnwqioHDRMqxRalPSH5E/gT+8OO
 tgiNYFuPV0LZA/XuToMqS3fmY2bzFSTOwrcgTw3YP9L94Q1uJr9LaN/P7VaBPsJU+/8S
 VuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Su2+lNrIYiIwUqosKkObvIfBLeTcjXELFCaL6bYLt4g=;
 b=t8cntkn9Tn4HVjRuqMH0waE/EBIj7eYkcgEPrJdA+h8Iej1xYaqwMoh15SvqA1BlFr
 FyiM/xuUWqVma5/rHw9+oH7mRfDtEXVtektkERYSfzKF7dQbYWC15ZYeIzhCzZkpnN7b
 SA44B9ps1a2MZtEeKwKMvzqrKpJFuTxFZ4lIhr2JA+7XbgrjJMnQRXMPxtlDnrsYNv+Z
 yDf0tRUhN4ba+SOZUZYXbP7GjAQDbL0zlL60e3DD74Sj5cLFhwhsImM49/RqdyhPmo/T
 uAq+1WYIDnlHjdxs/atkkor4Roi3vokVFnx581akeNi/Zq75jWdBFizw8WhYHBTnU6RC
 jD7w==
X-Gm-Message-State: AOAM533ghYbSCj1sTSl6axGOCCdewg+MYndu+myAjCfFeSe5BR8k5NYJ
 xgwdtbxGA3jMTr2gv/DvIGiKATdWW/MZCQ==
X-Google-Smtp-Source: ABdhPJzQrD/RAXF+Rn9kt5x6Bn0S0iy5yXp67azg4AJkWCFEAarKlD2QRUZdpAfLpoZZxSPe02V38A==
X-Received: by 2002:a63:1d18:: with SMTP id d24mr5793528pgd.355.1623454428156; 
 Fri, 11 Jun 2021 16:33:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m134sm6349606pfd.148.2021.06.11.16.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:33:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] configure: Change to -std=gnu11
Date: Fri, 11 Jun 2021 16:33:39 -0700
Message-Id: <20210611233347.653129-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we assume gcc 7.5 as a minimum, we have the option
of changing to a newer C standard.  The two major ones that
I think apply are _Generic and _Static_assert.

While Paolo created a remarkably functional replacement for _Generic
using builtins, the error messages that you get out of the keyword
are *vastly* more intelligable, and the syntax is easier to read.

While I'd like to prefer _Static_assert over QEMU_BUILD_BUG_ON
going forward, and would like to convert existing uses, that is
a much bigger job.  Especially since the test condition is inverted.
In the meantime, can drop the configure detection.


r~


Richard Henderson (8):
  configure: Use -std=gnu11
  softfloat: Use _Generic instead of QEMU_GENERIC
  util: Use real functions for thread-posix QemuRecMutex
  util: Pass file+line to qemu_rec_mutex_unlock_impl
  util: Use unique type for QemuRecMutex in thread-posix.h
  include/qemu/lockable: Use _Generic instead of QEMU_GENERIC
  qemu/compiler: Remove QEMU_GENERIC
  configure: Remove probe for _Static_assert

 configure                   | 22 +---------
 meson.build                 |  2 +-
 include/qemu/compiler.h     | 51 ----------------------
 include/qemu/lockable.h     | 85 +++++++++++++++++++------------------
 include/qemu/thread-posix.h | 14 +++---
 include/qemu/thread-win32.h |  6 ---
 include/qemu/thread.h       | 15 ++++++-
 fpu/softfloat.c             | 16 ++++---
 util/qemu-thread-posix.c    | 24 ++++++++++-
 util/qemu-thread-win32.c    |  2 +-
 10 files changed, 100 insertions(+), 137 deletions(-)

-- 
2.25.1


