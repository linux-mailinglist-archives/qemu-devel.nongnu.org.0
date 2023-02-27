Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83C76A4418
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:17:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeDV-0007WP-UX; Mon, 27 Feb 2023 09:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCr-00078o-3a
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:26 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCp-0000tX-9V
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:20 -0500
Received: by mail-wr1-x429.google.com with SMTP id h14so6373713wru.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BUCyj6jY2NeQmAhDjqNmRrKIVUF0KxHMPTPKs9DAlGM=;
 b=TRr6MFCUUMV6wYWwo/YqwzFizSyFLxT4fIUh6FnYabC/qhhrn5/lH4uqDBkgHPTf7u
 mRu0EwX3qRBT3LooIAyeez2AxgBSffhUsw7dx/riilfrhm5Yl5bQTS/K2hw9uZdFWqcm
 D7IbrZGQWvwdXlbCqjuzxxHvh4Si1xgwkCKMFK1+72wuyemnNOwOwXc5IprJ9IozpqHJ
 cS+rpD/ce4RNGuypb1lFq2UNLOKlslFU+fM8lA9i/0wGSMEwSY7x+JIQOR+V0XUIq03j
 G2i3nUo0yzOivF0YpzV0vrmHpfWNB26Y0PZtj7eq5hRtpCAVsm90bGMTgyb7yPPY6N5D
 l9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BUCyj6jY2NeQmAhDjqNmRrKIVUF0KxHMPTPKs9DAlGM=;
 b=jOO7CGmdHrSL8vPV70QU3v2Cx0Kypm4AWMYHCnk5mc4oOaV+E51FraBmuEobln7rzM
 7qpFw9XQIqGRl1dhLtQ4PmWUcJ3vukBH8u87wiughYuA/DmzXOw5WzD0CdNFjNcTnR6S
 bag5/0iFN23X0sWl8XxiPn+wdnRKDwVoYXeB9AvJDUM/4DrGN6NC93HIeAvorIEHuKpD
 N0/VyEdQutsBUIv+1xExTMcuKDrV6/sv0iF5+AAf6BsLdKC0M45SF65X4SiozBcB57uI
 Nc+pSdrS0/HrsAqcJiV+gZJYSujYj7ayahmYLcuutahwUvb7ORYLtyz5DY0VqGVIgCf0
 Uu5Q==
X-Gm-Message-State: AO0yUKWeWKtqq2mZJhT7PgEGusd+U0Dbr98qiq/PPrkcpXyWIodwduLj
 J3I+qQSM2i5jucCkHNhLXQG2hijYHzMwXH7l
X-Google-Smtp-Source: AK7set8J/lwD/7G62ZcRtmyNGGfw8q+wzxuecxZaC8P6hUeggMXb/b73ZwLGymub/dAGd36M5IeNgA==
X-Received: by 2002:a5d:4dd1:0:b0:2c7:a39:6e30 with SMTP id
 f17-20020a5d4dd1000000b002c70a396e30mr14915301wru.38.1677507017615; 
 Mon, 27 Feb 2023 06:10:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l8-20020adff488000000b002c557f82e27sm7266039wro.99.2023.02.27.06.10.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:10:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 098/126] hw/ide/ahci: Trace ncq write command as write instead
 of read
Date: Mon, 27 Feb 2023 15:01:45 +0100
Message-Id: <20230227140213.35084-89-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fiona Ebner <f.ebner@proxmox.com>

Fixes: e4baa9f00b ("AHCI: Replace DPRINTF with trace-events")
Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230217103130.42077-1-f.ebner@proxmox.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ahci.c       | 4 ++--
 hw/ide/trace-events | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 7ce001cacd..595a96203f 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1085,8 +1085,8 @@ static void execute_ncq_command(NCQTransferState *ncq_tfs)
                                       ncq_cb, ncq_tfs);
         break;
     case WRITE_FPDMA_QUEUED:
-        trace_execute_ncq_command_read(ad->hba, port, ncq_tfs->tag,
-                                       ncq_tfs->sector_count, ncq_tfs->lba);
+        trace_execute_ncq_command_write(ad->hba, port, ncq_tfs->tag,
+                                        ncq_tfs->sector_count, ncq_tfs->lba);
         dma_acct_start(ide_state->blk, &ncq_tfs->acct,
                        &ncq_tfs->sglist, BLOCK_ACCT_WRITE);
         ncq_tfs->aiocb = dma_blk_write(ide_state->blk, &ncq_tfs->sglist,
diff --git a/hw/ide/trace-events b/hw/ide/trace-events
index 15d7921f15..5ef344ae73 100644
--- a/hw/ide/trace-events
+++ b/hw/ide/trace-events
@@ -91,6 +91,7 @@ ahci_populate_sglist_short_map(void *s, int port) "ahci(%p)[%d]: mapped less tha
 ahci_populate_sglist_bad_offset(void *s, int port, int off_idx, int64_t off_pos) "ahci(%p)[%d]: Incorrect offset! off_idx: %d, off_pos: %"PRId64
 ncq_finish(void *s, int port, uint8_t tag) "ahci(%p)[%d][tag:%d]: NCQ transfer finished"
 execute_ncq_command_read(void *s, int port, uint8_t tag, int count, int64_t lba) "ahci(%p)[%d][tag:%d]: NCQ reading %d sectors from LBA %"PRId64
+execute_ncq_command_write(void *s, int port, uint8_t tag, int count, int64_t lba) "ahci(%p)[%d][tag:%d]: NCQ writing %d sectors to LBA %"PRId64
 execute_ncq_command_unsup(void *s, int port, uint8_t tag, uint8_t cmd) "ahci(%p)[%d][tag:%d]: error: unsupported NCQ command (0x%02x) received"
 process_ncq_command_mismatch(void *s, int port, uint8_t tag, uint8_t slot) "ahci(%p)[%d][tag:%d]: Warning: NCQ slot (%d) did not match the given tag"
 process_ncq_command_aux(void *s, int port, uint8_t tag) "ahci(%p)[%d][tag:%d]: Warn: Attempt to use NCQ auxiliary fields"
-- 
2.38.1


