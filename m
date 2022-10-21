Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF956074F2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:23:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpB2-00050f-N3
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:22:57 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olosj-00045R-57
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olorp-0002BF-40
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:03:05 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olorm-0006Kq-GO
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:03:04 -0400
Received: by mail-pg1-x533.google.com with SMTP id 20so2129164pgc.5
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 03:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HPysC3P2pm4MTCWntmq25v9k8Xsx4lQrmrlkUD6YWqc=;
 b=iYZQOhu8jK2FVz3X3+KFsEFqAK+azGExaBOW0fMJVtAyG8mNJx7pOBX3DUuOnVWxCR
 I0+7RLQ7GrBn7YS/hWNMD/Rs/zacf808wDrBSOsw1YKvh9SYnbICGJQWNo3C6aiU8RyB
 gxH1/76kXqbFVDiEy6rOWZ3JJt5Y41f6456XxD3u4ZEx6sJQhPn3qBprx3mvNzcZfcms
 ETa9zeRq2GvOImDBacIad22HOBJpDNiiOfVH+LGmTDNfGpLOkMLz3Q7m/oN1fvBeDCok
 79Moj6rGwreG4cHyddfQaFdNz9thRGRGrjIF0fXCEsAaWOF00Ve9TDy9faE08fSLbblq
 WnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HPysC3P2pm4MTCWntmq25v9k8Xsx4lQrmrlkUD6YWqc=;
 b=IVX53Bq9ADsFwCSi+KhSsJOPXNrxwKc+3PtRDsTZInhNDbY7Do0mTmR9o0HqQx7/2Q
 VoTNzDiZ/tJrzu73TT2ERcENkypzGxABJcvYAnYHopYoeiVnJEoAMQoo92Fqw7nbuBbA
 ruA9UErBEp2ZN8M+915oLMPNrx3oaJH76fyWpc5Mg27F50XMh2qAxqSlpo/WJJ7mCcK2
 VMkPyXNumPKddg/iBKePH+8QNUbOawhV3xXVhe/2DC+qEsd86C9rfadBM/tXoI8v10S7
 lUzFw1lQK+bTvuxwpHwxVZK8t0an+muiKdIVr7B8IvPOehAdHhKXF0xtvCdIqTxtg/Vy
 kWjw==
X-Gm-Message-State: ACrzQf2qCdZ/9Ikk5Ss6f3wYxiLKyo9TyO/0R4CwtnL7RvUmf25+wrea
 H8sk4o83pZDidJ9ILgU3kJEc2w2FAozJYrsL
X-Google-Smtp-Source: AMsMyM5Ho1pNjpcc2NpKFH6ACNY2Sn81Gritshb/C2K2PRvNM/QbLKI583mYRd+qmHv+0V4uEI0E+Q==
X-Received: by 2002:a63:c06:0:b0:439:9b18:8574 with SMTP id
 b6-20020a630c06000000b004399b188574mr15610420pgl.608.1666346580635; 
 Fri, 21 Oct 2022 03:03:00 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.245.138])
 by smtp.googlemail.com with ESMTPSA id
 e14-20020a631e0e000000b0042fe1914e26sm12997375pge.37.2022.10.21.03.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 03:03:00 -0700 (PDT)
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
Subject: [PATCH v7 7/7] MAINTAINERS: add myself as the maintainer for acpi
 biosbits avocado tests
Date: Fri, 21 Oct 2022 15:21:08 +0530
Message-Id: <20221021095108.104843-8-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021095108.104843-1-ani@anisinha.ca>
References: <20221021095108.104843-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::533;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x533.google.com
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
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8ae2e43c83..02ac462213 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1859,6 +1859,13 @@ S: Supported
 F: hw/acpi/viot.c
 F: hw/acpi/viot.h
 
+ACPI/AVOCADO/BIOSBITS
+M: Ani Sinha <ani@anisinha.ca>
+S: Supported
+F: tests/avocado/acpi-bits/*
+F: tests/avocado/acpi-bits.py
+F: docs/devel/acpi-bits.rst
+
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
 L: qemu-arm@nongnu.org
-- 
2.34.1


