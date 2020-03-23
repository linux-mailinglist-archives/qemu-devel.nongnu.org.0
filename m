Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8DC18FE72
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 21:08:17 +0100 (CET)
Received: from localhost ([::1]:39344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGTMt-0004d5-Ni
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 16:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jcfaracco@gmail.com>) id 1jGTKW-0003HO-3Y
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 16:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jcfaracco@gmail.com>) id 1jGTKV-0004zw-3t
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 16:05:48 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:37086)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jcfaracco@gmail.com>) id 1jGTKV-0004zg-0P
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 16:05:47 -0400
Received: by mail-qt1-x844.google.com with SMTP id d12so10478072qtj.4
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m0QqDuaYFwTgRskE74lfRqKCXm5znRqYAV3jwZVbSFs=;
 b=bICaAt6xZxtcqEjK3B46DQxKLh1tDUCPHGNRl0ymwAdwaGmvFRj/vLWqmTYa0ZxDFe
 XULTHXSnZtEgJCaIF93at6mNJCgXc8PKRsMuHAPCdG5QAJkjYzOb2+XMSEqS98HGmBjP
 AEyXkUx5n/HSKZI5RTzQa3OQarDXeVFaCRKGvzynTj9neWx9syU5FF/D1SQDZxBfAzQ7
 O9v6kyvcsw5+f0mUomHPpr5GeN9yY4CJOVggV0nQTHPXjIRP97uiSzFfN6eguEeOxa8m
 FHDVptpnU6fKB4gVEiDhveH6UGDr7KWyD3pPJ5HP/7VORH29Zi8bVefGaqdYVZ04fRYt
 4nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m0QqDuaYFwTgRskE74lfRqKCXm5znRqYAV3jwZVbSFs=;
 b=pn7lOsTQRV0veJpK7xYYTR7v6XrwmB0D6GhmjgKbYWAfclzw9MaN8uHdQrtMJKuvcP
 2Grr9l+YmNDBDQHnD2gpquVvm5QtYttgK2YKZOJv2WADor8tXn1d8/bdSQqPAqCzF81K
 k6XLJIj40nNcrhN/0BoadJN4Iit/XctcHAKGaneqisjOm/MOYe2z0YIfNlriXEgo9myh
 UJs3UDUsvmRM2kASS+J2mDl+5R7MfTXEEhXc6u+NaMb2RxbheZ7lt3qjpVvYKzO0XpMz
 f57a/LZS8cPw6Xxc2tMpJnfjdl2KKEUw+3dNOzpDe9wjsM8aGmH+kd/AvLCkVwlVn5YF
 U2Gg==
X-Gm-Message-State: ANhLgQ05ZA5IsNu9GTf2BPLE97llMhRo3rnM+x/TbcRDVaq/z6zvH6lH
 9W+gIM8hUdwPOqH5B/rWLyJzM+oVT2E=
X-Google-Smtp-Source: ADFU+vsr298tvZKOXrquTK94H8u1uLg2ZjTHo0nPPFqCA0R2RTTnq66UDeHGHjqa/hhz1WiNwF9oIA==
X-Received: by 2002:ac8:32fc:: with SMTP id a57mr21453530qtb.331.1584993944449; 
 Mon, 23 Mar 2020 13:05:44 -0700 (PDT)
Received: from localhost.localdomain ([177.94.12.134])
 by smtp.gmail.com with ESMTPSA id 17sm11374729qkm.105.2020.03.23.13.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 13:05:43 -0700 (PDT)
From: Julio Faracco <jcfaracco@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] i386: Remove unused define's from hax and hvf
Date: Mon, 23 Mar 2020 17:05:38 -0300
Message-Id: <20200323200538.202164-1-jcfaracco@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
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
Cc: pbonzini@redhat.com, wenchao.wang@intel.com, colin.xu@intel.com,
 ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit acb9f95a removed boundary checks for ID and VCPU ID. After that,
the max definitions of that boundaries are not required anymore. This
commit is only a code cleanup.

Signed-off-by: Julio Faracco <jcfaracco@gmail.com>
---
 target/i386/hax-i386.h     | 2 --
 target/i386/hvf/hvf-i386.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/target/i386/hax-i386.h b/target/i386/hax-i386.h
index 54e9d8b057..70fe5cefeb 100644
--- a/target/i386/hax-i386.h
+++ b/target/i386/hax-i386.h
@@ -41,8 +41,6 @@ struct hax_state {
 };
 
 #define HAX_MAX_VCPU 0x10
-#define MAX_VM_ID 0x40
-#define MAX_VCPU_ID 0x40
 
 struct hax_vm {
     hax_fd fd;
diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index 15ee4835cf..fbe4a350c5 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -21,8 +21,6 @@
 #include "x86.h"
 
 #define HVF_MAX_VCPU 0x10
-#define MAX_VM_ID 0x40
-#define MAX_VCPU_ID 0x40
 
 extern struct hvf_state hvf_global;
 
-- 
2.24.1


