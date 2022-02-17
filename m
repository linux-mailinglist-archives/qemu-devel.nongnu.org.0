Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329D54BACF3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 23:56:43 +0100 (CET)
Received: from localhost ([::1]:45590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKpha-0007UV-0w
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 17:56:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKpf2-0005K5-Gr
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 17:54:04 -0500
Received: from [2a00:1450:4864:20::635] (port=40586
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKpf1-0003wy-0M
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 17:54:04 -0500
Received: by mail-ej1-x635.google.com with SMTP id p15so10654821ejc.7
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 14:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BnXOQRAhAESTiXjmGY2dfChgtVslUhB1nIqjKJ3Sz1s=;
 b=OC/A2oXgY4CrRalc4wC3gGvkCAy5n/9HrdA52C+YaKKXjFDa12+j+w3TCELbZFmTF9
 OuFPFzDkc9DRk1RMy8Zf8zKYGHf0GmXv/+V+IUGr59oEC1JTa3OMROWqumc7MOZdwvgQ
 r5deQu42hNolv2qpddDBe0eDwrHZZBg3IGqMBeEbswqqnZkhO55ESgFL11isAKe5+sra
 T8N8PjiFbeYTXdmRrsuMOPa3ewFdl4WzHdUtARLRQNTn3ntNlry9mdt0vC647iTFmcrt
 vHitL6oESmhwpUFvE2b6bDWX2QPZBAM8M+XOuLqmOmyKEVH3m+6329HrKehDX1jE6ynf
 bL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BnXOQRAhAESTiXjmGY2dfChgtVslUhB1nIqjKJ3Sz1s=;
 b=wEpDH+6W7v82akMD3W7pV/vYhDEEFq1qN38oV5Iu3Aw48UA5T6gml1WePU3m61o/QQ
 NsOVP0P+FZGUf5Xj0RHlgDKMMrsKd42jFJ2fMlefnpLCqlYCgxS9eReXvNaQoJqn30l3
 8I2X5F0uq3jzyK28+U0CftxA1mE9nbf/T1gFtzmBEbXBIQJ8y2MMjRULb5lc8hiKfpP9
 jniJ99mNBdufW1ts3bHqEKEtuNELw2WUOehQAkK2wJZMNfsmbfLabdSxfzIlPcvErwe8
 b2fG+6rt3Wj2BsOY2wy0jAkEFFJ6Stp+Y+llAl56zr0Ty+oPA467LpqNDhe8MTueSLqV
 kPVg==
X-Gm-Message-State: AOAM530WsQQ1Zwg5JAZ/NnH5aJYtSont/iwa8CT8kh+3d0ouNU8Rg7pA
 TTexL63zbeB3Hh4i/WCOww/0GAGaCrAxCA==
X-Google-Smtp-Source: ABdhPJzhqlkyo5kZDmsbPAL0pvnndY3vca5csOXgUoSOZZU3T4rmvjlVUiNhvDtbOT76aOHCcwokbA==
X-Received: by 2002:a17:906:824c:b0:6b8:d8e:c44c with SMTP id
 f12-20020a170906824c00b006b80d8ec44cmr4143954ejx.548.1645138439488; 
 Thu, 17 Feb 2022 14:53:59 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-198-236.77.183.pool.telefonica.de. [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id mb23sm1598871ejb.62.2022.02.17.14.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 14:53:58 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Resolve some redundant property accessors
Date: Thu, 17 Feb 2022 23:53:48 +0100
Message-Id: <20220217225351.140095-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QOM API already provides appropriate accessors, so reuse them.

Testing done:

  :$ make check
  Ok:                 569
  Expected Fail:      0
  Fail:               0
  Unexpected Pass:    0
  Skipped:            178
  Timeout:            0

Bernhard Beschow (2):
  hw/vfio/pci-quirks: Resolve redundant property getters
  hw/riscv/sifive_u: Resolve redundant property accessors

 hw/riscv/sifive_u.c  | 24 ++++--------------------
 hw/vfio/pci-quirks.c | 34 +++++++++-------------------------
 2 files changed, 13 insertions(+), 45 deletions(-)

-- 
2.35.1


