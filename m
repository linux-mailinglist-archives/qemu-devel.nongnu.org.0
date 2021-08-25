Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD5B3F6DAA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 05:22:13 +0200 (CEST)
Received: from localhost ([::1]:40978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIjUN-0002kv-QU
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 23:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIjSk-0008T2-Qo
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 23:20:26 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIjSj-0005w6-BZ
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 23:20:26 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso3764879pjq.4
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 20:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z/hNyxdV8zUruhznwyJ0JRbrPFDcZu9AJ+1RZ5zF/ik=;
 b=1WMgGfkO82WCAaYTyZ6PO4FU9QjifUwMY6Kenn4TQ9TZEje4q3PGwtM3vPrmx7xT4a
 JI7JMYY+i10EqOogfimDl5/nb14rHLgkPzZ73+/NX/cNkflbxombXY97+6mP4I9zjL9x
 4/Du5jPVh5GWmzZ6voJsmlU36HknZPCPhJjb3jqYR1n3hXNdH1xAQyIhbYtvf7uyUMTe
 yI32bZloG3kitMcDYXKjl2iOe1Cs52iv5KHY3vQtoBWo3L3JL+NOt7bWEhOlyXJUecm0
 2coJgqtIWANPOo4DFS8ScOGWVpufj9sSzMZPdn1G1mhcCoQdTwmpK+OeFSQhMDz0mo1v
 VaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z/hNyxdV8zUruhznwyJ0JRbrPFDcZu9AJ+1RZ5zF/ik=;
 b=GmkMwzmvhlKDtdnMVEJVJ36bli0L98XENpGKs6Eqiq0IJlvSJgiPuYJAO9F/RLwxPX
 zKp5n6IE3zBvtw3bAxK9vnFrh6aEhZRYVxahrtnEdu1eLQjpeJW1xEVU4fuadxzOru7T
 60AdqyObwrj3QNDqXtP5Z7NYKszPLjSpwnOo1RbSC774W47vNt2ikJwFW0Qa6+3AeK8d
 APwpM2p7ujBBrASK8ZOTvpPn+HRzReRSDFZL8eVC2xcBv6+MsBVGiy6QXwSFsIfvMesk
 MWD7s5D3y+EePjMDYWAaFrU7JB1sBb7O4DbD5t79A3MLIr3Dbbo/dkFx4v5PL4Rd+Rzf
 7cbQ==
X-Gm-Message-State: AOAM531iWEz06IgN2mBfdiktla0UrktTmrsjjBq3BlwjCmp8jZ9Sf8wh
 ugZTxCAJzifhv4ZFZTHbHYpUg24gJl1u2w==
X-Google-Smtp-Source: ABdhPJyMCb3PrT9b5t3RvggcBjDJ99UkMVw5EcYnqXUvAXJXqxqYtffxcRTgkeCSQkTWiBiTV0ISMw==
X-Received: by 2002:a17:90b:1c92:: with SMTP id
 oo18mr8173310pjb.56.1629861623493; 
 Tue, 24 Aug 2021 20:20:23 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.155.195])
 by smtp.googlemail.com with ESMTPSA id c19sm3404895pjs.1.2021.08.24.20.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 20:20:23 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: mst@redhat.com
Subject: [PATCH 5/5] hw/arm/Kconfig: no need to enable
 ACPI_MEMORY_HOTPLUG/ACPI_NVDIMM explicitly
Date: Wed, 25 Aug 2021 08:49:49 +0530
Message-Id: <20210825031949.919376-6-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825031949.919376-1-ani@anisinha.ca>
References: <20210825031949.919376-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: ani@anisinha.ca,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit
36b79e3219d ("hw/acpi/Kconfig: Add missing Kconfig dependencies (build error)"),
ACPI_MEMORY_HOTPLUG and ACPI_NVDIMM is implicitly turned on when
ACPI_HW_REDUCED is selected. ACPI_HW_REDUCED is already enabled. No need to
turn on ACPI_MEMORY_HOTPLUG or ACPI_NVDIMM explicitly. This is a minor cleanup.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4ba0aca067..dc050b5c37 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -25,9 +25,7 @@ config ARM_VIRT
     select ACPI_PCI
     select MEM_DEVICE
     select DIMM
-    select ACPI_MEMORY_HOTPLUG
     select ACPI_HW_REDUCED
-    select ACPI_NVDIMM
     select ACPI_APEI
 
 config CHEETAH
-- 
2.25.1


