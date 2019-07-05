Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADE760C70
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 22:35:43 +0200 (CEST)
Received: from localhost ([::1]:55926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjUvm-0007Py-Nh
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 16:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34144)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hjUk4-0004HU-H5
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 16:23:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hjUjz-0002jn-Ny
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 16:23:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51742)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hjUjw-0002fq-Aj
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 16:23:29 -0400
Received: by mail-wm1-x32e.google.com with SMTP id 207so10296288wma.1
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 13:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uj5oH2lIOzQhbVvPGa1CJyfr5Ywg7honDl46Ua9isOg=;
 b=ZkFcGdaeOOtXb1HsONRTcOTJg5JPJgCFAPJaboK8fJcguFC1EaWs9boDlwUxOIXCxX
 N2UgBnO7kxloDx7t+MWTs20JVBsEGy4POt1Nnj7DiTd64tfZvIHbEVxx07lEOqTcJmyv
 xeSTBv9tpbeXSH5yy7/zqPHkwP6QFSjNKPrYMd5Kh7FLVSUvvD6DKdJ0/TdXWePVamtS
 NS1Xu8nAZTjkn59VzUHDDwVoCB39g1Gpm3INb0zOwRNL48WaH08skoJqAP5z6uZ+DTIS
 TEtvW0MQeO4hFyzbrUZNspI+JvvVXK6jYGvCtzRY3VtvqXJcAJvf8vLqOMGYKWdWCOv9
 QKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=uj5oH2lIOzQhbVvPGa1CJyfr5Ywg7honDl46Ua9isOg=;
 b=YXgyF8DquVgPVDW5jWGCJ0POTLqtFNSILjuFuG9b0HXruZyZm3N8Pm0ogkNUMcgAMx
 A2YFva7K+Ge4tYxlcjwRnPGlzimuiSBURAWpEGG+sOL31siUdbvu8R5cWdT7zc4OcPLp
 k6p9aznApDa/fpHXDQSwqW8gf6KLpszoMFqbHkV1Kv4Axe4zay4rQJ4U4Ud5kURtOjLs
 t9QMaU1Cs5yBAebx5AO+21BpUfPgA1Sm0K87W099cNA/7k4mgEhh7m26soV3cS4+bbIu
 CmRq5Ez2Z5HnOFlcsxjUxgWdJ1UnM+G6b59gR0SRcmpkJtwIBFqOuQQYqhYGUFOuRfaJ
 o3VQ==
X-Gm-Message-State: APjAAAX/EuPUbsKPkU14KW3rZ7jSfKjNxTjMkusOUBTBxj4LRJx5pXGo
 2oQBFKY94TJejFLZjzxLFwHBBUdIKVE=
X-Google-Smtp-Source: APXvYqwjk8NYCC8hvOlyXESbovgMIV9ogtZ3QAfWtu+0+Ylw6xwLggzRSif2kiZBauXw0bXCRM763w==
X-Received: by 2002:a05:600c:2243:: with SMTP id
 a3mr4432590wmm.83.1562358204804; 
 Fri, 05 Jul 2019 13:23:24 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id v23sm3035875wmj.32.2019.07.05.13.23.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 13:23:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 22:23:11 +0200
Message-Id: <1562358202-28008-2-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562358202-28008-1-git-send-email-pbonzini@redhat.com>
References: <1562358202-28008-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32e
Subject: [Qemu-devel] [PULL 01/12] pc: fix possible NULL pointer dereference
 in pc_machine_get_device_memory_region_size()
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

QEMU will crash when device-memory-region-size property is read if ms->device_memory
wasn't initialized yet.

Crash can be reproduced with:
 $QEMU -preconfig -qmp unix:qmp_socket,server,nowait &
 ./scripts/qmp/qom-get -s qmp_socket /machine.device-memory-region-size

Instead of crashing return 0 if ms->device_memory hasn't been initialized.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <1560174635-22602-1-git-send-email-imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e96360b..552f340 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2458,7 +2458,11 @@ pc_machine_get_device_memory_region_size(Object *obj, Visitor *v,
                                          Error **errp)
 {
     MachineState *ms = MACHINE(obj);
-    int64_t value = memory_region_size(&ms->device_memory->mr);
+    int64_t value = 0;
+
+    if (ms->device_memory) {
+        value = memory_region_size(&ms->device_memory->mr);
+    }
 
     visit_type_int(v, name, &value, errp);
 }
-- 
1.8.3.1



