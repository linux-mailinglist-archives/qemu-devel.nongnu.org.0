Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972EB6066A1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:03:03 +0200 (CEST)
Received: from localhost ([::1]:55590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYwY-0006sw-Mm
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:02:56 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYt1-0004oy-KB
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUme-0008Mc-A1
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:36:27 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUmc-00078c-M2
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:36:24 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d10so20136011pfh.6
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BudlTvOWerERuhN9firEtF5P6oWWwNEC+Zk0jHYYDxg=;
 b=3lCHgNxQqAOmQaurGxILu1sBAAJRl26NdKA1teEnlmEot00VB0dnh8j3CwQ/MnrJgo
 HjqnGlB0gtpMWPpMptLop7RwPnRzkYDw2HybyJo+vRq7Z0+Es1LRTQdsMYvwDY7EybHP
 cm3ttykUqj8un3/Xcw8X+Z46WA4iAYt8tS0aCTnd613jNVnjZbSML0M8NYi3zT56W0RM
 rBWW0I6PkJt5oZm9l35CbeyJfEDF7mAStm2vXzHpGvQRa5oyylNoiQdvfD5pGtr0lst5
 92nV/fdc+q/kIMCCJ5rP/nx78nxfvm6j27sWiABp6NZCc/eZkPpvbntI0ye8BQsy9JPr
 U/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BudlTvOWerERuhN9firEtF5P6oWWwNEC+Zk0jHYYDxg=;
 b=xBR62IwlURFk29vgyxsDMrnDjnNklEzl2SsOZUVN5u0MixOn8G5dh2WoWHQt4hQaJQ
 G/d6RkluBAzVO51+p3nk5Z5wNEVqPyGwh764BOQwDiL4QLfaYR9+7BFGCZEBPqBAPjPn
 F7ThIhHQHEm733ss1sHGfkiTEo6RQ1El4h0FFl5X/TkrM7ynR8QrQOPmK9XBTL8HnbZe
 hMmnK82ucR51jCuMoKKGjCuoYYgDc6aoFEV4nHy2ac2jewYKbM26xkWCuRkuTVMnQtzh
 reZ/ejczXNO520ZmwUa1UCJ12pkNdSVuRB+T0htO/hmL71jHExQfkNlKo1SFoByQj6Hc
 yTNw==
X-Gm-Message-State: ACrzQf1ykOeXnP7A4lOOS3gPmT4zdOe9Zvz1Kv4UbjNGA1I0t8kEcIYe
 930vCG1g8lf2E358o5Y2+ggYFA==
X-Google-Smtp-Source: AMsMyM6YVuv7bwSfkgjAN4IdxnVjemXaIuZ5YLFv5YJANr+JMQbEgyRt6+qWNCmfVGMr2WS6peBfRg==
X-Received: by 2002:a63:200e:0:b0:45b:d6ed:6c5 with SMTP id
 g14-20020a63200e000000b0045bd6ed06c5mr11433443pgg.121.1666269381049; 
 Thu, 20 Oct 2022 05:36:21 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.246.137])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a170903244b00b00176b3c9693esm12794174pls.299.2022.10.20.05.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:36:20 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: 
Cc: Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v6 10/10] MAINTAINERS: add myself as the maintainer for acpi
 biosbits avocado tests
Date: Thu, 20 Oct 2022 18:05:06 +0530
Message-Id: <20221020123506.26363-11-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020123506.26363-1-ani@anisinha.ca>
References: <20221020123506.26363-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

I wrote the biosbits avocado tests for testing QEMU's ACPI/SMBIOS implementation
and all the related changes including fixes in biosbits software itself. Making
myself as the maintainer for QEMU's biosbits related files and test scripts.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8ae2e43c83..30c7cd96ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1859,6 +1859,12 @@ S: Supported
 F: hw/acpi/viot.c
 F: hw/acpi/viot.h
 
+ACPI/AVOCADO/BIOSBITS
+M: Ani Sinha <ani@anisinha.ca>
+S: Supported
+F: tests/avocado/acpi-bits/*
+F: tests/avocado/acpi-bits.py
+
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
 L: qemu-arm@nongnu.org
-- 
2.34.1


