Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905761D1D34
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 20:16:25 +0200 (CEST)
Received: from localhost ([::1]:44684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYvvb-0005PM-2v
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 14:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYvpO-0003ed-Nz
 for qemu-devel@nongnu.org; Wed, 13 May 2020 14:09:58 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYvpN-0000KX-DB
 for qemu-devel@nongnu.org; Wed, 13 May 2020 14:09:58 -0400
Received: by mail-pg1-x533.google.com with SMTP id f4so89144pgi.10
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 11:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eV8fASr6zLNPOM9+MqNBiDQt3yfbdc9NuVmqRCKMy8M=;
 b=WCO/A1M8QQyXI3lxK3iQZw/57NL7oXtRPtkW2F8krPU9BtddrTZ2uteqna+uE6NKLh
 jg9mIfmtahAjz2j8ZzjElPp/YvrcFw3KGBEWlsdukB2KvFcBHHYsxMlGEiPlyHqeFYta
 uJvgO0QMhYb6IJqyQJ9EijV3s8pxDTlz/cIySJuh2mf4tvt5qBoXMFM5OOy3EeyLR8H+
 g3XEg3roqPeFOXKJ/24iaUrh7fsGfdHJV8Bc1b+1pJ3tjB03f9AQhwkIi9Y4RfgCZBSB
 reJeqd3X0BOm3geYhyQQaAiVC2hGulPk7smBue7ksJQBCoN6w0kIyjZv6/f5UZ9drJ5I
 zROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eV8fASr6zLNPOM9+MqNBiDQt3yfbdc9NuVmqRCKMy8M=;
 b=j+/5BFVrkse/uoGLd+Gg5t+0bS9uB/XzamRptNdujOTHi6AdYGI7Tr64CDvOXKxy5W
 89jDOKI9JBXmTRZTNwAfFSWpf2ZE6SFFDB5tKvxWbU1JOF3bedU41SFkfDxnOwGJiGUb
 J3gppdubtpA9tFhxVvSrKJosr3CGQPYKV9UoaZargQFobf0AIAdASl59rVw9Jcpqmu7E
 x4aGxVoxOgJrWnV1/DuoOwE16VXgnKmY4wpmEx9m/XTgXvbetzJxkmy9pBCKVR5GROtQ
 xp5taeDtdRM5UB08YMtxm31tUbuqKpCXNcKRO7kTH+DFiV1YtAYEBhCSXapsQtetx7Tp
 w7SA==
X-Gm-Message-State: AOAM530/iZtLWubOdJkjt6NzeLJn+lxOaE7x7Zvkyg/rAdfBz0HPdhef
 gy3eL6YPY1w17sVi7vK4JhH7TRAElg0=
X-Google-Smtp-Source: ABdhPJzWz3y48z15WLAgeW99lcPayPBdb1+1R8c+5ygH9VlsztmM9vj2+HOF873w9hTuyK/n5PjqrA==
X-Received: by 2002:a63:7519:: with SMTP id q25mr506986pgc.224.1589393395411; 
 Wed, 13 May 2020 11:09:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i185sm197361pfg.14.2020.05.13.11.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 11:09:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RISU 0/9] risu cleanups and improvements
Date: Wed, 13 May 2020 11:09:44 -0700
Message-Id: <20200513180953.20376-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set does alter the format of the trace files, and thus
means we'll have to re-generate these.  However, the space saved
for sve trace files is significant, so I consider it worthwhile.

In addition, the new --dump option allows one to inspect the
contents of the trace file.


r~


Richard Henderson (9):
  Use bool for tracing variables
  Unify master_fd and apprentice_fd to comm_fd
  Hoist trace file opening
  Adjust tracefile open for write
  Use EXIT_FAILURE, EXIT_SUCCESS
  Add magic and size to the trace header
  Compute reginfo_size based on the reginfo
  aarch64: Reorg sve reginfo to save space
  Add --dump option to inspect trace files

 risu.h                 |  12 ++-
 risu_reginfo_aarch64.h |  16 +---
 comms.c                |  26 +++---
 reginfo.c              |  45 ++++++---
 risu.c                 | 208 ++++++++++++++++++++++++++++++-----------
 risu_reginfo_aarch64.c | 192 ++++++++++++++++++++-----------------
 risu_reginfo_arm.c     |   6 +-
 risu_reginfo_i386.c    |   8 +-
 risu_reginfo_m68k.c    |   6 +-
 risu_reginfo_ppc64.c   |   6 +-
 10 files changed, 342 insertions(+), 183 deletions(-)

-- 
2.20.1


