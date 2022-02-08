Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FFA4ADDAC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:53:51 +0100 (CET)
Received: from localhost ([::1]:47254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSoP-0007bJ-Qx
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:53:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liyu.yukiteru@bytedance.com>)
 id 1nHQDY-00026R-N4
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:07:36 -0500
Received: from [2607:f8b0:4864:20::1032] (port=42837
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liyu.yukiteru@bytedance.com>)
 id 1nHQDT-0000JU-Sq
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:07:33 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so2675200pjb.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 05:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:cc:from:subject
 :content-transfer-encoding;
 bh=9VVXLv9TyUydx6CgAjhNGzuxF7/DiDjXDAwDUWWiWzA=;
 b=xRl0wDP+zkzmNoLVh14/ZRr0d8QAbrCaxSpQ7rCZq8FUfEJScToJ0sehyvuz0Tj1bF
 prPDlVti4gbQ0HG9T2jdrIIYAuy8CRqnNewy3sW+WmJ+I3jqcE1YlkahzKjdaznWFDMC
 rdaZh9t9INw/JG7ab9XXugycXROaZ6XA1f2SSyr2qD5RWKcrqKMNqGTs3WXrxrO+BVBh
 2xzUBzM3QnHntdaJlLV4m8eaaM+3lG9UxXrWT81oUQ6A2YffgbUky/6NAUHbEY6VFp+n
 Ftkqhlrv1t1zxDwtYd1zHdt3/JULUsAKzo/YdCdJlr4I0iHYpj/LIPElDoc+cPsVO8lC
 QI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
 :from:subject:content-transfer-encoding;
 bh=9VVXLv9TyUydx6CgAjhNGzuxF7/DiDjXDAwDUWWiWzA=;
 b=kek38OqyyIDm9HxHr6DaUYm1I9idthBSQK4Ov1E1u2pp9RxkSpqyTid0IWUbfVGnpv
 dt7SGGxrZJ4C9ZO+T9CfZ1afmPGgxtXEN9gYY5ovHjt864lGWFrbR2qhgkyp1xb10gls
 immNlIFxlhSP7BUegpyNbWom7XSh4oja3fqSURhNMVki+0a1XA1jMStekk5zaWCdUJQA
 r0sQriQrQhLbOemmdDj75UPOlu1Xp8T9oJZSQKctO3zoBYoUQETtX2OwSYxqcSNZhJ33
 AVsoUpnzPTU5pPOCFQVOu5819Wl3u8l3dSGrFV8vibguxNGuOHbQN9/IE8yxqJnQ29Zu
 n5Ew==
X-Gm-Message-State: AOAM531NojkVTN71u4i1ddNKg8r7hkh8EJvuH4Lw56XLkgHnVm/+wios
 swcuiODvooZx5DqmCogcxrWwNoieYv64Lg==
X-Google-Smtp-Source: ABdhPJwu1tS82V3naUaMqFuWAnnxxGM0cseEvS4MIfLwi6FwMC2VfrKuILsqp3mgISeyZyWWfqozsg==
X-Received: by 2002:a17:902:f549:: with SMTP id
 h9mr4626554plf.62.1644325648814; 
 Tue, 08 Feb 2022 05:07:28 -0800 (PST)
Received: from [10.87.51.42] ([139.177.225.229])
 by smtp.gmail.com with ESMTPSA id s84sm11625532pgs.77.2022.02.08.05.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 05:07:28 -0800 (PST)
Message-ID: <9040401e-8f87-ef4a-d840-6703f08d068c@bytedance.com>
Date: Tue, 8 Feb 2022 21:07:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Yu Li <liyu.yukiteru@bytedance.com>
Subject: [PATCH] docs/system: riscv: Update description of CPU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=liyu.yukiteru@bytedance.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 08 Feb 2022 08:32:02 -0500
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
Cc: bmeng.cn@gmail.com, alistair.francis@wdc.com, liyu.yukiteru@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the hypervisor extension been non experimental and enabled for
default CPU, the previous command is no longer available and the
option `x-h=true` or `h=true` is also no longer required.

Signed-off-by: Yu Li <liyu.yukiteru@bytedance.com>
---
  docs/system/riscv/virt.rst | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index fa016584bf..08ce3c4177 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -23,9 +23,9 @@ The ``virt`` machine supports the following devices:
  * 1 generic PCIe host bridge
  * The fw_cfg device that allows a guest to obtain data from QEMU

-Note that the default CPU is a generic RV32GC/RV64GC. Optional extensions
-can be enabled via command line parameters, e.g.: ``-cpu rv64,x-h=true``
-enables the hypervisor extension for RV64.
+The hypervisor extension has been enabled for the default CPU, so virtual
+machines with hypervisor extension can simply be used without explicitly
+declaring.

  Hardware configuration information
  ----------------------------------
-- 
2.20.1

