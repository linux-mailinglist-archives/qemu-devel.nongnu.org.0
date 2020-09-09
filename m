Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D6E262DD6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 13:31:04 +0200 (CEST)
Received: from localhost ([::1]:58308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFyJa-00052a-Ud
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 07:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kFyGS-0008OV-6K
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 07:27:48 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kFyGQ-0006WS-Ft
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 07:27:47 -0400
Received: by mail-wr1-x42a.google.com with SMTP id s12so2517347wrw.11
 for <qemu-devel@nongnu.org>; Wed, 09 Sep 2020 04:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hb9hv73EPp1tw1ahzPI1+7OENb7hPI7UQgxNVfWg2Cw=;
 b=shQ5SKsxA+gPp+yUihGIKLTX9NO38Y7B8ADOH9TV9AEr6rIIRQo78El1e6Ii20I8/4
 a12Ik3OZQUkRnf9blRE9t3QNHUVY1/2IPx51ZDnbyXfw3+QoXkg+KFyCFRPuINU8YVbX
 vxjw+k7ZtQdgWFk6pFvD4C0dhdHPZWX5LY9OdZsZQ1dBN4uuJxcZJzMfe+KMyek4j5Ug
 CdWyndDIhgXaa8lQjHMSyaotj1S2WExxBXwOAvwfhCXZs9zgSYF2BdEhIQsNc6pCdS/y
 tIdaJuj3XHw4RV/h2JNUVkHZgmBeaF5b6SBOCC1OaO3870v1NU4uKacAaipKtAcUx+Bw
 z81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hb9hv73EPp1tw1ahzPI1+7OENb7hPI7UQgxNVfWg2Cw=;
 b=DDIhfM2uQSnQTG/rBTZuHHGfUn1KqjN2JrNKt/vQYnX1WS1kieOIpEVWLNMs+I15Yk
 9hF3Sl2k7XqAWL1ryJ9dqLlTBVJg/Din4zSuQh6fdWJ2BE5f4Ba8Fq0n3N+IBtrv+EX7
 AQQqG1gif33n1OGONEiuXUnJJsiEq8RZ/ZxJbIg+tsFHIyKKnlUr8QYqC27Fp+E3S2Ba
 24a8348Yuw3C73YwwnnmHI3KgjjgxN/5aVIySfcFNaB1EoDl7H/haENUqXtmnGUaIgsd
 RHQGWOKVOeSJ2xvEii0XY4qu0Smw/sa1rw7NhF2QBBIXXjuAPGc31fIpeGvfa+shnsQ0
 fgyQ==
X-Gm-Message-State: AOAM531CRJh0PAaYaetPBCUYValp0f2P+CNO5X2SqC97jWbrH+qA9E6H
 V/vJf0XpWZ/rRKYibmDjPojH6g==
X-Google-Smtp-Source: ABdhPJyqNEikyN9jISy12ZHJw0dPmg9ECfLgAJBbZP5LKySFylYKhFAYrkk/eLXUxhmP/DwTzLYdvg==
X-Received: by 2002:adf:f04c:: with SMTP id t12mr3461663wro.121.1599650864956; 
 Wed, 09 Sep 2020 04:27:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f6sm3809411wro.5.2020.09.09.04.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 04:27:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2318B1FF87;
 Wed,  9 Sep 2020 12:27:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/10] CODING_STYLE.rst: flesh out our naming conventions.
Date: Wed,  9 Sep 2020 12:27:32 +0100
Message-Id: <20200909112742.25730-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200909112742.25730-1-alex.bennee@linaro.org>
References: <20200909112742.25730-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mention a few of the more common naming conventions we follow in the
code base including common variable names and function prefix and
suffix examples.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200903112107.27367-2-alex.bennee@linaro.org>

---
v4
  - Incorporated Paolo's suggested paragraph
---
 CODING_STYLE.rst | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/CODING_STYLE.rst b/CODING_STYLE.rst
index 427699e0e42..8b13ef0669e 100644
--- a/CODING_STYLE.rst
+++ b/CODING_STYLE.rst
@@ -109,8 +109,41 @@ names are lower_case_with_underscores_ending_with_a_t, like the POSIX
 uint64_t and family.  Note that this last convention contradicts POSIX
 and is therefore likely to be changed.
 
-When wrapping standard library functions, use the prefix ``qemu_`` to alert
-readers that they are seeing a wrapped version; otherwise avoid this prefix.
+Variable Naming Conventions
+---------------------------
+
+A number of short naming conventions exist for variables that use
+common QEMU types. For example, the architecture independent CPUState
+is often held as a ``cs`` pointer variable, whereas the concrete
+CPUArchState is usually held in a pointer called ``env``.
+
+Likewise, in device emulation code the common DeviceState is usually
+called ``dev``.
+
+Function Naming Conventions
+---------------------------
+
+Wrapped version of standard library or GLib functions use a ``qemu_``
+prefix to alert readers that they are seeing a wrapped version, for
+example ``qemu_strtol`` or ``qemu_mutex_lock``.  Other utility functions
+that are widely called from across the codebase should not have any
+prefix, for example ``pstrcpy`` or bit manipulation functions such as
+``find_first_bit``.
+
+The ``qemu_`` prefix is also used for functions that modify global
+emulator state, for example ``qemu_add_vm_change_state_handler``.
+However, if there is an obvious subsystem-specific prefix it should be
+used instead.
+
+Public functions from a file or subsystem (declared in headers) tend
+to have a consistent prefix to show where they came from. For example,
+``tlb_`` for functions from ``cputlb.c`` or ``cpu_`` for functions
+from cpus.c.
+
+If there are two versions of a function to be called with or without a
+lock held, the function that expects the lock to be already held
+usually uses the suffix ``_locked``.
+
 
 Block structure
 ===============
-- 
2.20.1


