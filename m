Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073114BD886
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:32:27 +0100 (CET)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM53R-0002Ip-Q7
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:32:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zJ-0007wI-RX
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:09 -0500
Received: from [2a00:1450:4864:20::435] (port=38515
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zF-0000z4-MU
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:09 -0500
Received: by mail-wr1-x435.google.com with SMTP id d27so25925069wrb.5
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6zQvB0fbDONAONglDBnAHNCQ7EKB6euvQKXFm0Tco2I=;
 b=MBczjj3oV+/4YApEHYqgnq7x92xiC+SsChthisGINKrKPPWB6+gfa5UfHJkJKBS3em
 QspES5jhQXYEzew07C1sepvnRAkYYk+6ftoPB/JGjdd94XWrAM8FL3eRyqnjihjIw+p5
 00eW/j7PGgaNoTIKEUf0+608I3yg/JNRYT3egHNfxDNwhabV2PtbXLqf98tRNmuhOL6U
 tpCSNV1HHErztfFguFSmaxUitmM9pKMKVKpyjjVy033MeSn5rPjXoeWP8vzF+uZIXYAt
 MvvfTKxFKjCMMbKW9jciRMqjdpGgJUZHbtgL1Qw3SzBlxpbyZfblw6y4kuNtXLaNvZri
 p8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6zQvB0fbDONAONglDBnAHNCQ7EKB6euvQKXFm0Tco2I=;
 b=DiuAnpalkatKTmZ9KTeJHfaELB6cknsvBEzDt2CzJ2seYU16qaz5knZ1Hh0ZWybckC
 ECFnGJfAguePR8vdBwzbzScxn5QeafYw9a6s0PpPDR93lgQnNeE7T77ys299QKZ9KlCk
 nPIpHAjSNJD6kD9Ewkj93x4sDq8YvAQrCLjKUaQ8RaB1OxqcHL987DIrlYPiP3IDzbJA
 /EVnASLNTVUn1A6WapkKAd/Ogx56RBMTE+JuTsJg3ZHbgJ7KzUC9Zxj0cs0yqKukw/eD
 nZYSGYA6Cl4lApwgazYgJnwoT7np+fNwxvTQYKF/CTpV1c26WIWad6a3Ea9z5jeY3O/L
 WuXQ==
X-Gm-Message-State: AOAM531wIX8HudMmetX3mi6qxsKIfd6wEF6nxPHkgXmsHVdYJc4tykm6
 4pcVpFkIyefr+0/02ReKuytnr+CYvHaDsg==
X-Google-Smtp-Source: ABdhPJwgnxfRJqnqQbsSpPiu8ccQCRlMOnePAnbaZgQoRSKWQk9NiWZBddhLHIzjYzvgVRAjFRx83A==
X-Received: by 2002:adf:912f:0:b0:1e3:909:a6b6 with SMTP id
 j44-20020adf912f000000b001e30909a6b6mr14702336wrj.684.1645435683315; 
 Mon, 21 Feb 2022 01:28:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/26] MAINTAINERS: Adding myself as a reviewer of some
 components
Date: Mon, 21 Feb 2022 09:27:35 +0000
Message-Id: <20220221092800.404870-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Ani Sinha <ani@anisinha.ca>

Added myself as a reviewer of vmgenid, unimplemented device and empty slot.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220131122001.1476101-1-ani@anisinha.ca
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81aa31b5e1a..bd85e27889f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2189,6 +2189,7 @@ F: tests/qtest/prom-env-test.c
 
 VM Generation ID
 S: Orphan
+R: Ani Sinha <ani@anisinha.ca>
 F: hw/acpi/vmgenid.c
 F: include/hw/acpi/vmgenid.h
 F: docs/specs/vmgenid.txt
@@ -2204,6 +2205,7 @@ F: hw/misc/led.c
 Unimplemented device
 M: Peter Maydell <peter.maydell@linaro.org>
 R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Ani Sinha <ani@anisinha.ca>
 S: Maintained
 F: include/hw/misc/unimp.h
 F: hw/misc/unimp.c
@@ -2211,6 +2213,7 @@ F: hw/misc/unimp.c
 Empty slot
 M: Artyom Tarasenko <atar4qemu@gmail.com>
 R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Ani Sinha <ani@anisinha.ca>
 S: Maintained
 F: include/hw/misc/empty_slot.h
 F: hw/misc/empty_slot.c
-- 
2.25.1


