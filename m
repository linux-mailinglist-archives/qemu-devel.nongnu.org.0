Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645812F94FE
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:48:16 +0100 (CET)
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1E23-0004Xo-G7
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dh6-0000Gr-OT; Sun, 17 Jan 2021 14:26:37 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dh5-0005bA-AT; Sun, 17 Jan 2021 14:26:36 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 91so14459156wrj.7;
 Sun, 17 Jan 2021 11:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cQ7WuH65hManE2WTAsW8tOQLREFQZ7ZlBTq/RCNJDW0=;
 b=JVwXzyhxfwZ0PfTAO21ov55DvH4NurMxFuxYYskpxXRWpJ5OgzEF+m6pBPZL+aJssr
 rDHVXdKh0nM+GSV1JvyKTpCWg9JUEFk8k28CQ5O4bHDM2uH0S9CHS/odVO9PKWtWTVFA
 /mK61ANrkf9p/Aox3nkyVxxu+2rpdpW4DNZIUDeHJgbYFKwM3Gl373e9YWZgg4TD6X8C
 IN1BMR8bvV3CochTmOSOSiDmQm4zjCMYWv+ArKTDNPxUBUW1g8hlcL78zKAZAWCkzQqL
 zWzkFgXamnC8XE1TjDmvlfyYoqLPjDq8jVwymbn7lT+XZNmGkIzBK1RJPYzwj14UqUfj
 ykNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cQ7WuH65hManE2WTAsW8tOQLREFQZ7ZlBTq/RCNJDW0=;
 b=om5QYKqOt14KHXrevv7BGUCU+XwZfYjNWi9DxftWKojRa1qmluHnNcmh0oVWEQ5VmA
 T7xwosWEjKIQkVAIjpIuhwNMupZjhepifJoZd/IeAcGk2EpHGJQpbULQjvo51Pqq65go
 eodGpYUJ3E/Vkjy7uogHNK0806dOUrQxhpOFuLzULzbk8bzbkgbQOuojQWe7U+BO+SxK
 CM8siQYkrLW1pWOtahYlOafhHCMbWZHWRkpWOyH0KDyROGQK6q/QNZ/my2ZqWN1UMt/g
 dR2PryudHBowUeEdLjokZtkVcntv/AfI5gP00haPD1wPSxxMRsuUWtaVA62N5Lx7AdHF
 wXwQ==
X-Gm-Message-State: AOAM531nlv4UK44IvZVShG5RBg1+2LFHVZvYseSBrEgHiYFmqJGYQn13
 TUF0GHlqJ2Cvr1Mi81LWyBc=
X-Google-Smtp-Source: ABdhPJw0affoOQBd3BXv6ayluNOZxyQlytCo+1A20sV29BzouOR7ewU9Q8FY0mIPS4j8uDKHxbwQCg==
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr22876173wrh.209.1610911593569; 
 Sun, 17 Jan 2021 11:26:33 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v11sm24403198wrt.25.2021.01.17.11.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:26:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 19/20] stubs/vmstate: Add VMSTATE_END_OF_LIST to
 vmstate_user_mode_cpu_dummy
Date: Sun, 17 Jan 2021 20:24:45 +0100
Message-Id: <20210117192446.23753-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a name and end marker to the vmstate_user_mode_cpu_dummy variable.

Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 stubs/vmstate.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/stubs/vmstate.c b/stubs/vmstate.c
index f561f9f39bd..1d0e03e233b 100644
--- a/stubs/vmstate.c
+++ b/stubs/vmstate.c
@@ -2,7 +2,12 @@
 #include "migration/vmstate.h"
 
 #if defined(CONFIG_USER_ONLY)
-const VMStateDescription vmstate_user_mode_cpu_dummy = {};
+const VMStateDescription vmstate_user_mode_cpu_dummy = {
+    .name = "cpu_common_user",
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    },
+};
 #endif
 
 const VMStateDescription vmstate_no_state_to_migrate = {
-- 
2.26.2


