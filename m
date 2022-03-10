Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA04A4D516B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 20:29:13 +0100 (CET)
Received: from localhost ([::1]:42082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSOTI-0006EN-AF
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 14:29:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <30U8qYgcKCjIjSbhifSUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--venture.bounces.google.com>)
 id 1nSOS3-0005VR-Ac
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 14:27:55 -0500
Received: from [2607:f8b0:4864:20::c4a] (port=41518
 helo=mail-oo1-xc4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <30U8qYgcKCjIjSbhifSUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--venture.bounces.google.com>)
 id 1nSOS1-0006g9-Rx
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 14:27:54 -0500
Received: by mail-oo1-xc4a.google.com with SMTP id
 h42-20020a4a942d000000b00321739192d0so601139ooi.8
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+2YtiVwEZ9RwC/8VBcyI97P419lBNhav2fnGdw/4ndg=;
 b=aLQ0a9tgWEFsjkpnyS5US9lYMyXE6H5GPqCrffGqtpAAvg9iHh+TT8Ram4PtRhwV05
 nBlpjvTDNhSJIx0Jnylwb3lKtcW0sPouV0SK0X0VfXAQa2KIHC7xXcvOH+vqJGjiN8ek
 uKdMp8pD57QSgX6htw/xqD6M61ADltXgwMBr8rMvlsnS3vKdVKBg/5Q5YuurqWFCByIz
 jmzRfV4FJEJeJazV8mKonxZcEaSneDTeLIspWSZSEP3shDrwrSRfDZQoW02vGu1dc2fV
 AT2qWsz6GQ27zP0pU2HMmY+Qc3oGEX4/KGAqMdSxs1qkSWCYnNCo2S6zmTfSrBDGDQqw
 Ri2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+2YtiVwEZ9RwC/8VBcyI97P419lBNhav2fnGdw/4ndg=;
 b=j9+iEiWyVpSwVXKoyubUAdd2jFRXBAfqvfZSl7i83yPPMpxtUaz0gnYns17NVoTLgM
 VI0RF7QcdgZEENup2lTimlLshniVo3NtAFzYbZsnSlmonXFQpoVi0M405LCnfMenZ9aW
 HVBMoW+mOgAYJYQ4hH22wOXQicJga8coJ03s/8kND5EY/DHNK/+o7bpXT1RIbLtRY28L
 7gBtFsPplPIBT28zNSoAZRIV4F8nx30YT2VIEvMDDOIFxWOTV3xTAdqic7Lc49++5eAG
 Q0gemddMXzw6cESXd0rvOFz7RG2mdHbAIRA9XOQnvB3n3+C+yyESck077Trj9iesJe7d
 szUw==
X-Gm-Message-State: AOAM533uyZcShmF4Snp+6SVO6AxDLn6HljUN3IcPq651VHFyliGWtZfS
 7hyR7Ua03QhrrwSv2PJ64Xz3Rj0LfBLy
X-Google-Smtp-Source: ABdhPJxaBps8aY1/Fhc8iqxTvtuoIBmuhAS95C7+qh7lwgHd1GnQESTvPjrlvjXknNVHZNGSyHspuPnSJ29T
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:3dc3:dbf8:5ec1:7fd2])
 (user=venture job=sendgmr) by 2002:a5b:145:0:b0:629:4ec6:bd74 with SMTP id
 c5-20020a5b0145000000b006294ec6bd74mr5257183ybp.572.1646940113295; Thu, 10
 Mar 2022 11:21:53 -0800 (PST)
Date: Thu, 10 Mar 2022 11:21:48 -0800
Message-Id: <20220310192148.1696486-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH] linux-user: Fix missing space in error message
From: Patrick Venture <venture@google.com>
To: laurent@vivier.eu
Cc: qemu-devel@nongnu.org, Fergus Henderson <fergus@google.com>, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c4a;
 envelope-from=30U8qYgcKCjIjSbhifSUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--venture.bounces.google.com;
 helo=mail-oo1-xc4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

From: Fergus Henderson <fergus@google.com>

Signed-off-by: Fergus Henderson <fergus@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 9628a38361..c45da4d633 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2504,7 +2504,7 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
     addr = mmap(test, reserved_va, PROT_NONE, flags, -1, 0);
     if (addr == MAP_FAILED || addr != test) {
         error_report("Unable to reserve 0x%lx bytes of virtual address "
-                     "space at %p (%s) for use as guest address space (check your"
+                     "space at %p (%s) for use as guest address space (check your "
                      "virtual memory ulimit setting, min_mmap_addr or reserve less "
                      "using -R option)", reserved_va, test, strerror(errno));
         exit(EXIT_FAILURE);
-- 
2.35.1.723.g4982287a31-goog


