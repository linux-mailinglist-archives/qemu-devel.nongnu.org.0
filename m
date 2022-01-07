Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED48487609
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:59:46 +0100 (CET)
Received: from localhost ([::1]:51118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5myI-0001Mm-2m
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:59:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5mtC-00034Y-5A; Fri, 07 Jan 2022 05:54:30 -0500
Received: from [2a00:1450:4864:20::42b] (port=46975
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5mtA-0008LR-L7; Fri, 07 Jan 2022 05:54:29 -0500
Received: by mail-wr1-x42b.google.com with SMTP id i22so10260714wrb.13;
 Fri, 07 Jan 2022 02:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MeEm7h+236b3jz3HgakFoX/GMcHt60JKsq8f9Y3JC/Q=;
 b=JZS1nCmjzBJ3Fo64wGbMf2AyJEz9gH1dvbGJuYkgHsygOi1TZWnmAcj4hfO/rlOVS/
 fjaDjlGzC3k4kYIqKnOQWSq90liAKQrRQ3zJT7HiDbg9gvt71TllKgH63qaZn7/WrOY9
 zIoXS5dN/TMXgKu0GJL0KMNVkLNq4uArWHljgEJFAEJoDOuyzH7UnEXsYRRR5YhbDcrh
 RfgMWkR5n08i90URpBjgm9I7fQbC9UpabWOslOdsEiceZoZHLkIxXTxcHr9wlHZGGCHz
 1Zqi2Ar/hDYYHVNRp+1q9pNrFutmoLofzrZaU/vr+1Ac+IjlC3kWZ4hIivmRhFtYK5QA
 3Qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MeEm7h+236b3jz3HgakFoX/GMcHt60JKsq8f9Y3JC/Q=;
 b=6DroZSW0kEaulqVXsuyKcxnZxNA7dHObPQApff5LNln4PeKChYO+LkwDsq7Jc8xyQU
 uRTtJ9Z8KzBPW3MUONZRkV5PzFEjctByqVCQCEiwY4G/XKOYObZAHvlY4qWrsFz74vR4
 VItV89/HkJfQZlCSXuq11fqpEEb7NGQhQhO/p7xehMdCPPL60lbAVETAJHpx22g+RhvP
 x+lC7HsLcbeB8s2wCKpTOK0FoXj26eanhZXgGN2FtYqqmSYv6AEjHuZU9r18jgxCJhbZ
 QKFfXf5cGju7D8vE90p6qYJLPRagyLhJonmfm1SrKml3M6u1fozKGgtxQ3yh7yypffyZ
 lxlg==
X-Gm-Message-State: AOAM533wjhENu7N7bBp1rutSSAjPvFvGLMZx0LVzYa89F77w4g1wEZYD
 Hp7xFkZIL1PNSNxqSa/53GpKYio7brk1fA==
X-Google-Smtp-Source: ABdhPJzZRnWDGjPQnWJbEi3ltwEjYEA91hsss2H6Ml09R3fuClqArdn22OAKTd6fmxBazffVap0eAw==
X-Received: by 2002:a05:6000:144d:: with SMTP id
 v13mr55408646wrx.411.1641552866892; 
 Fri, 07 Jan 2022 02:54:26 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id az1sm1488090wrb.104.2022.01.07.02.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 02:54:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] docs: Correct 'vhost-user-blk' spelling
Date: Fri,  7 Jan 2022 11:54:18 +0100
Message-Id: <20220107105420.395011-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107105420.395011-1-f4bug@amsat.org>
References: <20220107105420.395011-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/tools/qemu-storage-daemon.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index 3e5a9dc0320..9b0eaba6e5c 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -201,7 +201,7 @@ Export raw image file ``disk.img`` over NBD UNIX domain socket ``nbd.sock``::
       --nbd-server addr.type=unix,addr.path=nbd.sock \
       --export type=nbd,id=export,node-name=disk,writable=on
 
-Export a qcow2 image file ``disk.qcow2`` as a vhosts-user-blk device over UNIX
+Export a qcow2 image file ``disk.qcow2`` as a vhost-user-blk device over UNIX
 domain socket ``vhost-user-blk.sock``::
 
   $ qemu-storage-daemon \
-- 
2.33.1


