Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A642F94F9
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:44:41 +0100 (CET)
Received: from localhost ([::1]:60652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Dya-0001Qw-KT
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dgh-0008Ji-Qv; Sun, 17 Jan 2021 14:26:12 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dge-0005NG-Fc; Sun, 17 Jan 2021 14:26:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id e15so5646429wme.0;
 Sun, 17 Jan 2021 11:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+o+ioZvx1jeZgR8bC7wg2B3Sh0sACSJW4nTdU8f7aTU=;
 b=RILotdEvzW7p4sBqW4M3EnDurWmb3N1pLM5Sn80jZz3dhPqGzfe1LGXAZuKZFhPNfL
 7Lx7XpFlVVSrcJsJXSE27NstSKS9FbF5TaaXEm6257Aes2wSs4ogex1kzLzabXoQYSIF
 hfcH2YVJ8DYFrNipRSor0w3i9gryP7mn5BQn1VHaXAUgUGYOtQapyTSkZAvZrkjM678L
 qguqYfFKE/GYaTw1mVfUQZOP8YDUeZCdbJ7H4CMKC/E16A66D64xL85cRrhR/kTt2TM8
 V+zkE0A0GlZ5Ix/60gPfowSN+Wx9X3Drp1WCJDNWNG6RR9Y7pJY0Hka6u6o6g0cyQ7yP
 LLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+o+ioZvx1jeZgR8bC7wg2B3Sh0sACSJW4nTdU8f7aTU=;
 b=gjqkyig8L5D0Dr1nWSeV5VtGCv7/T0WCssdiZZv7XDD4HNa7SSLjxjFD0zqE5WNvjI
 TFblGpMYsFtJuOfKqB3J/FbjBCVFNSJ3kZc8ubuTOuUbTKF304uzDmLN0tZCst1VTYpb
 SZcTeZTmpc9gemQHHXEPR6Be6O64u3HP8gpKOEqYXCU7M+AyuC2v5jchDWFGrNq0qUcK
 5j9jd4ABbc9/iyzVFgMLY7adV3DtYG/x2XcXWF0C/ejELZCvww6VQKiKFowZGQZPyjIk
 lt4hm6oBHlY1Kspkf4oKSBAjQcvTKMWzo7ap7KSD80GNyffl/qgqZ6Ss/sQhEuzgLpBY
 tQIA==
X-Gm-Message-State: AOAM533KdeSWs/Pcm5hEVnzW6fWtIFkQziLT7yEwZtGqax6I25TYDen0
 b8zYrkyhxT36PVz+VoG095I=
X-Google-Smtp-Source: ABdhPJwuJyD5eoJZdzZeLrTpidVMX4ieENOmYUA+91AatCaoyylhNKb7AwKmVzAyg91mXVCdFTHbWQ==
X-Received: by 2002:a1c:6744:: with SMTP id b65mr6011059wmc.60.1610911566671; 
 Sun, 17 Jan 2021 11:26:06 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m18sm25364721wrw.43.2021.01.17.11.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:26:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 14/20] hw/misc/unimp: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:40 +0100
Message-Id: <20210117192446.23753-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/unimp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/unimp.c b/hw/misc/unimp.c
index 6cfc5727f0b..e5ede95c124 100644
--- a/hw/misc/unimp.c
+++ b/hw/misc/unimp.c
@@ -81,6 +81,7 @@ static void unimp_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = unimp_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     device_class_set_props(dc, unimp_properties);
 }
 
-- 
2.26.2


