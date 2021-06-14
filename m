Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B353A7283
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 01:33:55 +0200 (CEST)
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsw5a-00034r-Em
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 19:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3Y-0006CJ-NJ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:48 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3W-0007hG-JR
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:48 -0400
Received: by mail-pl1-x635.google.com with SMTP id h12so7467591plf.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 16:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U0u1TDygUmjjlTgrfJy721vPPoEGJeojxF2wpLFrDeU=;
 b=meOEoiQBj/NgOI81l3OUk4Us1Tks5IZKa0yoAUXmINy+F5WZvYUADEoBn0C8bK2Qd5
 SIhLiumX7NG+2L391KbYsC/mZiAINhfHZYCzLKYIjO7DrEeRDtIpH+NdhXZTs0m8uMYA
 Y91jnPT6KPUr9NUY5DwlzElxf/bMyZHziawajyGlT6AeRCVs2yt947GCn3HGlXSsJE3n
 2Yn/jGzre55r6Kkge0Y5h3TbVD+yLh5PxQXD9A96q1iBPgOQAUSeFU16uyqXonlCyqsq
 iZjqMGVgX8dmMnp+uCqvtKXRXBdWELzGdurAVkA0K9H4fa8YNO2SK+XuGMMc8q+tLxbD
 O/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U0u1TDygUmjjlTgrfJy721vPPoEGJeojxF2wpLFrDeU=;
 b=kQDNvivUwyON/3wfqGULYA1At5hpdrrLGwSdoirFAvLEQ2pwCBDfnMVYPfGFYQVcr5
 d64wHRBVt5zhPSsKXwCZFhnQkc3XOfGHz80IgU3gNHQf6fT61tMjWKFLAJ08Jv/tFXIV
 DDhrdhLJC8D8beAHOH05jm6x5iNI279CkKWLmD3TbNkA3hGS2GbdwVjW1bYFwJBj32ht
 GrZM012WZu1/UGr0ZRbNv5GJ6raQ7w1VNmjp8yidv7LZZfm/bYa0/sF6xuaoc5alT5tr
 LIgUhzdryXd3pxls2gGc1h/xCYpuUFmMS7AcWRrdk7rJUdkdRTuBWwtxJaCi24QRm08w
 OCiw==
X-Gm-Message-State: AOAM530OCVZZOQfM/NzYhBkWa8IzT6ySXAUaGTbXCa/vAiMFjl6uHJBi
 lnqJXGEvipGR5QC0ActQ0W8CGeV9sqMfqg==
X-Google-Smtp-Source: ABdhPJwrTJJelvvpOjC7QnrEMU1yOCKOx1XmcMqxMVOlYvob+TWyq38PNjzSYTRmvcnG1ia4ZyAU1A==
X-Received: by 2002:a17:90b:4004:: with SMTP id
 ie4mr22060808pjb.102.1623713505009; 
 Mon, 14 Jun 2021 16:31:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id gl13sm488113pjb.5.2021.06.14.16.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 16:31:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] configure: Change to -std=gnu11
Date: Mon, 14 Jun 2021 16:31:35 -0700
Message-Id: <20210614233143.1221879-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Now that we assume gcc 7.5 as a minimum, we have the option of
changing to a newer C standard.  The two major new features that
I think apply are _Generic and _Static_assert.

While Paolo created a remarkably functional replacement for _Generic
using builtins, the error messages that you get out of the keyword
are *vastly* more intelligable, and the syntax is easier to read.

While I'd like to prefer _Static_assert over QEMU_BUILD_BUG_ON
going forward, and would like to convert existing uses, that is
a much bigger job.  Especially since the test condition is inverted.
In the meantime, can drop the configure detection.

Changes for v2:
  * Remove QEMU_LOCK_FUNC and QEMU_UNLOCK_FUNC as unused.


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

 configure                   | 22 +--------
 meson.build                 |  2 +-
 include/qemu/compiler.h     | 51 ---------------------
 include/qemu/lockable.h     | 90 +++++++++++++++++--------------------
 include/qemu/thread-posix.h | 14 +++---
 include/qemu/thread-win32.h |  6 ---
 include/qemu/thread.h       | 15 ++++++-
 fpu/softfloat.c             | 16 ++++---
 util/qemu-thread-posix.c    | 24 +++++++++-
 util/qemu-thread-win32.c    |  2 +-
 10 files changed, 98 insertions(+), 144 deletions(-)

-- 
2.25.1


