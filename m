Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2DD69A4AF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 05:10:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSs4q-0001pj-B7; Thu, 16 Feb 2023 23:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs4j-0001O5-V3
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:10:22 -0500
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs4f-0001Cu-Tc
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:10:21 -0500
X-IronPort-RemoteIP: 209.85.219.70
X-IronPort-MID: 260573041
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jbXBdq9/1pWAtpOoF1nQDrUDPXyTJUtcMsCJ2f8bNWPcYEJGY0x3n
 zMeC2iHOvvbYjP0etElPYyzp0kOvpXcn9MwHAs/+3oxFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yI6jefQHeCU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNLg06/gEk35q+q4mpG5gdWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJF4bBI8J1uJmO0VX8
 bs3MmEuNxCzhsvjldpXSsE07igiBMziPYdao285iD+GVbApRpfMR6iM7thdtNsyrpoWTLCOO
 oxDMGspM0yojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKNlFEui+CxabI5fPSDHuNVsha5t
 FuB4jnCAC0mbsKEkWaKpyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m83s/F3+hPzCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBdJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:xasL5qwmCndyAOmXyYZlKrPw+r1zdoMgy1knxilNoNJuA6ilfq
 eV7YgmPHrP4gr5N0tQ/+xoVJPwI080sKQFmrX5Xo3SITUOxlHYVb2KhLGKq1aQeBEWtNQtr5
 uIG5IfNDSaNykcsS+V2njcL/8QhPOqyuSHv9v/8ltaZT1WSshbnnhE48WgfnGehjMqOXP0Lv
 ShD7J81kKdkL0sAaWGOkU=
Received: from mail-qv1-f70.google.com ([209.85.219.70])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 23:09:58 -0500
Received: by mail-qv1-f70.google.com with SMTP id
 f6-20020a0cc306000000b0056e96f4fd64so2265505qvi.15
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 20:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fxzgfX4+v/nnrAbv0bHpRj7WdNVW28zLqE1nexQp+8o=;
 b=OMai67KEf5jlQBBeLPZRYgiokPNhkuybnS/AADDv3JTMs48clqgnkjFIaha/Xqgs/q
 X1I2Qe16j5tMarji+yWbcMnyMAi0oXA8NjQfxu6uZIIDuUAe7Q2+XdWA/rXNSxS9Of3K
 kFi002I4euGM+6r0eSAzmj5Ls7cfeGW1T4g72F+j9efgYq1IVcqxcxhBiEisPzU5VRHo
 s5IRQC8ursCIiFJOsNZxU7ZZgibtNK1K3v+ec1c3Yt4KHEldav9cZP3COufWVJy8PWew
 75lGKKjT7IlSTOOm/ly1Be5ybqHcDaLfIlMyThh5LkW5OmrCHCue8dvXdmhbxT5wcq5H
 EenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fxzgfX4+v/nnrAbv0bHpRj7WdNVW28zLqE1nexQp+8o=;
 b=ZhVh9zWn7N64T1X3UVzf2HeeImpErglocpC0NK9T9v+Ch+dNeUFD9xo0tBRtxuF4uc
 2kX3dN0JXY1fnLlM888tjBzXSAkQEPyu/XmldgxRVYvSDkj3BaCmRUmlvi+EHEBXMjSP
 Gey+mlEzY/b8F9sl7L2NZqa/olbd2ItPo+5JfiJukxMvtdriU2NbYbPI1lZTuQKjGxOA
 yA64Kr+VAfLUrxDDp3DKAArUYJBsGasVXFT88l+wyrRz24ieNlqG75hkVQzrvBTqGh4P
 vsg9+K/N7ax/DDYUyoBz9/YGm180lDixXt8CNqrxpEwhTGyr/YEoGGEw33FZpCxi+RuY
 7LWg==
X-Gm-Message-State: AO0yUKX65MEyBwcrQxf++v0ewjWjetsyMeB4IN/Q1FAEGXK0S0urh1WQ
 5O3rKwE0qoQ60aNEIHSFhSSAhgPmZ1AeXTClb9Fb3o8wc4i8T4uq7TrXJZhXKfpS0VXmMTuHArY
 CFyDd6bzVH8P6PstdrgrLTmOEvsQUEc7j+6COuw==
X-Received: by 2002:a05:6214:230c:b0:56e:fef4:7ff2 with SMTP id
 gc12-20020a056214230c00b0056efef47ff2mr6696078qvb.28.1676606997410; 
 Thu, 16 Feb 2023 20:09:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/lWGLNeF+mj97F03YPPVvjGzgj/qTs7hWPzYJb0rd4iKWQJqYgVcjSDeJu/tMecWukEvFpcw==
X-Received: by 2002:a05:6214:230c:b0:56e:fef4:7ff2 with SMTP id
 gc12-20020a056214230c00b0056efef47ff2mr6696058qvb.28.1676606997157; 
 Thu, 16 Feb 2023 20:09:57 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 145-20020a370897000000b007296805f607sm1911891qki.17.2023.02.16.20.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 20:09:56 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: [PULL 10/10] docs/fuzz: remove mentions of fork-based fuzzing
Date: Thu, 16 Feb 2023 23:08:55 -0500
Message-Id: <20230217040855.16873-11-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217040855.16873-1-alxndr@bu.edu>
References: <20230217040855.16873-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.649, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 docs/devel/fuzzing.rst | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 715330c856..3bfcb33fc4 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -19,11 +19,6 @@ responsibility to ensure that state is reset between fuzzing-runs.
 Building the fuzzers
 --------------------
 
-*NOTE*: If possible, build a 32-bit binary. When forking, the 32-bit fuzzer is
-much faster, since the page-map has a smaller size. This is due to the fact that
-AddressSanitizer maps ~20TB of memory, as part of its detection. This results
-in a large page-map, and a much slower ``fork()``.
-
 To build the fuzzers, install a recent version of clang:
 Configure with (substitute the clang binaries with the version you installed).
 Here, enable-sanitizers, is optional but it allows us to reliably detect bugs
@@ -296,10 +291,9 @@ input. It is also responsible for manually calling ``main_loop_wait`` to ensure
 that bottom halves are executed and any cleanup required before the next input.
 
 Since the same process is reused for many fuzzing runs, QEMU state needs to
-be reset at the end of each run. There are currently two implemented
-options for resetting state:
+be reset at the end of each run. For example, this can be done by rebooting the
+VM, after each run.
 
-- Reboot the guest between runs.
   - *Pros*: Straightforward and fast for simple fuzz targets.
 
   - *Cons*: Depending on the device, does not reset all device state. If the
@@ -308,15 +302,3 @@ options for resetting state:
     reboot.
 
   - *Example target*: ``i440fx-qtest-reboot-fuzz``
-
-- Run each test case in a separate forked process and copy the coverage
-   information back to the parent. This is fairly similar to AFL's "deferred"
-   fork-server mode [3]
-
-  - *Pros*: Relatively fast. Devices only need to be initialized once. No need to
-    do slow reboots or vmloads.
-
-  - *Cons*: Not officially supported by libfuzzer. Does not work well for
-     devices that rely on dedicated threads.
-
-  - *Example target*: ``virtio-net-fork-fuzz``
-- 
2.39.0


