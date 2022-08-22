Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6741059BC4B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:08:56 +0200 (CEST)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3QU-0002Id-BE
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3Ml-0005CM-Ir
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:05:08 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3Mj-0006dl-Gp
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:05:03 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y127so6744319pfy.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 02:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=QCLDwQ7RTf39RZZ1x0cNoR4G67Onki56gUP/GuChs4o=;
 b=TVEqf3upA3iZD18JNaxnvezKKD4WuF6owyumLYUJdLF7dFeW3yazU0ocf4O/CeacFy
 jccuhBKjHLvl5VbAXg101fQ47sJrYiLxI07WoDnMId20A2dche/h/YwDRRVLjk7JCtmt
 rBamf2NuuYidtoHchF1rb09VkOHLiDxmwZxaYnJnH53ieoKbgqlhChADOtGMlzegaL42
 K/pYA82RSU/12nF+pQDEA0mZiNtZCSEe9tCjJ/WFg3BeN5WnfPxMN5lgSWhjs1BRnZta
 tOML2Bm4UhI8X8Sj0nAcgHWzxAPexvz2gJxJCMdMH7aAfy1csfUC/bXje3J20q2usOXB
 IimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=QCLDwQ7RTf39RZZ1x0cNoR4G67Onki56gUP/GuChs4o=;
 b=bc4RII2+9NGyk/z8fG29Q5zhcM7QTTsTOJ1iWmIV8Vq63WKV+7HEmmB1P9Fhz8Oh7v
 RHSmq72Noe6igcW0UfTxOht0sqv13+OWiQ7uROhbmdI85RTiUZzwSklZ/51wKw8hf81C
 YISstJ/l0q84amS8CBAKQF7cD62jyiiqfVCgybYTkHXxVRL79mdKy0WrZKcQZ+uctDxm
 Z507gaG0yAPag4b9yPAo3DYs42lrEFwo7LI9sxaIZJNGLX1/LNJeCLD9eY9n6t/S4TZK
 NFQPILmTAkjfEdsmXluq1CuS8B26PTwXBGrtF6K44MQUOIazdEXlci+uRLxu4wecp1x9
 HWjw==
X-Gm-Message-State: ACgBeo3M8aTMMI5mEbJGldomXGKZtsV7wu/KfTrQ6szTqXCgRJStBkW3
 VrvMO0ACpGxeErRNCicOdfTjjSTP42iPOg==
X-Google-Smtp-Source: AA6agR4Qjk8owrQnpHZAkjq4QdAtv2s3l12thVcGPZOzZ20nakmA6qgh0wk5EmUMnP4Nhb4HhMR35g==
X-Received: by 2002:a63:2c8b:0:b0:41c:5f9e:a1d6 with SMTP id
 s133-20020a632c8b000000b0041c5f9ea1d6mr15844266pgs.601.1661159099170; 
 Mon, 22 Aug 2022 02:04:59 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([116.73.134.198])
 by smtp.googlemail.com with ESMTPSA id
 n34-20020a635c62000000b0041c3ab14ca1sm7015428pgm.0.2022.08.22.02.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:04:58 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: yvugenfi@redhat.com, jusual@redhat.com, kkostiuk@redhat.com,
 imammedo@redhat.com, mst@redhat.com, ybendito@redhat.com,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 0/4] enable ATS per pcie root port, not globally
Date: Mon, 22 Aug 2022 14:34:33 +0530
Message-Id: <20220822090438.426748-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42a.google.com
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

This is towards a possible fix for RedHat ticket
https://bugzilla.redhat.com/show_bug.cgi?id=2089545 . 

Michael suggested we try to enable ATS per pcie root port instead of enabling it
globally by setting the ALL_PORTS flag to 1 in the Root Port ATS capability structure.
This patchset makes this happen.


Ani Sinha (4):
  hw/acpi: allow changes to DSDT and DMAR tables
  hw/acpi: set ATS capability explicitly per pcie root port
  tests/acpi/bios-table-test: add pcie root port device for DMAR test
  tests/acpi/bios-tables-test: update DSDT and DMAR table blobs

 hw/i386/acpi-build.c           |  74 ++++++++++++++++++++++++++++++++-
 tests/data/acpi/q35/DMAR.dmar  | Bin 120 -> 136 bytes
 tests/data/acpi/q35/DSDT.dmar  | Bin 0 -> 8421 bytes
 tests/qtest/bios-tables-test.c |   3 +-
 4 files changed, 74 insertions(+), 3 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.dmar

-- 
2.25.1


