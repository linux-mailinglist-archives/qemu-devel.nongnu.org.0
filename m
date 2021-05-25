Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF16390153
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 14:50:02 +0200 (CEST)
Received: from localhost ([::1]:42582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llWVU-0002kh-NC
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 08:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWTy-00019U-92
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:48:26 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:37573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWTw-00040m-MT
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:48:26 -0400
Received: by mail-qv1-xf34.google.com with SMTP id z1so15903513qvo.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 05:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hgr9V5IN7d3rA8+JPZggMasNQOvltzha7rmqf3OhQd4=;
 b=gEekJmWeFZUy5dYzPe7fBp8IjRqSjOvD/DdNu3CA5ZEdjd0cfv5iQpHcb4FzrKC47w
 VMyHSOZx685lBdsIRRZ5XyTWpd2l4ui2QtOTASTlfQ2cwtbeEVFV4iYvo/zTp/eD3JcS
 jrXWB0db2r3TqAwclmDpQFoX1N07yTJ4AeFROM9FH91UxOAT2dFLFOoh/qIGT2BJv+e0
 QsfTPeRc2MSmkix/sPI64iMf5jbz+evEMl32aUM2yZcQzisGY48Gj3aQSOIx3hGti4M9
 W2j6rXBNZ9XZh5aWQfvSeTd2lJuiUiLdKSt24gQBc+eyObmuOyPdSOQHW9EGOUeDDC75
 wbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hgr9V5IN7d3rA8+JPZggMasNQOvltzha7rmqf3OhQd4=;
 b=YpvDwofLXn5t9pVrEjLg25og880GvvP1HX+BbXvLiycd/fwrHLmSUNwGblYHaC8hjV
 H8k4uZ+u0VTjAO5TnkXC19KB/9rFnmHnfY7nlmWkJFC8KQseb3ZHG5tGiS90czjXUmAa
 nabMap2HARp8UoftWPcrG0fLWKeKI+QrvNq9PxVUOm+vAE6RxzYAd3lZvoqty2MZZY8Y
 uYytnVkGH1/A/0ZIsxREaMnXHdqgM9JUfIKuCNB3MzGpg5bTs3krcSrxnVxfcb59/SlF
 NTm4/aOY3HfUR+xDTmx2X47VEOmo5wJPFTBA1Nn6CoAJjEoffxOuumfIG833kyB47s/B
 G2yg==
X-Gm-Message-State: AOAM532XuVePkP7PXX4CTDJgM8bdZFK8ArXH8sYJK9n6QeAYTDSJhQ9w
 AQJ6uuEbUurz9rBNwpVYgva/9e1tqnY=
X-Google-Smtp-Source: ABdhPJx+QsTQbaIgblQQCllcSM9UYCe8orbQxy5EewKz/I3xS9CBeILbyVkelr2YcgxvLDvTvZXBDg==
X-Received: by 2002:ad4:466c:: with SMTP id z12mr36919173qvv.14.1621946902990; 
 Tue, 25 May 2021 05:48:22 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id a68sm13036749qkd.51.2021.05.25.05.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 05:48:22 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] testing block device blocksizes
Date: Tue, 25 May 2021 12:47:50 +0000
Message-Id: <20210525124753.528516-1-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=kit.westneat@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: pbonzini@redhat.com, Kit Westneat <kit.westneat@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches add a few parameters to blkdebug to allow modification of
the block device block sizes, both logical and physical. It also adds a
test that uses the parameter to verify correct UNMAP behavior in devices
with 4k blocks.

Kit Westneat (3):
  block/blkdebug: add blocksize parameter
  tests/qtest/virtio-scsi-test: add unmap large LBA with 4k blocks test
  block/blkdebug: add log-blocksize and phys-blocksize parameters

 block/blkdebug.c               | 53 ++++++++++++++++++++++++++++++++++
 tests/qtest/virtio-scsi-test.c | 48 ++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

-- 
2.26.3


