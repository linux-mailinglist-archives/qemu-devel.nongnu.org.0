Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F5E3808F5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 13:53:44 +0200 (CEST)
Received: from localhost ([::1]:49262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWNz-0002g9-Bo
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 07:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lhWJV-0002cf-76
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:49:05 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:46672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lhWJN-0004r2-1Z
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:49:04 -0400
Received: by mail-lf1-x132.google.com with SMTP id i9so36145299lfe.13
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 04:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HsiF1/EhRsF2rPRBEnHP1f/R5pxso3L25zHd/RevGm4=;
 b=WRrCsfLZhwNt6e4uV+u/mWDrgvTfUnBQFfwXkoOmGaJSe2QeGFgJW9q1Qpyk9t/puu
 F71XuzdxVhWQBzLloOvb5fVbY0n3pu5ZBQAUchJM0Y3W2EUWpg7tq35gvraSfZGLkfmx
 l+uwj9wdgHVfA3vT3rsv8DRpxWLHuHQ0BvsFUqTxa1ZnIMXF5fBisvphqF5btjhVhKjM
 RD56g7QNLCijfdOWFtdMlyBBo77kD/fNnxPeURYLYqq5Mem4epZBrjkOenDdIFeGLF+L
 DGukl0EpWEuDyjr64/B+YjyZflDxMPeOvutKiQvT4Wr4yi9H7oGtjIkVRtZmY8X4bRR5
 FMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HsiF1/EhRsF2rPRBEnHP1f/R5pxso3L25zHd/RevGm4=;
 b=eqSvvLXzbzfNg7QTBmTaa0BMsC9OcZLknRAKr2vBQHGxroq12e4zdDD1t95fwhSpps
 IgAv/CFAcTJ8kToURL3ZtTuzXAo6YfV7IIZXUDrtmbqiyhHLdKLFI4bE8VAPjGiUkpgz
 0oSJlDX3IqKeSTiPc9in/0o/Hw93ai2cs3aRpfF2p8G/v6YfJr+gZOWUG1dKIeF1I7kg
 mE96mEU4E08eXA8K3mwykdkuSkHWJUpstGXaIsgmwKAIypNWDYnwAxKny9r2HJ87Gdde
 BQp/Z6Bq3SOfiQfFSpjtpYlj4VN39TCqJK4nah3syqROhQPg9RytkDKXXTzpA2jc9+fh
 AnaQ==
X-Gm-Message-State: AOAM530+99108nHMkTNNVYvWs2u06DyCjfsVsO2gkqloQDdHcTZrpYdT
 yxMKLH2XNaSxrtirSxehjB2+Ow==
X-Google-Smtp-Source: ABdhPJyy49yaJUd1NSY6DxSZlztSrXnT0aB5u8QN/EmOOaoX2kGuIbOwinIF012Q95vvApyrKU785Q==
X-Received: by 2002:a05:6512:5d7:: with SMTP id
 o23mr33009012lfo.301.1620992935607; 
 Fri, 14 May 2021 04:48:55 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id t13sm583421lfc.57.2021.05.14.04.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 04:48:55 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v8 7/7] MAINTAINERS: Added eBPF maintainers information.
Date: Fri, 14 May 2021 14:48:35 +0300
Message-Id: <20210514114835.267316-8-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514114835.267316-1-andrew@daynix.com>
References: <20210514114835.267316-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::132;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c5..c7e9a57cd9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3312,6 +3312,14 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 
+EBPF:
+M: Jason Wang <jasowang@redhat.com>
+R: Andrew Melnychenko <andrew@daynix.com>
+R: Yuri Benditovich <yuri.benditovich@daynix.com>
+S: Maintained
+F: ebpf/*
+F: tools/ebpf/*
+
 Build and test automation
 -------------------------
 Build and test automation, general continuous integration
-- 
2.31.1


