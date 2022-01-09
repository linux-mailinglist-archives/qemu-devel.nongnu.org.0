Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B214889D7
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 15:23:32 +0100 (CET)
Received: from localhost ([::1]:33740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Z6Y-0003OL-R6
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 09:23:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsoref@gmail.com>) id 1n6RWT-00075V-I1
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 01:17:45 -0500
Received: from [2607:f8b0:4864:20::f31] (port=44604
 helo=mail-qv1-xf31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jsoref@gmail.com>) id 1n6RWR-0007Sp-JU
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 01:17:44 -0500
Received: by mail-qv1-xf31.google.com with SMTP id kd9so10846683qvb.11
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 22:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dPj8a11BlFrTeB94xILqk7Wf7wj8quAA2KXIvyRw/BM=;
 b=Qu2EePoI860eBwgQ62MmdPhDPkannjZDhEtm932/X3M9bWi8l6zoPWmnSkWHh54yXe
 hgrhhccX2du4FE30FPIC+71WHhdr4ojp/dbH5bMkz7WEFf0NQwV1hGOI8MwQRl67y19P
 s9AIQ9MR3zQQXYLSKeWd9/R7es6+Qd4jVDoiJj8pRGzdt89Z3hCbpDB0m4+ONRr0zJ4r
 LJJgO4tVOoNIJH5cv5ktDAJ+VQ/6eXCKZhktyK85b3R0s2pFDVVIYXCU7EaRSiPoqh/X
 QcN3ZYuXghSsXC5xk0Q6+m7E4l/6Ewsv7KJtkTtSQoaen4W6wXL73rzuk359R5t1O1ma
 a4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dPj8a11BlFrTeB94xILqk7Wf7wj8quAA2KXIvyRw/BM=;
 b=BOKkRyyopSvfF/tV39hBHJoQ/WWN2mYGSLq7mzDLiQwpYrC425tIII81DbwhE00biP
 RKZ6qtDj4XSIqrrDx8c6b+Sl8FGcgKieAzllwJZsU+/lqXE/+5Dj5xQ/AfBl+62a8NO9
 jAxdWBpWTrZmqdxn/zHSDjSJ2XzfZ0AJU+zEKwhdrx5+2McjuTHsfYkUlSOTSONiP9Ad
 i0TipFHBCbiJIvJab05VdOAjTiafAV9EalNDpqtz70COyFuAXf3Y6dVXK99mNwsrvGGf
 robJEpuDvoyU/7jdOJdu1/P6TVG+yVFthDNFLhsA3NlJcV4DmAf1oSKZjzkeGZDb0xIF
 o6cQ==
X-Gm-Message-State: AOAM530TICMRfTLXowC3YjAMzrmERaE+UNWM/7rGKgtMzvNeMt2BNUSS
 /KImIxIY+YHVeQoq+cozaFs/KNGPOf8CqjHV
X-Google-Smtp-Source: ABdhPJypwZKbc6gr2wTq8d+77l99GoD8xmL5R3MGe9tSa//xyY2HwDcc2j3gQ/7Yy8bA9ABFu/nGSA==
X-Received: by 2002:a05:6214:248a:: with SMTP id
 gi10mr60201257qvb.101.1641709062210; 
 Sat, 08 Jan 2022 22:17:42 -0800 (PST)
Received: from localhost.localdomain (199-255-11-35.static.celitofiber.net.
 [199.255.11.35])
 by smtp.gmail.com with ESMTPSA id w63sm2169705qkd.88.2022.01.08.22.17.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jan 2022 22:17:41 -0800 (PST)
From: Josh Soref <jsoref@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] GitHub workflow fixes
Date: Sun,  9 Jan 2022 01:17:06 -0500
Message-Id: <20220109061708.21481-1-jsoref@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=jsoref@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 09 Jan 2022 09:21:13 -0500
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
Cc: Josh Soref <jsoref@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current workflow fails to provide a comment explaining why
it has closed a PR. This is not friendly.

Also, while it's perfectly reasonable to close PRs to the qemu
organization, it's a bit much to close them in forks.

These patches address both of these issues.

Josh Soref (2):
  Fix lockdown comment argument
  Limit lockdown to qemu

 .github/workflows/lockdown.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.32.0 (Apple Git-132)


