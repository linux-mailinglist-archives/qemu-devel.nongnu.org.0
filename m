Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D248A314357
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:57:48 +0100 (CET)
Received: from localhost ([::1]:36212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FTX-0000un-UO
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCJ-0002sf-PU
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:43 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCG-00063j-KW
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:41 -0500
Received: by mail-wm1-x329.google.com with SMTP id m1so60505wml.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N868ZEyZ6u5XOq6H/Pyk+nswe7j/Yy+s5xT76V+knOs=;
 b=JX5JK7AERWMd439EyMMsilXq/aYnO4/CLjt1hbNI3Z4b8nVOKjfVzmJFlUHmYMFXkE
 taH+/xegOR9CaDW6Q1/u4g1uxV3aAUb1lL8IpRHwJ1f7iRfvotm+Ch97s4v8xRG1YlCJ
 ybQLQgQlTDHyMRdaH3i+P0k4gmahZuJbIxyIIV3vJtEnMs8wJ+fu+vwWOp9rH6RDrrlS
 zOvUD/PLIHzaXxg4pAqaVgFqsiAJwwhcmC8WvoCEHBJ/r2FYR0t0hypFzWXbivfbBxa+
 bPFCwbDD5KBtJchTyfiYmd6xtRsRtSTR2I9UkhwYwwlWfOvwzI2AADLdgutsbIZ9iafo
 lJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N868ZEyZ6u5XOq6H/Pyk+nswe7j/Yy+s5xT76V+knOs=;
 b=Taj3gH0VWnTAxuZDylWOzPOjy2XVIx45pqvuXx8IeB/t9MJHMV3cZcQlZJAvdx+a41
 cqav0LGWYdN/xG5mSTfJ+R4ouHR2cJE8nk4Fs4y+LXCmzcGyNcguFFccOhN5/ww3lPgw
 hecq/NvC0PE0f9slCuvAag1UekW0XdkSlzVSdDwwnPT8K+yniFEWpoapVEd0CV20qem8
 Nn79pVi+szR+3Q1+9oik7haDngZoDQysk3hgCsNI/9aa0l55I5+x8hec+RUm/Bg3htg7
 bOI+xQYKAyxXyfDGFouV1fPcgoWHJqD963rqr/K00tJa8mk8nuC9eD78ycQUTQOdPkjQ
 Nd2Q==
X-Gm-Message-State: AOAM531eMLMQUPa6Qv/JjxR0IUSbOknQbtZK6yi/KZnUKy2kfvf9nHmQ
 SZSmOH60HQqgodPX/7Y6UwjTxMclN11+lg==
X-Google-Smtp-Source: ABdhPJzbYDCQu17d4qV3/zm29W/ERTntURi51mlluyz8l7okv8sbrSbbK9ad4+vJYnv+4ha1fmeI6Q==
X-Received: by 2002:a1c:b6c5:: with SMTP id g188mr63698wmf.27.1612808619392;
 Mon, 08 Feb 2021 10:23:39 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/46] docs/fuzz: add some information about OSS-Fuzz
Date: Mon,  8 Feb 2021 19:22:51 +0100
Message-Id: <20210208182331.58897-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20210117230924.449676-3-alxndr@bu.edu>
---
 docs/devel/fuzzing.rst | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 5f5200c843..97797c4f8c 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -180,6 +180,36 @@ To ensure that these env variables have been configured correctly, we can use::
 
 The output should contain a complete list of matched MemoryRegions.
 
+OSS-Fuzz
+--------
+QEMU is continuously fuzzed on `OSS-Fuzz` __(https://github.com/google/oss-fuzz).
+By default, the OSS-Fuzz build will try to fuzz every fuzz-target. Since the
+generic-fuzz target requires additional information provided in environment
+variables, we pre-define some generic-fuzz configs in
+``tests/qtest/fuzz/generic_fuzz_configs.h``. Each config must specify:
+
+- ``.name``: To identify the fuzzer config
+
+- ``.args`` OR ``.argfunc``: A string or pointer to a function returning a
+  string.  These strings are used to specify the ``QEMU_FUZZ_ARGS``
+  environment variable.  ``argfunc`` is useful when the config relies on e.g.
+  a dynamically created temp directory, or a free tcp/udp port.
+
+- ``.objects``: A string that specifies the ``QEMU_FUZZ_OBJECTS`` environment
+  variable.
+
+To fuzz additional devices/device configuration on OSS-Fuzz, send patches for
+either a new device-specific fuzzer or a new generic-fuzz config.
+
+Build details:
+
+- The Dockerfile that sets up the environment for building QEMU's
+  fuzzers on OSS-Fuzz can be fund in the OSS-Fuzz repository
+  __(https://github.com/google/oss-fuzz/blob/master/projects/qemu/Dockerfile)
+
+- The script responsible for building the fuzzers can be found in the
+  QEMU source tree at ``scripts/oss-fuzz/build.sh``
+
 Implementation Details / Fuzzer Lifecycle
 -----------------------------------------
 
-- 
2.29.2



