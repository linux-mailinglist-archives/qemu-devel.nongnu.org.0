Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B64F407D5E
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 14:47:48 +0200 (CEST)
Received: from localhost ([::1]:45184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPOtc-0005YH-79
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 08:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOpu-00039I-U8
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:43:56 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOps-0004pP-Q1
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:43:53 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso4662147pjh.5
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A35TlHj6NvQvQf11SU5kwz38uLXbFwsaunOnRixnHzE=;
 b=HFItM+JtLq4vc1boKfIjB2likrCmbSl4biAdSwFP8XM32Q7Gg3UJzJ5ujp+DPaPug5
 qkDEaS5BfBi9SkFZVI1m2w8+vpFJaCmRQRi1Go2pRU1xqPe0/Zd5bmiJBtW/Hopi+Jwt
 tpSRXTfEa0g6FzGG9DTAlVLa/tDaL1SQA9IA9ji4k3rPEWWMQcIXjWCUrtvHxx3TEELn
 pN0qyBxULCagNefQBqeW5aBr1qk7C7BrfkLEcfqtH7lIIEFICPG5LZ7gQTbK2mu2rVu3
 RctjdpTZ5PuFNKk1oTdscFbkBb2ECWor4rbYEANifkUEuToNHo5YV/rnDaIS28x1x85h
 dBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A35TlHj6NvQvQf11SU5kwz38uLXbFwsaunOnRixnHzE=;
 b=rLXIhMn0bH/FfSLz2LxFSi8/U1vW59CYbpveFDqjqxXzaqTLQTStj+91IL+SEbaPPl
 ISK2sQpyUseudk+vqs9ozYgHvfz7dSWD1f0KVRatqFVd3M7kNWAfsEF+9Oo0HfwQmycO
 vbFdpzdM2VQ45L+lHbp0qIjuzyK5D5phgQ4oMpGq3ioK0J3xlKLnFP7u/X1qYmCpKc0z
 s4waJU9u/lC9yq9AhGBRhSqLT3/YwccIcl1VyB4C79otcxWK5Dac42d96gh3JVcmOAQN
 EotbcgbodHOaoBDs4zlRraAvCnOVGiv++stwysYBU73BvZcFye2DIygNJiS1JdRXQdb5
 yn5w==
X-Gm-Message-State: AOAM533vsAf1jEZqPSlgR3exQ8Cb1m48cOnuDtYJPiuenVzBUFJhOXnk
 ZA45uGkNTvjg8hxi1dr7yDoPi8V9q5t29Q==
X-Google-Smtp-Source: ABdhPJwUmiYZwz8f2Uy7Xdl82Gwr4trPHG1HQYrK/QnX6zfoJxspXl3x2JIVri9H6Lkr5vxlmIJdGw==
X-Received: by 2002:a17:902:710d:b0:139:4c7d:8c7b with SMTP id
 a13-20020a170902710d00b001394c7d8c7bmr6022675pll.59.1631450631406; 
 Sun, 12 Sep 2021 05:43:51 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id i22sm3473443pjv.47.2021.09.12.05.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 05:43:51 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 0/4] hw/dma: Align SiFive PDMA behavior with real hardware
Date: Sun, 12 Sep 2021 20:43:38 +0800
Message-Id: <20210912124346.165540-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Current QEMU PDMA doesn't align with real PDMA's behavior. This would
result in Linux dmatest failed. This patchest aligns with real PDMA's
behavior we tested on the real board. The golden results are performed
in U-Boot on the Unmatched board with PDMA supported.

Changelog:

v2:
  * Add comment to describe document errors.

Frank Chang (3):
  hw/dma: sifive_pdma: reset Next* registers when Control.claim is set
  hw/dma: sifive_pdma: claim bit must be set before DMA transactions
  hw/dma: sifive_pdma: don't set Control.error if 0 bytes to transfer

Green Wan (1):
  hw/dma: sifive_pdma: allow non-multiple transaction size transactions

 hw/dma/sifive_pdma.c | 54 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 11 deletions(-)

--
2.25.1


