Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2C4186C36
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 14:36:58 +0100 (CET)
Received: from localhost ([::1]:38462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDpvN-0003mE-4Y
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 09:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48411)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDoQx-0004mJ-26
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:01:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDoQv-00009G-Os
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:01:26 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33268
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDoQv-0008Th-FU
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584360085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8cN7xrQbUXKOPTKMenh4LFrfI67X2hH+2BFr+BT/2qE=;
 b=RaSn9KgcNfyK8L9M6c4XzhYir7hRV9NTA2A16osYfWalBwakpoUnKQTXAPE0LH3Wl73H3h
 dEvCks9rtvuDX06rM4b4ggVJ2yoeLcQPtutg3IzdVTuqe7L+MoFGqVJ5HaD051nGbvyhdc
 wvxL/BGR3s5DXIucCn4447jqXahH/MU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-q1krT07NMQCZ1VYsBdYdzA-1; Mon, 16 Mar 2020 08:01:21 -0400
X-MC-Unique: q1krT07NMQCZ1VYsBdYdzA-1
Received: by mail-wr1-f72.google.com with SMTP id p2so6380787wrw.8
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 05:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ylQbiBJV0bTCaWbZjZzWsWQ007xgGC4LERV9nP8xmDY=;
 b=tHo70r43CdRIrfwoqAtGNOqabEAJkIQDaSBBr6OSuIac34Wf+wMnIpUfActyR9KohR
 yiLByvhQMs+nF7obYBFfwk4hgLY/NM6LQnE1RlVtqkieL8v41poddemacu4GwkYmwxy9
 HS32ljVhbQTQ+YZw/+OAiT4mTHFoRJOib5OhKoYzzaE18GLtsXp20tgPsKAju98UZPGl
 DbHcpnAkLMlq93K6N2B6u2YIVdT+GNzrg4QtiEWW9I5uYukXsMDPsS3/NznIw2LQxJ3C
 0YAz7sGKjEYeYmG2T9pwQXxydvlhIlRQkYk5a4OKNRqwwBsF0Jfbx7G3Vcfasz8D0uFP
 yztA==
X-Gm-Message-State: ANhLgQ13374V1BZFYkvaVo2tUbQjX/+q1FyZfiNDbtQX7VhGZoadDXgV
 PC5vEDPhR2JrTIjigfIOrFOfzjwQp0lgmPtdTu2xO3GJPSs4DuD5fsC7jkJdxiELpwYnkvd/Vs4
 +BDno5xPCexH/CIM=
X-Received: by 2002:a5d:5290:: with SMTP id c16mr34063664wrv.235.1584360080459; 
 Mon, 16 Mar 2020 05:01:20 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuxoYzjuK/W23tT7l1V9Rq2i8X28GEkStlQOjxsHGubN0CmfNM22zQoTHDW0GrF1nX7h79jxQ==
X-Received: by 2002:a5d:5290:: with SMTP id c16mr34063642wrv.235.1584360080306; 
 Mon, 16 Mar 2020 05:01:20 -0700 (PDT)
Received: from localhost.localdomain (191.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.191])
 by smtp.gmail.com with ESMTPSA id y200sm28532934wmc.20.2020.03.16.05.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 05:01:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] Makefile: Write MINIKCONF variables as one entry per
 line
Date: Mon, 16 Mar 2020 13:00:43 +0100
Message-Id: <20200316120049.11225-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316120049.11225-1-philmd@redhat.com>
References: <20200316120049.11225-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having one entry per line helps reviews/refactors. As we are
going to modify the MINIKCONF variables, split them now to
ease further review.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 7df22fcc5d..d83a94bc53 100644
--- a/Makefile
+++ b/Makefile
@@ -418,8 +418,10 @@ MINIKCONF_ARGS =3D \
     CONFIG_LINUX=3D$(CONFIG_LINUX) \
     CONFIG_PVRDMA=3D$(CONFIG_PVRDMA)
=20
-MINIKCONF_INPUTS =3D $(SRC_PATH)/Kconfig.host $(SRC_PATH)/hw/Kconfig
-MINIKCONF_DEPS =3D $(MINIKCONF_INPUTS) $(wildcard $(SRC_PATH)/hw/*/Kconfig=
)
+MINIKCONF_INPUTS =3D $(SRC_PATH)/Kconfig.host \
+                   $(SRC_PATH)/hw/Kconfig
+MINIKCONF_DEPS =3D $(MINIKCONF_INPUTS) \
+                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
 MINIKCONF =3D $(PYTHON) $(SRC_PATH)/scripts/minikconf.py \
=20
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIK=
CONF_DEPS) $(BUILD_DIR)/config-host.mak
--=20
2.21.1


