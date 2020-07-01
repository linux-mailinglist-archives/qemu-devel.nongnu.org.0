Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BF0210BBF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 15:07:13 +0200 (CEST)
Received: from localhost ([::1]:36314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqcSF-0001QM-Op
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 09:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1jqcRD-0000No-17
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 09:06:07 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1jqcRB-0006Ir-4X
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 09:06:06 -0400
Received: by mail-wr1-x442.google.com with SMTP id z15so12466444wrl.8
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 06:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=fOYRSgb6QiPfrgdzhZYNnAer88CUkfYQW+y0xXCMyXE=;
 b=pZx5Nf9aDpvwGwh/xzTApWyyY//4EdiRj561fiNEGAOGQGvrb13G3xArG5n4dIiC1B
 cevlShQjSL3MPSLUX14EQQI6qnVtZsIvnwC9BgHzCMhDFpE0vS7QMSAr3VokUbpuVk3b
 dC67A/hOabuJ/7CDYJd+jMb8IDLfOZCr/JcsxbuwP5xI+IuiqvGsiA2oRZcktjpUdd+4
 /r+uMv+jDL664E2ahDoh23Y+5NWIJT00FlsldJksEl1IVHXkjyS4M3/tIlgNdNwTJ4VH
 QI7XljX8Dsem5jGtFWg20ntn3oavbKLeX3a27TfnV6itm0abjDWAuc3YFgcBpald1RJ2
 +mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fOYRSgb6QiPfrgdzhZYNnAer88CUkfYQW+y0xXCMyXE=;
 b=pqWcYna1VRBFfJ7vjgnjIJ04vLcME7zVKBWODsvKRrj1wwN3Zp6kQHs/RCr6/AFLsC
 8F198E/HfR2YrN5oB+HOjhnHV4xDDS7GGKQauXpdeAvTtRy8gjBvcJQtvyio41fqRdli
 oeDAGYRKy/UzBTFSZnj+N0JTX5KYAauQ1m3sUJKxLUB7AfuXz3PgxFx1pDtPvWMsGFaH
 7DKUT0MT0r4TYaH3VU7OS1X/TrsvKNUVwGQMVMHBUxH2daNnEwyPdGt7+hJ4Qer3ZuV/
 bqmHyuok7WJdV/GG3HyRF0/qj6L0UaSzw4roSPrY+YWmYAvtXY2T5dIjWQTqkZnWVES0
 IlEA==
X-Gm-Message-State: AOAM531/gbpZfDPAEJL5FzyhWDHjs0RkF7vX+44+IUXgOmq+wxaGEdEr
 mZwlJqMCrINKRKyUW8LtB/4jjwn5
X-Google-Smtp-Source: ABdhPJxRdP/HRKa3W6gt8QK1l/tHrLYLQf30BYSiRkmcgw2r28SfP4fNlvIEGl9mql0s1/Y5MlPG/w==
X-Received: by 2002:a5d:6907:: with SMTP id t7mr26653006wru.329.1593608762874; 
 Wed, 01 Jul 2020 06:06:02 -0700 (PDT)
Received: from AK-L.domain.name ([197.58.21.177])
 by smtp.gmail.com with ESMTPSA id u65sm7053999wmg.5.2020.07.01.06.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 06:06:02 -0700 (PDT)
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org, aleksandar.qemu.devel@gmail.com,
 alex.bennee@linaro.org, ldoktor@redhat.com, eblake@redhat.com,
 rth@twiddle.net, ehabkost@redhat.com, crosa@redhat.com,
 luoyonggang@gmail.com
Subject: [PATCH 0/1] Add Script for Dissecting QEMU Execution
Date: Wed,  1 Jul 2020 15:04:32 +0200
Message-Id: <20200701130433.1506-1-ahmedkhaledkaraman@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series adds the dissect.py script which breaks down the execution
of QEMU into three main phases:
code generation, JIT execution, and helpers execution.

It prints the number of instructions executed by QEMU in each of these
three phases, plus the total number of executed instructions.

To learn more about how the script works and for further usage
instructions, please check the "Dissecting QEMU Into Three Main Parts"
report posted as part of the "TCG Continuous Benchmarking" GSoC project.

Report link:
https://lists.nongnu.org/archive/html/qemu-devel/2020-06/msg09441.html

Best regards,
Ahmed Karaman

Ahmed Karaman (1):
  scripts/performance: Add dissect.py script

 scripts/performance/dissect.py | 165 +++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 scripts/performance/dissect.py

-- 
2.17.1


