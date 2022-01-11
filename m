Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF03348A4AA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 02:03:39 +0100 (CET)
Received: from localhost ([::1]:50960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n75Za-0006b1-NT
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 20:03:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n75SP-0007p3-2u; Mon, 10 Jan 2022 19:56:13 -0500
Received: from [2607:f8b0:4864:20::a35] (port=38709
 helo=mail-vk1-xa35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n75SN-0003pZ-AW; Mon, 10 Jan 2022 19:56:12 -0500
Received: by mail-vk1-xa35.google.com with SMTP id h16so2014782vkp.5;
 Mon, 10 Jan 2022 16:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CZAzCSvxQsi7SVK1sqpRIeVXn9hfCFh6Jtxm5xS5xUQ=;
 b=T1dBNJYCmu7lfC5B3kUuWPlV3NvptJXwl+imv4/Hgk/UWPXfXnUiv675N67ZDmFqwx
 uBroQmWH76+SXWOXQ0vGxzBXr2ryZQ/xSNVG+O5moEkLZ2R3KjVgNzxkLl61+8NPgH4R
 mMtMvFNvI8twnwXN/E9q9qTk9sOlUNw45GbgYUOvc1oW+WgwjY2mXCuttU+S12iZ+9uA
 i7/5fwGICEdv3EE83zwfpdgakjDC+4x98NN/dJbiYjUbtP3GAdT0/WIdCm7xc3kRW2WX
 z+hrR+CA3Ka2YkYa+Fz14VqHXAaYoWmcVyVUarHCkb1UlUwgpHKiSjPpDzzyK0EN8wZY
 PWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CZAzCSvxQsi7SVK1sqpRIeVXn9hfCFh6Jtxm5xS5xUQ=;
 b=Bm2aPka+aoPRoSsLYqP++bwXKBK6IG5ojJSPdkcCZ3nV3jJ1q02jsvJD0BmjbTChru
 Mbq2UdaxLjTUMANNM44vz6XgAyHBwNSRmuQ/YJQVJV34QhSk/oWxL0zsqSW0+fjDId87
 G2vhQnoqs+2voqS0yvyIW278cl50mTtH/LBQZkHUHcs0gDKfPJNFJEFgvqLZyNkmdpJg
 s4TvNckE2kNJdHqQhxC1SP6dFMqhR/0UZ2T4FdJSX3Zj8LfiIg/nL0vzdonfys0SZAW+
 d9ktcNNj6F//uEmOFYu7DG5KbcgKAzNjRJ7Va6IoIdtgdcCbsbbV6dnliesNagAzr6fx
 faqw==
X-Gm-Message-State: AOAM5327N7J00qRm8Ga4JWW6riaDG1KhIW5u9Ad4W+z7sP3FMWxMD7w9
 e9qzAQZlHMlyJLMvMYeWHdmU2sIUoH3YKy5u
X-Google-Smtp-Source: ABdhPJxhntWw08RD7b6rQg1qnxTnuM6KutTDVsWdqXJKUGzSOs0E/iXVWm7G/7LV2SHQbNy+VVrPIQ==
X-Received: by 2002:a05:6122:2188:: with SMTP id
 j8mr1188626vkd.11.1641862567523; 
 Mon, 10 Jan 2022 16:56:07 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id x190sm4645562vkf.56.2022.01.10.16.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 16:56:07 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] user creatable pnv-phb4 devices
Date: Mon, 10 Jan 2022 21:55:53 -0300
Message-Id: <20220111005558.549685-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This new version contains the remaining v3 patches that weren't accepted
yet, which is the case of patches 10, 2 and 3.

There are fewer patches this time due to 2 design changes made: move the
phb property setup to stk_realize() and all XSCOM initialization to
phb4_realize().

As a note/TODO, at the end of this work it became clear that it would be
interesting to rethink what we expect about the PnvPhb4Stack object
in the overall design. The object ended up with no init() and its realize
is used as a glorified setup for its phb, being a no-op if the user runs
with -nodefaults. There might be an opportunity for further cleanups and
simplifications.

changes from v3:
- patches 2, 3, and 10 from v3: accepted
- patch 1:
  * do not create a function to set the properties
  * set all properties in stk_realize()
  * remove the 'phb-id' link during this process instead of using a separated
patch
- patch 2:
  * move all XSCOM init to phb4_realize()
- patch 4:
  * review changes proposed by Cedric in v3
- patch 5 (new):
  * a trivial cleanup following patch 2
- v3 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg01931.html


Daniel Henrique Barboza (5):
  ppc/pnv: set phb4 properties in stk_realize()
  ppc/pnv: move PHB4 XSCOM init to phb4_realize()
  ppc/pnv: turn 'phb' into a pointer in struct PnvPhb4PecStack
  ppc/pnv: Introduce user creatable pnv-phb4 devices
  ppc/pnv: turn pnv_phb4_update_regions() into static

 hw/pci-host/pnv_phb4.c         | 431 ++++++++++++++++++++++++++++++---
 hw/pci-host/pnv_phb4_pec.c     | 317 +-----------------------
 hw/ppc/pnv.c                   |   2 +
 include/hw/pci-host/pnv_phb4.h |   8 +-
 4 files changed, 422 insertions(+), 336 deletions(-)

-- 
2.33.1


