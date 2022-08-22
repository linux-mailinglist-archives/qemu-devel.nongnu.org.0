Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BC159BCC5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:24:27 +0200 (CEST)
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3fW-0004ep-AN
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3Py-0001ar-UC
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:08:22 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:45706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3Px-0007Kk-BO
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:08:22 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso10582160pjj.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=QCLDwQ7RTf39RZZ1x0cNoR4G67Onki56gUP/GuChs4o=;
 b=FWoFF6IU6xR1aYyLFSaATITW9T3583P97O00fzM79LK/Ej5e7jGrz3qWIPLdvYTRBx
 ce06iEexaS7b4pzzOgGPh3+XcryB3ZkPFsJxhgzVEYh3Gl+siW8TNRSLdaXmWgs1qFcO
 CGIGTli7n2e06Nofor54fwBHikIHWqPpvSEJ67U4SLDFFV+xIzs3yE3b8oAt2HKwHYUh
 xGsaM5JvFAf3r0zfzknU2x1LZD/u7oiQ5dl7dhleVa2I4YLdP0LbhbZUyexZnxqbuD4N
 z22YyqFgnymdKOwVZqBcyLWtXFvvSeYfgHBijT9FgEB6dbKuue2BTjcJZMS1eSlyIyK+
 cUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=QCLDwQ7RTf39RZZ1x0cNoR4G67Onki56gUP/GuChs4o=;
 b=xg8fsY/EstSifwebVFCBkNFIVKSxW+gP1cccD5+opGiDr7dom6Pqu6de41vLK3daIn
 zArZI2zuc4H6D3kpqv1+Ru4UCxtGoKk3yqT5xWPpvjklRNx5JK+xha3f2RRQdZZfXX4t
 5CmkRwLWGDRCz2KfEGtJmibUyfByVljqIgSBTZEXIswgvS4UirdT2+JThAT/YweroD2f
 EV/wWuzr6R5AkNGmEgDdGiO3manjwCzNty3hUEkjlT+gKHMtlsnYDdhCdLqU5J4Q1GKq
 ZkewobW7PyPJ6aGLc4tmB0sdRoUWzt3V5CLb472TZODWq9eiRvHcgSFWnLatKNLS21nI
 XVtw==
X-Gm-Message-State: ACgBeo1U3Nw2jgnARoPPnZGNV/FCzfUiKbKxXWGF6anwqVO+S98WzsCt
 eLktLgBfdWYKKO8kA3En2tzXIXus5LXHzg==
X-Google-Smtp-Source: AA6agR5dbhuEnU2UNJCfBKVtpf3HLpblI75e1uTuZ8WTLhkO7bJV/oBa5BWGS7tM3jzMwrJOpk3q/g==
X-Received: by 2002:a17:90a:c402:b0:1f7:75ce:1206 with SMTP id
 i2-20020a17090ac40200b001f775ce1206mr22106612pjt.68.1661159298955; 
 Mon, 22 Aug 2022 02:08:18 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([116.73.134.198])
 by smtp.googlemail.com with ESMTPSA id
 a20-20020a62d414000000b00535e6dbda16sm7364539pfh.35.2022.08.22.02.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:08:18 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: yvugenfi@redhat.com, jusual@redhat.com, kkostiuk@redhat.com,
 imammedo@redhat.com, mst@redhat.com, ybendito@redhat.com,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 0/4] enable ATS per pcie root port, not globally
Date: Mon, 22 Aug 2022 14:38:07 +0530
Message-Id: <20220822090811.427029-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102f.google.com
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


