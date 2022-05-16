Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48F5529366
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 00:12:51 +0200 (CEST)
Received: from localhost ([::1]:33878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqixP-0003xm-1u
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 18:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhlC-0004j9-Uv
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhlB-0007Ef-A9
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PjekhUZsdAwgMnLDH0U4swRwHF5IsMc+oRB8Dll05Ak=;
 b=TQ2Do3Nnqd7YTMS+E+PcGpYdZlGHiVYG1QRAM92gxluicVHk9hAcbwKvJ19WbVMIW7Cu/a
 wrjodINhdcnnwPuKrQz1dcrMQ98it2Wjp+TZOM29kBT1hNob4anvxmcoqDblZi29tFLZKf
 fzyUKC6Jx0Y/kgeqHhGWeUE9ucVWGYg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-YEzXvaOMMDGuWrK4uiMi7w-1; Mon, 16 May 2022 16:56:07 -0400
X-MC-Unique: YEzXvaOMMDGuWrK4uiMi7w-1
Received: by mail-ed1-f72.google.com with SMTP id
 s9-20020aa7d789000000b0042ab9d77febso1714407edq.16
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PjekhUZsdAwgMnLDH0U4swRwHF5IsMc+oRB8Dll05Ak=;
 b=VmU7DOKkYnriSXFt/fywLUP1S4Q1bxI5BrEf2U0TleWGjlMJkjN6JZ+qye/R2V7+IV
 w5bDecSM4AZyRbnSJ4tcIBPTYsjFeTcKZ6SYzUmxa4HQoX5DvZv57lqLVEwrtq4+VSzI
 KV586igSo7OWIvmUuzXj86r9IbWdAm4F19w5LLDSmYV+Hi4g0VpYHvNbz/Lf0V2EBq34
 hl/EIyGHWOtC0KBER1n4PyMml2DDjvi86cVdcoFH41V0JomHNlTgDLArv9e4tIlKk61V
 lxuOGQNg4z/meYo1qHUXMmqx0+EgSRwq5IFA1cpooziebKlJNhCYljrGm77g1FrRQUZO
 rVpA==
X-Gm-Message-State: AOAM532Y/V+HdzFfQrkx1rYjLmTqtCIN9WsuI6kTsO/+ZzHBlZoDJ4j4
 L81RRCUNX8rRspMDC4GC6MCl5yYEkz+HC2pAtIdvvycr1R8GAF0JaJXqmO4xuyK34n1CevE6ld8
 kI5C3ZO/+JYnIfRb7YWPaqCzGLAcH6+mOZ30T5cOZ3+Wjik1PiFKaKgicSr9H
X-Received: by 2002:a05:6402:50d2:b0:428:b39:5c08 with SMTP id
 h18-20020a05640250d200b004280b395c08mr15316170edb.146.1652734565858; 
 Mon, 16 May 2022 13:56:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2ZGBXiIAtW4TpbFoxHiq14wA13Kf/HQ7VLHQH2u0lWNr99Yayktk/VvDq5r8TUQ1SHP4IPQ==
X-Received: by 2002:a05:6402:50d2:b0:428:b39:5c08 with SMTP id
 h18-20020a05640250d200b004280b395c08mr15316147edb.146.1652734565620; 
 Mon, 16 May 2022 13:56:05 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 ia25-20020a170907a07900b006fa981fcd78sm169262ejc.93.2022.05.16.13.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:56:05 -0700 (PDT)
Date: Mon, 16 May 2022 16:56:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: [PULL v2 86/86] vhost-user-scsi: avoid unlink(NULL) with fd passing
Message-ID: <20220516204913.542894-87-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Commit 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend
Program conventions for vhost-user-scsi") introduced fd-passing support
as part of implementing the vhost-user backend program conventions.

When fd passing is used the UNIX domain socket path is NULL and we must
not call unlink(2).

The unlink(2) call is necessary when the listen socket, lsock, was
created successfully since that means the UNIX domain socket is visible
in the file system.

Fixes: Coverity CID 1488353
Fixes: 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend Program conventions for vhost-user-scsi")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220516155701.1789638-1-stefanha@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/vhost-user-scsi/vhost-user-scsi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index b2c0f98253..9ef61cf5a7 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -433,13 +433,16 @@ out:
     if (vdev_scsi) {
         g_main_loop_unref(vdev_scsi->loop);
         g_free(vdev_scsi);
-        unlink(opt_socket_path);
     }
     if (csock >= 0) {
         close(csock);
     }
     if (lsock >= 0) {
         close(lsock);
+
+        if (opt_socket_path) {
+            unlink(opt_socket_path);
+        }
     }
     g_free(opt_socket_path);
     g_free(iscsi_uri);
-- 
MST


