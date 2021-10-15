Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9D442EE3B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:57:24 +0200 (CEST)
Received: from localhost ([::1]:41802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJxr-0004Sk-RS
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mbJvn-00030j-4b
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:55:15 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:33348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mbJvl-00050s-El
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:55:14 -0400
Received: by mail-lf1-x12d.google.com with SMTP id j21so39820088lfe.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=pNU0CgmwhYQxrEI7GLsLMVt2YLQB0CbS2czTIccyHug=;
 b=QqjxR6fLXlcnsl053njurzK9URVp3W+g1KsBeR6ow/JTbW/rBaUSh+dqZUtx0UlMBf
 ZOJqjMqOG5TUjRhPsJpn0/0mV6RHAnc7KgMouRmpu4CX93BEVe3JCWITThZZPNugqWQr
 gHQxu1f1BHasoBXilo3zHbtsknb7xboxrDy8gNWkS0sN6P4b4N4pvMSbm8SFmwpIKp4s
 lG0Fvcnzb/9pe8qQlX/q7w6EAbgHk3DyH+L6oK992JUnU5x3rwQxA8X/qIrEwD5syAZc
 Su34iceZaz50evwmZSSadUPLzHKzkVQNOtM9KdRx9T8Lqc2CrrTmY9VIqXJ4oevSxrDv
 jfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=pNU0CgmwhYQxrEI7GLsLMVt2YLQB0CbS2czTIccyHug=;
 b=QyjabzbfMl8cYUkxHu+w/ufABs5tuSZ3V8BYt7qtWBkIzNCSMGj78GP3cJDOr+hLKZ
 NMcPv8k3rBess2+S1XYSDFm4R8FsQJY1zfb4k08N52pnVZhhofIxiTTlqb9JrfHxHiW4
 3wxR5DkkSaUKLhr+ujYGQrWvXxx2xD1q5bPoMnl1BUFLYCWZa/75flexX+3dH//wwgLB
 IQuJfWSmXcZuvua25qzr6Atap0u4G+Cxke7W8raflsmB5yxPj9uy2MWqXYPebc15anR3
 VDNm3Lco9t5svRpdd09c0JGSiZtiO5C6WJd//nzBlFsHU6tjwK+rGHbV/Zv2qbVUhgoJ
 liug==
X-Gm-Message-State: AOAM533Hc7pNIrhvJZI2NB20LmHR2dVfchLrSQYm4woaJ0+46sw+bd0V
 0nTEElvvdW+Kg6kJrVYXNGf1Yq/t6ICtpQ==
X-Google-Smtp-Source: ABdhPJx4FB9BPkRWVMu8o0S01o0zEt4xsqIjpmvkSS73IxvbYPAQ5M4AJeRLH0VFesakk0h+yzsl1w==
X-Received: by 2002:a05:6512:13a0:: with SMTP id
 p32mr10646749lfa.492.1634291710909; 
 Fri, 15 Oct 2021 02:55:10 -0700 (PDT)
Received: from pc-System-Product-Name.intra.ispras.ru ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id u25sm458042lfr.279.2021.10.15.02.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 02:55:10 -0700 (PDT)
From: NDNF <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] plugins: add a drcov plugin
Date: Fri, 15 Oct 2021 12:55:06 +0300
Message-Id: <163429165642.439576.16356288759891202632.stgit@pc-System-Product-Name>
X-Mailer: git-send-email 2.25.1
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: alex.bennee@linaro.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches adds the ability to generate files in drcov format.
Primary goal this scripts is to have coverage
logfiles thatwork in Lighthouse.

Changelog:

v2:
  * Added path to executable binary file.
  * base, end, entry have correct values now.
  * Added option: "filename" for output file.
  * Install an actual tracer when the TB gets executed.

Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>

---

Ivanov Arkady (2):
      src/plugins: add helper functions for drcov
      contrib/plugins: add a drcov plugin


 contrib/plugins/Makefile     |    1 
 contrib/plugins/drcov.c      |  148 ++++++++++++++++++++++++++++++++++++++++++
 include/qemu/qemu-plugin.h   |    5 +
 plugins/api.c                |   27 ++++++++
 plugins/qemu-plugins.symbols |    4 +
 5 files changed, 185 insertions(+)
 create mode 100644 contrib/plugins/drcov.c

--
Ivanov Arkady

