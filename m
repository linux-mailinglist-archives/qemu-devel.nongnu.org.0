Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15013A19C2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:33:40 +0200 (CEST)
Received: from localhost ([::1]:35394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0D6-0003Sw-02
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr05r-0002wd-NA
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr05n-0003yn-DX
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623252365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3JDtiVRlS21ENBVVxMxOKQP3uYIs/1iCx9UWETEac04=;
 b=Z5hm33PvFebCm4ZT/G8ELv1Z88QDw+PKE37uv5P0Z2c3jme0XVHTygeULn/qcpQ7gDrkZi
 8FrZvEygAexY0tKHLQWZrgsNLdgSvXSObL/tTSYy5gn8YZ6Cj/gkJTn5iOSndtp3q1KfPm
 4XDQBGifLdBvRV0vLGAstPvU3yY7GK4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-aIN2Z5wnPf2f_5ApVM3AIA-1; Wed, 09 Jun 2021 11:26:02 -0400
X-MC-Unique: aIN2Z5wnPf2f_5ApVM3AIA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r17-20020a5d52d10000b0290119976473fcso8734387wrv.15
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 08:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3JDtiVRlS21ENBVVxMxOKQP3uYIs/1iCx9UWETEac04=;
 b=r+0k12bKV8syZ51cafOS1oCL9avofwnnGUMO9UrT8Ga1vqAE82OTm00ezM2BmtusyQ
 2ii8BvDbOcZC5QcDq9nK73/5wXFYxhHx8vxpE7vdpHqPIQNwYnogWi58rEdJaqDtrr4G
 uGn72zwW4eyD2fn71kFnlYdnD5m8onVKNRtzr/8vaVmMA2LAPynXZZCRLo33QH1ArRO4
 JQWmdjKwAT6Fa1wYmRT7zm/dF9/ngyD20MKfmSW7VwksJPvQIJGqX1xzBOxZFdh0rTMJ
 3NmqyTAP5rXQY+N9Ov5Plz431a0FaCTbmdW0LCJD0b5qvkSFGEWTOJqLjUh0b5PGEGBN
 fE/g==
X-Gm-Message-State: AOAM532Z1vm/OW2JMjFomGUZEFrOYNaLvQEY06Amm6bS73+CSk8EBPx+
 UaqiqtkFhSpqg/xUnT+DbmZKfGPveuw2SjCrRlgfSlaIbfKwzZdSzFqFUcFy8m3LPU0GfKQstR1
 /RHX62ckrb6w9cl31CsnK8IFivHfDIZxsfpGRNRHsBt7mwI7ttWHchfeUBrLtT0wp
X-Received: by 2002:a05:600c:4f8f:: with SMTP id
 n15mr398938wmq.116.1623252360874; 
 Wed, 09 Jun 2021 08:26:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8l3dwW/n0M1oO5dsF/VhS7WP4rqzDzLw4NDsjUbfyjerme5n+FyjVdEKHfcZBXNo9cLaq5A==
X-Received: by 2002:a05:600c:4f8f:: with SMTP id
 n15mr398914wmq.116.1623252360660; 
 Wed, 09 Jun 2021 08:26:00 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id e27sm280297wra.50.2021.06.09.08.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 08:26:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tpm: Return QMP error when TPM is disabled in build
Date: Wed,  9 Jun 2021 17:25:59 +0200
Message-Id: <20210609152559.1088596-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the management layer queries a binary built using --disable-tpm
for TPM devices, it gets confused by getting empty responses:

  { "execute": "query-tpm" }
  {
      "return": [
      ]
  }
  { "execute": "query-tpm-types" }
  {
      "return": [
      ]
  }
  { "execute": "query-tpm-models" }
  {
      "return": [
      ]
  }

Make it clearer by returning an error, mentioning the feature is
disabled:

  { "execute": "query-tpm" }
  {
      "error": {
          "class": "GenericError",
          "desc": "this feature or command is not currently supported"
      }
  }

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 stubs/tpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/stubs/tpm.c b/stubs/tpm.c
index 9bded191d9d..8c904215b39 100644
--- a/stubs/tpm.c
+++ b/stubs/tpm.c
@@ -7,6 +7,8 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qapi-commands-tpm.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/error.h"
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 
@@ -21,16 +23,19 @@ void tpm_cleanup(void)
 
 TPMInfoList *qmp_query_tpm(Error **errp)
 {
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
 TpmTypeList *qmp_query_tpm_types(Error **errp)
 {
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
 TpmModelList *qmp_query_tpm_models(Error **errp)
 {
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
-- 
2.31.1


