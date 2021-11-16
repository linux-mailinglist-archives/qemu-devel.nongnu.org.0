Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1F7453577
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:15:48 +0100 (CET)
Received: from localhost ([::1]:54296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0BW-00039q-Pn
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:15:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn09M-0001es-0u
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:13:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn09J-0001sa-4j
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637075607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I9uHr78Bd1hAdWgud7dJDANsSM/mJBoe5Km+LIqe2vI=;
 b=OxsSelj4K15+rhT4qq5KQUNqEtsfvqeY2P9+0Hl9738GxZkQxCm5ta/4SrzNuzKczpgVEn
 sjHYXPqjMeCiCYQS9wQpWUj85ghqwIgLc9oNMppOzaeVzT2rxr4MhiPYXEv8kdHmlmx1O9
 iEnWJw71Zgdz24SCDzx24MojACGGxbg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-Yysr90BpPUWw8Pz9s17E-A-1; Tue, 16 Nov 2021 10:13:26 -0500
X-MC-Unique: Yysr90BpPUWw8Pz9s17E-A-1
Received: by mail-wr1-f69.google.com with SMTP id
 y10-20020adffa4a000000b0017eea6cb05dso4570720wrr.6
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 07:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I9uHr78Bd1hAdWgud7dJDANsSM/mJBoe5Km+LIqe2vI=;
 b=LZAxfzuAAhfL5tcGKHguzx0WMOGyj5oF724wBf7tKGmWB3O14N9zDJfvr1ivHybXRj
 9f0lpE4L9Nn7ZJEqILAZfTvPiojy8+vHEBVurSKhXWQ7ZDBU0aWCmvESQP+8RZIgEdJZ
 mjvMft45b4iqvQz4/epmUaEyJkNpC4ph0WVuZ76PmaZNRlxls1Jn0XNDWINY0mYQi16l
 g6GCar5hhVWlQm4XiCxGAK0mpMX5mJDzc+E6M7EyCceNx/cvZm3a+YHZFTWSk/7auJDN
 Wl7hytR5LD9/4B6uoHbMA3+NyaUnUTSYfzChxbZMNc0ZI6j15i98XIiAvYDICHaI4PE6
 1Fvg==
X-Gm-Message-State: AOAM530tF1IFS7gfUSsahkj81LSDUaGs6/kdtu8AxkdoVY+gkKGCAfwC
 1QmJGalROysbpiAPT+FAUGGvXW64Yy1pvrZJmrItj04QTC3UVyuoORzSo7cT7WJ52x/4IQmwD8+
 irau5qjv8AAXA+AWKQ+57S1PgUgDSkIO5/7fQFo6gum5qy8h4nswTHJ3WXepudZRa
X-Received: by 2002:a1c:7714:: with SMTP id t20mr60375357wmi.139.1637075604738; 
 Tue, 16 Nov 2021 07:13:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQYAhFyLdU4iFhA7VfEwTgn75yNRIJwDNqnRdl+aOTf1vwgs7GNXm8/DtcNIOrpkLojnQBIg==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr60375296wmi.139.1637075604394; 
 Tue, 16 Nov 2021 07:13:24 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 ay21sm2876646wmb.7.2021.11.16.07.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:13:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? 1/3] docs/devel/style: Improve GLib functions rST
 rendering
Date: Tue, 16 Nov 2021 16:13:15 +0100
Message-Id: <20211116151317.2691125-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116151317.2691125-1-philmd@redhat.com>
References: <20211116151317.2691125-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/style.rst | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 260e3263fa0..415a6b9d700 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -413,13 +413,14 @@ multiple exist paths you can also improve the readability of the code
 by using ``g_autofree`` and related annotations. See :ref:`autofree-ref`
 for more details.
 
-Calling ``g_malloc`` with a zero size is valid and will return NULL.
+Calling ``g_malloc`` with a zero size is valid and will return ``NULL``.
 
 Prefer ``g_new(T, n)`` instead of ``g_malloc(sizeof(T) * n)`` for the following
 reasons:
 
-* It catches multiplication overflowing size_t;
-* It returns T ``*`` instead of void ``*``, letting compiler catch more type errors.
+* It catches multiplication overflowing ``size_t``;
+* It returns ``T *`` instead of ``void *``, letting compiler catch more type
+  errors.
 
 Declarations like
 
@@ -444,14 +445,14 @@ use this similar function when possible, but note its different signature:
 
     void pstrcpy(char *dest, int dest_buf_size, const char *src)
 
-Don't use strcat because it can't check for buffer overflows, but:
+Don't use ``strcat`` because it can't check for buffer overflows, but:
 
 .. code-block:: c
 
     char *pstrcat(char *buf, int buf_size, const char *s)
 
-The same limitation exists with sprintf and vsprintf, so use snprintf and
-vsnprintf.
+The same limitation exists with ``sprintf`` and ``vsprintf``, so use
+``snprintf`` and ``vsnprintf``.
 
 QEMU provides other useful string functions:
 
@@ -464,8 +465,8 @@ QEMU provides other useful string functions:
 There are also replacement character processing macros for isxyz and toxyz,
 so instead of e.g. isalnum you should use qemu_isalnum.
 
-Because of the memory management rules, you must use g_strdup/g_strndup
-instead of plain strdup/strndup.
+Because of the memory management rules, you must use ``g_strdup/g_strndup``
+instead of plain ``strdup/strndup``.
 
 Printf-style functions
 ======================
@@ -524,10 +525,10 @@ automatic cleanup:
 
 Most notably:
 
-* g_autofree - will invoke g_free() on the variable going out of scope
+* ``g_autofree`` - will invoke ``g_free()`` on the variable going out of scope
 
-* g_autoptr - for structs / objects, will invoke the cleanup func created
-  by a previous use of G_DEFINE_AUTOPTR_CLEANUP_FUNC. This is
+* ``g_autoptr`` - for structs / objects, will invoke the cleanup func created
+  by a previous use of ``G_DEFINE_AUTOPTR_CLEANUP_FUNC``. This is
   supported for most GLib data types and GObjects
 
 For example, instead of
@@ -551,7 +552,7 @@ For example, instead of
         return ret;
     }
 
-Using g_autofree/g_autoptr enables the code to be written as:
+Using ``g_autofree/g_autoptr`` enables the code to be written as:
 
 .. code-block:: c
 
@@ -569,13 +570,13 @@ Using g_autofree/g_autoptr enables the code to be written as:
 While this generally results in simpler, less leak-prone code, there
 are still some caveats to beware of
 
-* Variables declared with g_auto* MUST always be initialized,
+* Variables declared with ``g_auto*`` MUST always be initialized,
   otherwise the cleanup function will use uninitialized stack memory
 
-* If a variable declared with g_auto* holds a value which must
+* If a variable declared with ``g_auto*`` holds a value which must
   live beyond the life of the function, that value must be saved
   and the original variable NULL'd out. This can be simpler using
-  g_steal_pointer
+  ``g_steal_pointer``
 
 
 .. code-block:: c
-- 
2.31.1


