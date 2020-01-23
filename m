Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAC8146D1F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 16:41:56 +0100 (CET)
Received: from localhost ([::1]:59630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuecE-0004Iv-TU
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 10:41:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51789)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iucrh-0005SX-Gl
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iucrg-0004J4-7l
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:45 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43676)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iucrg-0004FX-19
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:44 -0500
Received: by mail-wr1-x430.google.com with SMTP id d16so3114262wre.10
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 05:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OEkIKTJLqtLn0CwQfnZ9UM16dUj1z1/bOKbRoffOWsI=;
 b=oWemyY4AgVFVMi0XwZ+H1fMp9qEDMOQJQsbfJZLA1hcLXuxhIG/o8EsrmjDQWhzHse
 Fa35WQHd3BtI5w8rXpQUTFzYgCTU0CbLW+So6jIi1GJKV490rAeMV+dWYXH9xPgahLCS
 SL8cYn4MKZEab2dhNSQW28mnaEYrfFh2EzYcFvNHuNFqtdD6YIK85edEw95v9OrYQbgv
 zku20sdkb3ivEpyXTWhrTh3luD1y3xKLrQx8sRFkKzpW10klTU4sH+9BF5Ibfk5luFW5
 Dw86FDgbrkXdwDkUC10cVBSzSesdFCZLMzW08sBG8lp/yXdINTU0q180L4VkxFPYvy+m
 FGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OEkIKTJLqtLn0CwQfnZ9UM16dUj1z1/bOKbRoffOWsI=;
 b=j+dabcxOQXYkK6OSABxnl8yNH0DXZyghB72SkZ5xO0zi0N8n62bSN7zIP81vE8lurL
 2x/MtikeOIWkxCkabSemj0Hl9Tn7tCkYjGyW2pjhdOUVWCXiPnMJA6lLN3w8oL2cpMK/
 xMeXFmX6ZTeVAQnEWlgbqd4JMb1RxGcWf1fM4gavw+g7EQaAy/i91+eMlHBTrwI3o1ub
 lT0OunwqNvS7uyVgL6tOWfuyMewUsyGn3rc8pikEHZIwYclDtHj+IizZUOAQdetNYygi
 WE9q3o8Fo+ZPsP7cYrAKUguJJScLy+0bC+t3LwTMcgacaohZX8KRG5SDm0Gd4KLkVwzQ
 SXXA==
X-Gm-Message-State: APjAAAU9ZKE9UEXS3Zsq0AccSMBE5Q8JEuNUe2BKKX6h7tBL7Gx2IO3t
 7J082qBQDJy9fH27zL5KFF11+nG9
X-Google-Smtp-Source: APXvYqxBl/DJ0zQMzmGHkHq3Ph9hV3cJLwPEB/XsmRuUzR8eYGytXlZ0jLB2IixBHMVTIOaDCJvSuQ==
X-Received: by 2002:a5d:6305:: with SMTP id i5mr18054825wru.399.1579787382736; 
 Thu, 23 Jan 2020 05:49:42 -0800 (PST)
Received: from 640k.localdomain.com ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id s15sm3073171wrp.4.2020.01.23.05.49.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jan 2020 05:49:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/59] object: do not free class properties
Date: Thu, 23 Jan 2020 14:48:44 +0100
Message-Id: <1579787342-27146-42-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579787342-27146-1-git-send-email-pbonzini@redhat.com>
References: <1579787342-27146-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::430
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The release callback is called during object_property_del_all(), on a
live instance. But class properties are common among all
instances. It is not currently called, because we don't release
classes, but it would not be correct if we did.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20200110153039.1379601-12-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qom/object.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 1423344..30c4f82 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -2143,7 +2143,7 @@ object_class_property_add_str(ObjectClass *klass, const char *name,
     rv = object_class_property_add(klass, name, "string",
                               get ? property_get_str : NULL,
                               set ? property_set_str : NULL,
-                              property_release_str,
+                              NULL,
                               prop, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -2236,7 +2236,7 @@ object_class_property_add_bool(ObjectClass *klass, const char *name,
     rv = object_class_property_add(klass, name, "bool",
                               get ? property_get_bool : NULL,
                               set ? property_set_bool : NULL,
-                              property_release_bool,
+                              NULL,
                               prop, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -2328,7 +2328,7 @@ object_class_property_add_enum(ObjectClass *klass, const char *name,
     rv = object_class_property_add(klass, name, typename,
                               get ? property_get_enum : NULL,
                               set ? property_set_enum : NULL,
-                              property_release_enum,
+                              NULL,
                               prop, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -2429,7 +2429,7 @@ object_class_property_add_tm(ObjectClass *klass, const char *name,
 
     rv = object_class_property_add(klass, name, "struct tm",
                               get ? property_get_tm : NULL, NULL,
-                              property_release_tm,
+                              NULL,
                               prop, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
1.8.3.1



