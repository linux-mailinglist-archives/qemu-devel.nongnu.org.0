Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E413848363A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 18:35:46 +0100 (CET)
Received: from localhost ([::1]:48078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4RFK-0006fA-12
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 12:35:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RDA-0004bK-PX
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:33:32 -0500
Received: from [2607:f8b0:4864:20::534] (port=43830
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RD8-00088l-1B
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:33:32 -0500
Received: by mail-pg1-x534.google.com with SMTP id 8so30581819pgc.10
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 09:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dhyLDhJxviT7Nl2YqmMcOySDo+jc6egc2s/azRKRrJo=;
 b=hYLF/NDdorFNKOc3A8Htz2eEXCxwU8NK/Xn1RZKvRzWY8wrp+0GOA3AM066en79+LQ
 9cCq1XDwPUdwx+oZVhPRbIP5Rp4MO+avQuKPM8EkoC9HVwX6NWJCsygDSveCxc0q/TIP
 sg1f+nzvu1GoNF3+qdugps467/3LMk5jL85C8LBRuzkqEBYWcaJODlLZtpLLbHs1A80+
 voO91vpq+hDxuZ6My5ADHR84e8Fot4dZ53lYpxbWmVO56Bi5CaS5u+9UI7IAhWsR/LZk
 jzEKflRhqRqH4lZJNv61CaqBuzCOHGVcAzCXdYAr5S/yvXljg8vhkWDee49rOgWRNEj3
 W2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dhyLDhJxviT7Nl2YqmMcOySDo+jc6egc2s/azRKRrJo=;
 b=l5a0IkrHpwZS1NC6c52MvFx0JwuwQEGFau2BBRDD3L5EfxQ3SfDzfwHMipD/Rhev01
 dfcvMAjC5lHhBNJltSl6KIFXjY3V+GGcQyZmVCPPQp+wcE3eF9HR7tl/1phCWKit1ZnT
 efdqu7Z7V5RN9EpTWkH9XDAk6iTDIxz3eB0W98pfg5qa0UNZcTZiZtXIwKS8WZfTEKCX
 FDzGYdlL7WTtUXGsPZ9CfJyNdDF0zTgYG9it5ZFDGQ7HpxE6GFV0ZUR02BfixEpjBFkR
 jmBC2htQ0Voq9/YdZEzl6oALQowuYojdYUbBgUTJbS0alVAmVqmZGedf2uG62cdFMaqd
 o0lg==
X-Gm-Message-State: AOAM5304EAc8SL0+GIk0jgrN1dXK2tKZ/PuWdjQykJ074OPerdnEcBBo
 V/UlaAmQzwXlSoEbCYQnbvs+5X2ogNS8Zg==
X-Google-Smtp-Source: ABdhPJwjG6V03KXkz3uWB7PhmMj2eA3qOHqxIXPdWh/zVeORGFChaduhvZCE8LlvYbENjpI7vVvraw==
X-Received: by 2002:a05:6a00:1ac7:b0:4bb:7601:df3 with SMTP id
 f7-20020a056a001ac700b004bb76010df3mr47516357pfv.21.1641231207219; 
 Mon, 03 Jan 2022 09:33:27 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s14sm39348564pfk.171.2022.01.03.09.33.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 09:33:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Misc patch queue
Date: Mon,  3 Jan 2022 09:33:21 -0800
Message-Id: <20220103173326.257152-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 69f153667fce723ee546d2f047d66d0cfa67c3cc:

  Merge tag 'memory-api-20211231' of https://github.com/philmd/qemu into staging (2021-12-30 17:02:42 -0800)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-misc-20220103

for you to fetch changes up to 5c23f0c3191907000bab278654570a7d5879822a:

  gitlab: Disable check-python-tox (2022-01-03 08:55:55 -0800)

----------------------------------------------------------------
Fix some meson conversion breakage
Disable check-python-tox
Fix emulation of hppa STBY insn

----------------------------------------------------------------
Richard Henderson (5):
      meson: Unify mips and mips64 in host_arch
      tests/tcg: Use $cpu in configure.sh
      tests/tcg: Unconditionally use 90 second timeout
      target/hppa: Fix atomic_store_3 for STBY
      gitlab: Disable check-python-tox

 configure                      |  2 +-
 meson.build                    |  2 +
 target/hppa/op_helper.c        | 27 +++++++------
 tests/tcg/hppa/stby.c          | 87 ++++++++++++++++++++++++++++++++++++++++++
 .gitlab-ci.d/static_checks.yml |  2 +
 tests/tcg/Makefile.target      | 12 +++---
 tests/tcg/configure.sh         |  2 +-
 tests/tcg/hppa/Makefile.target |  5 +++
 8 files changed, 118 insertions(+), 21 deletions(-)
 create mode 100644 tests/tcg/hppa/stby.c

