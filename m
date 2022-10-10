Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96D15FA3BC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:54:29 +0200 (CEST)
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxv3-0000oI-1c
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwe9-0005Mc-8L
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwe1-0007hO-H5
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BOj9XvWCERiBlfj57YO9Kmbr44NjG5pXJPMDv7Q0wso=;
 b=hMNUYjul1mU4DNEjwi7abLaUiXV1Q/9fz9S34b+0VqL5Cc7YUVJ7szE0GarDr4p9JITXr9
 x/PWv7Z+zpty/gJVAAOm0CJ/G3arCOqTfaSlpAsxlFXW1Wcmly1s3GUH54C3TAY73sBya+
 HHYfXOd3aA58Sz0PsYT/fJzLSExTvQo=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-78-L2t2rwSVMaWeFdWhshC6zg-1; Mon, 10 Oct 2022 13:32:47 -0400
X-MC-Unique: L2t2rwSVMaWeFdWhshC6zg-1
Received: by mail-lj1-f198.google.com with SMTP id
 q22-20020a2eb4b6000000b0026befa4f871so4705498ljm.18
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BOj9XvWCERiBlfj57YO9Kmbr44NjG5pXJPMDv7Q0wso=;
 b=QtFN/Y2E3E0Pu9fPe1iXp9o3vamb4kUzMCykq1LE4zzZSTXXYWNBUTO02u8FSbfhTo
 QuwYDqcOcn6O3Di0vQgzj5e2McCsT7KSZpMKcrWyD4hytoUFrBhWTfiwnUMbuUEnrrH3
 3lseJSgrLPAlqI1AHLyE7xnTLpnSMUjZUSwfLoPdNxkCTK0gHJW4816G4FaPcQBj2AyX
 MY7sZlcRmM8mV7c8M3l6jVNKJFdNZ0WjtM1xW50FloS+SJR1Eg1DYhcUGR9NPW25Yfbx
 CeQ7dZMivtwZRmSZOQcwKhK/Vm2X1mRcq5IQLqktz3WxgSMToLXYj+y0I1T4Uy01VU3j
 DoUQ==
X-Gm-Message-State: ACrzQf0nNaPHbEAJGspPa4kFjCXgJbW/3SufA5QiSt3IJHLz2J1pkscH
 kR0triu4Ny10M6ERC71FVbp4smR3numbNo+wK9xAJM3c4/CgFSTQ7DGc+hmyJrQRo8JJlZ/SEgf
 wv8/RRcd3VbpJMt9gkOdzDl3In+MCicFscqV9ntyQI9zUCBF3UoKvG8vW/I03
X-Received: by 2002:a2e:92c8:0:b0:25d:6ddf:e71d with SMTP id
 k8-20020a2e92c8000000b0025d6ddfe71dmr7082453ljh.170.1665423165611; 
 Mon, 10 Oct 2022 10:32:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4maYEaPmkVVzE0Hbc32Q1x3q6+WRTLZGirQ/WH0y6M/o2z5GNH9npOUF8gjDU3X3ONfauHRQ==
X-Received: by 2002:a05:6000:168f:b0:22e:4c3:de09 with SMTP id
 y15-20020a056000168f00b0022e04c3de09mr12126091wrd.40.1665423154231; 
 Mon, 10 Oct 2022 10:32:34 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 k13-20020adff28d000000b0022ac672654dsm9134082wro.58.2022.10.10.10.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:32:33 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:32:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 52/55] tests: acpi: whitelist pc/q35 DSDT before moving _ADR
 field
Message-ID: <20221010172813.204597-53-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-15-imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..1983fa596b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,15 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.multi-bridge",
-- 
MST


