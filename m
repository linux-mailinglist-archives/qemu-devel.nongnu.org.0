Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5342CFC4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 03:00:28 +0200 (CEST)
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1map6f-0007t5-5p
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 21:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1malqt-0003Sj-PW
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:31:56 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:37874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1malqr-00029A-Ur
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:31:55 -0400
Received: by mail-qk1-x731.google.com with SMTP id bl14so3648274qkb.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EVNQMNzwxLHYQpPmLnvNYYKGvgSqgWQ7JXCmQkgB/w=;
 b=EwgnWpG5DcjTNOBZIrARRkYzV2y6B0nSlyCecAV8zE/8aw2X9hLrM9IZFuMuRBWy8f
 tgUuScVHs42IaBXfdU3ZEk9OCDpJehedkA/g7uJZrWVPWfea8XFChZzemQUhNgACW/H9
 AC0dCKKm9D8ffwqUCrlHPu0cR8f7wQBIx6aKXPTugXM6FK37s0Ksu/GOMozlgzXR8nMA
 ln1K2iAhffVXJx9U9F67P1bPkPNoTY1VI/mPF+IYU5UXnYZTW0q/nj4g+3mjKqmymIfy
 scpusEEuRsiigoh/z3IFnD2cea8eXC7I/jmgiN+cVic9K7WeXpUdhvDpZ5BQCVnLmzfm
 6KNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EVNQMNzwxLHYQpPmLnvNYYKGvgSqgWQ7JXCmQkgB/w=;
 b=zBUuMhFbkS+uaHYSOXJAHTwvDQeN1ZrYKjsuJP+f1EkCwNoWH1WfV7xyOVHYobI66f
 nw6NhS/PE5xCU3hk+DMnSvdSQm3bd3fXyAzGEhORO1z6+KIIraYjGeMr+GQMElr31iP/
 KG1TvRNohogCoCK2j8pWdYsMfGgFkQiVIyJXq3iJr2yVJsXKCNtlWY0MzUCJjyAuuuyq
 qmt1kaPMyh/L19sf3oRdHF1UDyU/xo30kh8dzivHA6XlsBH0IEnLSZxaKONi3t/rwWA7
 Bno+/LdJ82L3F9W2nhzJ0JmndnanBf5HkgmKYEQJQzYpr+acnUAx5LV4wV7yOlNd+rQU
 wGyQ==
X-Gm-Message-State: AOAM533kW2xjGKb/EozYaUqqNfUM3n0qbhtkVRTLYn7VGLGRP3moqtBY
 oj2RSuqGcCQenTFV7ozQs21tTdA1pzt6lw==
X-Google-Smtp-Source: ABdhPJxgYzpNF4juIwk8jYbwCFpA/x8u34Ge4En6znUhR/VV40HJyCZJ4vjURgFDLpxZf8rZmA9/sA==
X-Received: by 2002:a37:a050:: with SMTP id j77mr1506699qke.337.1634160712673; 
 Wed, 13 Oct 2021 14:31:52 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id n123sm406752qke.36.2021.10.13.14.31.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 14:31:52 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] 9p: Add support for Darwin 
Date: Wed, 13 Oct 2021 17:31:37 -0400
Message-Id: <20211013213148.26134-1-wwcohen@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x731.google.com
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
(https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg04643.html).

It has since been updated and rebased for NixOS by Michael Roitzsch
(https://github.com/NixOS/nixpkgs/pull/122420) with a goal of resubmitting
upstream. I am submitting his patch set as suggested, as developed by him, with
his Signed-off-by headers included in full.

Additionally, I have run the patches through checkpatch.pl and adjusted coding
style accordingly (with the exception of ignoring warnings about avoid
architecture specific defines in hw/9pfs/9p-util-darwin.c, where they seem
unavoidable), and have signed off on those modified commits.



