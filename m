Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1223346F12
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:52:27 +0100 (CET)
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsh8-0003fj-Q1
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOsYh-0005vb-WE
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 21:43:44 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:45054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOsYa-0005ht-6F
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 21:43:41 -0400
Received: by mail-oi1-x235.google.com with SMTP id a8so19178475oic.11
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 18:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lgJuuAsGIv+rXk/SCDM6mqKwzHvk0QF7NBuSRYiRcYk=;
 b=lV8VeS1efYiyIsxOfM8r5zwS16FRICraD9Wow8vA+vmTSSqyJw+O6GlOOjNa+3Du/r
 5mu4FQ5K4lgiXg9BPqiy+Xd5DwbCVe9LoXohQa4Fv4CPxrtbkyRGT1aYgeMtZqEVrlR7
 lsklVwriR0C7f6dt7yn2ufrwbWYtTlVZb9iR0hrqoqWB44RJDx+zhLD/F5gi9VgPEz70
 R1ZViBrDZjVSFm2eEWBxP7xvJ09+TkfI40KXbZxCaotX8njsGro6xRSgNa+DbZJFrJsz
 azOzqnSEchlQOCFbIXmO4Rs2rC9KRBwLX4prqNFPD1h68+ZShir2IBAGgQJcBayO4Apu
 Q20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lgJuuAsGIv+rXk/SCDM6mqKwzHvk0QF7NBuSRYiRcYk=;
 b=QP/ocSutgOQysIdBe8W+lcgCNiDkok+Y1XlcnGGuvYn2OoCy1waLmvvoDCknMG2we6
 b5TigmZYs+7cCSuMEdBaUkYkJi0mitTKQnc1vIyzQxBEyuUctzSLBznHZrCCSa0bjXkG
 ll6qdWrCH24LpSRhMsuXGK06B94zObNZ9KCfjtRpv13f/LuN8lTOEAkyokmyALNUenib
 jhjrY69RZXtsO50n1rEmz9MRtvvbwgoIUqXVD54WE8P7Bqk4c6YXUxHCgga8y7I0aHxT
 Uh45WdNCLOBhlFhO+chEHz7LE+PawphTNXzqGcQoOzpQSdnBfDEPHFC9BMuG4rwN2yv3
 1gqg==
X-Gm-Message-State: AOAM531pXgkBiLveBdknDl1GOzRbhv6nOcM6yAuKwyE8IC+SM+uppUiS
 vlEfhvmy6ipCE7JADcs43qTpco+ORNtVoXSk
X-Google-Smtp-Source: ABdhPJwiN/a5kuvcLF7rSLEUq8ecnRNZc0PEMZaSlrWKBdCft8tOBFIuTzWMag3VCjxElChRgWD7xg==
X-Received: by 2002:aca:e146:: with SMTP id y67mr742557oig.90.1616550213880;
 Tue, 23 Mar 2021 18:43:33 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id c9sm203601ooq.31.2021.03.23.18.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 18:43:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] tcg patch queue for 6.0
Date: Tue, 23 Mar 2021 19:43:27 -0600
Message-Id: <20210324014332.6331-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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

The following changes since commit 266469947161aa10b1d36843580d369d5aa38589:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-03-23' into staging (2021-03-23 22:28:58 +0000)

are available in the Git repository at:

  https://github.com/rth7680/qemu.git tags/pull-tcg-20210323

for you to fetch changes up to 44b99a6d5f24afcd8476d0d2701e1ca4ab9b35c1:

  exec: Build page-vary-common.c with -fno-lto (2021-03-23 19:36:47 -0600)

----------------------------------------------------------------
Workaround for macos mprotect
Workaround for target_page vs -flto

----------------------------------------------------------------
Richard Henderson (5):
      tcg: Do not set guard pages on the rx portion of code_gen_buffer
      tcg: Workaround macOS 11.2 mprotect bug
      exec: Rename exec-vary.c as page-vary.c
      exec: Extract 'page-vary.h' header
      exec: Build page-vary-common.c with -fno-lto

 configure                |  19 ---------
 meson.build              |  21 ++++++++-
 include/exec/cpu-all.h   |  15 ++-----
 include/exec/page-vary.h |  34 +++++++++++++++
 exec-vary.c              | 108 -----------------------------------------------
 page-vary-common.c       |  54 ++++++++++++++++++++++++
 page-vary.c              |  41 ++++++++++++++++++
 tcg/tcg.c                |  22 +++++-----
 MAINTAINERS              |   2 +
 9 files changed, 167 insertions(+), 149 deletions(-)
 create mode 100644 include/exec/page-vary.h
 delete mode 100644 exec-vary.c
 create mode 100644 page-vary-common.c
 create mode 100644 page-vary.c

