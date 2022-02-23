Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08DA4C159F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 15:44:47 +0100 (CET)
Received: from localhost ([::1]:47346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMsso-0004NI-Pf
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 09:44:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsiR-00016I-2e
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:34:03 -0500
Received: from [2607:f8b0:4864:20::1034] (port=44999
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsiP-0005a7-B0
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:34:02 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so2882124pjb.3
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 06:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FNZ8Rx4INpzOPlF/y4fl9eyEHjFGRw+NmRoMRHQuj2Q=;
 b=1+hkuh6SHH6+Ylcl8qfWFvlGTWQQNOF3LN7WQDjzK4q2D81dj4V5c+qotA7xt7sS0Y
 cfKmPJVRJ/M7sVzftBhwNo+Kk+BcLouo4Nccr+J0VmGn8gZROoM4VXCRSbQPL2uN+ipm
 ccEc5SANyef9NkBD8BoU6sPo8Vi4IsV2mvpaCVMqK81nSuVapff2qOuPBpXcETRf/onn
 zQPOqQICtVbBo++2hoeRRloPj/BNOXpYbVQ4sGUk7GkmBoLEDKS3HHNiFEF4HHrQoO+5
 zmy0s/TVy5482PCYRoK0h1Cy3R8ue4PQYUDL0iR82lSYHKVp6ncLHENjaM0wPwFLozM5
 od9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FNZ8Rx4INpzOPlF/y4fl9eyEHjFGRw+NmRoMRHQuj2Q=;
 b=bQISNtG+alUc3QIvcVQEkwGhE0tTvRBIkwoz6lRKjaDuEWYPrA/m43oj8NqgFDcmpW
 iY/u9+6AGfc9FJRXSXOL/+Xs+8Ek+z9tNCnRf+JMpZWbXU45Qaxc+KCFE2J5SQHhxJx5
 dcgu3UXfkA4WIVZloZzJKnoMhxLyDxta/dcuSs4IE2HL8nPGcQ+MTl0TU8gvVzCR99rj
 ol0K8lh9Tylu2Z9fnIhmYof8jt60WsUHjlWeGwjmzs2nvUpJi7OKNbqQAs1blv9A9Ujy
 I93vcyC72ZPkTZxU6gmC75bxxD6syhfKUSRre5sHCRf/jum6ycyZKXSXfTI+4iyCNdDQ
 96yw==
X-Gm-Message-State: AOAM5331Z7mY/kcYovuNVMZQ77GC5pDm/+4/5n1+xVgn5P6b5ohMcieZ
 dQxBPwIaDxTdsamdvZ6OoFO5NW+23ULwsQ==
X-Google-Smtp-Source: ABdhPJw7nNhg0MHkcXX9HmXt+XXKJiLvk+U801v15cgAfHDrnOlc+47K3EjX+HqaExJs1wqP9gdGfA==
X-Received: by 2002:a17:903:24f:b0:14f:73fa:2b30 with SMTP id
 j15-20020a170903024f00b0014f73fa2b30mr24239621plh.174.1645626839012; 
 Wed, 23 Feb 2022 06:33:59 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.242.81])
 by smtp.googlemail.com with ESMTPSA id
 l21sm22929583pfu.120.2022.02.23.06.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 06:33:58 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, mst@redhat.com, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 4/7] hw/acpi/erst: clean up unused IS_UEFI_CPER_RECORD macro
Date: Wed, 23 Feb 2022 20:03:19 +0530
Message-Id: <20220223143322.927136-5-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223143322.927136-1-ani@anisinha.ca>
References: <20220223143322.927136-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1034.google.com
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
Cc: Eric DeVolder <eric.devolder@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change is cosmetic. IS_UEFI_CPER_RECORD macro definition that was added
as a part of the ERST implementation seems to be unused. Remove it.

CC: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/erst.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index c0a23cf467..de509c2b48 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -80,11 +80,6 @@
 #define UEFI_CPER_RECORD_MIN_SIZE 128U
 #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
 #define UEFI_CPER_RECORD_ID_OFFSET 96U
-#define IS_UEFI_CPER_RECORD(ptr) \
-    (((ptr)[0] == 'C') && \
-     ((ptr)[1] == 'P') && \
-     ((ptr)[2] == 'E') && \
-     ((ptr)[3] == 'R'))
 
 /*
  * NOTE that when accessing CPER fields within a record, memcpy()
-- 
2.25.1


