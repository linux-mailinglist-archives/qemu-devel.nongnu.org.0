Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3384A4CE7B3
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 00:35:53 +0100 (CET)
Received: from localhost ([::1]:49948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQdwF-0005bz-MR
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 18:35:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQdut-0004Vy-IL
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 18:34:27 -0500
Received: from [2607:f8b0:4864:20::536] (port=35505
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQdus-0008D5-3F
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 18:34:27 -0500
Received: by mail-pg1-x536.google.com with SMTP id e6so10501570pgn.2
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 15:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VLjAFUNN93YrbMjmxzNEmvOQZXkxUVnMPGd9SBdp3CM=;
 b=DX1B3/v8yf22gV2UA4GHVy2qCtUJAdgeAGjuwnx0XUUkHRFvnLoaehjyBbEGkSSRaz
 z4k2t/fq/AIUBHle9z/GDpULHjkVzQTeSHxA7Er7cUUNwLyXXJ1nbnNG02U51vJ7kvsT
 t/6gBl6UaJRUkxVn2kpDPQgT1cnCKGJJCi6TKpYcjWJTcQNr9dzLxrNIHv6ZwKpNlbPo
 a5AoK3o3FAwCGrv6+VQT3WbhsGfF+uGiu/OC+LcUZM7Vf49NYZc+o4+7XTPJG2sAkTJK
 naae8knfRBFruYsw+KbUwkoGZTU87yJ6ApSip5+GU1XjwlQsX73omNiF/Oui4TRJlbct
 xtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VLjAFUNN93YrbMjmxzNEmvOQZXkxUVnMPGd9SBdp3CM=;
 b=pvL3V7EiwdibctpztJIN4gQqU8dEJc7muA76F1eCeROwd/6wc+8gYujSF7TH8kOwep
 P7Gmvd/bqnVnZspS2NAC6ngEK+TbAq2/UJdZEsm0+5QuCZuMLBWYlzqynekSwY3Fcc32
 ygYP994oT7nKY5LhY0h801OWW6w8OAqpbBH/7BZbjGF1u+NLuQOREB5KoG1S2psg4acD
 ZgxFNCNoLEidT/Tkglu+fA5I448K8QtIPy3IdTQAcA49a9duM8YftJK7KTkcdNhk+5YR
 TiD7/jWuGbm8kvLvwW4IpNQhLRZEPHYWZaK/MQIkshb4ugNjCB/+3TgXEkMc0gGcXHQo
 mn7w==
X-Gm-Message-State: AOAM531NcXZXJXcuOBDA39L2vYb/uA7hNQU+ur1yvD53jWoiYtWAg7Py
 eTm8ezAtd+s31VLn39yR+wNXWakSI3Q=
X-Google-Smtp-Source: ABdhPJyRaCfM3fKT+nzehhXmZAQmkSCbNc3Rfxo7MrFN8Unr/QCdON/X09rvqZuRwX/p07/Z16+KJw==
X-Received: by 2002:a63:8b41:0:b0:37f:f658:8fd1 with SMTP id
 j62-20020a638b41000000b0037ff6588fd1mr4038950pge.214.1646523264492; 
 Sat, 05 Mar 2022 15:34:24 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z192-20020a6333c9000000b0037c7a6f1798sm6061440pgz.7.2022.03.05.15.34.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 05 Mar 2022 15:34:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] accel|target: Remove pointless CPUArchState casts
Date: Sun,  6 Mar 2022 00:34:13 +0100
Message-Id: <20220305233415.64627-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Now than we can use the abstract CPUArchState, let's clean up.

Based-on: <20220214183144.27402-1-f4bug@amsat.org>
target: Use ArchCPU & CPUArchState as abstract interface to target CPU

Philippe Mathieu-Daudé (2):
  accel/tcg: Remove pointless CPUArchState casts
  target/i386: Remove pointless CPUArchState casts

 accel/tcg/cpu-exec.c        |  4 ++--
 target/i386/hax/hax-all.c   |  4 ++--
 target/i386/nvmm/nvmm-all.c | 14 +++++++-------
 target/i386/whpx/whpx-all.c | 18 +++++++++---------
 4 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.34.1


