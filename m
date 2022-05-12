Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCDD5253B4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:31:42 +0200 (CEST)
Received: from localhost ([::1]:44778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCf8-0001iJ-1S
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCYw-0004uG-Be
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCYu-00054t-U7
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fmRFwHxwP0hEqzSoXFKIq27Wm8oEzwhpModZltl21Ks=;
 b=Bbf8MufRejJwmGYa/YfoE5JII4XrDtCgKfrVUY2cP4cqS79hVDIzsgDpOXUVFNZ3mOraup
 HDsgp6srvrgClga8vjjcKxIhikPXOsfKRe2hcjvJzt2L/rcM33cagvIVJl7GS0obuYnOhh
 PHohPopTNn183AmYr3dR7SRtf1bXMto=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-aQD0A4m6MLmwoOhWRntqEg-1; Thu, 12 May 2022 13:25:15 -0400
X-MC-Unique: aQD0A4m6MLmwoOhWRntqEg-1
Received: by mail-ed1-f69.google.com with SMTP id
 ch28-20020a0564021bdc00b00425cb227ab4so3494899edb.4
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmRFwHxwP0hEqzSoXFKIq27Wm8oEzwhpModZltl21Ks=;
 b=ep7rGeAgDmN4kmABBnOGOL6Z0mbtG0tRwR1emmbdOsjAh4wL3jCfZQJcyGbabGkqzq
 dCTJUJGb6hezXR3It6hxKHHVPG4CcGt0GNtBjTjilRjvToPwV0B/eHTjl9YNHun2RXRl
 hG/j57mX1Qrbp/U1QXwWJV7VROaNwryJRFTmx+vlqUMIKBKyd9a/vBJnTugoih4ghtpK
 nUXRkOf+3rt5IDPjgff3ofGy6zGEtnOMYde6Iw6n5/HtwBlMNjxYIJFWXHGbgv2lMeYR
 h99sNL4sseTWtRBow5T9juE7Ug+6DLi6riVTG2RHl5yCxLTuIph/ERX7A5qkZjCuxznL
 WBcg==
X-Gm-Message-State: AOAM530RJsigVwpDAIO7sVi/7np9hMINHJrJ7smzJF9gfnFjBkVt+VV/
 IORiWyxuQrxHrX+Wfwj/aN8gMG+JRmZF3L0jZurZ4gqLER56NUDFxUZ9HTq2tIpL66OkY4iYr2d
 JKOYCzpB++bKxl3Cjds4znXeLochGz/BcwCtI753yAYGvYpcfnJBVzcFj1VhgCdGl3R0=
X-Received: by 2002:a17:907:3f8c:b0:6fa:8b15:66fe with SMTP id
 hr12-20020a1709073f8c00b006fa8b1566femr908813ejc.142.1652376313519; 
 Thu, 12 May 2022 10:25:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrRAOuPvIV1o0aPp5aSIodbbOdqbVogdcdmB/iHyHWpIIVTp7Ns9tZS/gs3IqUkNyi6icnGg==
X-Received: by 2002:a17:907:3f8c:b0:6fa:8b15:66fe with SMTP id
 hr12-20020a1709073f8c00b006fa8b1566femr908785ejc.142.1652376313274; 
 Thu, 12 May 2022 10:25:13 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a170906195300b006f3ef214dbdsm2270827eje.35.2022.05.12.10.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/27] pc-bios/optionrom: compile with -Wno-array-bounds
Date: Thu, 12 May 2022 19:24:40 +0200
Message-Id: <20220512172505.1065394-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Avoids the following bogus warning:

pvh_main.c: In function ‘pvh_load_kernel’:
pvh_main.c:101:42: warning: array subscript 0 is outside array bounds of ‘uint16_t[0]’ {aka ‘short unsigned int[]’} [-Warray-bounds]
  101 |         uint32_t ebda_paddr = ((uint32_t)*((uint16_t *)EBDA_BASE_ADDR)) << 4;
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Cc: qemu-stable@nongnu.org
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/optionrom/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 8de5a9461c..2494ad9c25 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -26,6 +26,7 @@ override CFLAGS += $(call cc-option, -fno-pie)
 override CFLAGS += -ffreestanding -I$(TOPSRC_DIR)/include
 override CFLAGS += $(call cc-option, -fno-stack-protector)
 override CFLAGS += $(call cc-option, -m16)
+override CFLAGS += $(call cc-option, -Wno-array-bounds)
 
 ifeq ($(filter -m16, $(CFLAGS)),)
 # Attempt to work around compilers that lack -m16 (GCC <= 4.8, clang <= ??)
-- 
2.36.0


