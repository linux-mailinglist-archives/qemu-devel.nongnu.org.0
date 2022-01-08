Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E554880A9
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:45:52 +0100 (CET)
Received: from localhost ([::1]:52900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60nn-0001En-Iz
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:45:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60AG-0004ZK-UW
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60AF-0002Pk-Fp
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cur9SUZpW8iaVGB6IQWM8uAhUApOuqbaIkx16EmO6Y0=;
 b=QsofNCLtEFqXISYEJIYiEmqZ+QKcnMMMQDyboJQVXSydLuZBWeMgzllfugb9fHXzwYCwcA
 cLCS6eUyE/NkhBnGS+uVaXZax9k8YoKleW/eGptpkn/32v8vJPgRtbyS1O8jBbtlFNPF0s
 zxeYk/14hICMZxcANBRCn7UbNke2vdw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-7stPh8xMPCyltjI7-Edaeg-1; Fri, 07 Jan 2022 20:04:58 -0500
X-MC-Unique: 7stPh8xMPCyltjI7-Edaeg-1
Received: by mail-wm1-f69.google.com with SMTP id
 b9-20020a7bc249000000b00347c5699809so1587168wmj.1
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Cur9SUZpW8iaVGB6IQWM8uAhUApOuqbaIkx16EmO6Y0=;
 b=gg0auH/PeocVAku+gijRST+Yun/dtZR5/KYDedcW0wJDE0UxWnGGLrsipa+ahXt/if
 QTiQZI2euDXuwYV2bvHnxuDcQG7Qy8i/kl9WwiBBjRaLnYv4ZpvukY+HnI8ph1px3gU1
 dBhkxGf2GWbeMTpHLDF7tS6PgI8hjBIcfQHzEnwdRwGYvmWq7DCoCxLNgkbWZyVU5tn4
 p0UeEGa9CTVnIhxZkHOytJLnDIhJrb0ZnuqoTAOpTW9xZpUm2olbN5Lc4AE9RirL+xyC
 NPXM/HIsmxANqgOcd6H0LAdv0rXonAV3ygi+4GsXwJf98WQUP94w4qXw5EF6AAq85I7C
 WxrQ==
X-Gm-Message-State: AOAM530NOY6dJnNhdB7MlxIwkqMLtJ1FWbbH6Qlr21aJQ+fk4x6bdg+y
 GyhrIiJYEgCOHGsAobaL2n9i2GIbptIGFqMoAY1FIz7lywv332SaPFBYz+rsTiTOztrq+tOtHIW
 Wh+s8PQI28X55iemmD6NHqpuadoF4kggxR/kCVKnH7GekApOMqHg91mv8C/H1
X-Received: by 2002:a05:6000:22a:: with SMTP id
 l10mr55490028wrz.39.1641603896686; 
 Fri, 07 Jan 2022 17:04:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6UYf/eMPX14Mtwdwgv7BVJXEegD5E9azJGqDfSaZIeHIXcoNynVup6dstVrXOovOxVEYREA==
X-Received: by 2002:a05:6000:22a:: with SMTP id
 l10mr55490003wrz.39.1641603896400; 
 Fri, 07 Jan 2022 17:04:56 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id u3sm284536wrs.0.2022.01.07.17.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:55 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 26/55] hw/smbios: Use qapi for SmbiosEntryPointType
Message-ID: <20220108003423.15830-27-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

This prepares for exposing the SMBIOS entry point type as a
machine property on x86.

Based on a patch from Daniel P. Berrangé.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20211026151100.1691925-3-ehabkost@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/machine.json            | 12 ++++++++++++
 include/hw/firmware/smbios.h | 10 ++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 372535b348..b6a37e17c4 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1568,3 +1568,15 @@
 { 'command': 'x-query-usb',
   'returns': 'HumanReadableText',
   'features': [ 'unstable' ] }
+
+##
+# @SmbiosEntryPointType:
+#
+# @32: SMBIOS version 2.1 (32-bit) Entry Point
+#
+# @64: SMBIOS version 3.0 (64-bit) Entry Point
+#
+# Since: 7.0
+##
+{ 'enum': 'SmbiosEntryPointType',
+  'data': [ '32', '64' ] }
diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index d916baed6a..4b7ad77a44 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -1,6 +1,8 @@
 #ifndef QEMU_SMBIOS_H
 #define QEMU_SMBIOS_H
 
+#include "qapi/qapi-types-machine.h"
+
 /*
  * SMBIOS Support
  *
@@ -23,14 +25,6 @@ struct smbios_phys_mem_area {
     uint64_t length;
 };
 
-/*
- * SMBIOS spec defined tables
- */
-typedef enum SmbiosEntryPointType {
-    SMBIOS_ENTRY_POINT_TYPE_32,
-    SMBIOS_ENTRY_POINT_TYPE_64,
-} SmbiosEntryPointType;
-
 /* SMBIOS Entry Point
  * There are two types of entry points defined in the SMBIOS specification
  * (see below). BIOS must place the entry point(s) at a 16-byte-aligned
-- 
MST


