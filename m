Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C652895F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:01:21 +0200 (CEST)
Received: from localhost ([::1]:33566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqd9s-0005X3-6v
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd50-0001i6-6p
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd4y-0003MP-99
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYJyZmUxNZsBEVzOnWcVqqvivvN6SHzGi8AIcyMs1Ho=;
 b=hno7Iu7ekR4EO77UInwb0w5mdHReu1bgRW17fCcfknwLZ88NTPp60zyWCLF5Aj12ROpnu6
 qkUmVzYbDKFZ6Ckw9/BGuTp3q/0SZ+gSJzu4w7kiPmCNF+aZ1ZqZiRIToSQUHNSRuqqaak
 aTT3hyJnVD1t4yZQWXNYDICRhTZkFw0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-lO3bWmBRPd2fitLLjZY7AA-1; Mon, 16 May 2022 11:56:14 -0400
X-MC-Unique: lO3bWmBRPd2fitLLjZY7AA-1
Received: by mail-ed1-f72.google.com with SMTP id
 bc17-20020a056402205100b0042aa0e072d3so3682350edb.17
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AYJyZmUxNZsBEVzOnWcVqqvivvN6SHzGi8AIcyMs1Ho=;
 b=TwyDkmiP4HZSxzWvWFCg/dG2VmToZ5DlQdfls2wpADFnLZ0bMRNzmcD2j48nM2XPXn
 nVOUHvqEB5WGqEap/3AirQEhuRfGbSy/V7YHIdAWrx2tFSxYyrnq5ctfJU+p3E6G47gj
 Wb4NxCE8DF7IO8wDQYIhD06Gp74zgD8UazRG2pa57xGLnf6AmKNrUsAOiJ3DmKWzxQbG
 BoG1jOXHmRGxyqddaCyNhO/S5uCSQZPQdpUvc+Z3FNlE7yvdfTAFeEVJQZBuKZR6o4dB
 u99l2kinMzJnVJiieejs4nWFQS/X9Rzpc6c4r1Tan0h0ZkdoQOVnX6tkxyguV4P3q+79
 3m3g==
X-Gm-Message-State: AOAM533AMDHL0QC7ymmw9RWGCoLpUerydyGPiL6szrzzBoTS3CQu94Gn
 4VKa3eFCkEOKJU4WzKp3Ku9yP9b02qs/CnqBWjEH0uVESE8S9ANzI6j8ZNAOn4VoYKdDmgTk1V+
 QElYwU6cPtbtb2ya7EmfrM9yQdMmYEYZMr+dSrkva6V9pB0A7KLeKKJ1jtyzmFpwsqYo=
X-Received: by 2002:a17:906:4f90:b0:6f6:b288:b3ab with SMTP id
 o16-20020a1709064f9000b006f6b288b3abmr16396985eju.189.1652716572912; 
 Mon, 16 May 2022 08:56:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyPRw18XpemXXQqQjfAcommHR//FkozZQbbivBWMTCZgs67ii9WvB72lzRiY1giDDBsjniNA==
X-Received: by 2002:a17:906:4f90:b0:6f6:b288:b3ab with SMTP id
 o16-20020a1709064f9000b006f6b288b3abmr16396965eju.189.1652716572675; 
 Mon, 16 May 2022 08:56:12 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b19-20020aa7dc13000000b0042a6d0508a9sm3774309edu.73.2022.05.16.08.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Weijiang <weijiang.yang@intel.com>, Like Xu <like.xu@linux.intel.com>
Subject: [PULL 05/23] qdev-properties: Add a new macro with bitmask check for
 uint64_t property
Date: Mon, 16 May 2022 17:55:45 +0200
Message-Id: <20220516155603.1234712-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Yang Weijiang <weijiang.yang@intel.com>

The DEFINE_PROP_UINT64_CHECKMASK maro applies certain mask check agaist
user-supplied property value, reject the value if it violates the bitmask.

Co-developed-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
Message-Id: <20220215195258.29149-2-weijiang.yang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/qdev-properties.c    | 19 +++++++++++++++++++
 include/hw/qdev-properties.h | 12 ++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index c34aac6ebc..357b8761b5 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -428,6 +428,25 @@ const PropertyInfo qdev_prop_int64 = {
     .set_default_value = qdev_propinfo_set_default_value_int,
 };
 
+static void set_uint64_checkmask(Object *obj, Visitor *v, const char *name,
+                      void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint64_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_uint64(v, name, ptr, errp);
+    if (*ptr & ~prop->bitmask) {
+        error_setg(errp, "Property value for '%s' has bits outside mask '0x%" PRIx64 "'",
+                   name, prop->bitmask);
+    }
+}
+
+const PropertyInfo qdev_prop_uint64_checkmask = {
+    .name  = "uint64",
+    .get   = get_uint64,
+    .set   = set_uint64_checkmask,
+};
+
 /* --- string --- */
 
 static void release_string(Object *obj, const char *name, void *opaque)
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index f7925f67d0..e1df08876c 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -17,6 +17,7 @@ struct Property {
     const PropertyInfo *info;
     ptrdiff_t    offset;
     uint8_t      bitnr;
+    uint64_t     bitmask;
     bool         set_default;
     union {
         int64_t i;
@@ -54,6 +55,7 @@ extern const PropertyInfo qdev_prop_uint16;
 extern const PropertyInfo qdev_prop_uint32;
 extern const PropertyInfo qdev_prop_int32;
 extern const PropertyInfo qdev_prop_uint64;
+extern const PropertyInfo qdev_prop_uint64_checkmask;
 extern const PropertyInfo qdev_prop_int64;
 extern const PropertyInfo qdev_prop_size;
 extern const PropertyInfo qdev_prop_string;
@@ -103,6 +105,16 @@ extern const PropertyInfo qdev_prop_link;
                 .set_default = true,                         \
                 .defval.u    = (bool)_defval)
 
+/**
+ * The DEFINE_PROP_UINT64_CHECKMASK macro checks a user-supplied value
+ * against corresponding bitmask, rejects the value if it violates.
+ * The default value is set in instance_init().
+ */
+#define DEFINE_PROP_UINT64_CHECKMASK(_name, _state, _field, _bitmask)   \
+    DEFINE_PROP(_name, _state, _field, qdev_prop_uint64_checkmask, uint64_t, \
+                .bitmask    = (_bitmask),                     \
+                .set_default = false)
+
 #define PROP_ARRAY_LEN_PREFIX "len-"
 
 /**
-- 
2.36.0


