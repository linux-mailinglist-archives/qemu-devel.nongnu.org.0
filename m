Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ECE3329B2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:07:08 +0100 (CET)
Received: from localhost ([::1]:55210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdww-0004vv-Fi
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:07:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdJl-0003yq-EW
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:38 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdJi-0005uI-Hq
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:36 -0500
Received: by mail-ej1-x635.google.com with SMTP id mm21so28107190ejb.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/NZYkxjcusI9dchfNq6jS4Ie3ROG6hpFJkcyCnDxE+8=;
 b=hKnx3X3IFOx1NNlQ+pAwdxD7KwlO3Y/C9K6+wCoU0SK081pC7tCFI1Q5OJemQ2QHtN
 ZdnI13m0QbrVdMN3iahgihoq9NLzGHBK06vaI/o0JY+LBKVSmzclcDC1iA9/H27oqr3O
 s8Y0xnQ+uj7XbDqExKTZW30Jzxo+MbKghITba/BqVW3Xzv7h/AvlxiQG8RpyOVsghS++
 GkSrj9No5nPrZycYVsTZvtO8+nsgV9JkTqh3djQQkiFuna2lWl81p4kh+hrT9Z8/hCkD
 Aro14wKKZwlxpTEfaJXOXHBfcZdE/+4ghnWEDUxjbWD/f2QSy/WPT94TmIbdzBLyyUta
 c4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/NZYkxjcusI9dchfNq6jS4Ie3ROG6hpFJkcyCnDxE+8=;
 b=J7n2wNtueMx6x3m2We53AP5ahPQc/Hwpjy4ho0Et6KK2TZfShlZCtCXIK9RswUw4qd
 Dz4YfhVprpSDll1QVgicaIQiOU/Mw9IYAV0MnkR31bzYpJ2vB3fCwHM4VBnmSbIZnaJ4
 vZA0MlwgZItQJHxDsgx0csjvquHNkId6uQkiMEkYZYp4ejg6hcCMGT+0fcZ3cCHrT7g/
 QDyNAgATU3QcynXzpXhKRhwAbS8E6zpF8Vy4QjnVK0fwKFxa1/QLZEIhbv6Hk8osWRf1
 008RxMWvhG+zbeA5QNVbLyi9onhMhckxCsDPwXzyO/XfH4e7XA05VnFYPReq2ST2xGjP
 wfAg==
X-Gm-Message-State: AOAM5311Dg3vSWrbYl/FxxjeZLt1vKufgUop5xmHAoPFOZ6gqw9CIoXL
 +fjW93v56TAPBzTVBmagOKLDxmXYf5c=
X-Google-Smtp-Source: ABdhPJzOMjBhe9wU9wn4XxZ6VA12bNpjjFc+rB4Q8G9a35rgTc3phEMwaQFdRr990mEJgZ/Lg7gh1g==
X-Received: by 2002:a17:906:1457:: with SMTP id
 q23mr20583223ejc.43.1615299992557; 
 Tue, 09 Mar 2021 06:26:32 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id lu26sm8473278ejb.33.2021.03.09.06.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:26:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 0/6] hw/mips/gt64120: Minor fixes
Date: Tue,  9 Mar 2021 15:26:24 +0100
Message-Id: <20210309142630.728014-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial fixes extracted from another series which became too big,=0D
so I prefer to send them in a previous step.=0D
=0D
(This is a resend for Zoltan).=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  hw/mips/gt64xxx: Initialize ISD I/O memory region in DeviceRealize()=0D
  hw/mips/gt64xxx: Simplify ISD MemoryRegion read/write handlers=0D
  hw/mips/gt64xxx: Fix typos in qemu_log_mask() formats=0D
  hw/mips/gt64xxx: Rename trace events related to interrupt registers=0D
  hw/mips/gt64xxx: Trace accesses to ISD registers=0D
  hw/mips/gt64xxx: Let the GT64120 manage the lower 512MiB hole=0D
=0D
 hw/mips/gt64xxx_pci.c | 67 +++++++++++++++++++++++++++----------------=0D
 hw/mips/malta.c       |  7 -----=0D
 hw/mips/trace-events  |  6 ++--=0D
 3 files changed, 47 insertions(+), 33 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

