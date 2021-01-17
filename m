Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE3E2F94E0
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:30:10 +0100 (CET)
Received: from localhost ([::1]:51552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1DkX-0002XG-99
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DgV-0008Ck-38; Sun, 17 Jan 2021 14:26:00 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DgT-0005Kg-ME; Sun, 17 Jan 2021 14:25:58 -0500
Received: by mail-wm1-x32b.google.com with SMTP id r4so12028468wmh.5;
 Sun, 17 Jan 2021 11:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ywUmqbvL1fXxkTM+pHTvth+aqc+cAGL+9PBE1kwGlvU=;
 b=k7DODHe+DDG3vQtF/snRglJd6BfW3ctKhMz9N5ZFRJPXSf0dzDpFVpp9dGeQyIgka2
 mdTqYVgIVGe5jiF7pLc665Uf/KYCTz00064LRcNBOnBSZwp4xOO/C2FsgmaTxp+Kiri3
 3Mf9O0Cx7AipZaS1Zz8GU8BYzJTllHxdSsIAZYe4jQYB666OfBzttpHt1QlcVEFKMp2/
 DUtIxBfJ+7eq4+Tuhq2c7ApuCa19fDN6L1A5gmBj05wZQPRf7cxIsFi8TZ+4YZM1sl73
 AzwsJyf9tONeU4ZjEQivy5FmqH5hXP/mttczYyRpcyFWIc7Di+uYnV/oAf6jLi0l8iIp
 oobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ywUmqbvL1fXxkTM+pHTvth+aqc+cAGL+9PBE1kwGlvU=;
 b=JO3E7PMNOhR12fnOh8SGjSW0hJSAzkiJQPitnwtNEXaAKf6NRInpSqAuBZx4xGQfr9
 0wwosy4h5Pql16JH70dqXL/Eppq7fx26rj+TSuNv1QAEr2g4oonRvdDblhOBQLG8j7Ez
 S5qoljalsEjKczlVJlV6RH+uC5+WOA5oVGRKTcH2b7o6Y66p4CqCcHXziN5qP6Izwe9o
 FoixtFRj9aPKo4HmZeVTWRJbYyefq+afAfVByUg1ZsL2LvmImUsfd/yHXfgVav5utuhm
 WVUfHU+brS0lJltQ5FetA9P4z0x5upEHbOzdwyRZbwxITiSSkccQJBYAtAAovXq5IO+4
 cGCw==
X-Gm-Message-State: AOAM533g0oP2YfIJEVAsfIY+7sHQTEvgJEUwXrygP+Mvud3CvGUVeR8W
 9qTeNe0XHH5FnrPmRvZapNg=
X-Google-Smtp-Source: ABdhPJza6zbRor9M5WyThlg8NoJDp6Fltcq7KawV8Ng1oH1jGEM16OJHPmdV21ZTChQidt5vQpLFbQ==
X-Received: by 2002:a1c:9c91:: with SMTP id
 f139mr18028374wme.118.1610911556017; 
 Sun, 17 Jan 2021 11:25:56 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c18sm42879172wmk.0.2021.01.17.11.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 12/20] hw/misc/armsse-cpuid: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:38 +0100
Message-Id: <20210117192446.23753-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
 hw/misc/armsse-cpuid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/armsse-cpuid.c b/hw/misc/armsse-cpuid.c
index d58138dc28c..61251d538b9 100644
--- a/hw/misc/armsse-cpuid.c
+++ b/hw/misc/armsse-cpuid.c
@@ -115,6 +115,7 @@ static void armsse_cpuid_class_init(ObjectClass *klass, void *data)
      * This device has no guest-modifiable state and so it
      * does not need a reset function or VMState.
      */
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
 
     device_class_set_props(dc, armsse_cpuid_props);
 }
-- 
2.26.2


