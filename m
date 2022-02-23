Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2164C158C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 15:38:41 +0100 (CET)
Received: from localhost ([::1]:34730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMsmu-00043i-7A
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 09:38:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsiP-00012m-Jm
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:34:01 -0500
Received: from [2607:f8b0:4864:20::52e] (port=37733
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsiI-0005Zf-Tm
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:33:59 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 75so20095638pgb.4
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 06:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9nW3dJhmSQhG3M6kqU0a3KQ7eK6smKGtYqopq0anLWg=;
 b=cMGIDiYQuDIoUwsWiorsaQ7mwJXbgHViY9X0q+yIZKroopYJZnSClAYl0Wb57NiqFG
 /AG8bX3uzVaHMsbvxTkt3HUFZsgsMJxxG77xri5Lfc9Nq016YE1uucASPZbLOiITmi9e
 hfoVcvs7zG+QWSwf7YhFJQa6koku0458AQ6BCl4DvW9/lTioEhC2DBh5nTs56dtnWeXQ
 x+ayYP81NOTal0+at/2w3rz95zOktbWP47y6EySJM5FoLOMbzzxgA/OMnd704UeIO2xc
 b2UJtwceFFW6p1elmFYpNV3qKEoZONZ/A69VBgdyKtkMI0PTPxW/FIIjB3bMOEpLU7yR
 j4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9nW3dJhmSQhG3M6kqU0a3KQ7eK6smKGtYqopq0anLWg=;
 b=ir8VQ7UWj7VwIHB+cxyVYGtfgcChvGYFa+gNKozE7PpqdH5kMMWVIyaKJF9oqTLSrj
 n3a3I6zxa1aek/ye17qFzTRa4MnlYh+zDDuIB1yvmeoNjX8hB49+HCuxpoTr4H6xPlWw
 CsQK3p8j5RvqdXzqT2hvsmHYSid17BzKEwKuw+hhLJN0XnjtDxBG4DsrAgxH26jwT9Jz
 +uL3j6LEZ41E45xcEO3CtkjJkLZb/ZuhZ4GYBSNBG8+KL9fXljm5pZFHYo05goF/KpXU
 3Oif/ZSpGQ8ImuP0I3Pp5BhpIPKpyHxu32gApSXlkoqqBKnPe8Jze4pZ709sq0GzbqAL
 eqXw==
X-Gm-Message-State: AOAM532l5QYDwZ1Wa3yot1jYWAj5Ox//xBuN5pxk+NqiyNjrVu3XGNy9
 q5MExUPLuNXI1MHI8AKiOPKqCkkPYFvZDw==
X-Google-Smtp-Source: ABdhPJzTnSBkwA0q15k7AOLfUTjZ5XlQ/X0s8KnC+jlW5Nziu1cdLLLpewZXWuCn12GdDXZqZenJrA==
X-Received: by 2002:a63:fb44:0:b0:372:9ec8:745a with SMTP id
 w4-20020a63fb44000000b003729ec8745amr24044981pgj.551.1645626833380; 
 Wed, 23 Feb 2022 06:33:53 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.242.81])
 by smtp.googlemail.com with ESMTPSA id
 l21sm22929583pfu.120.2022.02.23.06.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 06:33:53 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Subject: [PATCH 2/7] MAINTAINERS: no need to add my name explicitly as a
 reviewer for VIOT tables
Date: Wed, 23 Feb 2022 20:03:17 +0530
Message-Id: <20220223143322.927136-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223143322.927136-1-ani@anisinha.ca>
References: <20220223143322.927136-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am already listed as a reviewer for ACPI/SMBIOS subsystem. There is no need to
again add me as a reviewer for ACPI/VIOT.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81aa31b5e1..60e2f1951f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1819,7 +1819,6 @@ F: docs/specs/acpi_hw_reduced_hotplug.rst
 
 ACPI/VIOT
 M: Jean-Philippe Brucker <jean-philippe@linaro.org>
-R: Ani Sinha <ani@anisinha.ca>
 S: Supported
 F: hw/acpi/viot.c
 F: hw/acpi/viot.h
-- 
2.25.1


