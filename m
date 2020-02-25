Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC80316C0CE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:29:42 +0100 (CET)
Received: from localhost ([::1]:54174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6ZLJ-0001OJ-Oz
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50205)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6YlU-0002Ks-9N
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:52:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6YlT-0002DR-94
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:52:40 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54498)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1j6YlT-0002Ac-0x
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:52:39 -0500
Received: by mail-wm1-x32d.google.com with SMTP id z12so2666717wmi.4
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 03:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Trf/mk0jpdqf1s96yCJ2TYHlIrv5Mg6JRkgeQGUFSRo=;
 b=S9rXNKIpQdDaW8HlV5iL+/PPxn6SX+DOwbLcsfapgBUX4NPYqoHSlRPB6I/oWfCFqo
 0+Q4jwhQXAStaaiflqRIcWh5IJJwhffdMf6Wb278DrLy49fDoiNS/hUgIfAp4GUMdcOr
 JIuXvnNrL4pB2cZd5Kvo5swf54QkBsiqpiGepKPSonIlDvxk9U5eo7mTnQNC8pcMIwwh
 8JpHjcUWrHfO9Y+P9jZHMEODFrOz8RDP3/CbyO2UY1KASkatv08LcUSeFt6qdlNmVemQ
 pot/sT03Bx0B81D9VvtNBOHnP0TNqMKDvV+ST8oIgcFicJ6CVxbin+hxSIkJrpB1TbUi
 CF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Trf/mk0jpdqf1s96yCJ2TYHlIrv5Mg6JRkgeQGUFSRo=;
 b=uXdoT+lXIt3qRxgdkS5s/6OfznZ7I4sxWyMNMGnpzFz0Gptt08k8ukWMdK/T9J/U/x
 D8u+rMJvhPYAFvPWMmGNOvjKuiukQI5PXe9I+TuPUoKFRNBgcz3+dbmnC2Xshir91Wxx
 jWSjxJB2f+ogcaJSFX/vvquOhz6KDtO+7AvjUcVJpvkqslazAqFJ+HELB8EomVS1XNhR
 kWA0zRSq1cGBmMLPXdEh6BjTU2AnVGJNLH1lTmjZlAssK5o2MePQWMxnQ9isptW8CQ+D
 9hwjeOojk2hS/R73CSP7VS59llDiJBmh+tNR8Nwog9JD6thLEIOIBf7OdJr9dEIVWhs8
 ltPg==
X-Gm-Message-State: APjAAAV3ykaoAFvR7m4B46kuAd+CSsHwlTqQHn7XD4tUDSYnGZ1xuXYb
 t3OO0XeRHPFySBExdnTwmuh7vroo
X-Google-Smtp-Source: APXvYqxXBKnemSL9tVWUJO7zw4Yj9Tm3bviIb2vU3W8xAyy6aiAUQU3Naw8PipgQZopqgD/t1LuzpQ==
X-Received: by 2002:a7b:c109:: with SMTP id w9mr4835494wmi.14.1582631557596;
 Tue, 25 Feb 2020 03:52:37 -0800 (PST)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b67sm3922326wmc.38.2020.02.25.03.52.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 03:52:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 099/136] memory: Correctly return alias region type
Date: Tue, 25 Feb 2020 12:50:29 +0100
Message-Id: <1582631466-13880-99-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
References: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32d
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since memory region aliases are neither rom nor ram, they are
described as i/o, which is often incorrect. Return instead the
type of the original region we are aliasing.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200224205533.23798-2-philmd@redhat.com>
Supersedes: <20200221173049.18134-1-philmd@redhat.com>
---
 memory.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/memory.c b/memory.c
index aeaa8dc..ce11798 100644
--- a/memory.c
+++ b/memory.c
@@ -2818,6 +2818,9 @@ void address_space_destroy(AddressSpace *as)
 
 static const char *memory_region_type(MemoryRegion *mr)
 {
+    if (mr->alias) {
+        return memory_region_type(mr->alias);
+    }
     if (memory_region_is_ram_device(mr)) {
         return "ramd";
     } else if (memory_region_is_romd(mr)) {
-- 
1.8.3.1



