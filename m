Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ABD266811
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 20:09:49 +0200 (CEST)
Received: from localhost ([::1]:39812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGnUZ-0003h2-1O
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 14:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kGnTD-0002PC-NU
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 14:08:23 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:34139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kGnTC-0005x2-95
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 14:08:23 -0400
Received: by mail-pj1-x1042.google.com with SMTP id n3so2928813pjq.1
 for <qemu-devel@nongnu.org>; Fri, 11 Sep 2020 11:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=HHdiOGLkXts4NNVu4SCMzFcJi56aYTGQpkW5PEoj6js=;
 b=GpkBoxEUA/uY89jGfSgaEWHEQwRqOxC/Zdl+9fZ0iuGCck5pUWB7TNpQ58KrI3pAOX
 sxEqJ+F2rHYzr39i8XHJ5Di/4C1HRelZwmjR4wVelcxAOirYbzZyKtSOz2TrBcOduWvc
 /R4dB4dxgMSCNqVywNmGoPs3tEVBjg7u1Gn8Cz4L+IDjnDTQ1Fu8I/XAFX1TMsQr2r/s
 lpSXc3jZ7GoneFFCcAxWriY/v0cXWbq1mVQgZVbpFk6tlnJ3PD4GaftvD4lPEGGJEn7A
 tazqBMWAo3KYDRP8Typ7eSeS8jYJxoVFcEAX38TiQcRZ+6DcDQDYdJ3Ur99b4jF4QV9K
 mzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HHdiOGLkXts4NNVu4SCMzFcJi56aYTGQpkW5PEoj6js=;
 b=gHO3KoVu7sygzS6TLCKlWgGQW3J31yCuazCM/QwEt44qT7JGwE2S4QwywayLuOv3mv
 hYSnZe1HySkcOggQAxJYN6uyyRclE3VF3nQybjzjLaiDEBFekC8XNRVwY35ogsJnEbpO
 aV8cDxSarmiA9JzrPsXz/67rPXL6mnYujZfR3VVpPxCywdyFkXAptIWkSNV0ZPlLEI1K
 Whzf7kWVX1nFwPpm4GHzJCy+prU/yIJaTuD4av+rI+slHjSuE2dXJtNGFy3R3Xo3oQRO
 b7u7ztslgjNy4qfvEpWxz/ul4Q8ygUw1h/FLgb8qmcTMQj74U1+UjR+ShLAHO5NxVwCW
 HMdA==
X-Gm-Message-State: AOAM531HFV7PoqZdmAoeOwaKHchlBtQGnenBa5OwwwRXnDjSVSBcfjoE
 9+CSKSzFjPufKuZ/UI3L9TkI0ic9XPEcJQ==
X-Google-Smtp-Source: ABdhPJzvLqKxnPXSdYL68lCoSLRYW5UakjOxmzJymcaXScA4O5OHgRNtgHEzvi7AFaFR4Luc5EIbXw==
X-Received: by 2002:a17:90a:f992:: with SMTP id
 cq18mr3311525pjb.136.1599847700260; 
 Fri, 11 Sep 2020 11:08:20 -0700 (PDT)
Received: from localhost.localdomain ([115.96.135.201])
 by smtp.googlemail.com with ESMTPSA id n9sm2929135pfu.163.2020.09.11.11.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 11:08:19 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] tests/acpi: document addition of table DSDT.roothp for
 unit testing root pci hotplug on/off
Date: Fri, 11 Sep 2020 23:37:47 +0530
Message-Id: <20200911180755.28409-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2607:f8b0:4864:20::1042;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 jusual@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A new binary acpi table tests/data/acpi/pc/DSDT.roothp is added in order to unit test
the feature flag that can disable/enable root pci bus hotplug on i440fx. This feature was
added with the commit:
3d7e78aa7777f0 ("Introduce a new flag for i440fx to disable PCI hotplug on the root bus")

This change documents the fact that this new file addition was made as a part of the
unit test change.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..ac864fc982 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.roothp",
-- 
2.17.1


