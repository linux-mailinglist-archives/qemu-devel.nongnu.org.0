Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE942CFC6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 03:02:08 +0200 (CEST)
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1map8J-0000Xe-Tw
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 21:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manID-0003yA-Vb
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:15 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:39774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIC-0002XS-DD
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:13 -0400
Received: by mail-qk1-x735.google.com with SMTP id 77so3836267qkh.6
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 16:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oaPrjBwE27qYYg6zPdefExmELvRJbh0hYIwQ025UvmQ=;
 b=WpKD50UPtaa3zC/tyopGQf0lBQN+OpJPhrgVgfAyAbXa1yn6E8Xpog/xOaXqpgdoQm
 upiSqNY6++tGOgb3Lx+yhpXG/e0NRBO5Ewz3Hu90kfRraU2SikS/dbOTYLB0R9EUELh4
 8DxaSdPmqnrbA/ngMeAApOYrcMa1Mnt8Q/0oMyR20P2kw/cjAyliTy9kbKYIdha1rnAt
 jXy6uDlvLeRB43xXaIp7lCcNKFx/ozclks74CmrjM0mgRbexNE58kBw+5Gmy19qdLgc4
 UzFti/8lStENjBfbb+HjzuzviVkB4iOffCMerZCgtBycvIlkq/WB8eGyDaRMIBRxmTq+
 04kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oaPrjBwE27qYYg6zPdefExmELvRJbh0hYIwQ025UvmQ=;
 b=TLNKKFIwaewL1YRF4zL1i4xN/KigfUGDyKgJ5SWQmhZHhDfhPmq6m1NI+XlAr8WxS6
 tRwW3bDYpZYBDj/qTqC8qgo5yO/BQ2ZsduYQbe8IGWaR2aGVxjs5cR4UZpfDj7bH6Iqd
 NPrN5Rp5Fz2LXcNClO4BIEn063dui/Wcc2H5XKJ0uwky46TE2HLQl3g+NwI5GUD/UTn4
 OtvtDEBJSQY5fCVPiGDd/NsiZilvg3AREtYDuk9gTifFSdlsB4EYtVgNZ2IQcjhmxbvF
 7dmxnjROycWXEG6wCBqzNdtXuSxbnOktwjyuDoyTIJWu+shCR5gvF9obC+WEpPP+ZOc6
 wwBw==
X-Gm-Message-State: AOAM530xjiqMebwy40nUI1CoD9HFjI0ZOWIJbh323V7tN5cHlZQkNK8n
 qefL3zfvQ6KJThQ1WXIncHmRa7TzIdlhdQ==
X-Google-Smtp-Source: ABdhPJxI8AXpKOFtfb6gFANBx4PudyLrdwi0Rg+at7X0X5v5VfLd6HrnxZ4CpbNrB0OtN/Jd+Y095g==
X-Received: by 2002:a37:6303:: with SMTP id x3mr1830417qkb.465.1634166251152; 
 Wed, 13 Oct 2021 16:04:11 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w11sm778680qta.50.2021.10.13.16.04.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 16:04:10 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] 9p: Add support for Darwin 
Date: Wed, 13 Oct 2021 19:03:54 -0400
Message-Id: <20211013230405.32170-1-wwcohen@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:55:22 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a continuation of a patch series adding 9p server support for Darwin,
originally submitted by Keno Fischer in mid-2018
(https://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg04643.html). In
some sense, this could be considered [PATCH v4] of that process, but I assume
that the multi-year gap merits a fresh start..

It has since been updated and rebased for NixOS by Michael Roitzsch
(https://github.com/NixOS/nixpkgs/pull/122420) with a goal of resubmitting
upstream. I am submitting his patch set as suggested, as developed by Michael,
with his Signed-off-by headers included in full.

Additionally, I have run the patches through checkpatch.pl and adjusted coding
style accordingly (with the exception of ignoring warnings about avoid
architecture specific defines in hw/9pfs/9p-util-darwin.c, where they seem
unavoidable), and have signed off on those modified commits.



