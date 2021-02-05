Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75460310D11
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:18:29 +0100 (CET)
Received: from localhost ([::1]:47042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82sO-0003T8-DG
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eg-0004bw-Kv
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82ed-000376-GC
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzZaM6geEFIvP4T3KqYpbT6FM3FQrM9kRnMR3GRsHFU=;
 b=gQ+iiZC9jQOH7NZJ/YwZ86T1f93B8y1ely/yM5/VsTW1R+GGevbTwOLBOoGUPsaXPEzwrH
 6e5cGF2Bb+9L/jDVqzvlz8J0MGGL2iZbN4+gXGPIoCIqX9guaTJ8Q+i8hlqGJlf75LbA0i
 jDmGmuinCQbe6wN6wFyJ7o5oENU0Q60=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-I4iVto4MNQC91PoFGmrcJw-1; Fri, 05 Feb 2021 10:04:11 -0500
X-MC-Unique: I4iVto4MNQC91PoFGmrcJw-1
Received: by mail-ed1-f69.google.com with SMTP id f4so7021567eds.5
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hzZaM6geEFIvP4T3KqYpbT6FM3FQrM9kRnMR3GRsHFU=;
 b=j2zPT7N4mzs9zMaN22PnTehUolqI1cGrD9ZVOQjSA5815QaH16FBCmUdFYlv3oSyFT
 5wi9neZ1El0oy6FrXiPLz5/7kg9cf5t49f+IPVLgCW6hZyQyFfWwFUI5yvuK1FA8tmfg
 lxtwWmlK64XHZE3l5X1LCkb/Uo59yJ04cLwBudPZdwBghCWnINUttloyDwgrhs91++73
 1SBFbWRpAYG4h40lP95a2xWhT8cP3lHTKh1zpTb5ZF/I7CTIwPSTrSisUPCFh/77+cFJ
 3CArfWqseJpmiPgjhlufXujWKQSSIJCP4rlJfg/iMNaxZp7/RcKKi1IynG+2yHYcA7vZ
 26zg==
X-Gm-Message-State: AOAM531xDNGB3aH6LybLloNUeWx9NylvHRJePYGS+Vyfk5SSzxiDfPUG
 gjl1j1piUNHGDU9+6+ZrxeZ+MgcljxwECFQg5qyh3Wb7WdO6Dh9JKI9qAVoNE4atMy2WnGE37tk
 0/i3ARkQgTcG28Aey2HC4fpq6puUh9kcnxA++Hw91zLMe1azMsLN3cuzAjXgn
X-Received: by 2002:a17:906:33d9:: with SMTP id
 w25mr4266762eja.489.1612537449626; 
 Fri, 05 Feb 2021 07:04:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqHeEYSGmVQojrrBwDv2U3Anrvj9u4F1J+7HbqYsLWNRlrmR2p6mCVkIV7xAVxyDeDlG0oog==
X-Received: by 2002:a17:906:33d9:: with SMTP id
 w25mr4266722eja.489.1612537449393; 
 Fri, 05 Feb 2021 07:04:09 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id bf8sm4209574edb.34.2021.02.05.07.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:04:08 -0800 (PST)
Date: Fri, 5 Feb 2021 10:04:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/16] acpi: use constants as strncpy limit
Message-ID: <20210205150135.94643-14-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gcc is not smart enough to figure out length was validated before use as
strncpy limit, resulting in this warning:

inlined from ‘virt_set_oem_table_id’ at ../../hw/arm/virt.c:2197:5:
/usr/include/aarch64-linux-gnu/bits/string_fortified.h:106:10: error:
‘__builtin_strncpy’ specified bound depends on the length of the
source argument [-Werror=stringop-overflow=]

Simplify things by using a constant limit instead.

Fixes: 97fc5d507fca ("acpi: Permit OEM ID and OEM table ID fields to be changed")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt.c     | 4 ++--
 hw/i386/microvm.c | 4 ++--
 hw/i386/pc.c      | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0c65fe38a0..371147f3ae 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2173,7 +2173,7 @@ static void virt_set_oem_id(Object *obj, const char *value, Error **errp)
         return;
     }
 
-    strncpy(vms->oem_id, value, len + 1);
+    strncpy(vms->oem_id, value, 6);
 }
 
 static char *virt_get_oem_table_id(Object *obj, Error **errp)
@@ -2194,7 +2194,7 @@ static void virt_set_oem_table_id(Object *obj, const char *value,
                    "User specified oem-table-id value is bigger than 8 bytes in size");
         return;
     }
-    strncpy(vms->oem_table_id, value, len + 1);
+    strncpy(vms->oem_table_id, value, 8);
 }
 
 
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 1dc2956e72..4e0cf4c522 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -668,7 +668,7 @@ static void microvm_machine_set_oem_id(Object *obj, const char *value,
         return;
     }
 
-    strncpy(mms->oem_id, value, len + 1);
+    strncpy(mms->oem_id, value, 6);
 }
 
 static char *microvm_machine_get_oem_table_id(Object *obj, Error **errp)
@@ -690,7 +690,7 @@ static void microvm_machine_set_oem_table_id(Object *obj, const char *value,
           "8 bytes in size");
         return;
     }
-    strncpy(mms->oem_table_id, value, len + 1);
+    strncpy(mms->oem_table_id, value, 8);
 }
 
 static void microvm_machine_initfn(Object *obj)
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 437977c49e..8aa85dec54 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1630,7 +1630,7 @@ static void pc_machine_set_oem_id(Object *obj, const char *value, Error **errp)
         return;
     }
 
-    strncpy(pcms->oem_id, value, len + 1);
+    strncpy(pcms->oem_id, value, 6);
 }
 
 static char *pc_machine_get_oem_table_id(Object *obj, Error **errp)
@@ -1652,7 +1652,7 @@ static void pc_machine_set_oem_table_id(Object *obj, const char *value,
           "8 bytes in size");
         return;
     }
-    strncpy(pcms->oem_table_id, value, len + 1);
+    strncpy(pcms->oem_table_id, value, 8);
 }
 
 static void pc_machine_initfn(Object *obj)
-- 
MST


