Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4561EF24F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 09:43:25 +0200 (CEST)
Received: from localhost ([::1]:33590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jh70e-0007Eb-Jt
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 03:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jh6xt-0002ec-9L
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 03:40:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34404
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jh6xs-00056z-Dv
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 03:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591342831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndqFgBanjliYTdRp8N1sk+p/cY4owVogsc0x0ibf8Jw=;
 b=a++0Nec46LIFbnUy3y+Vgw0/ehOAtAxxazQPtVHIEuDjV7kNbQEgZcra/0qK1dijKwHGpZ
 LAaRU20YuK36XKFHFwfFpMgKeiEwaGXd8Zyungh0iKJCrj6BL4O6AW4oxa+p2e+ZduIExV
 OVoxYTtdVRQqXoOjxavZOCIQQ62nUO8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-GGS4JfEMO6aU9zj3KH_aNg-1; Fri, 05 Jun 2020 03:40:28 -0400
X-MC-Unique: GGS4JfEMO6aU9zj3KH_aNg-1
Received: by mail-wr1-f69.google.com with SMTP id m14so3410232wrj.12
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 00:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ndqFgBanjliYTdRp8N1sk+p/cY4owVogsc0x0ibf8Jw=;
 b=rMy9QUf7oEpQMqrNmiLMkwq3VExsu+HxSZ4rzHFOnN41uq+9LW3Q2lzrh+b0cxnPNH
 GbqogxOG1f5zXK5ZlZy1+oQGaE9NOKTZcHMUpR/SHS8kuyOV9hg1WVUu9VTRte5hUzew
 4VL3DA22eahPingK73SJPP1+/y+w4DCC+e8MonS6VUGfTq6XRDBJDj2ps3rhBLCOfeuS
 C2OXk8whxidkxG8hLbPJUCvqskVn5udHKfzh7GKmhWieiA5DpqGowTcmAxWMVSihpxvk
 fuVNMMgP5bPYgznPD2hYlC0z6PlZ5P048lndLs7Ex3yQ9H4S1Z8gbcRbYqZDMSl4OoBO
 BWbQ==
X-Gm-Message-State: AOAM530FwdIvT73HCDXy1jjZHYYBUWZNRsxgkkvWJpLULEhjhJmj6V2x
 /xhz/gKZbIrd4Ue5/DIpo3RbmInp7oFLfqwgY7LQOWEacecPHopkhXgtfWSl6aqHK8hgCUziIuK
 o5sbhfcIEuYLRDCw=
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr8626785wrs.313.1591342827170; 
 Fri, 05 Jun 2020 00:40:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnQ2AniyMVxZoYobHmqCK9ik0wtyDnTfYZyOcSebWnPvTrCUfuBSe9d8Ts/3F6dJJ10SYA6g==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr8626766wrs.313.1591342826952; 
 Fri, 05 Jun 2020 00:40:26 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id c6sm11196967wro.92.2020.06.05.00.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 00:40:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/11] Makefile: Remove dangerous EOL trailing backslash
Date: Fri,  5 Jun 2020 09:39:48 +0200
Message-Id: <20200605073953.19268-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200605073953.19268-1-philmd@redhat.com>
References: <20200605073953.19268-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:35:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One might get caught trying to understand unexpected Makefile
behavior. Trailing backslash can help to split very long lines,
but are rather dangerous when nothing follow. Preserve other
developers debugging time by removing this one.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 40e4f7677b..6c9d718b2c 100644
--- a/Makefile
+++ b/Makefile
@@ -420,7 +420,7 @@ MINIKCONF_ARGS = \
 
 MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) $(wildcard $(SRC_PATH)/hw/*/Kconfig)
-MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py \
+MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
 	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) > $@.tmp, "GEN", "$@.tmp")
-- 
2.21.3


