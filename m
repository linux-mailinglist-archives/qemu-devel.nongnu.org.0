Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B1C460A7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 16:26:16 +0200 (CEST)
Received: from localhost ([::1]:52050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbn9j-0008Ci-8B
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 10:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50862)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vandersonmr2@gmail.com>) id 1hbmew-00036s-6r
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:54:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vandersonmr2@gmail.com>) id 1hbmev-0007wI-AS
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:54:26 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:42364)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <vandersonmr2@gmail.com>)
 id 1hbmev-0007vQ-1t
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:54:25 -0400
Received: by mail-qt1-x844.google.com with SMTP id s15so2495063qtk.9
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tlqg1GjejbBjdqKOuyj4x0cosQXs8JHVm9nwNRwuQuA=;
 b=iOeR+oWmTYMhjj+s8uvFYFsa6tJTN33365fkIGltnRDbnwOBruAVGkEKZf8vQWnRaj
 fqp7dJa85futKzuN1uixoAhzOrIlufsGlr7MZ8yxAhzU4PjJLupNNmvLrGWZm55ZAUB9
 AdGw57fFdathMSnPUQrpLMCEfnbSa1oa/AV/3a7rDsABeR8bYDhipKT6Q8g7+HphQRRG
 cUU+CzmNts2uCr3iXwyXWKZ4nLjHBWjJH+zGhlHyGfihfwDvaRv/ZOvIBdLKYg7mS5e8
 F03I/hg1Uf0WdKbXGApTCAS6MgvvkZFCRK8kA6JJ3blyuGayd/9itYdTvdXNRAfFP7F3
 jYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tlqg1GjejbBjdqKOuyj4x0cosQXs8JHVm9nwNRwuQuA=;
 b=snvyjmBwO905NerPUnF4E5dxF5IW0bvRG99ook1/SKEv7ld1X3lCdZcUiTZ6O+MeV1
 8LJA4gKqrQE7mwUtTHqa2PXthnOVTLclk04lYeRUm7bI9FFz6ddZPHNN6/+aHvezzv6Q
 HxvnRuIJWedpPW02I3eWYpT06/1twKCFBuPaQADb1pU05VNOOF6KxR6J7NzGEG/OOqH1
 NXH7xTxuyfQNtq/asYd7aU1Gx++rT4FvfO0979qpTIouZ2dCjl0YEjUgjFrU0lzfbtty
 44byTzcedDAXgwVNPOXypOW4ieb3u8yoJhBe6IBHCROyHnuCV1eY+jV/jUUtcao/VdpU
 O0mg==
X-Gm-Message-State: APjAAAVmBoMfR6WVjRULl/XvxugaS+mlNzZpepprEpADJNIBvdc0hJtf
 7Cd2lGjyZYVFlSj/ebZk1t1uumHe
X-Google-Smtp-Source: APXvYqzeqNBYTjWDqRTUyo5s/07jOSSck7EwdXAd694Pn5nWiIwD1lbxfzjjIUPHPqoF0bhDP83Hww==
X-Received: by 2002:ac8:25d9:: with SMTP id f25mr79453764qtf.256.1560520463378; 
 Fri, 14 Jun 2019 06:54:23 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f4:548c:f96b:4e5b:86ef:e7bc:c1a0])
 by smtp.googlemail.com with ESMTPSA id 77sm1747150qkd.59.2019.06.14.06.54.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 06:54:23 -0700 (PDT)
From: vandersonmr <vandersonmr2@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 10:53:28 -0300
Message-Id: <20190614135332.12777-1-vandersonmr2@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: [Qemu-devel] [PATCH 0/3] Collecting TB Execution Frequency
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

This is the first series of patches related to the TCGCodeQuality GSoC project 
More at https://wiki.qemu.org/Features/TCGCodeQuality

It adds an option to instrument TBs and collects their execution frequency.
The execution frequency is then store/accumulated in an auxiliary structure
every time a tb_flush or a read happens. 

[Qemu-Devel][PATCH 1/3] Adding an optional tb execution counter.
[Qemu-Devel][PATCH 2/3] Saving counters between tb_flush events.
[Qemu-Devel][PATCH 3/3] Adding command line option to linux-user.


