Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EED2381A43
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:45:51 +0200 (CEST)
Received: from localhost ([::1]:51266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhyMI-0006sG-8q
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEj-0000rJ-8O
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:38:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEb-0006KU-8Z
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oapXbLTqf6jmlB2c8yI8R/Rxrd0PQpmzXNP57+j3KT8=;
 b=Y8qSBUf2v2eH0ubsYFqBX6VDUZd8CjzGKPxcKhIeddGU7XJyjS//22N/1lFzjBqmOaeVXh
 hjxwsx3/ojXRmOWCkl18OAhyt5bVTMFcbve0/IbDgbx7wQPNUzbNUu3LPk+GIZFlOqts0o
 H/r8ezvxuPucKId1G5p+0/nZwGZO5aY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-iegOiz0vN225Ht5dReonHQ-1; Sat, 15 May 2021 13:37:49 -0400
X-MC-Unique: iegOiz0vN225Ht5dReonHQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 k124-20020a1ca1820000b0290175dd5429afso146075wme.7
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oapXbLTqf6jmlB2c8yI8R/Rxrd0PQpmzXNP57+j3KT8=;
 b=gw3GRT4U+OxZa498qu9E83260q3r1cWV7OnfYdhcmtrIJdJnv/KVdHyC03xSotncIU
 hrDbp0TE7HTWLOBZO6zuisl7tucI228G96CvLQMC7ZwR4m8tncO3NxKerlU8xpOPBQ5O
 LofrCjP6RS/0RJMuWUaPI6vIhCP2lYW1XdA1km02i3dPG4RcGFfnE9O8jUCV1CJaoXDj
 HuwCM573svRN0UKXmhu5NxJdfmnzUj73gV/b4RBJQ9q7pVj/ClHo+hCPJ/55xdbPl1zu
 H7pEZKfMsxvp4OTDbQ4udD+j1q2t+XBAdbI7LtMxNsHVtht2fKFFbhKAi/NEOocNcPn6
 Ci4A==
X-Gm-Message-State: AOAM533d3HWoGMkJgtwoik9eRAe+eF7+cItuCzBxrUA9cgcgtTnR6vS6
 RYNO+j8tTTapveLI0LoFyDdOJnS42+MG3TN4Kj9S87ilyh2KoFWMYPfJymqHw64AUsqdLm08nXn
 DUJ/7DYhTCKG0acCiKX0lN8HJlZoEigLvMraMVvvNwGULhabHyTG/GWwk5FVUj6w6
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr23733776wrs.185.1621100267766; 
 Sat, 15 May 2021 10:37:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF4bawh4kel9iuIamVbm1PNlABSKwFlGKejs+jqDOchip+fxGFi0iYCbS25sCIV5UINTj1Hg==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr23733747wrs.185.1621100267514; 
 Sat, 15 May 2021 10:37:47 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d9sm10234096wrp.47.2021.05.15.10.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/12] hw/riscv/Kconfig: Add missing dependency
 MICROCHIP_PFSOC -> SERIAL
Date: Sat, 15 May 2021 19:37:10 +0200
Message-Id: <20210515173716.358295-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART
emulation") added a dependency on the SERIAL model, but forgot to
add the Kconfig selector.
Add the dependency to the MCHP_PFSOC_MMUART symbol to fix when
building the MICROCHIP_PFSOC machine stand-alone:

  /usr/bin/ld: libcommon.fa.p/hw_char_mchp_pfsoc_mmuart.c.o: in function `mchp_pfsoc_mmuart_create':
  hw/char/mchp_pfsoc_mmuart.c:79: undefined reference to `serial_mm_init'

Fixes: a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART emulation")
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 4cf36ac637b..2e4f620b13e 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -61,6 +61,7 @@ config AVR_USART
 
 config MCHP_PFSOC_MMUART
     bool
+    select SERIAL
 
 config SIFIVE_UART
     bool
-- 
2.26.3


