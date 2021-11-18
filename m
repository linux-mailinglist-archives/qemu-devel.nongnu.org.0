Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58188455ECF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:00:05 +0100 (CET)
Received: from localhost ([::1]:55598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnitP-0007EY-SK
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:00:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mniqu-0004QI-Kb
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:57:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mniqr-00082u-MR
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637247444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/sBYOa2h22qqCaXNmWikjc24bg3qqY1FNjgkcCrf8RE=;
 b=NUFiWepu0ezIJ19IQDTRqZrbKHkxss8960y4FJ3zxBgC8R6pcuHOPeKPordsRzlq34/I1z
 XLNWqv9EV3GBbnMBguevGiPsknorKxUjQRwspwohWLaR2nU5+kX5H0zBju7rxMHjaMr1oD
 kPo6IBq5MVYM3WOSovjDDIkvUDYRkMs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-M4gPu_87NwiLULdXNlhKrg-1; Thu, 18 Nov 2021 09:57:24 -0500
X-MC-Unique: M4gPu_87NwiLULdXNlhKrg-1
Received: by mail-wr1-f71.google.com with SMTP id
 y10-20020adffa4a000000b0017eea6cb05dso1146293wrr.6
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 06:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/sBYOa2h22qqCaXNmWikjc24bg3qqY1FNjgkcCrf8RE=;
 b=yU2by/OfeqyQbFp7XPGUhkhWhPdd8U/r5PUzZ0FIsHFoFkHLqId/C2qQPGl5MTsKz8
 PfVrH0sLvFS92amJGSt33O2mL+Ofe4qNxK9LQw8sQSTiemlvTw/dPfPV+arB+Va4uQag
 UHIbiOe7ohPDdgQe4cPhYr8EITiXXmR1IOu/yFn1PT7bD8TWr8Eg/YorzKIKDKQYdJF+
 TA07R3VgdcN8rBX5gV/av1OM8cMxcQxCeF7Qut6ivbgHYhaM83qsfimyiwHh1Vhm3fA3
 /mxNHc6N9ty7doA40wKC76MNHaQHG9rejOxuqL6QIxZhVOUT1eOIA2fFTLy8qIoLKR64
 9mCg==
X-Gm-Message-State: AOAM5327cLdKD5dcXMj5yrOdtOjSd33opkZmNmL1B75r2VPVy+PA4GUE
 xkrpFMA5qlQQo7/96/nKV21Ji9AK5tm9Swj8ArTJBjMkoiEMES7j5APJ8Xu4AF+o+vwuQqzcVge
 8FVplApwi2mIy7Y6uJp7ofOuUK9Ab2YRpmxIJdplquy33hArFe3+Z3fUrMvt56VLF
X-Received: by 2002:a05:6000:181:: with SMTP id
 p1mr31961485wrx.292.1637247442411; 
 Thu, 18 Nov 2021 06:57:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbaWYbx+81L3A2uMQ7E+xXjuqJi+VdIcV7V1z1J9YNySN3KDUkR1Gyg1jOwtaldysuX7gw+Q==
X-Received: by 2002:a05:6000:181:: with SMTP id
 p1mr31961425wrx.292.1637247442040; 
 Thu, 18 Nov 2021 06:57:22 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 r8sm118850wrz.43.2021.11.18.06.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:57:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? v2 1/5] docs/devel/style: Render C types as
 monospaced text
Date: Thu, 18 Nov 2021 15:57:12 +0100
Message-Id: <20211118145716.4116731-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118145716.4116731-1-philmd@redhat.com>
References: <20211118145716.4116731-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/style.rst | 59 ++++++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index e00af62e763..3e519dc6ade 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -111,7 +111,7 @@ Variables are lower_case_with_underscores; easy to type and read.  Structured
 type names are in CamelCase; harder to type but standing out.  Enum type
 names and function type names should also be in CamelCase.  Scalar type
 names are lower_case_with_underscores_ending_with_a_t, like the POSIX
-uint64_t and family.  Note that this last convention contradicts POSIX
+``uint64_t`` and family.  Note that this last convention contradicts POSIX
 and is therefore likely to be changed.
 
 Variable Naming Conventions
@@ -290,57 +290,57 @@ a few useful guidelines here.
 Scalars
 -------
 
-If you're using "int" or "long", odds are good that there's a better type.
-If a variable is counting something, it should be declared with an
-unsigned type.
+If you're using '``int``' or '``long``', odds are good that there's a better
+type.  If a variable is counting something, it should be declared with an
+*unsigned* type.
 
-If it's host memory-size related, size_t should be a good choice (use
-ssize_t only if required). Guest RAM memory offsets must use ram_addr_t,
+If it's host memory-size related, ``size_t`` should be a good choice (use
+``ssize_t`` only if required). Guest RAM memory offsets must use ``ram_addr_t``,
 but only for RAM, it may not cover whole guest address space.
 
-If it's file-size related, use off_t.
-If it's file-offset related (i.e., signed), use off_t.
-If it's just counting small numbers use "unsigned int";
+If it's file-size related, use ``off_t``.
+If it's file-offset related (i.e., signed), use ``off_t``.
+If it's just counting small numbers use '``unsigned int``';
 (on all but oddball embedded systems, you can assume that that
 type is at least four bytes wide).
 
 In the event that you require a specific width, use a standard type
-like int32_t, uint32_t, uint64_t, etc.  The specific types are
+like ``int32_t``, ``uint32_t``, ``uint64_t``, etc.  The specific types are
 mandatory for VMState fields.
 
-Don't use Linux kernel internal types like u32, __u32 or __le32.
+Don't use Linux kernel internal types like ``u32``, ``__u32`` or ``__le32``.
 
-Use hwaddr for guest physical addresses except pcibus_t
-for PCI addresses.  In addition, ram_addr_t is a QEMU internal address
+Use ``hwaddr`` for guest physical addresses except ``pcibus_t``
+for PCI addresses.  In addition, ``ram_addr_t`` is a QEMU internal address
 space that maps guest RAM physical addresses into an intermediate
 address space that can map to host virtual address spaces.  Generally
-speaking, the size of guest memory can always fit into ram_addr_t but
+speaking, the size of guest memory can always fit into ``ram_addr_t`` but
 it would not be correct to store an actual guest physical address in a
-ram_addr_t.
+``ram_addr_t``.
 
 For CPU virtual addresses there are several possible types.
-vaddr is the best type to use to hold a CPU virtual address in
+``vaddr`` is the best type to use to hold a CPU virtual address in
 target-independent code. It is guaranteed to be large enough to hold a
 virtual address for any target, and it does not change size from target
 to target. It is always unsigned.
-target_ulong is a type the size of a virtual address on the CPU; this means
+``target_ulong`` is a type the size of a virtual address on the CPU; this means
 it may be 32 or 64 bits depending on which target is being built. It should
 therefore be used only in target-specific code, and in some
 performance-critical built-per-target core code such as the TLB code.
-There is also a signed version, target_long.
-abi_ulong is for the ``*``-user targets, and represents a type the size of
-'void ``*``' in that target's ABI. (This may not be the same as the size of a
+There is also a signed version, ``target_long``.
+``abi_ulong`` is for the ``*-user`` targets, and represents a type the size of
+'``void *``' in that target's ABI. (This may not be the same as the size of a
 full CPU virtual address in the case of target ABIs which use 32 bit pointers
-on 64 bit CPUs, like sparc32plus.) Definitions of structures that must match
+on 64 bit CPUs, like *sparc32plus*.) Definitions of structures that must match
 the target's ABI must use this type for anything that on the target is defined
-to be an 'unsigned long' or a pointer type.
-There is also a signed version, abi_long.
+to be an '``unsigned long``' or a pointer type.
+There is also a signed version, ``abi_long``.
 
 Of course, take all of the above with a grain of salt.  If you're about
-to use some system interface that requires a type like size_t, pid_t or
-off_t, use matching types for any corresponding variables.
+to use some system interface that requires a type like ``size_t``, ``pid_t`` or
+``off_t``, use matching types for any corresponding variables.
 
-Also, if you try to use e.g., "unsigned int" as a type, and that
+Also, if you try to use e.g., '``unsigned int``' as a type, and that
 conflicts with the signedness of a related variable, sometimes
 it's best just to use the *wrong* type, if "pulling the thread"
 and fixing all related variables would be too invasive.
@@ -363,7 +363,7 @@ it points to, or it is aliased to another pointer that is.
 Typedefs
 --------
 
-Typedefs are used to eliminate the redundant 'struct' keyword, since type
+Typedefs are used to eliminate the redundant '``struct``' keyword, since type
 names have a different style than other identifiers ("CamelCase" versus
 "snake_case").  Each named struct type should have a CamelCase name and a
 corresponding typedef.
@@ -418,8 +418,9 @@ Calling ``g_malloc`` with a zero size is valid and will return NULL.
 Prefer ``g_new(T, n)`` instead of ``g_malloc(sizeof(T) * n)`` for the following
 reasons:
 
-* It catches multiplication overflowing size_t;
-* It returns T ``*`` instead of void ``*``, letting compiler catch more type errors.
+* It catches multiplication overflowing ``size_t``;
+* It returns ``T *`` instead of ``void *``, letting compiler catch more type
+  errors.
 
 Declarations like
 
-- 
2.31.1


