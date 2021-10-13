Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DAC42BB38
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:11:56 +0200 (CEST)
Received: from localhost ([::1]:53852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaIj-00057f-TB
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEZ-0002AY-Kr
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:35 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEX-0005ay-Sz
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:35 -0400
Received: by mail-ed1-x532.google.com with SMTP id y12so7306793eda.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0FDTyDLOhG/Kr2K+3Sxwib8ho+Rf1TxbO6LGzgBxoOk=;
 b=CYCvhGEUaIIkbmUb06/EAVprKUvlCqmbEe3nZmTugdKyOwU8TybX6irP/YW1lceQD9
 GSUofK9i1aRv/mrqkjdmK6in5P4dFneLWnsH2Izx+Wg6iAHiiAnKj9xkLDud35wvp5yg
 vafqoCmEjzIvgbJJ1X2UPJFbNh7w0XGsCEXifYok30AtWoOIS5lm/DfHJzYud3OCTZzi
 B9Asf75IBuHlZpfURqWCgtOhKcR8H5DWqbLYCNV6ZGrY/BnEp9OLVLW5A0HYTo6hYj9c
 ae2Ugw8HMHl71AUfL/8JNqNFFtgatI5pRkiM8rEwjeCIHBNkx9Pc+i/r+uOVLPiw59fa
 5D2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0FDTyDLOhG/Kr2K+3Sxwib8ho+Rf1TxbO6LGzgBxoOk=;
 b=PixFG909X6mJq+034g7CmWgd32VuzjeXFOEK04VuheyM5fBSo14+ocRbEWp2Ec0NBv
 IWM68QWh0kqQb9EDdCtmFR/ZMp1eeQpw9iyQhq8HUlQqKvVm4t1/rNDxfBfuPt/Lhmx0
 Pd/XXX8dfxNMEBalHR18cQhBBqPiuMI17buEp6C7U1cRfutaLWiKwL3q3ce4KSB1M/lf
 LPbYHfc/aH5Emf2skEFmys1KiuIZXMxdxCgl8PnWJF2jTqdS26QtzForPLZR1UmeF+1N
 JT5jhx7d3bpjVkd5Wz/WntjWFeS4si8tho6OuD8wmvDwvlZ+PDp6dFFhMl4pJO6z1Aot
 Cb8A==
X-Gm-Message-State: AOAM530P0ix1nXEal/UybrmMzpaRCmlXUrU4wWu1svOglpAf4OVVD2BI
 TDmQL5kA/9XWSBG66QqzxpIyT6Ai88I=
X-Google-Smtp-Source: ABdhPJybFz06W4WATp6R3z0fJJ/9jqFtV+V43M7wQFxXSZ52Dr/gCXGW/jNzaEwdqKogSC+4JJsWhA==
X-Received: by 2002:a05:6402:14cc:: with SMTP id
 f12mr7953012edx.242.1634116051537; 
 Wed, 13 Oct 2021 02:07:31 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/40] tests: add missing dependency for check-block
Date: Wed, 13 Oct 2021 11:06:50 +0200
Message-Id: <20211013090728.309365-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-iotests run qemu-storage-daemon, make sure it is up to date.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 7bb8961515..cc1e4f2c07 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -151,6 +151,7 @@ ifeq ($(CONFIG_TOOLS)$(CONFIG_POSIX),yy)
 check: check-block
 export PYTHON
 check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
+		storage-daemon/qemu-storage-daemon$(EXESUF) \
 		qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
 		$(filter qemu-system-%, $(ninja-targets))
 	@$<
-- 
2.31.1



