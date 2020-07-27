Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2703E22FCFD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 01:24:39 +0200 (CEST)
Received: from localhost ([::1]:34180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0CU1-0008PF-JV
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 19:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1k0CT0-0007Ei-8I
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 19:23:34 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1k0CSy-000607-Eh
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 19:23:33 -0400
Received: by mail-ot1-x343.google.com with SMTP id o72so8024392ota.11
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 16:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=hMWGRB055yRZUhDpcH5vf6C3dA/ey8uxPz41nKnCIII=;
 b=bxAtletE0Yre+1pkrYLi3KVVzTC7VkL0BErNvMqsB4H/OXNGmrngzdecSKG8lvLp9J
 ksuyTrEOh67ztrRPEK8H0j+3AisHHlo8wu94rwHOmVF5dtDxDOOya1wY7caa2LGlHHdt
 xxG//euqZtd9QJXeVd2H4sI+ziadE+/yC/1kn2meRS84/5MXZtrENJV9jDT23+4UotC3
 rSxipCRh7WrMgzs8k8OLf7Qiw7SrC/TDRR8q/7wAUMMndWsMhzmlzlDqiMD6TMH2hy3Y
 mSYfuj/F+pCTV8HQHNIfsLd6h/QHD/xHklDFXzVg21aJ5cz3crB4758aM9aNLT59Iaur
 SP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=hMWGRB055yRZUhDpcH5vf6C3dA/ey8uxPz41nKnCIII=;
 b=FIMSrz+TYHPB0rziIZaRDx8hBgRY57bKjFgWN+n7ImPZHO8NnvalIFvOSRMcfnP73Q
 lerk/00vGPcjiDxN0cMaMd9Lk9kSqLyYheg1nAk2gdHcbVYv5IuXjXhMf/inrQHoE5mL
 roCdLLDyCfjMg2+uUil+w1YvZu6hwc+6JzQF+vu8xviAFIWUUUfbMea4nNTzVq6cb2BB
 OhIiDplnHQ4IEiblxivgAbmTSOn7YowuM9KeDSu4knw9dI0C7APubbkJkxyd9008rlZ1
 CyM+irEW7MnJkvPCdtm48srY1dAteZ/Wv7aVWdDMLxvNQmAHN4X7fM/EdFxd0HyRy1Uj
 YgnA==
X-Gm-Message-State: AOAM532/kn+g+djP6FHIp233KDxEA2r0TGK53UVZKHOE2bCDm90VBNjT
 MuGGfbULcJCfhobmHwbFkxcE5SXy
X-Google-Smtp-Source: ABdhPJw0pZRyFZqyZLwYoU3BbiWLCNBW8yUPpqDvFEJL3crxbkwUvM+aBet+ZQwvFZysHyu1DiADZg==
X-Received: by 2002:a05:6830:1af9:: with SMTP id
 c25mr21811602otd.271.1595892210560; 
 Mon, 27 Jul 2020 16:23:30 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id i1sm2351630oib.6.2020.07.27.16.23.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 16:23:29 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.1 0/2] qemu-ga patch queue for hard-freeze
Date: Mon, 27 Jul 2020 18:22:35 -0500
Message-Id: <20200727232237.31024-1-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9303ecb658a0194560d1eecde165a1511223c2d8:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20200727' into staging (2020-07-27 17:25:06 +0100)

are available in the Git repository at:

  git://github.com/mdroth/qemu.git tags/qga-pull-2020-07-27-tag

for you to fetch changes up to ba620541d0db7e3433babbd97c0413a371e6fb4a:

  qga/qapi-schema: Document -1 for invalid PCI address fields (2020-07-27 18:03:55 -0500)

----------------------------------------------------------------
qemu-ga patch queue for hard-freeze

* document use of -1 when pci_controller field can't be retrieved for
  guest-get-fsinfo
* fix incorrect filesystem type reporting on w32 for guest-get-fsinfo
  when a volume is not mounted

----------------------------------------------------------------
Basil Salman (1):
      qga-win: fix "guest-get-fsinfo" wrong filesystem type

Thomas Huth (1):
      qga/qapi-schema: Document -1 for invalid PCI address fields

 qga/commands-win32.c | 29 +++++++++++++++++++++++------
 qga/qapi-schema.json |  2 +-
 2 files changed, 24 insertions(+), 7 deletions(-)



