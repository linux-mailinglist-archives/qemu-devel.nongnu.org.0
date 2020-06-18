Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44AC1FE932
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 05:02:25 +0200 (CEST)
Received: from localhost ([::1]:41714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlkoq-0007pH-9F
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 23:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1jlknD-000656-NE
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 23:00:43 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:46356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1jlknB-0005J1-Ke
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 23:00:43 -0400
Received: by mail-ej1-x642.google.com with SMTP id p20so4739477ejd.13
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 20:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2r1tjch1br1SVb2oD5fzElgfPDBObUIKTgABF3mVlUA=;
 b=AzfbkXSUJAQnD4+kcve+amqfpR93n7YX5PyJ/mn04nWEcDsifVb1/TSkBBGZZanPfx
 uteMkd/nOqnWRbd1eIRZhMKmd0S9xwjlgshYSsmMzBeSiA79MqSAxqK5JssRvWx89JDB
 JlJAVhd9/IZix/RhX4HUPDYeEERC+7k7S0SvseF7ziJRADIpt4peO59kPrpOdZlDplW+
 fhJr1Fvr9CcQELJh/iXXcGGfViivjo1O7Rjc5pKdwqpT5kiahTOkfZ9W0UnN4suHgchJ
 KXWu52BzaSLXgyrcGEh2SsBh9M+l5Z0jeFZK7SmgIfgjslYapOiTsBzU/CFfXV1+WEch
 K7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2r1tjch1br1SVb2oD5fzElgfPDBObUIKTgABF3mVlUA=;
 b=BPhh0keX6AZxAE7XmjqS/C1N9K2eDzcOQGJrif5pbuunLo38rA5wCE38I9qYVg5Vfi
 DXpCW0ztxBXagvFAn7MNtyTOsQ+PcFFP3I96SS3jcaLkmB7E++GOOxnmNotPrhwQVj2Z
 FKbj/HIZI9R0ZNidNo8vi2Cs/eRiXjAqgdQyIVJrHVEO5t58ewG5gnaZV4q51L7RKs9L
 ivTJAihGAon1Mj31J7MNxutP4iMvRbDVqnNWoeqZ8su5EuG/WYCcmuJqLBxN4YCJHgPc
 xq5Hm1h+rOMrHx60sHI/+FfCg4hNkRMuQcABIQWoD31x7coc/X5OktWDf1AQlVyLzA8o
 ziQQ==
X-Gm-Message-State: AOAM5328kGmMOyVyn5DNi0ZkUc2DDV9wRC24Lu39bWBYxrnjXrMjOPPQ
 LH1jsWyD6/HwOVRaPvbBhnS7EnShvCg=
X-Google-Smtp-Source: ABdhPJzsP/mgsLj+ivadjzSwQRN0yT9cIjtgEiOq9L1iKXbZwHU70dJXIYwEg+x2l84BlUsN5VexZA==
X-Received: by 2002:a17:906:7212:: with SMTP id
 m18mr2009828ejk.29.1592449239674; 
 Wed, 17 Jun 2020 20:00:39 -0700 (PDT)
Received: from jondnuc.lan (IGLD-84-229-154-20.inter.net.il. [84.229.154.20])
 by smtp.gmail.com with ESMTPSA id
 l18sm1034131eds.46.2020.06.17.20.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 20:00:39 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] hyperv: vmbus: ACPI various corrections
Date: Thu, 18 Jun 2020 06:00:24 +0300
Message-Id: <20200618030027.759594-1-arilou@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=arilou@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: mail@maciej.szmigiero.name, Jon Doron <arilou@gmail.com>,
 rvkagan@yandex-team.ru, imammedo@redhat.com, pbonzini@redhat.com,
 vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After doing further tests and looking at the latest HyperV ACPI DSDT.
Do minor fix to our VMBus ACPI entry.

v3:
Removed accidental change for the dct submodule head

v2:
Renamed irq0 to irq now that there is a single IRQ required

Jon Doron (3):
  hyperv: vmbus: Remove the 2nd IRQ
  i386: acpi: vmbus: Add _ADR definition
  acpi: i386: Move VMBus DSDT entry to SB

 hw/hyperv/vmbus.c                |  3 +--
 hw/i386/acpi-build.c             | 17 +++++++++--------
 include/hw/hyperv/vmbus-bridge.h |  3 +--
 3 files changed, 11 insertions(+), 12 deletions(-)

-- 
2.24.1


