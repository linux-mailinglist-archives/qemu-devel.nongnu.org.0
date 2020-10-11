Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9AD28A9FB
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Oct 2020 21:54:00 +0200 (CEST)
Received: from localhost ([::1]:40474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRhPr-0007bF-9k
	for lists+qemu-devel@lfdr.de; Sun, 11 Oct 2020 15:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRhM7-0003rG-DG; Sun, 11 Oct 2020 15:50:08 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRhM5-0000LY-V1; Sun, 11 Oct 2020 15:50:07 -0400
Received: by mail-wm1-x344.google.com with SMTP id j136so15373094wmj.2;
 Sun, 11 Oct 2020 12:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d523o/fbZffgfzeiRypgl8Sr4+ahfNlUxyuEoCVUj0g=;
 b=EYnrGZPTOj8yaPLAWO28rI1ri1ce5smeOkO+Tb5ZS3nLhMsToBsTcmgkiL1I4SM89J
 3bhpFEf2TJhNMkaOJHmP1M9r2veA/0Bz1QTZxzMaDiNjN3lsTt5aLRaSH+wLrMhEqoBS
 Iacs4R+/JupBRmIgMJZ7Zt65v35FSwMGnjV7hQta7uKJaFaFcjFJjivrpOEZvuEyFLkt
 QGL0sZ/JHAj1qduW7ab8Hh2Ed/Kk8DptGiYqDdmZLfRR6BPzk9oRcVBVUectfgD/a1l1
 3f1GnO7lMqPKeAl5vAB67lymbKIpwKJJtzTd8lh4IhWTLYVSPK/daWaFb2ver8ns+ESA
 baJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=d523o/fbZffgfzeiRypgl8Sr4+ahfNlUxyuEoCVUj0g=;
 b=H6uOnsC+sk5uNl4z2KL2d0x9h5exYsB39hce0wbVxzhir4GncsDSmW9kwpLVhOGYVG
 FUeMVVo0HvRW4HHTjQEVVEeMnCTG5Gnw4Co950EHZQrxuLIs839g6mMiECn7vhH52eV0
 ToX7F6zbRiHCCOblBOexsLL84NlUDKCLSxRAspa/FYkWvHG3F+erW4zWushOzzsXdLGx
 4yAniOe9q36CqllORX5X9w5kJjcdsye1VCC62eDcf95AWYog3ANvF4ih2uYnttguUt7x
 RP6oGg7nFW4LHHD6bdgadERJJIqE8gOnnA2guVe26i+C8Yp4U9oYw0Q8GghbnoudSZ0F
 qiwA==
X-Gm-Message-State: AOAM532tG+PcVjI+ot2Bs2Wo7gte3aOgTfMaYZAtSzp9Fn+ZBIEIrHzB
 dY/FnE/ylb3w5qGl2jAdOYYS4W0VQJ8=
X-Google-Smtp-Source: ABdhPJw004lI0n18X2RegqYlDFdb6T8L+lqp9TtPBR8lixfsZH7J1EdsRtlse37U2+jjKfMPz6V/Uw==
X-Received: by 2002:a1c:f208:: with SMTP id s8mr7981313wmc.85.1602445803811;
 Sun, 11 Oct 2020 12:50:03 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id r68sm15474264wmr.37.2020.10.11.12.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 12:50:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/scsi/megasas: Remove pointless parenthesis
Date: Sun, 11 Oct 2020 21:50:01 +0200
Message-Id: <20201011195001.3219730-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/scsi/megasas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index e24c12d7eed..d57402c9b09 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -2384,8 +2384,8 @@ static void megasas_scsi_realize(PCIDevice *dev, Error **errp)
     if (!s->sas_addr) {
         s->sas_addr = ((NAA_LOCALLY_ASSIGNED_ID << 24) |
                        IEEE_COMPANY_LOCALLY_ASSIGNED) << 36;
-        s->sas_addr |= (pci_dev_bus_num(dev) << 16);
-        s->sas_addr |= (PCI_SLOT(dev->devfn) << 8);
+        s->sas_addr |= pci_dev_bus_num(dev) << 16;
+        s->sas_addr |= PCI_SLOT(dev->devfn) << 8;
         s->sas_addr |= PCI_FUNC(dev->devfn);
     }
     if (!s->hba_serial) {
-- 
2.26.2


