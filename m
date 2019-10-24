Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631E7E3514
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 16:11:18 +0200 (CEST)
Received: from localhost ([::1]:43688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNdpc-00017T-Sb
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 10:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34787)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iNdix-0007pF-6Z
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 10:04:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iNdiv-0007kE-V9
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 10:04:22 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45362)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iNdiv-0007jo-Oq
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 10:04:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q13so21265465wrs.12
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 07:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KFoaCTpYKZuGSbpa+7c7e1feXYIhKJED+OF4NhJ9Cig=;
 b=sG5rF5CUwDzs3pTMdK8OirpoSb/cxdmi9jdvwtOLr9yhZfAw8NnFpTvfjTEmTtK5Gc
 fX0Hb7hGp/rqhJYbkMnJpiR7VqB+/tv+dCSHgqo7k2w3MlJRpl6jdtxG1MDjkw5O0OlE
 8zIzYmqCN3nuGUUxXOrhO55UK+F8QXggdl/ec1/gv+QAxdUw8UJbx9jlS7hHrkmIaW3/
 k/I+uO8gwnf2fehwta4Mg+clueVq/aap1NXJK4WqLbL8ePAJAlD7uXs3Y6iQcz8/4DU0
 NXsLlSbd+S+IUL0qezhFKHA2+OqFZDfKNjn7egI2DjlUrBwGQxexAlnRvihfMLqDwsqU
 q3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KFoaCTpYKZuGSbpa+7c7e1feXYIhKJED+OF4NhJ9Cig=;
 b=M1qDDvD3RswtztLY5Hwh0zAgktHoDewPeXLbFn5ynxhNFWAJMYkNRPwszageFIAwtB
 dQwB6HYgj2UcFO7hp02Fx3mrIdUaBafww/wDGhlXJ8Wdfio1Uwu/EdgrwKxKQkZUMd2y
 J7inprPHIVhmzF1tMyeUERR5zNuuqNBVtrI8fzeRsPzSgoVd4P0tEHiW8QI7zk3/a69A
 psDYZJvRU2nWOxpRTtBOyzPusqVdO/nmWnSBui5SbiYMHgqRKqgXqWaJc3w+3+WwHnf1
 SSXiNOXFI2bNpVCt715rs9OgzMtvqbC6VuXGIXkqAv4UjAF58rQOhOmyjxx+NTQz6BR5
 184g==
X-Gm-Message-State: APjAAAWkAuRS0iiMYqcII6DGbOBBv/9W/nBdzArOHZS/ynORfRycoFjh
 0WWncq1H5fFIQTc/4DtXMrZuLeir
X-Google-Smtp-Source: APXvYqyUtTPAhPOmxY7FJochviyHTFZGfClWs+lmG8qJn1JelX2oBeDppy9GP1O0WzhFHwcoSu1RVg==
X-Received: by 2002:a05:6000:11cd:: with SMTP id
 i13mr3898816wrx.197.1571925860485; 
 Thu, 24 Oct 2019 07:04:20 -0700 (PDT)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b7sm10610155wrn.53.2019.10.24.07.04.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Oct 2019 07:04:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/39] MAINTAINERS: add microvm related files
Date: Thu, 24 Oct 2019 16:03:37 +0200
Message-Id: <1571925835-31930-22-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571925835-31930-1-git-send-email-pbonzini@redhat.com>
References: <1571925835-31930-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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
Cc: Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

Add a new "microvm" section under "X86 Machines" with the new files
related to this machine type.

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 250ce8e..72ab731 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1275,6 +1275,15 @@ F: include/hw/timer/hpet.h
 F: include/hw/timer/i8254*
 F: include/hw/timer/mc146818rtc*
 
+microvm
+M: Sergio Lopez <slp@redhat.com>
+M: Paolo Bonzini <pbonzini@redhat.com>
+S: Maintained
+F: docs/microvm.rst
+F: hw/i386/microvm.c
+F: include/hw/i386/microvm.h
+F: pc-bios/bios-microvm.bin
+
 Machine core
 M: Eduardo Habkost <ehabkost@redhat.com>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
-- 
1.8.3.1



