Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847C53F6DA9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 05:21:42 +0200 (CEST)
Received: from localhost ([::1]:40232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIjTx-0002Fd-G0
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 23:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIjSb-00086D-U9
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 23:20:17 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIjSa-0005kJ-GS
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 23:20:17 -0400
Received: by mail-pl1-x630.google.com with SMTP id w6so13482859plg.9
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 20:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fi5WxhhadR2UM/qthU4X06h6DIcMmGAlSCkO9HVYdao=;
 b=qyl3s4Rx7MZUwn1w7LHunmL6L2lepkP9JyZ4bJa/YqYraiNJl2CdCRx6+gVVZUhjko
 WcDv2LPwWSMcq7Ere6q23Ueh1T9e0rCH1ZwMhur+os30NIcxSWpqt/JPXZKq2LTnpo8b
 nJzLqDz9D2qzAf/2yN4VyFnGue7c2bN17/9a/rkRNDJJNZlRgdPn6ffDzXpbcwxmpdz6
 78Fs3eKxaGdxX6+ki2GCuCPY92+G4pROWaRFul1vSLeFx4E6MX0Wf030W+hU7OZ5gdEw
 yUEV9u634rCTZWGXK+PioYZSwkA6xJDMqCWRkNpqWc5jbYx76wDK5uNlBV1F/h1Nc7Va
 FVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fi5WxhhadR2UM/qthU4X06h6DIcMmGAlSCkO9HVYdao=;
 b=DW6yFWka2NgbL3+9UA3biBurEAcnekYgcpML4pKPdfVvywWqc2bRnq+brFbZMToFbe
 lMSl2jjXJiCLj/uETXfgocmRXoHc1znaS2/4gF/CaWQ45cK9/rFT0WPOZ56FyHy2SEzE
 9cRdZNeXPQb/HPBp7lMGRI4HIN+FoK3klOlfkWQTdBoe6iMJ2OA7qZ0ZnT4Sff1zItLD
 /brumIGv/01Lk4v5vLTeUPFvU2/toshc+Dkj0kcRr6AmErQfrrdPmtDVCkjF2e9gK1Nt
 U25RDj0A9UwviI1Hk/yLVM5wZe6GGBJIrMHJ6WguS7i91UVlIdQEh/7Zob9b1mBWHGGq
 CPkQ==
X-Gm-Message-State: AOAM533eyBSNZYZCzjxCAF4PpbCmCbvlhBoWvnqdsRoy8Q4Cc59N/LdE
 7uVfwCLkZGFTMUWao3TXWC/5bw==
X-Google-Smtp-Source: ABdhPJwqEiWXwrkYpOAtFTa1rDLnk1LYhSLp7SoVX98fejP70170MOEYxGAKLj56ms9MVTqaYKYMUw==
X-Received: by 2002:a17:90a:5147:: with SMTP id
 k7mr8057237pjm.204.1629861615264; 
 Tue, 24 Aug 2021 20:20:15 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.155.195])
 by smtp.googlemail.com with ESMTPSA id c19sm3404895pjs.1.2021.08.24.20.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 20:20:14 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: mst@redhat.com
Subject: [PATCH 3/5] MAINTAINERS: Added myself as a reviewer for acpi/smbios
 subsystem
Date: Wed, 25 Aug 2021 08:49:47 +0530
Message-Id: <20210825031949.919376-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825031949.919376-1-ani@anisinha.ca>
References: <20210825031949.919376-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x630.google.com
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
Cc: ani@anisinha.ca, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have developed an interest in this space and hopefully can lend some
helping hand to Igor and Michael in reviewing simpler patches.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b3697962c..79b3e19931 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1739,6 +1739,7 @@ F: docs/specs/*pci*
 ACPI/SMBIOS
 M: Michael S. Tsirkin <mst@redhat.com>
 M: Igor Mammedov <imammedo@redhat.com>
+R: Ani Sinha <ani@anisinha.ca>
 S: Supported
 F: include/hw/acpi/*
 F: include/hw/firmware/smbios.h
-- 
2.25.1


