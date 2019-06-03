Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2881133028
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 14:48:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXmO4-0000Xp-5c
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 08:48:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1hXmKn-0007F5-IS
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 08:45:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1hXmFL-0008TR-PX
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 08:39:28 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34116)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
	id 1hXmFL-0008R7-K9; Mon, 03 Jun 2019 08:39:27 -0400
Received: by mail-pf1-x442.google.com with SMTP id c85so1764766pfc.1;
	Mon, 03 Jun 2019 05:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K42CkPeucn8W+B9II/bfKD2EsCVdQuGyHCr2h0lXa8c=;
	b=n+X/NxBbs+Hq5iDd8EJXRunXYWS19W1ohehfKN5ZQ+oDJ4zjqN9Y7ICL5fzLsAL/VF
	LCrbLgmNkNeSRCF9Xz1XTp8T9KEgFr/3XKD4YMkQ8X4nMKggVKXomQBpKRGK+Kamu2us
	6qDgPyGd5Gr6djULxU3m6aEhnxpZa8C9fAT/nu27H+HpF1kbaA4N+EQj9Zrcn95q/Tch
	DuD1wfmi94DUkAElixlp1iIjBtzHDF16RoOOiJcooZX0/MS6VPgofs1v5fUe7Z0zDTPI
	0J7ChZV1MS5thn7tk4Jp26zn+cAvdEyBDcLuKKMP4nQSNFLmzjY+dZbn+Y/r5wmODuLe
	NDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=K42CkPeucn8W+B9II/bfKD2EsCVdQuGyHCr2h0lXa8c=;
	b=gk1eNgEtdSwrUIskOgkPDc6Dbe1dE9GLCFojIQHD9FG5VzLrzfoprocWKOKA3Vaffs
	EVkItYSufbielPpJLAYG6UzofZYVZx6+CYCjXOAS+c38LtGgzCA6fD2bLDAik+WL0ChY
	oVaEEhwgw9xdm4SV/f3nIPSzzzrtzp3civrCsu5yN+BiHf1EAKR2n4yLKn1p3ut6xwy6
	u8f8oLhrZHdRCR1lvZFa8kvXq3WxM3lSQu/62wXZk3SNg7wDaNkoFy8y+qgLfQWeN9l3
	pAzQxXqJHNnJgUZYo3BHynUyEBl+PjfQdn3Q/NyYUErP5KZO1q3gznocRoS9gbPvzO0q
	pLsg==
X-Gm-Message-State: APjAAAWJOhgtwj7tubGETqaeHv98gWXkwBoHLUdSEHBbXyLfgInR22OZ
	of0NolKVq1HQ7FwRtjOwAb2vkf6yEa3s4g==
X-Google-Smtp-Source: APXvYqzxUDtkvYmYzexVz2tGG3u/FzIydbknrZ6oCErX0tBtLwqoKYwifYNM6vJ/WwFQjS0zdZE0VQ==
X-Received: by 2002:a63:dc15:: with SMTP id s21mr14644859pgg.215.1559565566293;
	Mon, 03 Jun 2019 05:39:26 -0700 (PDT)
Received: from localhost.localdomain ([136.233.9.100])
	by smtp.gmail.com with ESMTPSA id
	k14sm34860257pga.5.2019.06.03.05.39.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jun 2019 05:39:25 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon,  3 Jun 2019 18:08:21 +0530
Message-Id: <20190603123823.32661-8-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603123823.32661-1-mehta.aaru20@gmail.com>
References: <20190603123823.32661-1-mehta.aaru20@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-devel] [PATCH v4 7/9] blockdev: accept io_uring as option
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>, saket.sinha89@gmail.com,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
---
 blockdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 17c2d801d7..58a9e69268 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -386,6 +386,8 @@ static void extract_common_blockdev_options(QemuOpts *opts, int *bdrv_flags,
         if ((aio = qemu_opt_get(opts, "aio")) != NULL) {
             if (!strcmp(aio, "native")) {
                 *bdrv_flags |= BDRV_O_NATIVE_AIO;
+            } else if (!strcmp(aio, "io_uring")) {
+                *bdrv_flags |= BDRV_O_IO_URING;
             } else if (!strcmp(aio, "threads")) {
                 /* this is the default */
             } else {
@@ -4568,7 +4570,7 @@ QemuOptsList qemu_common_drive_opts = {
         },{
             .name = "aio",
             .type = QEMU_OPT_STRING,
-            .help = "host AIO implementation (threads, native)",
+            .help = "host AIO implementation (threads, native, io_uring)",
         },{
             .name = BDRV_OPT_CACHE_WB,
             .type = QEMU_OPT_BOOL,
-- 
2.17.1


