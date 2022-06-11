Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AA954750C
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 15:57:27 +0200 (CEST)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o01cC-0000wC-VT
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 09:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o01a0-0006em-2V
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 09:55:08 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:38890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o01Zw-0003Ts-Qy
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 09:55:06 -0400
Received: by mail-il1-x129.google.com with SMTP id f7so1220553ilr.5
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 06:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XBFbCEkZ7oGiUNkMxqM+i9If5EDsx2zvfgO9qiyweyg=;
 b=XUF6PnKpmlmWy3TxAlt/0lVw1lWmPwRwhAsy9YL/bXjEO0w9yq0soiZlGM+DAmeCQI
 hPn+LhEqvl6L4+/CNjrUekOAiDSb3A4rTP0SQeo1ytUZRRVXdCcxLdsyGMtUadJZjePe
 +LJ9nL0BR5xb6lYtvdrsCZJio/muxeV05zKPp58bxl1WZ8mIJX5vajOqomboK8l2jwvz
 OQk5YNO9sMOHcPolHKuoJtj3aSzKKCDS0R0VZRqJkJX56x+s6iEbySOsHJUBosA5qJw3
 5jy4dL5XUm78W2BXUPvMlFkiH5xZ0qPq9FJ9Bn+li/AuKAT6XZi0IOzN99jNnP5w8B7u
 w5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XBFbCEkZ7oGiUNkMxqM+i9If5EDsx2zvfgO9qiyweyg=;
 b=dHeNJlqc3200OcSx0U+n1dKXjWd/o90VWEauazg2iOtiFoL8V00paub5iTeXYRnSy9
 vzTKCEFKKV+GH+TmYwOSKB5A3JtRd4OGXVsKXJsA4/Mdh5rOS5EWrWh01TTpTKqo3xjI
 oGmFPNqu8dRSX3lJwAdbVZyeShyjEWTowOjIH8WXWDsEbDLnElPwd0zO1FchiMY5p9nb
 c30jr9f//YHJILUx4u8PFG1rHINUjkvDfQrC0GJJCd87TeB19YPnR+XDENff3KKNCCG5
 6+W++cWZhmo2stuVEPO/G7noqZvxIb87xxd1N01wt7P4DVWz2ZJsJnumVaPKnnLgUGvp
 YFnw==
X-Gm-Message-State: AOAM531Ee+pJ9mtuoqK5S+rYBbGHhifP/dxWxWa0sM4JEWHxgVPu3RO3
 pID2QVuZhpeOZ4Np5HOWb7stIrEYIc0ONw==
X-Google-Smtp-Source: ABdhPJxvdtYsYdFhxzhtTSvsXkosmj5KuJqM2OH17LjJuOqIIDmME4tZyBIP8fs/iXg891uUPjGqBQ==
X-Received: by 2002:a05:6e02:1985:b0:2d3:bd36:7e1e with SMTP id
 g5-20020a056e02198500b002d3bd367e1emr29295033ilf.91.1654955701814; 
 Sat, 11 Jun 2022 06:55:01 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 13-20020a056e0211ad00b002d781cc0875sm1023578ilj.29.2022.06.11.06.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 06:55:01 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: def@freebsd.org, arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>, jrtc27@FreeBSD.org
Subject: [PULL 0/6] Bsd user preen 2022q2 patches
Date: Sat, 11 Jun 2022 07:55:08 -0600
Message-Id: <20220611135514.92882-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 2663c41cfa2c3be34c62de97902a375b81027efd:

  Merge tag 'pull-target-arm-20220610' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-06-10 13:16:48 -0700)

are available in the Git repository at:

  ssh://git@github.com/qemu-bsd-user/qemu-bsd-user.git tags/bsd-user-preen-2022q2-pull-request

for you to fetch changes up to 9554d33076771dcc284dc3fa1a87cd0e24b91d9d:

  bsd-user/freebsd/os-syscall.c: Implement exit (2022-06-10 22:03:50 -0600)

----------------------------------------------------------------
bsd-user upstreaming: read, write and exit

This series of patches continues the effort to get system calls working
upstream. This series was cleaved off a prior series to give me time to rework
based on the feedback from the first time I posted these. read, write and exit
are implemented, along with a few helper functions and tracing.

----------------------------------------------------------------

Warner Losh (6):
  bsd-user/freebsd/os-syscall.c: lock_iovec
  bsd-user/freebsd/os-syscall.c: unlock_iovec
  bsd-user/freebsd/os-syscall.c: Tracing and error boilerplate
  bsd-user/bsd-file.h: Add implementations for read, pread, readv and
    preadv
  bsd-user/bsd-file.h: Meat of the write system calls
  bsd-user/freebsd/os-syscall.c: Implement exit

 bsd-user/bsd-file.h           | 163 +++++++++++++++++++++++++
 bsd-user/bsd-proc.h           |  42 +++++++
 bsd-user/freebsd/os-syscall.c | 217 +++++++++++++++++++++++++++++++++-
 3 files changed, 418 insertions(+), 4 deletions(-)
 create mode 100644 bsd-user/bsd-proc.h

-- 
2.33.1


