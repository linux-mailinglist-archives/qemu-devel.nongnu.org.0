Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654BA2CF409
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 19:29:13 +0100 (CET)
Received: from localhost ([::1]:60556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klFpQ-0003tK-0U
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 13:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klEOj-0002Ai-8N
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 11:57:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klEOh-0002m6-2E
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 11:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607101050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R/GrdjJugNBKSVXop1280GF0Wdptc9d0GujZbx+LGYE=;
 b=HJO+t4euGY3ctfBeeWXQxZz0sEFjONE6HUi+o5C38kg+AEZJOoDmedpTP1V6L65JdGeARW
 wzEtT9V/cv9tbXbU9qcIYwpjPKaLj9YaqnXM1TqDydGwDbWzeUPRsXIPxdEi0xVElJQhFh
 Jb/U2AGvLMvvtD6ocIg70jQVbcHhWX8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-Fj9y00JLNXyiyMY7UiT60Q-1; Fri, 04 Dec 2020 11:57:28 -0500
X-MC-Unique: Fj9y00JLNXyiyMY7UiT60Q-1
Received: by mail-ej1-f70.google.com with SMTP id lw15so803995ejb.7
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 08:57:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/GrdjJugNBKSVXop1280GF0Wdptc9d0GujZbx+LGYE=;
 b=bY0HHcYbKYtfDG9EvV7rTiT78KUH81mPTY7Lwd/5pi25S0rlWcYiinnDiQpWvxg5AX
 rYOvNYt0ynDHhE/4kJs8NBIKcUa8JrJXh0SBogLUacZN06Ht65eQumsshDYl2shPsMr9
 O1eCJ0C+Di/uApnmaNObaOiA69q/FqO2+dlmE88SL7MugTr0CWlyA8VmccQk0gL1kznY
 H0YIZXDy+JyGR4X6h55TvyUqEWDlZg93Lj0eZdBayGZWfJUxnjk4e3kr3tgzZ05aMfBG
 TkHo2zFRXMTaIznMZsj6HWYQU1DLByCw3XEVVYPfaIw5zUG8vL6y3JCeALrG+K5MRwCp
 FGhg==
X-Gm-Message-State: AOAM533P7iyIWxM6xvKBDHVyrIaCbc0VZv8c4ySXVSIgtA27i+jT7hjP
 Vh+4Vu5hldjNjeP3/hEsrR5bivb2kc/xHCrFs8duJ98qLukWQ9WqD8Eld/0/2jBKckJChR23Udi
 v5WAzhF54AlhHVu2o6KwB0fpt4KGY3KFQFUV8jbYZU7IfuZwCG7cklPbCHMGhkXLR
X-Received: by 2002:a17:906:ca47:: with SMTP id
 jx7mr8312635ejb.237.1607101046864; 
 Fri, 04 Dec 2020 08:57:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPpRUHaabjhcM5tZVjKt/2vwBJFo3Ekjp7ZHP8y+SLGq2qqMHP9g6cja0VI6dGv2Bux+o1pA==
X-Received: by 2002:a17:906:ca47:: with SMTP id
 jx7mr8312606ejb.237.1607101046654; 
 Fri, 04 Dec 2020 08:57:26 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id c14sm3767980edy.56.2020.12.04.08.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 08:57:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/nvme: Do not allow image creation with NVMe block driver
Date: Fri,  4 Dec 2020 17:57:24 +0100
Message-Id: <20201204165724.2647357-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Xueqiang Wei <xuwei@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The NVMe driver does not support image creation.
The full drive has to be passed to the guest.

Before:

  $ qemu-img create -f raw nvme://0000:04:00.0/1 20G
  Formatting 'nvme://0000:04:00.0/1', fmt=raw size=21474836480

  $ qemu-img info nvme://0000:04:00.0/1
  image: nvme://0000:04:00.0/1
  file format: raw
  virtual size: 349 GiB (375083606016 bytes)
  disk size: unavailable

After:

  $ qemu-img create -f raw nvme://0000:04:00.0/1 20G
  qemu-img: nvme://0000:04:00.0/1: Protocol driver 'nvme' does not support image creation

Fixes: 5a5e7f8cd86 ("block: trickle down the fallback image creation function use to the block drivers")
Reported-by: Xueqiang Wei <xuwei@redhat.com>
Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Maxim Levitsky <mlevitsk@redhat.com>
---
 block/nvme.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index a06a188d530..73ddf837c2b 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1515,9 +1515,6 @@ static BlockDriver bdrv_nvme = {
     .protocol_name            = "nvme",
     .instance_size            = sizeof(BDRVNVMeState),
 
-    .bdrv_co_create_opts      = bdrv_co_create_opts_simple,
-    .create_opts              = &bdrv_create_opts_simple,
-
     .bdrv_parse_filename      = nvme_parse_filename,
     .bdrv_file_open           = nvme_file_open,
     .bdrv_close               = nvme_close,
-- 
2.26.2


