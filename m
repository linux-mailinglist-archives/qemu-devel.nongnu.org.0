Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D28931FE26
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:47:36 +0100 (CET)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9sN-00012X-AT
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9kI-0002g6-Rt
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9kG-0005UG-Bb
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQ6bR9q2nTx8UZfcCwDp8YyWJ5IdPylW4EMLv5ePnSc=;
 b=aiIBXvVyVz8UZbKJ1VRMWUICNBGe/Ged0aq2gyJIxKbrGg/y/4qW6C+GOeGtIqz8jtKocz
 5JzrOWvPQ7Ac/lyOQZIzNKA0PophRMhi2pvyfybwaAlU4CSSoR35XxHQdA1Qhusxog216A
 8gIlUEBGhNHKT/IFLkIGd8rknRMOg3c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-jlinCSUnMfuU5SOmAxnmrg-1; Fri, 19 Feb 2021 12:39:09 -0500
X-MC-Unique: jlinCSUnMfuU5SOmAxnmrg-1
Received: by mail-wr1-f71.google.com with SMTP id q5so2752382wrs.20
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HQ6bR9q2nTx8UZfcCwDp8YyWJ5IdPylW4EMLv5ePnSc=;
 b=cqiHOYkza//z7loUZ5/86uyU2kpAFp80G7CKJDgNtwOtksb1/FdzDe30Lk5ytE5eye
 htZwwl+OYm4upiI8Sbakevquw/mwMeXEKfuJqRernTijuRjs2ZM4LbgQO0OFM+W96etp
 EJn/ptDAlJCP5U/FqeFNHYrdQv63ABH800qsVZQfP6NK/WghXUs1RCuGAQTESZKUJxJ2
 qEw1Z8my5YgUG6Z7hUSu5Huh8OzdrvleOiztNkLXnMofXLNhcKtdq1P8YBLGYW5Apzhh
 PiceNJHTXZdyJQy5tso091t1wvoRkHsKN48FJB+cKGrwiOjwEf8mSAPu+WubygT48PGY
 52Mg==
X-Gm-Message-State: AOAM532U+HSqwtunGQRLmPP/Z+iHkRemV6oZLQkrdJdzJdONAMAETm9I
 w9mFhjicaLd0/QgEEa1XF8tiqwRFod+ubmxF+HGcEqz3vHq5N13cuWZMY1SEFeuJwk7x5JaJgQk
 LqEv1UzyDo9/hghZz8yR256URBAqXDUVnePHc2V79z4FsxrlptGKnRxgxCdPByptl
X-Received: by 2002:adf:b342:: with SMTP id k2mr10246419wrd.264.1613756348013; 
 Fri, 19 Feb 2021 09:39:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRIsqLMFpNjZYF3WUU2UHyYdzuctCSQdLydicZwE25C3zYE3MQJaOoIUNZctaN8YvHWyznKA==
X-Received: by 2002:adf:b342:: with SMTP id k2mr10246368wrd.264.1613756347790; 
 Fri, 19 Feb 2021 09:39:07 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y62sm15299048wmy.9.2021.02.19.09.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/11] hw/core: Restrict 'query-machines' to those
 supported by current accel
Date: Fri, 19 Feb 2021 18:38:39 +0100
Message-Id: <20210219173847.2054123-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20Berrang=C3=A9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not let 'query-machines' return machines not valid with
the current accelerator.

Suggested-by: Daniel Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 44e979e503b..c8630bc2ddc 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -204,6 +204,10 @@ MachineInfoList *qmp_query_machines(Error **errp)
         MachineClass *mc = el->data;
         MachineInfo *info;
 
+        if (!machine_class_valid_for_current_accelerator(mc)) {
+            continue;
+        }
+
         info = g_malloc0(sizeof(*info));
         if (mc->is_default) {
             info->has_is_default = true;
-- 
2.26.2


