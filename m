Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A13B486581
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:49:11 +0100 (CET)
Received: from localhost ([::1]:47614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5T8g-0004XT-Hm
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:49:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Se7-00052Z-3d
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Se5-0000vc-5f
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cur9SUZpW8iaVGB6IQWM8uAhUApOuqbaIkx16EmO6Y0=;
 b=HN9w9rFldkBNpCALZtYKcWKqhe/KMI6H2E8BAn50viBgPC/aqezuboNIyIuR1ynDJBQMml
 ZzkzWpPKUTy5URfxH691JwHUP3X1NZKAyJ835DRwT5M36BeuhSuEZhQTulwtQG4BSvdTdR
 aL6j0Bv7Vn4o62yyClDkqifssjfV3bk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-FQ7PjI_qMg-6rYhwzyiuJA-1; Thu, 06 Jan 2022 08:17:31 -0500
X-MC-Unique: FQ7PjI_qMg-6rYhwzyiuJA-1
Received: by mail-ed1-f69.google.com with SMTP id
 b8-20020a056402350800b003f8f42a883dso1904688edd.16
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Cur9SUZpW8iaVGB6IQWM8uAhUApOuqbaIkx16EmO6Y0=;
 b=IUu69Xv56yRjJjgbDQ6GgTxGIV25hHXI1FiDdzO8gGZOUd+NBIHphBk5wOtGWI0K6s
 6cBSFsTPF1yuCjZ2P+E2smxbGl1LBVhOaBvEIb42Z9kXQnyc+xJmNa4DJsDinK3gG62c
 yn9jWnkL+d3kSUKnzjPk5bgvr4Or4Kl8ZXd9y2q/oZuOEwOcXQrbeB7Z4L5kqr8Vukpk
 tksEuYp5HlRiUbhnvZK/8+TymbZGjXuvYlxLYk4SpxWQIlHk7PC/qgNRDR0lP8DaDzcC
 QDAQWGp3rnXcZVg4x5Ow3jfEMn2QxkuJWIvPJc0rFlENkR3VE8USvc54JhJXIYyj69Y4
 pSfQ==
X-Gm-Message-State: AOAM532ZzHLyql7RFb393Ff0FHLgzp1tuDAR9MYgVstCW70Fxs8x0eYE
 +W1K+QxuyHBQKB3sQyR9n6uZwrj2PN6fPxUFGg16V+aWCGuxSvRnAFU5hCf+vs8rEyrhKOHcyxO
 vCvw8sI5poJjzWTJ76YK4KLcmQPl48Nl/E7eGLigw/l7VXMwsV68Q3h/SJZ4o
X-Received: by 2002:a17:906:bc97:: with SMTP id
 lv23mr45060567ejb.506.1641475050268; 
 Thu, 06 Jan 2022 05:17:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+Hn/7ZeI/If3xYJYvlzDChL/AjbhekgBqj05UyrrIc72c73ZLCeVMAP8yb4BkAbyvfay0Fg==
X-Received: by 2002:a17:906:bc97:: with SMTP id
 lv23mr45060536ejb.506.1641475049935; 
 Thu, 06 Jan 2022 05:17:29 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id e6sm719782edz.54.2022.01.06.05.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:29 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/52] hw/smbios: Use qapi for SmbiosEntryPointType
Message-ID: <20220106131534.423671-27-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


