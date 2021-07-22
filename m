Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A753D26D6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:38:49 +0200 (CEST)
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ame-0003B2-FQ
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akH-0000Z1-0v
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:21 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akB-0002gr-V9
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:17 -0400
Received: by mail-ed1-x52a.google.com with SMTP id l26so7309293eda.10
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NzogthgZ21HCG/EDcvHSBhnUAFmQsNuBNNzUMT7Gr9o=;
 b=cKyC4QEsFhUZ+Y4CRDqCj0m/q0Y4vqYUiqLdW9q8TWy5EPQGLG+bbp0qRXlyI04Tag
 TOgOdssdyODfbvhNROISM4Xuf7mm3mDIh2aD+zNljOhlaOrQICnEk9VgYPdE9hYO3rgM
 NrR+Pumui8NwoXdiEzZ3ZShCjEwNLPY2ZPg4mRcDiCjy6eRbfYnrz8pWOLdwq3Q4dqTE
 YbY9tbcfULRbuCx5pA/ABW67Dwa0ulrXUESQz76qqzbJUgxEy7StuTdfbptQKVwdbAwH
 bBVgt3dZezBcaM1fs/aHKWSsgimN+wJQo7Ni1pCmqUcn9tYP2OniqUTmxXnQjTzVfVvH
 cMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NzogthgZ21HCG/EDcvHSBhnUAFmQsNuBNNzUMT7Gr9o=;
 b=A+ALSsf9Em84moLvHa/8YPHKsS0wF9q6TZ6WqfsE9+DRKMDF7JDKZj7dCQKig0Iyqo
 eH+WktBowZ0P6v2X/k1/Ks9+kYH2BO//pyFAzwRXDlm0fh4l3v1Mqgn3eXoyPQ0uwucx
 Wo4hEhe82LTpiwSqlVrp1IOtjXSCoTfYIIa/pyh0Rnf0j2HhFZWMu+H45CyMcDn8ol5o
 /iNoJa7835XLpGgGQT4kQLWS3GHJKAd3EsIcD5aaKKPj0TU9Ui7EoER5AYX0SxnhQttz
 CcuESPZdKJO+/sXoCNJQ8SZhpLfr3zM9rpLl/HQ1avThdwMx3sSSNDdsiaooBrKe6Ez7
 0TNw==
X-Gm-Message-State: AOAM530h4BRj30vUa7Bvw9eREiq8bfwEMMrZxrOEEwh/Atc+D5Qn9rr+
 oAu/X/JT63XwPdCYREGl8yl0TXHVpF5Qvw==
X-Google-Smtp-Source: ABdhPJwTZo3q78fdWonBSx9lACoUJcWv1qgmGktwJF9I3tFnxHkqGHcmiKbLXlL/LwSJ7u9C8SAq3w==
X-Received: by 2002:aa7:c4c7:: with SMTP id p7mr258748edr.290.1626968174180;
 Thu, 22 Jul 2021 08:36:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] Misc bugfix patches for 2021-07-22
Date: Thu, 22 Jul 2021 17:35:57 +0200
Message-Id: <20210722153612.955537-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 143c2e0432859826c9e8d5b2baa307355f1a5332:

  Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2021-07-19' into staging (2021-07-19 19:06:05 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 0848f8aca6f7b13f2a755c2593b0a1cbb39f658e:

  configure: Let --without-default-features disable vhost-kernel and vhost-vdpa (2021-07-22 14:44:51 +0200)

----------------------------------------------------------------
Bugfixes.

----------------------------------------------------------------
Gerd Hoffmann (1):
      usb: fix usb-host dependency check

Jason Andryuk (1):
      vl: Parse legacy default_machine_opts

Lara Lazier (3):
      target/i386: Added V_INTR_PRIO check to virtual interrupts
      target/i386: Added consistency checks for CR4
      target/i386: Added consistency checks for EFER

Paolo Bonzini (4):
      qemu-config: never call the callback after an error, fix leak
      qemu-config: fix memory leak on ferror()
      chardev-spice: add missing module_obj directive
      meson: fix dependencies for modinfo

Stefan Hajnoczi (1):
      qemu-config: restore "machine" in qmp_query_command_line_options()

Thomas Huth (5):
      configure: Drop obsolete check for the alloc_size attribute
      configure: Fix --without-default-features propagation to meson
      configure: Allow vnc to get disabled with --without-default-features
      configure: Fix the default setting of the "xen" feature
      configure: Let --without-default-features disable vhost-kernel and vhost-vdpa

 chardev/spice.c                      |  1 +
 configure                            | 20 +++---------
 hw/usb/meson.build                   |  2 +-
 meson.build                          |  6 ++--
 softmmu/vl.c                         |  1 +
 target/i386/cpu.h                    | 44 ++++++++++++++++++++++++++
 target/i386/tcg/sysemu/misc_helper.c |  3 ++
 target/i386/tcg/sysemu/svm_helper.c  | 60 +++++++++++++++++++++++++++++++++---
 util/qemu-config.c                   | 16 +++++++---
 9 files changed, 125 insertions(+), 28 deletions(-)
-- 
2.31.1


