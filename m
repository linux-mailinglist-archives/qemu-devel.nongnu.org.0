Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D662F9228
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 12:55:41 +0100 (CET)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l16eh-0006WO-Od
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 06:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16WA-0001qh-Fr
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16W5-0008Gz-5C
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610884003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MqQtAiWC5T/ws37y6nXf0OqujwVirS3Y8UGvrA7Ic9M=;
 b=KPkkxrYJViwa1P4YpmNQJSJ1vqJHt2Esrd6LObwUIhDeFSTJgcqWt55K41dVyIORAjPNDm
 cGHxbDcUYkCkDfiOvuRwBcoyXrmXrUdEd0zPnNYf16wLjTsw9HBNAf2E5+N3yd4mz09Lum
 a0c9k4htT0rWLUy4baaBVJcYAn/2/rE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-4yAPnoY9M9qvGnTwBXSAig-1; Sun, 17 Jan 2021 06:46:41 -0500
X-MC-Unique: 4yAPnoY9M9qvGnTwBXSAig-1
Received: by mail-wr1-f72.google.com with SMTP id v7so6734200wra.3
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 03:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MqQtAiWC5T/ws37y6nXf0OqujwVirS3Y8UGvrA7Ic9M=;
 b=QW4GuPbmcaDq5oFvXKMHXynhFIYdB8haT1E6PuOCFOl5L8xZlpk0sBlk9u3cK4yVvr
 SFd0TA/Y62lsHM4OlufZ1mv6WmJLJtaqxGytM91fPLtYNaX1mIFSesDGipjSj/FzNXrH
 WWaBrAL7to00k9uvc23r7pyDXQfqg2pQJjy1/lO0Utn5wcgpac+yvwGsdVtb2cuYbEBi
 Li1tKM0XVR+deXQyTGbf+QvnC8r4rF/Y2Hij5AnvL6WNixL0b/7f71/N4G7aBGbPY0yv
 3oCOyr0q53LRBtP2YlTTcsbhQePCrLNxUxWTdW3Y5+8QZmyXqe3oISezcYo1wKdDYE6C
 /f+w==
X-Gm-Message-State: AOAM530QYF7z7o/gUohyYqylFUp1Uq4NJrM7jmS10YVvTABewyXE7TEq
 806W2HzSN+Mm8j+744T5WOPkuTg5k0P+W4V+jWQJrf6JmJUBZeWzqAyQ87IHsKTnSi2vkzxXt2E
 +RxArx0XqbGYdPQNv6/ogCrEAFTXkFEF6A70+el/fpl2WAvKEZUA+LHevw//v
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr21013439wrb.378.1610883999715; 
 Sun, 17 Jan 2021 03:46:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKNVRsBIXxYuKmHrxr/5tSRtxZmi+9Tj6HTOP8jzaSlPjEUMe1VyE1R/avdmeIA/usEpkh/w==
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr21013429wrb.378.1610883999553; 
 Sun, 17 Jan 2021 03:46:39 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 i5sm18085138wmq.27.2021.01.17.03.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 03:46:38 -0800 (PST)
Date: Sun, 17 Jan 2021 06:46:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] acpi: Enable pxb unit-test for ARM virt machine
Message-ID: <20210117114519.539647-10-mst@redhat.com>
References: <20210117114519.539647-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210117114519.539647-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiahui Cen <cenjiahui@huawei.com>

No matter whether the pxb is enabled or not, the CONFIG_PXB macro in test
would keep undefined. And since pxb is now enabled for ARM Virt machine
by default, let's enable pxb unit-test by removing the CONFIG_PXB.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20210114100643.10617-8-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4e026f90d0..669202fc95 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1196,7 +1196,6 @@ static void test_acpi_virt_tcg_numamem(void)
 
 }
 
-#ifdef CONFIG_PXB
 static void test_acpi_virt_tcg_pxb(void)
 {
     test_data data = {
@@ -1228,7 +1227,6 @@ static void test_acpi_virt_tcg_pxb(void)
 
     free_test_data(&data);
 }
-#endif
 
 static void test_acpi_tcg_acpi_hmat(const char *machine)
 {
@@ -1342,9 +1340,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-#ifdef CONFIG_PXB
         qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-#endif
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
MST


