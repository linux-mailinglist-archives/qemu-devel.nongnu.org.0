Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA2031FE7C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 19:03:23 +0100 (CET)
Received: from localhost ([::1]:56560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDA7d-0000Xb-Ru
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 13:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lDA61-000888-IZ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:01:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lDA5z-00044f-Td
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:01:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613757698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jUKNG8Djdou3sGVcUuI9zKgMd4UMFqzDXK1u676GNx4=;
 b=Xj4gabUOTrQfePbnlUKjMRdSp2SdmuucOyZ3KTC9b5s9+5I0AjwwYZqqsN3WjYc+kesZPN
 Q/Oflp0i5QDDTdN9/XfaajEvTHrlsZ4RXbrdeYhQzMR/E+cAathtRYI+y+pLYJ3Ef2C03O
 tbKEF58yn4HdoJYsBnBJ0MFXkAauupQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-IwuSQl93MhabEvuAU6BnEg-1; Fri, 19 Feb 2021 13:01:36 -0500
X-MC-Unique: IwuSQl93MhabEvuAU6BnEg-1
Received: by mail-wr1-f70.google.com with SMTP id c9so2773909wrq.18
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 10:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jUKNG8Djdou3sGVcUuI9zKgMd4UMFqzDXK1u676GNx4=;
 b=lpKq4WyVDhLpr1lgc3FUE41SNZnFu9o4y7Zmu5+xc96Tz4YmddrgVKN2kfBiXZy69+
 CQopRIS46Cl2Mlbyia4BwtB6oYWqR/v9IULmIiu+fOiKZOf1JK12aH8fd0OFYgrqGoUb
 d3D4gEg2DWmq2v+ak22/sctNeRbLl6/dH2bptWtqEk7I5gMJIPzzy2d4wnc6Th4VIOmw
 YD1cMybAAajw/1Ly2k7RFq7WPhJVBWiieNvTzRruTemrMpAYp/6hNVHL1z6fzbxuHLx7
 ZLWaMAq5wLPXNWqxw3cbORgfeUxSAkiHFuXYRJV6C1DLRayJBWqp+e5eNQuwqr3LHp/1
 BCHw==
X-Gm-Message-State: AOAM530MdJNiI3ym7+R3U5qLRgPJwrAzoNmjHLku7IPwaqG09Mxq4jm/
 FRZ1jyE2VtRXynJHtFZfoEI1ZpAE4riqlSH/jznyuOGxvowWxs1AJyNClaAM9ulR/8PAL0g6EGW
 Z6D9WF7eYYaHUaI4SRsMhGCI+9dkCZ7gSXfO0Z2RrX7Dn9RWIBZh5NlOAjciaKiAz
X-Received: by 2002:a1c:f604:: with SMTP id w4mr9397091wmc.39.1613757694059;
 Fri, 19 Feb 2021 10:01:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvN2ze111U1eV6JmmN6UZGpITIuk+56fAWPDeubnOR5xpasEP0qzj1szQwohw+Abp1nBPTbQ==
X-Received: by 2002:a1c:f604:: with SMTP id w4mr9397063wmc.39.1613757693848;
 Fri, 19 Feb 2021 10:01:33 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b2sm14228211wrv.73.2021.02.19.10.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 10:01:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386/sev: Ensure sev_fw_errlist is sync with
 update-linux-headers
Date: Fri, 19 Feb 2021 19:01:31 +0100
Message-Id: <20210219180131.2061072-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ensure sev_fw_errlist[] is updated after running
the update-linux-headers.sh script.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Based-on: <20210218151633.215374-1-ckuehl@redhat.com>
---
 target/i386/sev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 37690ae809c..92c69a23769 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -87,7 +87,7 @@ typedef struct __attribute__((__packed__)) SevInfoBlock {
 static SevGuestState *sev_guest;
 static Error *sev_mig_blocker;
 
-static const char *const sev_fw_errlist[] = {
+static const char *const sev_fw_errlist[SEV_RET_MAX] = {
     [SEV_RET_SUCCESS]                = "",
     [SEV_RET_INVALID_PLATFORM_STATE] = "Platform state is invalid",
     [SEV_RET_INVALID_GUEST_STATE]    = "Guest state is invalid",
@@ -114,6 +114,8 @@ static const char *const sev_fw_errlist[] = {
     [SEV_RET_RESOURCE_LIMIT]         = "Required firmware resource depleted",
     [SEV_RET_SECURE_DATA_INVALID]    = "Part-specific integrity check failure",
 };
+/* Ensure sev_fw_errlist[] is updated after running update-linux-headers.sh */
+QEMU_BUILD_BUG_ON(SEV_RET_SECURE_DATA_INVALID + 1 != SEV_RET_MAX);
 
 #define SEV_FW_MAX_ERROR      ARRAY_SIZE(sev_fw_errlist)
 
@@ -160,6 +162,7 @@ fw_error_to_str(int code)
     if (code < 0 || code >= SEV_FW_MAX_ERROR) {
         return "unknown error";
     }
+    assert(sev_fw_errlist[code]);
 
     return sev_fw_errlist[code];
 }
-- 
2.26.2


