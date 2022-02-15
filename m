Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5724B6FB2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 16:27:02 +0100 (CET)
Received: from localhost ([::1]:59880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJzjJ-0001Di-Vn
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 10:27:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJzh1-0008BA-EJ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:24:39 -0500
Received: from [2607:f8b0:4864:20::1034] (port=42583
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJzgz-0000Da-EN
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:24:38 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 h7-20020a17090a648700b001b927560c2bso2414092pjj.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 07:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/68K3kUhahgPyfwnoDtJRaoW5FXk97pGtmVXIB71XA=;
 b=nmufSL6+QSDs0a8TntRMJFNcnPnxHHbJ8BIjaLQLWeM14UoVOq3NCe9sFkPeUbxKGs
 /1VlIauS4aR6Rdtv7r/fAbiTtlr1SpmAkvAb9haW/vywL7KWsAYUGVQQ3GySaNpYjW2S
 BPluVeYIJT/Vuh/Zd/cBWV6wBDLzeFWtZCXpJw4j/XRqScGr0FudY29rihQyX1soHCrs
 9dLBiyevasFomW9hC7Gg73qUlpQfWjV92BesUbkYkI1WlpyCH4u44EzYW9YaC3Mk//7F
 2b3aZVUZ+iRit17uAeAxE5CooLuZ4lLMmDgW+S9iTTCP8kiTolQ+th7bdLy9p+EZ6CIQ
 Minw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/68K3kUhahgPyfwnoDtJRaoW5FXk97pGtmVXIB71XA=;
 b=SGMHTMmaQLiJJ6ruV7NGv90CF9ciCAiut0hoXKQXCW73E/nXiKRyMMGZ3A3mLGHfXi
 qEP43yrje9JAIGLFxkoC+6Y2FSng6htGqu9xWTKNqHDw58RnNf0J3QSJVuOSe2VdXzM8
 erlrYK+BHSBHBOYictiYDadDtrZpx4jV6hIMVvlg+yYTr4XrB+CQf6K9xgDkHiw3vSX0
 LjkVNco2wRU9FA5wCN2xe/XYI7bLqxLx+pG++/fBRyQaRmdcni9kNddeoyxSZDJItN+N
 KDaP8TGezuHw0zuA+OZRiwYJRbW1xJS3b6Ga626tJx8kUsnIkUqlBHxfG1tPC3KdO4sX
 F9Fw==
X-Gm-Message-State: AOAM532O4tyJQ7secnCl0cmIF/AFnl8aXJSq0f74mTgET3cVsgNIahzK
 BYYsPoApG9EiNXiNDmFNP7NzHyhAkxxJ0w==
X-Google-Smtp-Source: ABdhPJwy348Xd1mEj0r7JoYrUoWkyyeMO36VB6/jOCw+EB2cpHWw8uOoDm5lo3qcvxmADkseIB0Nww==
X-Received: by 2002:a17:902:e54d:: with SMTP id
 n13mr4685767plf.120.1644938674925; 
 Tue, 15 Feb 2022 07:24:34 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.141.137])
 by smtp.googlemail.com with ESMTPSA id 16sm29497989pfm.200.2022.02.15.07.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 07:24:34 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH] docs/acpi/erst: add device id for ACPI ERST device in
 pci-ids.txt
Date: Tue, 15 Feb 2022 20:53:51 +0530
Message-Id: <20220215152351.127781-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com,
 Eric DeVolder <eric.devolder@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding device ID for ERST device in pci-ids.txt. It was missed when ERST
related patches were reviewed.

CC: Eric DeVolder <eric.devolder@oracle.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 docs/specs/pci-ids.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index 5e407a6f32..dd6859d039 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -65,6 +65,7 @@ PCI devices (other than virtio):
 1b36:000f  mdpy (mdev sample device), linux/samples/vfio-mdev/mdpy.c
 1b36:0010  PCIe NVMe device (-device nvme)
 1b36:0011  PCI PVPanic device (-device pvpanic-pci)
+1b36:0012  PCI ACPI ERST device (-device acpi-erst)
 
 All these devices are documented in docs/specs.
 
-- 
2.25.1


