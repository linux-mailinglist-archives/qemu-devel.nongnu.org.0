Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A464F400454
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:52:07 +0200 (CEST)
Received: from localhost ([::1]:60920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDMD-0007nS-DO
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGA-0007h4-ID
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDG7-0000u2-IZ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOJQhlETtOueKegWcvS/QPbLXEVYKjhJkC5dBOYp7Ak=;
 b=QZYPVCkoT2IM0oVZP9Mar6xhiv58OJNMd42wuaWVPS1K0JsEpi7SW3vbl44AoIF6XGyyVQ
 awAUnkvm7X+fjxjKeOhgmHJsO//kN0qPX5lQCt4fKf0K/n67GO186y8PrT4gSjcbp/n6U5
 tdLYAHWuOzfc8fAkgMsTEMak1dM9qZU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-8NiH3swGNk-XkniKj2wQ0w-1; Fri, 03 Sep 2021 13:45:46 -0400
X-MC-Unique: 8NiH3swGNk-XkniKj2wQ0w-1
Received: by mail-wm1-f70.google.com with SMTP id
 h1-20020a05600c350100b002e751bf6733so34519wmq.8
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UOJQhlETtOueKegWcvS/QPbLXEVYKjhJkC5dBOYp7Ak=;
 b=DouDzAp0SA/PTfLgLITXw6Nt+n1947bDHkEvDZ4lgJNDCA2utWCV76qoPnsp0GT9VT
 eesCyflT3qSbNpChUXki7FF9lXy0MY3zWHohIM+FvdZxQnwYHQuWIo8AkKvzM+V44SWd
 3WNmHLGkwmYfYbsOSAddo3sjOYT8tLpVzbmdCEJlzFWcYAmlN87PZS/5ppauGqQr++iG
 XlYG320v2cDo08L5GiYqpVsBm2hYboowXSC97zxtjbpj/jPG9Se10fBaj6baZz+uv7IM
 vgdyDdsmlA2kDga1SdImkZ5o0FthSgB6iTBZXj2YvzS474jhVneqgQPP0FouVktj7W5z
 cJ3Q==
X-Gm-Message-State: AOAM531rLBrTvIb0faHmGXlf3hVFb7Llv8RrJQfvN1sg489eNsvTjBNf
 reuks/Ced5cvdPn1UJTHioTrIjFnjY8SyrS07KgsdrwfOSH/oi8YPOSTzsUfxuVeHLHkGjCBVhf
 yg4ssHpSGdgnzAVVJYtOnopYP6otJQm/QWAN+Vqm2kCyJOmh6ptaFVCI0GPqq9XgP
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr18613wmj.63.1630691144516;
 Fri, 03 Sep 2021 10:45:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRcKTaz97wda548576WB0Zd/5O2JWIA53BBlXPcv5Ju9z6ytfJ7STvVT7J3SpaUUWN07DYGw==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr18578wmj.63.1630691144215;
 Fri, 03 Sep 2021 10:45:44 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id q195sm23691wme.37.2021.09.03.10.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:45:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/28] softmmu: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:48 +0200
Message-Id: <20210903174510.751630-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/memory.c | 2 +-
 softmmu/vl.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4df..1db019393b6 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1140,7 +1140,7 @@ static char *memory_region_escape_name(const char *name)
         bytes += memory_region_need_escape(*p) ? 4 : 1;
     }
     if (bytes == p - name) {
-       return g_memdup(name, bytes + 1);
+        return g_memdup2(name, bytes + 1);
     }
 
     escaped = g_malloc(bytes + 1);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ea05bb39c50..7a44c63a6ad 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1154,7 +1154,7 @@ static int parse_fw_cfg(void *opaque, QemuOpts *opts, Error **errp)
     }
     if (nonempty_str(str)) {
         size = strlen(str); /* NUL terminator NOT included in fw_cfg blob */
-        buf = g_memdup(str, size);
+        buf = g_memdup2(str, size);
     } else if (nonempty_str(gen_id)) {
         if (!fw_cfg_add_from_generator(fw_cfg, name, gen_id, errp)) {
             return -1;
-- 
2.31.1


