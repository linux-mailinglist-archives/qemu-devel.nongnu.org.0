Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C35464EE0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 14:36:45 +0100 (CET)
Received: from localhost ([::1]:60100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msPmu-0004FN-6G
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 08:36:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johan@kernel.org>) id 1msPip-0001gO-Hy
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:32:31 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:32924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johan@kernel.org>) id 1msPih-0003Zn-As
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:32:31 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76FC4B81ED2;
 Wed,  1 Dec 2021 13:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B39C53FCC;
 Wed,  1 Dec 2021 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638365537;
 bh=Jjj9f2URO0qy7cwTOZLcZgnVsX9BCpZo0Th7xEFkb5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jLPvGj9kOb/25iE4HioskAHiKZ/WAW5HzHsImtRVjyNiW2k9GF1enhEa9bInJmUes
 H2g7Zi69RzhhGdBHZvMwE8V8QVFmQZH7uf4G9ZYm2ktAWIQwjM1tO19OlCFXgU1FAJ
 2d2awyvK6LakSsfiAhIl54eSmL84ku4WJ5it82ibrcmUd/D84PA2S9HNB0MB28IW0i
 prW39IwKmuEUQkRsJDYCyEVnmc11LwBrgLeh3LYGBabB3nWoxhSRAnWMyyHV51OkLo
 zBukiXUmb4IBRSVT91RZhNXlFIvwesqlx/rYwKODlVHJHj+qnE7OyIMRql3fwfWaYJ
 ZOPvzUZZuLdOQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1msPiI-0007s3-4f; Wed, 01 Dec 2021 14:31:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Gabriel Somlo <somlo@cmu.edu>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 4/4] firmware: qemu_fw_cfg: remove sysfs entries explicitly
Date: Wed,  1 Dec 2021 14:25:28 +0100
Message-Id: <20211201132528.30025-5-johan@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201132528.30025-1-johan@kernel.org>
References: <20211201132528.30025-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75; envelope-from=johan@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Explicitly remove the file entries from sysfs before dropping the final
reference for symmetry reasons and for consistency with the rest of the
driver.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/firmware/qemu_fw_cfg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index f08e056ed0ae..b436342115af 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -389,6 +389,7 @@ static void fw_cfg_sysfs_cache_cleanup(void)
 
 	list_for_each_entry_safe(entry, next, &fw_cfg_entry_cache, list) {
 		fw_cfg_sysfs_cache_delist(entry);
+		kobject_del(&entry->kobj);
 		kobject_put(&entry->kobj);
 	}
 }
-- 
2.32.0


