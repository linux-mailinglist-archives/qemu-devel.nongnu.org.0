Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0BF3C15EE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:26:39 +0200 (CEST)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VvC-0003uz-9y
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmu-0000ES-PJ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:04 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmr-0008AQ-CP
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:04 -0400
Received: by mail-ed1-x531.google.com with SMTP id eb14so9127874edb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y4owSChp3xs52ili+LXOkhFZq9ISU7bHrCizRYtlASU=;
 b=bMCNxZoRK4FwyaTjYYdeb4d1HmBPoWCdZHRuEhZ9GlKLOVYzXA5/nFAVGAEDiYv9il
 g3hGE7P4+73pyM7VcQRhmLnSzyRk07Q0/M1sY8Dq3pWGylMNL1oqQKEzLRbClPOqSlim
 mka3SG5dm0tGKwJh7omicHTeVQFr/eGbmuiUq1i+Tcs8cR7Mytj3cUZnJCJmbBR3Oucx
 IoCL9TMvoc6SzXoIOCHHq5hJt4acTKNpRZhNMtZ4x5IVihrxHHVqOAGCPAiV9GwinG0C
 yNaPNlaim3wKYkffgAnsWXMnCDoEEnHeoPGidmNbXFS87wbjafi43obhWWkBSbn6vQjI
 l3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y4owSChp3xs52ili+LXOkhFZq9ISU7bHrCizRYtlASU=;
 b=O8uvsOF8wlGs6XexAE6jFzO0CQNEBEyfiZIyJKBfdYutR7wtL6dI0N+kYhganuLOew
 xsApTLWGZpH4HT0498H+BJylRanxiMlBixIB0/VKXBqvOBYs03W9dEPsvH/qceo9M7lc
 QQxMiU/jF8xDDhFARdbps66YD+v4GJ/puK6g56CNLTBHIkzHzssv14HAuj9jPkkUTPK4
 24tEYVe8yYOF4lXZMFz749sBglRrWvrYVVSafMRpeCFSomQWFN+pHnBU4xO7X5zovamr
 zMacdMIH8JCh7lPFMUXUeVlnb2KwWG+Ac6rxaUmXyheWTVgQQ8MTKLS6Fb6Njnane95Q
 r6nQ==
X-Gm-Message-State: AOAM5328RQrdmDyj9/Hb3Mf27/XvNHeJd1SQ0hul7OMqxreu35DKSQ7Z
 AiCz4iehB5cGkD42s9L/57Ykjy2gY48=
X-Google-Smtp-Source: ABdhPJwfbEXh8XdXfeu9UunN5rbMuxy5RtT9A85sm48hvHth/QCBJA77pDxu3l20Pq4hKsIn6hg1dQ==
X-Received: by 2002:a50:f0cf:: with SMTP id a15mr38888317edm.347.1625757478526; 
 Thu, 08 Jul 2021 08:17:58 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:17:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/48] modules: add audio module annotations
Date: Thu,  8 Jul 2021 17:17:12 +0200
Message-Id: <20210708151748.408754-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-9-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 audio/spiceaudio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index 999bfbde47..a8d370fe6f 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -317,3 +317,5 @@ static void register_audio_spice(void)
     audio_driver_register(&spice_audio_driver);
 }
 type_init(register_audio_spice);
+
+module_dep("ui-spice-core");
-- 
2.31.1



