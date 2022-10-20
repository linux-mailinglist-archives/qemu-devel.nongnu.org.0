Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBB9606B46
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:31:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ole4N-0007dX-I8
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:31:19 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ole3i-0006D4-8A
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bjorn.forsman@gmail.com>)
 id 1olde8-0003fK-S8
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:04:13 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bjorn.forsman@gmail.com>)
 id 1olde7-0001Q4-A0
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:04:12 -0400
Received: by mail-lf1-x12a.google.com with SMTP id g7so1905852lfv.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R6h3SmhhkjD+FnGPH/Witg97rL5L8SOPX9K7/DLPO6w=;
 b=UZ0NtMsULRSJeWaQAEtJMJ9yr2XZxjlDeU68OWeo+DyopTI4IGCp76coNdLmOZxAp2
 QuhcTJiPWGPp4orOAWFOjHBj9LzJAiwhekBR8RtcgP6QHvsZrxapqH2uPnCfZtan78kf
 /2j19FryzFP+Zu/tAYv8daoMxBi2DE2i2kM2kQfPXSNISsbrP/gKEU3+RHwQAW4qN85d
 WsZU3cDRJ6Bf+8iMUBhLkjK72POarHhYx52E6asTYw1nmWad2OabaWbmQ/LM+aEXeqkJ
 R1gCs6KLo50ff4v4mUT5GhWWYtBU8gNGGhynlbezda14JMKViS+HhU1PGZPELJCp/uST
 6qzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R6h3SmhhkjD+FnGPH/Witg97rL5L8SOPX9K7/DLPO6w=;
 b=hJg5FxlH+LFJPUZ3BQYBJ8ULoyBJmzN/J8ifw34sF6XzfNwezEBc2NuPUlhFJTOTQU
 JD10cRMHrMzFbPRox8f3CPDzNDPEkmo7kMSJqb7PYsAoBx8AwYhmuHNcEzC4ApghgkMZ
 hWQQzLQjOUKrQU+3xqycHf8id+lCz/1UZhUHIufgMof6amGQxxPlznd2AYhneu4S7hhS
 cVN5P+QiSiI6AVn1GoybVHcSHOVIdnTZqYkxMjY2RI7wR6bsTAJYj/Jqk0VMP3V95WDn
 XQdiA+pWIkUY/PQoVQ4Y51mDSZuRhWy+IWbkIIjEpGETL89V03n9IDM4RaoEE4vzr7nQ
 dKYQ==
X-Gm-Message-State: ACrzQf2oOCLFn136WB8JWO8BC7wr6EW7qrTPOJ15eI5kTVUuWTiGRueZ
 /sh0ET6GaH66/GY00I2GhuDMgd2/DjRa
X-Google-Smtp-Source: AMsMyM5OGMrGnoZBS1RuvD4m6VhdPJHSkkcyUreuBHLoJMvVoOKEBfILqv1Xc9+XMzombKimXkrfXg==
X-Received: by 2002:a05:6512:3e10:b0:4a2:48c1:8794 with SMTP id
 i16-20020a0565123e1000b004a248c18794mr5272345lfv.17.1666303448851; 
 Thu, 20 Oct 2022 15:04:08 -0700 (PDT)
Received: from localhost ([84.213.123.201]) by smtp.gmail.com with ESMTPSA id
 a5-20020a05651c010500b0026c032ee48esm2965141ljb.105.2022.10.20.15.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:04:07 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, kkostiuk@redhat.com,
 =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Subject: [PATCH] qga: add channel path to error messages
Date: Fri, 21 Oct 2022 00:03:46 +0200
Message-Id: <20221020220346.124381-1-bjorn.forsman@gmail.com>
X-Mailer: git-send-email 2.36.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=bjorn.forsman@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 20 Oct 2022 18:30:14 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's useful to know which device was used if/when it fails.

channel-win32.c had this since 2015, with
c69403fcd4a0cb89f838a212ab71e4a1a3464c95 ("qemu-ga: debug printouts to
help troubleshoot installation"), this brings channel-posix.c up to
speed.

Signed-off-by: Bjørn Forsman <bjorn.forsman@gmail.com>
---
 qga/channel-posix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/channel-posix.c b/qga/channel-posix.c
index 6796a02cff..e6dce985ae 100644
--- a/qga/channel-posix.c
+++ b/qga/channel-posix.c
@@ -138,7 +138,7 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
             0
         );
         if (fd == -1) {
-            error_setg_errno(errp, errno, "error opening channel");
+            error_setg_errno(errp, errno, "error opening channel '%s'", path);
             return false;
         }
 #ifdef CONFIG_SOLARIS
@@ -163,7 +163,7 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
         assert(fd < 0);
         fd = qga_open_cloexec(path, O_RDWR | O_NOCTTY | O_NONBLOCK, 0);
         if (fd == -1) {
-            error_setg_errno(errp, errno, "error opening channel");
+            error_setg_errno(errp, errno, "error opening channel '%s'", path);
             return false;
         }
         tcgetattr(fd, &tio);
-- 
2.36.2


