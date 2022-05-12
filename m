Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834EC525482
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:14:21 +0200 (CEST)
Received: from localhost ([::1]:37320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDKO-0004yt-3l
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZm-0005HS-HR
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZk-0005IG-Ux
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a2ewl65k2BsKwBRrNMCT5JJmqFh0lLY+3S8RR03vM5E=;
 b=JzjQXkMhQaOV05JznJlFstZUNBmWAH+S/3IzTGnAtVh+utywVJkQr/tubpW68ap/S4DuRF
 twNec3rZ1q+cU703eFfq+pAx5AJzt6o0/b3yf/BIw1OCzpEyHY/16G7OzJcMRXc70k9Mr3
 +2PYzpeFHzP6aoQ943IsOzibwLaxg9E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-6ohoevVMNzSKGKc2W5cEXA-1; Thu, 12 May 2022 13:26:05 -0400
X-MC-Unique: 6ohoevVMNzSKGKc2W5cEXA-1
Received: by mail-ej1-f72.google.com with SMTP id
 hr42-20020a1709073faa00b006f4dc7f0be1so3154501ejc.22
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a2ewl65k2BsKwBRrNMCT5JJmqFh0lLY+3S8RR03vM5E=;
 b=xYsMe4lUUt5t4GeUOgxEPPDTtVo7jEUzIpaoj0VV1RmzncVY8uI/LThIm/Colmq5JP
 kfaF82YMzWXZj6OeTPsNVXYnoIXcfABZ8zulpNMj7zqjBcpSIg0F4o2ArA7WYq+D+laC
 dbGW0LD6+OwW1HhSQbneVkRdQmqr8tOMFKWDRXdm8I4McuZnSbVpJQ9vVtMernzDNsQz
 y6VoDm9jwByi8L4lYwtOPLNxkqw5QP/Sp/cBOiS7zZOvreJYF/py+FJ4EjDem2a4ZSe9
 GKRdtUgK7fbtdrxzEt12YRIOJy+0UezYlcKIJF+9G0eH9fMIXLKVnQWvyMnIYA0L9Zsd
 D/zg==
X-Gm-Message-State: AOAM531L0ewXhrHxnLMfsY90vE6mTe3hlOMtjUsWtsOxCYP2yPn/BQyq
 hlApfZxecfLamper7C0ifiRKM0R8vP1U2YElkDzb4mmcXnghn+RlGV/Bt7rcbvsVgL1OE8tOnP9
 KrHjCOplbBBHuAAcVcS7LDDeUEsvGibBDtzqnTq4D4JfLX+AIM7UrMq9G7yFBK6eWU4Q=
X-Received: by 2002:a17:906:9749:b0:6f5:6cd:5bd9 with SMTP id
 o9-20020a170906974900b006f506cd5bd9mr860360ejy.523.1652376364093; 
 Thu, 12 May 2022 10:26:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz37FHJbWwvfgMRXhSgw42VmNAhVT+qcIR4UJeNjrQMvTUP0UWOKEv9d4MrNAiqst8e7G2gdg==
X-Received: by 2002:a17:906:9749:b0:6f5:6cd:5bd9 with SMTP id
 o9-20020a170906974900b006f506cd5bd9mr860337ejy.523.1652376363821; 
 Thu, 12 May 2022 10:26:03 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a056402329200b0042617ba637asm2930563eda.4.2022.05.12.10.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:26:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Subject: [PULL 26/27] vl: make machine type deprecation a warning
Date: Thu, 12 May 2022 19:25:04 +0200
Message-Id: <20220512172505.1065394-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

error_report should generally be followed by a failure; if we can proceed
anyway, that is just a warning and should be communicated properly to
the user with warn_report.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220511175043.27327-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index edba74f075..817d515783 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3631,7 +3631,7 @@ void qemu_init(int argc, char **argv, char **envp)
 
     machine_class = MACHINE_GET_CLASS(current_machine);
     if (!qtest_enabled() && machine_class->deprecation_reason) {
-        error_report("Machine type '%s' is deprecated: %s",
+        warn_report("Machine type '%s' is deprecated: %s",
                      machine_class->name, machine_class->deprecation_reason);
     }
 
-- 
2.36.0


