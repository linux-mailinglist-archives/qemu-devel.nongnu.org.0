Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AA9300E27
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:52:40 +0100 (CET)
Received: from localhost ([::1]:58048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33Q7-0003Ap-ML
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33J1-00057W-Na
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33Iy-0002fD-Go
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GydJH9WUvPPt/ZHf2nL4t32IBhhMcFqNk+W+P5HZBSw=;
 b=RG1yqFUpY/zklr3/5XHJpFx/L7jd/SI47ObGqzlYv9VUZsk0Mc6YPXtq7ejmid0PeaYncH
 DXCuW2doGZusosPWmCQravIZlbnzpwznMDkXtddALSteRwJ6/Zk2i6IDUWvOYvnotJHrO/
 hZqCWBtxI8q2muIjlbUA6qTNZCjFccM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-B0zRL1DLOXOLby7AINQtAw-1; Fri, 22 Jan 2021 15:45:13 -0500
X-MC-Unique: B0zRL1DLOXOLby7AINQtAw-1
Received: by mail-ed1-f72.google.com with SMTP id n18so3509155eds.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:45:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GydJH9WUvPPt/ZHf2nL4t32IBhhMcFqNk+W+P5HZBSw=;
 b=fl1i20ubqB+EnKSvFR4k2ThuLfOUCa/54mfbo1wpREp50fFQ62s7Sr0+ztFE/mQTkH
 UlyYtUcnAbg/AaU6ipcI8mStA5DJ5jbMrHBbzFKX6YgsinsNL8R8/s1kKSmkKvRMMf22
 YhpkaS38szw2RmyWNp/jNvqsDY8VY4m89ot7Ke9V8e46+N67Ldoo1nqPlVjQKFuPzHRj
 jUtnlc6ru6d0ODbQgPjGhezaFUvYv2BSxbNm63fHPFxdwFuNTE2cuqMzaDUHJXYBEqIB
 TdNN7buOyr3S6hkW5rVmZS+B9F1W5oVbsTY3CIMorqOats/b2ute2dP5lUsLZ1g/ofeB
 skKg==
X-Gm-Message-State: AOAM531zxhcCDJcNaPg+rS/zlWKaKqGoxkNpRQ9XOgX1Lkz89M4no3Kt
 xroBmeJpT89/x+8jb8bTIhNXo6GDIadNO4kvMW6HfDNgGM+d+AtA84IRZPCTs9DiZ4j7EOal3UW
 CClvgBlgj3SHGA/nWbhkTNb8pkWwV9LIa7APTS3vbKGU9ei40Wsaihj/X+Br1Q8/p
X-Received: by 2002:a05:6402:104e:: with SMTP id
 e14mr1119995edu.316.1611348311770; 
 Fri, 22 Jan 2021 12:45:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjuas0tORPJ2oQr+NbjgaaeWf35m/gryQH1uCP+H++dgJ4ILLPMgRwzJcRh2+QYN7ixyqKIg==
X-Received: by 2002:a05:6402:104e:: with SMTP id
 e14mr1119973edu.316.1611348311563; 
 Fri, 22 Jan 2021 12:45:11 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id i13sm6234856edu.22.2021.01.22.12.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:45:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 05/12] meson: Restrict block subsystem processing
Date: Fri, 22 Jan 2021 21:44:34 +0100
Message-Id: <20210122204441.2145197-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122204441.2145197-1-philmd@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid generating module_block.h and block-gen.c if we are
not going to use them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: qemu-block@nongnu.org
---
 meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 61cbb89cd44..181f8795f5a 100644
--- a/meson.build
+++ b/meson.build
@@ -1829,7 +1829,9 @@
 
 subdir('nbd')
 subdir('scsi')
-subdir('block')
+if have_block
+  subdir('block')
+endif
 
 blockdev_ss.add(files(
   'blockdev.c',
-- 
2.26.2


