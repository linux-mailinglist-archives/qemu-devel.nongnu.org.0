Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053EE559577
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:31:52 +0200 (CEST)
Received: from localhost ([::1]:40788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ejG-00007x-U9
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efG-0005m3-Uh
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efE-0005ST-E5
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fWki7fDQXi5B/Xr/+5WLHFaR3k7nJmfyFC3RmETDRPc=;
 b=dtijfuSZQDbHpprLCS8c0Py2uWKdQtIEw1B5P4ZiOClMLMgnp+Vodn5QZRfTemSLQMt5AI
 6nArAUxVkksNHCafXDpeiDCADOlUvaY2DlkemtxQT4jDi3PAW4fNgwSzHEyD1n6s3viVJ9
 87Pl7UY1DpPlBPItOEHeEwDFWV3Lv4o=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-lvJLfgQpPtuLPQHBuSLsIg-1; Fri, 24 Jun 2022 04:27:37 -0400
X-MC-Unique: lvJLfgQpPtuLPQHBuSLsIg-1
Received: by mail-ej1-f72.google.com with SMTP id
 hq41-20020a1709073f2900b00722e5ad076cso567675ejc.20
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fWki7fDQXi5B/Xr/+5WLHFaR3k7nJmfyFC3RmETDRPc=;
 b=rMt9Rn0olnnwoSufUAXQzl2nV5942CrpuNkml3TqfN9Np/qL1I/KMAnqxd4DMNBKK2
 UoFPk5POKbae7rN93hOhZGc4yE+x0Tc2eWPhuZdhxN+PHUmQ5ACyd+cdUxlPxUyyNgbB
 fH1yOGfbosMhwm7/mTnwSZ6YX5oC1Bm9KZ5xteE02xa5a9HUYyLdWilxzt500M1KSpB9
 1kzeL1KVvKrfOyHFspM6+9wGf4zKFaOpyEa1ZeDCQC/M4pxEVnj7Zk1sSwn1Jr9qnDYO
 DB23P17FqouMM1jatckWmuEX12BFm3HUD6gpR29W+A1OeN6Y1bEac0cMvdasO0RUzcaD
 vd1g==
X-Gm-Message-State: AJIora/ukhbwbZmokhL5wy/4vO09gTblXRDcDv0weh+OeZVkVU6QY2vI
 cr32ECcF0TqNjmqqFjq+xG1sZqGRGHVlTXCKTrmqAB951D8Ex3n0b08cKCaQpD2Umcq/1UCj9m/
 pKm9CYH1jkZE2boClEkjntgiYVlaTa9aqeTQUy6ePNZwy0foAtjMAINLShduM5IzsEYE=
X-Received: by 2002:a05:6402:3988:b0:434:e2a8:8459 with SMTP id
 fk8-20020a056402398800b00434e2a88459mr15836700edb.253.1656059255787; 
 Fri, 24 Jun 2022 01:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sRdsGgaqz+yU8ZZUV9qv+l0taqyC7Dijbku3Oa1nCVT5TsDOXL0nZd9tREP4oeBHXFUtmt+Q==
X-Received: by 2002:a05:6402:3988:b0:434:e2a8:8459 with SMTP id
 fk8-20020a056402398800b00434e2a88459mr15836671edb.253.1656059255404; 
 Fri, 24 Jun 2022 01:27:35 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a1709061ed000b006fe8ac6bc69sm714768ejj.140.2022.06.24.01.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/14] pc-bios/optionrom: use -m16 unconditionally
Date: Fri, 24 Jun 2022 10:27:18 +0200
Message-Id: <20220624082730.246924-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624082730.246924-1-pbonzini@redhat.com>
References: <20220624082730.246924-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Remove support for .code16gcc, all supported platforms have -m16.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/optionrom/Makefile    | 15 +--------------
 pc-bios/optionrom/code16gcc.h |  3 ---
 2 files changed, 1 insertion(+), 17 deletions(-)
 delete mode 100644 pc-bios/optionrom/code16gcc.h

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index f639915b4f..ea89ce9d59 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -11,7 +11,7 @@ CFLAGS = -O2 -g
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
 cc-option = $(if $(shell $(CC) $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1 && echo OK), $1, $2)
 
-override CFLAGS += -march=i486 -Wall
+override CFLAGS += -march=i486 -Wall -m16
 
 # If -fcf-protection is enabled in flags or compiler defaults that will
 # conflict with -march=i486
@@ -24,21 +24,8 @@ override CFLAGS += $(filter -W%, $(QEMU_CFLAGS))
 override CFLAGS += $(call cc-option, -fno-pie)
 override CFLAGS += -ffreestanding -I$(TOPSRC_DIR)/include
 override CFLAGS += $(call cc-option, -fno-stack-protector)
-override CFLAGS += $(call cc-option, -m16)
 override CFLAGS += $(call cc-option, -Wno-array-bounds)
 
-ifeq ($(filter -m16, $(CFLAGS)),)
-# Attempt to work around compilers that lack -m16 (GCC <= 4.8, clang <= ??)
-# On GCC we add -fno-toplevel-reorder to keep the order of asm blocks with
-# respect to the rest of the code.  clang does not have -fno-toplevel-reorder,
-# but it places all asm blocks at the beginning and we're relying on it for
-# the option ROM header.  So just force clang not to use the integrated
-# assembler, which doesn't support .code16gcc.
-override CFLAGS += $(call cc-option, -fno-toplevel-reorder)
-override CFLAGS += $(call cc-option, -no-integrated-as)
-override CFLAGS += -m32 -include $(SRC_DIR)/code16gcc.h
-endif
-
 Wa = -Wa,
 override ASFLAGS += -32
 override CFLAGS += $(call cc-option, $(Wa)-32)
diff --git a/pc-bios/optionrom/code16gcc.h b/pc-bios/optionrom/code16gcc.h
deleted file mode 100644
index 9c8d25d508..0000000000
--- a/pc-bios/optionrom/code16gcc.h
+++ /dev/null
@@ -1,3 +0,0 @@
-asm(
-".code16gcc\n"
-);
-- 
2.36.1



