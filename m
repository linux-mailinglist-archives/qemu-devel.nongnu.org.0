Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA04529343
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:59:34 +0200 (CEST)
Received: from localhost ([::1]:33694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqikX-0008Jc-RI
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkQ-0003Oz-NZ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkP-00072s-22
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JyIahbS4OZdt1tqLpTxbnEQNK1KVz8nAfhMMVVMnJ7c=;
 b=glJkXuQ5CvCnpiP5uGEQ8ezz5xcuwAQNMpW+Kt6qg09cTHS5zcLvWyVhWzy1Uyq2o4abKm
 /tqwxXafULtz+xcNKdJoL4Zioucv2zRHuFK35W+iqD2EXv3sdz+EbbpdAWBCx5SFur1WaS
 jvtJLbJn3kio++b19prJwB9K4mvy+ks=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-dcQPCEHWPgqRtFTQFK4M2g-1; Mon, 16 May 2022 16:55:19 -0400
X-MC-Unique: dcQPCEHWPgqRtFTQFK4M2g-1
Received: by mail-ej1-f70.google.com with SMTP id
 re25-20020a170906d8d900b006f50701fbefso6354128ejb.23
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JyIahbS4OZdt1tqLpTxbnEQNK1KVz8nAfhMMVVMnJ7c=;
 b=3tBg8LsjNrTmI6TLGVpVqxh5t4brO4W/KFAzVGtv9eZ5MWafy0kZyXN7qS1X24idDe
 UEcPfT7yqchdGh/o0pW4+PVI+bGFb6CFBd7Td7K3SSGS8tNUGYYjCrAkz5JrPFGL/eR1
 GdPinTJSw0SCS8dzuS3gQku9yOe+LkiZeMeKXiBXtVjysxFLenAs9jKEI1MLIVZ5Qwx9
 XV38ey5X3XwwFoV7+YoMNGoUfTPnt6quDSx5DWZ6C3BDT6JM/+EePYRsWyoybpjmHRDI
 O9t1/p33bVucCMt95zQZgIZnRBZN2Bu83HPnkbsciFKwhsaQB1WceKrgvveZUTdKKmXz
 iEPA==
X-Gm-Message-State: AOAM531slAsJyavMmD7Knosc/CMpVcpCNHuzPQVskh49qlk7+2gLzVV5
 OyPoyRPGjtuvpPOqbuP4ZFHzOuNn9ayKsXR+gDL0mT2fjjuRi4sYlNOz4yPKqJVD/ErnZPFf5Pe
 nm4KY5FGTD/zneMe+aVySVaga3J4D+6rw/XeLAEm2z+FD+I/SR7bGjZsVxQ+s
X-Received: by 2002:a05:6402:94a:b0:42a:be9f:6698 with SMTP id
 h10-20020a056402094a00b0042abe9f6698mr3034991edz.393.1652734517659; 
 Mon, 16 May 2022 13:55:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywRjfhaLzmUCo+s3615WrKEhd7MjfxYjDDKx3gj1UTqLgfGjeat2rSfgTb/KxzF7mx3LM9IA==
X-Received: by 2002:a05:6402:94a:b0:42a:be9f:6698 with SMTP id
 h10-20020a056402094a00b0042abe9f6698mr3034958edz.393.1652734517300; 
 Mon, 16 May 2022 13:55:17 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 x13-20020a170906710d00b006f3ef214dcdsm179728ejj.51.2022.05.16.13.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:55:16 -0700 (PDT)
Date: Mon, 16 May 2022 16:55:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL v2 73/86] docs/vhost-user: Clarifications for
 VHOST_USER_ADD/REM_MEM_REG
Message-ID: <20220516204913.542894-74-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Kevin Wolf <kwolf@redhat.com>

The specification for VHOST_USER_ADD/REM_MEM_REG messages is unclear
in several points, which has led to clients having incompatible
implementations. This changes the specification to be more explicit
about them:

* VHOST_USER_ADD_MEM_REG is not specified as receiving a file
  descriptor, though it obviously does need to do so. All
  implementations agree on this one, fix the specification.

* VHOST_USER_REM_MEM_REG is not specified as receiving a file
  descriptor either, and it also has no reason to do so. rust-vmm does
  not send file descriptors for removing a memory region (in agreement
  with the specification), libvhost-user and QEMU do (which is a bug),
  though libvhost-user doesn't actually make any use of it.

  Change the specification so that for compatibility QEMU's behaviour
  becomes legal, even if discouraged, but rust-vmm's behaviour becomes
  the explicitly recommended mode of operation.

* VHOST_USER_ADD_MEM_REG doesn't have a documented return value, which
  is the desired behaviour in the non-postcopy case. It also implemented
  like this in QEMU and rust-vmm, though libvhost-user is buggy and
  sometimes sends an unexpected reply. This will be fixed in a separate
  patch.

  However, in postcopy mode it does reply like VHOST_USER_SET_MEM_TABLE.
  This behaviour is shared between libvhost-user and QEMU; rust-vmm
  doesn't implement postcopy mode yet. Mention it explicitly in the
  spec.

* The specification doesn't mention how VHOST_USER_REM_MEM_REG
  identifies the memory region to be removed. Change it to describe the
  existing behaviour of libvhost-user (guest address, user address and
  size must match).

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220407133657.155281-2-kwolf@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/interop/vhost-user.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 3c12607517..a99ba4433c 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1376,6 +1376,14 @@ Front-end message types
   For further details on postcopy, see ``VHOST_USER_SET_MEM_TABLE``.
   They apply to ``VHOST_USER_ADD_MEM_REG`` accordingly.
 
+  Exactly one file descriptor from which the memory is mapped is
+  passed in the ancillary data.
+
+  In postcopy mode (see ``VHOST_USER_POSTCOPY_LISTEN``), the back-end
+  replies with the bases of the memory mapped region to the front-end.
+  For further details on postcopy, see ``VHOST_USER_SET_MEM_TABLE``.
+  They apply to ``VHOST_USER_ADD_MEM_REG`` accordingly.
+
 ``VHOST_USER_REM_MEM_REG``
   :id: 38
   :equivalent ioctl: N/A
@@ -1400,6 +1408,14 @@ Front-end message types
   accept messages with one file descriptor. If a file descriptor is
   passed, the back-end MUST close it without using it otherwise.
 
+  The memory region to be removed is identified by its guest address,
+  user address and size. The mmap offset is ignored.
+
+  No file descriptors SHOULD be passed in the ancillary data. For
+  compatibility with existing incorrect implementations, the back-end MAY
+  accept messages with one file descriptor. If a file descriptor is
+  passed, the back-end MUST close it without using it otherwise.
+
 ``VHOST_USER_SET_STATUS``
   :id: 39
   :equivalent ioctl: VHOST_VDPA_SET_STATUS
-- 
MST


