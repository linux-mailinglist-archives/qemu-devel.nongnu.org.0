Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57008456EDB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 13:31:28 +0100 (CET)
Received: from localhost ([::1]:57598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo339-0002Qq-GN
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 07:31:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo315-0001iz-LC
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:29:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo313-0001dY-AH
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637324956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E+YM+uFqQtRebrslkx7MGj6jXY4YEZwnEuDUwanLYdw=;
 b=ViVLWIujDCchYzJuQyEh7ANVqozQBBoPCxchXzxXvJXYF1f8BX+VFgEln1arPGk616ysJe
 0NUIdmJrLKS6xFA6uaRBKg3pHv10MNrztlseufTJAWq7c6MhHetNSz4lKiJyeJP7h/4yMB
 pqA2FdtyoYBBfhSp+noRl0XE21WLCks=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-PSTQVCN2Oj2B5dTZdjbzPA-1; Fri, 19 Nov 2021 07:29:15 -0500
X-MC-Unique: PSTQVCN2Oj2B5dTZdjbzPA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso4662798wms.1
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 04:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E+YM+uFqQtRebrslkx7MGj6jXY4YEZwnEuDUwanLYdw=;
 b=AxFYXN01/XM90OJFN372RVsS9rQJaHlJVmvF3MQD3WPrFm/+Xd0Tmpm9LMRpKwZZ4+
 94Qh20ao5pcBnPO6Nw/j24LezSokaWVe0h2MB6MOhBpuZcyY5DiwKRiRJh7ZRj9OyZPo
 k9scp/ZUJWM872F21T9YJMwKlWsOPxlC5R4Em0+ZcLXOAkWvmmKQo4iXiX41Xqh1EOOq
 ROUBsbme8k4f6ESRgS0cjFNqAzZPz507wTaBJc4mE30nqkGQleJaNCL3fb4V/tE6Kwpm
 /JhQoguM5oIgvWmuiVwRK0/0CKgoCvSokvv0JjSUd4MytYB3oLVAJPOGu0NF1kY36oTe
 9rIw==
X-Gm-Message-State: AOAM532StlsQCy3y0zdoKWd3GRnJ0CmY86gOtF60mvKG57fs+mnmW+9a
 Y48E8ZgqLME6/nnAWFO4TpOqtRJTd7fyQOR8IhNjBE5L+APelbwaKWlI1kPZMy6x0PX4GjoyJWd
 C8bcm4FOQAb2s4hnX+68rHifXZW5UvFI9BrbOHPOXqQCmuV7TAs8xEaAuEEZMNdn1
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr6255355wmg.71.1637324953805; 
 Fri, 19 Nov 2021 04:29:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwf9V+gplc8AYEK15dOpOBnxlqpvEyWMRzCDOwvyoFqDb6qhIc9GN/PHNgzMpAjjCvzMRVwrw==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr6255298wmg.71.1637324953445; 
 Fri, 19 Nov 2021 04:29:13 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o4sm13954331wmq.31.2021.11.19.04.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 04:29:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2] qom/object: Ignore global properties with empty
 name
Date: Fri, 19 Nov 2021 13:29:11 +0100
Message-Id: <20211119122911.365036-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using -global, properties might have empty name/value.

This fixes this legitimate use case:

  $ qemu-system-x86_64 -global driver=isa-fdc
  qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
  string_input_visitor_new: Assertion `str' failed.
  Aborted (core dumped)

  (gdb) bt
  #4  0x5f6b8d5 in string_input_visitor_new (str=0x0) at qapi/string-input-visitor.c:394
  #5  0x5dd0f8d in object_property_parse (obj=0x6f33400, name=0x0, string=0x0, errp=0x7ffc9c8) at qom/object.c:1641
  #6  0x5dce131 in object_apply_global_props (obj=0x6f33400, props=0x6737360, errp=0x6611760 <error_fatal>) at qom/object.c:411
  #7  0x5dc5ee2 in qdev_prop_set_globals (dev=0x6f33400) at hw/core/qdev-properties.c:790
  #8  0x5dc89e8 in device_post_init (obj=0x6f33400) at hw/core/qdev.c:697
  #9  0x5dce02b in object_post_init_with_type (obj=0x6f33400, ti=0x672bd20) at qom/object.c:383
  #10 0x5dce059 in object_post_init_with_type (obj=0x6f33400, ti=0x66e9090) at qom/object.c:387
  #11 0x5dce059 in object_post_init_with_type (obj=0x6f33400, ti=0x66df730) at qom/object.c:387
  #12 0x5dce566 in object_initialize_with_type (obj=0x6f33400, size=848, type=0x66df730) at qom/object.c:519
  #13 0x5dcec78 in object_new_with_type (type=0x66df730) at qom/object.c:733
  #14 0x5dceccf in object_new (typename=0x60fcf81 "isa-fdc") at qom/object.c:748
  #15 0x5dc75fe in qdev_new (name=0x60fcf81 "isa-fdc") at hw/core/qdev.c:153
  #16 0x59eec58 in isa_new (name=0x60fcf81 "isa-fdc") at hw/isa/isa-bus.c:166
  #17 0x5bd3607 in pc_superio_init (isa_bus=0x66b42e0, create_fdctrl=true, no_vmport=false) at hw/i386/pc.c:1026
  (gdb) fr 6
  #6  0x5dce131 in object_apply_global_props (obj=0x6f33400, props=0x6737360, errp=0x6611760 <error_fatal>) at qom/object.c:411
  411             if (!object_property_parse(obj, p->property, p->value, &err)) {
  (gdb) p *p
  $1 = {driver = 0x6738250 "isa-fdc", property = 0x0, value = 0x0, used = true, optional = false}

Reported-by: Thomas Huth <thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: s/55555555// for readability
---
 qom/object.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qom/object.c b/qom/object.c
index 4f0677cca9e..45fa8561df6 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -401,6 +401,9 @@ bool object_apply_global_props(Object *obj, const GPtrArray *props,
         GlobalProperty *p = g_ptr_array_index(props, i);
         Error *err = NULL;
 
+        if (!p->property) {
+            continue;
+        }
         if (object_dynamic_cast(obj, p->driver) == NULL) {
             continue;
         }
-- 
2.31.1


