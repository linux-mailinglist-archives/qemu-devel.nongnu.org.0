Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FFB4FC78D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 00:20:27 +0200 (CEST)
Received: from localhost ([::1]:59816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne2OY-00055v-SI
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 18:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ne2Mr-0003oV-PV
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 18:18:41 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:43978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ne2Mq-0006qu-1e
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 18:18:41 -0400
Received: by mail-lf1-x136.google.com with SMTP id x17so19975490lfa.10
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 15:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lqr2Yw2GG9uaF7PrhGH9cFQ1GNjZebpUq0Zfz/vOEG8=;
 b=JrxMZVIxSS2NYtAcuy9QLVEWg4w9f/MFfq8V20OaZNYf/fDV508nC2gAnoa5QOMPhw
 WsCoUYho58P5J8bB25xKHKRcPI+f1pywSg8prKI+CJu9ZgRXev34MNtwCtOrrKTCx/50
 nqr4ybn89/chsS/197rICHp+1V5BD2WUZXXpHJTXAlkL8arKRSdfEh3hAUvfdtSHFbeP
 P5no5gDX8K9XNxz8Cvge3S3ZMG+DMk87qtSYmFZc5XXP2duqBm+wAOWZ8F+aSW32yAZ0
 nJQqIcLTVsWz1WZghc34xMNy/1Mo/kKM6NzVtq4JbneZCQ4zDX/R1kikHalpBSxP/CVv
 Qo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lqr2Yw2GG9uaF7PrhGH9cFQ1GNjZebpUq0Zfz/vOEG8=;
 b=n+x1XLKAk2ne343gSoWvWG5biY3EHynQc7XX3U5yTXZFjZgRofjWOkStvXmZZt351P
 Unn8sySgU9SRQFpgR88CmQh4LfCUYG7pqRPHRxtmJhHUE/n8bs100E3dXna9hZSMPsf2
 4aJVykNMZqXptZWxiIQphwhY5SqsGwBAOObTzlmdUMjoTItTSE7SvbLM/crFd23p3UZl
 oV9uApBSV8DfsSEv2wXpSs6zpymRSVGgB9j02PRRa52uJvY5b23V+8shlCYk9rBHhFzL
 RuuC15sf3EXThh2UCUdNY3QHbV72k3WCtXXNY3IrBxtHe+GJQeliabIvvMo7Jz6DQhIu
 2jzQ==
X-Gm-Message-State: AOAM531cC17rbCZ6AbO4q4rRAgmd1AewyAvHxkfo1tR1O4txwkPXihov
 Oa7xdbQFy2qwrKuKjEiYOdLNK5ltnE7EsA==
X-Google-Smtp-Source: ABdhPJxyDFlxbC3MCwaVf45A9jd4aThrzoAQOJnkIQFGdsrIXE7f8i5lYNglrRmRo5YWNEHQg3O+8w==
X-Received: by 2002:a19:da12:0:b0:46b:926f:d34b with SMTP id
 r18-20020a19da12000000b0046b926fd34bmr9351889lfg.646.1649715518014; 
 Mon, 11 Apr 2022 15:18:38 -0700 (PDT)
Received: from localhost.localdomain (31-208-27-151.cust.bredband2.com.
 [31.208.27.151]) by smtp.gmail.com with ESMTPSA id
 w22-20020a197b16000000b0046b89a0232esm1112829lfc.105.2022.04.11.15.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 15:18:37 -0700 (PDT)
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Correct a couple of defines in pcie_host.h
Date: Tue, 12 Apr 2022 00:18:34 +0200
Message-Id: <20220411221836.17699-1-frasse.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: frasse.iglesias@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series attempts to correct a couple of defines inside pcie_host.h.

Best regards,
Francisco Iglesias

Changelog:
v1->v2:
 * Went from RFC to patch proposal
 * Added more meat on the commit message of patch 1


Francisco Iglesias (2):
  include/hw/pci/pcie_host: Correct PCIE_MMCFG_BUS_MASK
  include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX

 include/hw/pci/pcie_host.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.20.1


