Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065AE3FFF13
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:23:27 +0200 (CEST)
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7I6-0006Ab-22
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM738-0005g3-IQ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM735-0000fY-1S
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6osDXRphDo8TIq2I2JrJLj4Iq8ymwMld3GU8FS2XmwE=;
 b=W1DnljpiBY9qB3ZSegVKjfn+TYRTSSmvIbawbN4BUSFVPnpyYugJKvlHj0YiACPgWD+pGL
 QBY1ulWppzy1i0WHshtBMhwFSrGyemfvBsd3g+51F/Fa6c14EtW1eY3l0jKOT3g75R1nxS
 F6k58msnOQMd+45MqvgueyHRWDaZ5RY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-bGciXd1RPPmJmnkqyXvzng-1; Fri, 03 Sep 2021 07:07:53 -0400
X-MC-Unique: bGciXd1RPPmJmnkqyXvzng-1
Received: by mail-wr1-f71.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso1443187wrn.19
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6osDXRphDo8TIq2I2JrJLj4Iq8ymwMld3GU8FS2XmwE=;
 b=o5sbmwKgPtkzDF/AhfWcYUwGTpGrXUDpxc68ZOYHxkCj2nLT32/6M9p5Emm2L0TKG3
 znTv2VfhL8RpQplz0G3QLj/vCGM8ZhxJSbC8w5v9J1DzOw1x9+woSqUT26GWZnnosF14
 4zJdZFlWWc3o9ausSXlDiXL6OS6bLv1C4xl05licSDQf5c0BVjvi/4vVgxfmlDpp1BvQ
 bdl2DgQtgme9xRctZZkjmdOM8OzJHijo6POuNETYFOD2WqHlPR0dIqwiQwqZKLqV0Cvy
 XTVyNtjCzHE86X99rcyOUx0m9yjqZfEELtw3JQqF8sdqejVyqgrcVUu6ox1HsVHdTe/T
 L1Ow==
X-Gm-Message-State: AOAM5339XlvaIeHCxkCBCsPP7aqXMEkhNaXz/C04G/qTn7vWy1o07Y9H
 1r+jKDf/wWUa7EfingwOw22PsHaJrsWBVwtA6K5EPM2qDoN04gYkKVmgsL9yo66OsIQBEaPLVmv
 WX71bSwy+PI0jsnuoxnatYLU7nHMJ5XT9mf8dvpYt/ijY3Ddd+b/hPLQtQW5hgntY
X-Received: by 2002:a5d:526a:: with SMTP id l10mr3307842wrc.279.1630667271474; 
 Fri, 03 Sep 2021 04:07:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcJFg+fUtt74cezEjGtPfJjbB/p8oBH6n6a0g8f/lUmZ5V9PLYMGF1/ZME4j9YjZI6HscUjA==
X-Received: by 2002:a5d:526a:: with SMTP id l10mr3307771wrc.279.1630667271215; 
 Fri, 03 Sep 2021 04:07:51 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 b12sm5141598wrx.72.2021.09.03.04.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:07:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/28] hw/acpi: Avoid truncating acpi_data_len() to 32-bit
Date: Fri,  3 Sep 2021 13:06:42 +0200
Message-Id: <20210903110702.588291-9-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

acpi_data_len() returns an unsigned type, which might be bigger
than 32-bit (although it is unlikely such value is returned).
Hold the returned value in an 'unsigned' type to avoid unlikely
size truncation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/virt-acpi-build.c | 2 +-
 hw/i386/acpi-build.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 037cc1fd82c..95543d43e2a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -885,7 +885,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
 static void acpi_ram_update(MemoryRegion *mr, GArray *data)
 {
-    uint32_t size = acpi_data_len(data);
+    unsigned size = acpi_data_len(data);
 
     /* Make sure RAM size is correct - in case it got changed
      * e.g. by migration */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a33ac8b91e1..aa269914b49 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2660,7 +2660,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
 
 static void acpi_ram_update(MemoryRegion *mr, GArray *data)
 {
-    uint32_t size = acpi_data_len(data);
+    unsigned size = acpi_data_len(data);
 
     /* Make sure RAM size is correct - in case it got changed e.g. by migration */
     memory_region_ram_resize(mr, size, &error_abort);
@@ -2783,7 +2783,7 @@ void acpi_setup(void)
          * Though RSDP is small, its contents isn't immutable, so
          * we'll update it along with the rest of tables on guest access.
          */
-        uint32_t rsdp_size = acpi_data_len(tables.rsdp);
+        unsigned rsdp_size = acpi_data_len(tables.rsdp);
 
         build_state->rsdp = g_memdup(tables.rsdp->data, rsdp_size);
         fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
-- 
2.31.1


