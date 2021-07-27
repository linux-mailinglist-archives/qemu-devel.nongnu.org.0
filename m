Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1543D7B8F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 19:06:03 +0200 (CEST)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8QWn-00084b-RX
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 13:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8QVB-00068p-8X
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:04:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:42922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8QV9-0006YS-ML
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:04:21 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso2822195wmp.1
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 10:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y27q+3/HyGhxtXzcaoYMdlH1mQX2kS/1GAqqixuarnU=;
 b=Yruebt0ZLF/ql/RfK0d4EDs9DnaMNFt40L9ZCkFY8ff6EgKc9V30jyos9rGmovQiN4
 OeKv7X9vF/U4nS6Qpkw7b6dJfQ5YSijfGXPNOTTLYJOVePvO3PSSFxX7n+uwwztHN6Ru
 5FKS0HfdyGiF/s6S6mPms2705HGRSR4CZfRYDvlLN+4PvolZkx8leZ6lABZ+PQ9T/8qN
 e0IFS4JwvOhi49tw77mKxvYhAkd+nrX7BZeXaW69vqRFMNAVrZSsWGi9wc/QNy1Gl/Tg
 RQbu5eNQgvTfDBi/qzwkIbOJUF1uEVkWhRplrpZm5Ee6N6CHaF9cEDyqEAl3uOHMsThW
 dEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y27q+3/HyGhxtXzcaoYMdlH1mQX2kS/1GAqqixuarnU=;
 b=oa1MEhR0Xapi8qLHwqATx5TjWzOyIYjgE3XPEl+y2E+R/bJlgTfQhKg6JIe3OwGce6
 vUs8QCCWNl5cz08QrTwQF+L2D4/ueRnUGir/D5j40voJW4y5F+dCYyyZh8ti6642OgVt
 4wBBCep4SjvBpRuqT4BfVVurwxXJW+XQvTjE2dPwz+8CttvlI/ropxy3lQ+lPBZoeqnX
 tbars9GMAD4rfWnFu2yDCsdUFCpf3wZ6c7jk2qmFfB4XvV3Kf33MtbkTyJSm3F/XdL2X
 BHgPlJmqfH1MajCQ0TbL2dLHl7ZQjBAZeE70rHx0Axly57h0I6RhzP0bt7SifhJCRKFi
 7AFQ==
X-Gm-Message-State: AOAM530bePXww2vvJ8AYArZGSeC8sr2QaSbpFoRxp1sLbhW/b5n7Z6PC
 8nsae7FLoPlNA9ZzcUlCu/vSTD0j6oUrWA==
X-Google-Smtp-Source: ABdhPJzBxjFbygfPzJmjumpnvqutRBoiDZBbwMvBsp/xgCx23iwWJNSl5+RnvDMlDXbbaqs7uKXIAQ==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr11027219wmi.24.1627405456769; 
 Tue, 27 Jul 2021 10:04:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 129sm3708518wmz.26.2021.07.27.10.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:04:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] docs/specs: Convert various ACPI docs to rST
Date: Tue, 27 Jul 2021 18:04:09 +0100
Message-Id: <20210727170414.3368-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset does a basic conversion of four ACPI related files in
docs/specs from plain text to rST format.  The aim of the conversion
is not to produce a maximally pretty result, but simply to do a
low-effort conversion that at least results in this documentation
appearing in our manuals rather than merely lying around in the
source tree.

Patch 4 adds the documentation files to MAINTAINERS file
blocks; feel free to suggest I've picked the wrong ones.

thanks
-- PMM

Peter Maydell (5):
  docs/specs/acpu_cpu_hotplug: Convert to rST
  docs/specs/acpi_mem_hotplug: Convert to rST
  docs/specs/acpi_pci_hotplug: Convert to rST
  docs/specs/acpi_nvdimm: Convert to rST
  MAINTAINERS: Add ACPI specs documents to ACPI and NVDIMM sections

 docs/specs/acpi_cpu_hotplug.rst               | 235 ++++++++++++++++++
 docs/specs/acpi_cpu_hotplug.txt               | 160 ------------
 docs/specs/acpi_mem_hotplug.rst               | 128 ++++++++++
 docs/specs/acpi_mem_hotplug.txt               |  94 -------
 docs/specs/acpi_nvdimm.rst                    | 228 +++++++++++++++++
 docs/specs/acpi_nvdimm.txt                    | 188 --------------
 ...i_pci_hotplug.txt => acpi_pci_hotplug.rst} |  37 +--
 docs/specs/index.rst                          |   4 +
 MAINTAINERS                                   |   5 +
 9 files changed, 620 insertions(+), 459 deletions(-)
 create mode 100644 docs/specs/acpi_cpu_hotplug.rst
 delete mode 100644 docs/specs/acpi_cpu_hotplug.txt
 create mode 100644 docs/specs/acpi_mem_hotplug.rst
 delete mode 100644 docs/specs/acpi_mem_hotplug.txt
 create mode 100644 docs/specs/acpi_nvdimm.rst
 delete mode 100644 docs/specs/acpi_nvdimm.txt
 rename docs/specs/{acpi_pci_hotplug.txt => acpi_pci_hotplug.rst} (51%)

-- 
2.20.1


