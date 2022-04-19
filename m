Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA15067A5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:24:51 +0200 (CEST)
Received: from localhost ([::1]:44434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngk6M-0001yn-Nu
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ngjqy-00048V-Tg
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:09:04 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ngjqw-0007rd-OP
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:08:56 -0400
Received: by mail-pf1-x433.google.com with SMTP id a15so477799pfv.11
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e8xqzWknn8xYvk/+Uuko5kRvnUv2h3xmnJDuVMwN5C4=;
 b=TB0dCJ/aQwUhWlIAKOQjMD7OXjKxlAh0rq4YNNz2yD/nGqWUV42KAA/ozIDvU77M+E
 aXPdLnLi4eR5wJPVh4mFoUi2upIG1ejmV8k7b+JnrsXwXs+azGxl3VyHdGkJvS82G8jy
 hIeoTUtyi8QOTUYmjzX02595Eb8uI5jtVEGYyxDJG9j9MBVqZBl1C+eEve3ZATnAjw4W
 KBYrTxGmez+G9FakMYMCMHwVX1OvzKNuQjQtvgm5fqBWxnXeuJlHa1ZrhYrYz40UA/X0
 0jjcsISME1jqgQrQYxpLALvZ4SfMjSAukhfviu3vFFXZGuKK2ZWpvsaboMnpTSlb+g0I
 RiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e8xqzWknn8xYvk/+Uuko5kRvnUv2h3xmnJDuVMwN5C4=;
 b=iY0e+Qct5Vmh9VCDVDLjO+Ch0FrBqBf7jATeTJMaDMNEc8S9NZDgFkj2nVKRMZRmph
 J6JjB3R55voFqsZGFcJd4BbPVjXIVFSLEl2k01OfexohgLltl7QUH+9XHt+fMVSwHOSY
 t/5TOS7yxT3mWUZNt82l2BP09H8SHmRY7ENr9PJujjET5iLIE4QDAJNCohG/YOhgujg3
 Ekp6hFOsO56hWZuNUalL7OsVtYoi43W7HMOHS6WZN6FPqevr5NO58X/g30e/qONUPbOb
 YLMQRZvbSlLPhvxfMdq8fPQb2G4G1FtEygvwiZBGU5/a4JZ5PTk+JkQy8crnZXRprSiI
 l/zw==
X-Gm-Message-State: AOAM531CwY4ccN9Dgc+fLKfMSiafMEXI0JmEFxlBgS9aGERaYlYTj9P7
 mApbGOXR88pjSv05y5PZEbxo9cKGS8zBtF7/
X-Google-Smtp-Source: ABdhPJxKTNqzahjbBnHnEjva/9MpDw+HlmmwxWC9bQh1MdOVxyoADbTr9hwMWRwP1dFR24TGmJwBgw==
X-Received: by 2002:a63:e413:0:b0:3aa:2742:3624 with SMTP id
 a19-20020a63e413000000b003aa27423624mr3702858pgi.404.1650359332918; 
 Tue, 19 Apr 2022 02:08:52 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 fv7-20020a17090b0e8700b001ce18c551dcsm14963381pjb.19.2022.04.19.02.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:08:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] Support ACLINT 32/64-bit mtimecmp/mtime read/write
 accesses
Date: Tue, 19 Apr 2022 17:08:41 +0800
Message-Id: <20220419090848.9018-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

This patchset makes ACLINT mtime to be writable as RISC-V privilege
spec defines that mtime is exposed as a memory-mapped machine-mode
read-write register. Also, mtimecmp and mtime should be 32/64-bit memory
accessible registers. ACLINT reset function is also added, which requires
mtime to be resetable if we need to support core power-gating feature in
the future.

This patchset is the updated verion of:
https://patchew.org/QEMU/20220126095448.2964-1-frank.chang@sifive.com/

Changelog:

v3:
  * Forbid 8-byte write access to timecmp_hi and time_hi.
  * Add ACLINT reset function.

v2:
  * Support 32/64-bit mtimecmp/mtime memory accesses.
  * Add .impl.[min|max]_access_size declaration.

Frank Chang (3):
  hw/intc: Add .impl.[min|max]_access_size declaration in RISC-V ACLINT
  hw/intc: Support 32/64-bit mtimecmp and mtime accesses in RISC-V
    ACLINT
  hw/intc: Make RISC-V ACLINT mtime MMIO register writable

Jim Shu (1):
  hw/intc: riscv_aclint: Add reset function of ACLINT devices

 hw/intc/riscv_aclint.c         | 144 ++++++++++++++++++++++++++-------
 include/hw/intc/riscv_aclint.h |   1 +
 target/riscv/cpu.h             |   8 +-
 target/riscv/cpu_helper.c      |   4 +-
 4 files changed, 121 insertions(+), 36 deletions(-)

--
2.35.1


