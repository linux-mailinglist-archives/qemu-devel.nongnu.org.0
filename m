Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DF84D457D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:17:20 +0100 (CET)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGnH-0003gj-Du
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:17:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nSGhK-0001G5-PB
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:11:10 -0500
Received: from [2a00:1450:4864:20::62a] (port=35753
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nSGhI-0005B5-Ru
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:11:10 -0500
Received: by mail-ej1-x62a.google.com with SMTP id yy13so11297732ejb.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=djodHWxz9LAJs4zqlcJSulYqRXXAFQs+TWFObxC6aOw=;
 b=IjFvbWcUFmXYK4rICDqrxl/mpC2WkCruIC7SZRZ9RhABbMRXMPAITs2RZ+zESSy0Fm
 iNcJE8y8i471LCmvWJYKym9xeFjXnqUuk4zhcOj00+repTeFdXl8PokiWWXgaYLlX89G
 8GgcL+hdxK0okkG6747UO2BSxkrMimKJ2PX77F6Xhc8EbqP7I87s4glSoDJkinWR5c3q
 +2ySYbVJDxo85NuZ1xLUrg3W9LLaDq8tF4Pmcz92bJLLslT10icTC1mQIVrYzuNaw/1p
 NUoLnwtYWPesXiOp0h8nMU2axD8K+Vgbr26HCbgpdtFnhYi9peJgOVkF8n2vKQd+zeeX
 JlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=djodHWxz9LAJs4zqlcJSulYqRXXAFQs+TWFObxC6aOw=;
 b=GqC76UEv2ucObsUgJNk5tS8LxPk3IHflQA2gTcSBI8A0mFFdkMmq6O3DKO7tVZYARn
 ANDla+ihwC1jPiuNZT+H50Jg3CbLpVUWzJJJs4P4TtL5V1rzZrtLfGIBrgwyuR6VZoD4
 bmE5sSluuqX8ym3T9dxi3bXadJ1iRLFK3jr1jn6e4ZOHApiivTwtv99ilnjR7MjhKibN
 HgYJFzHUENAr2onNBkHODMNawo+leqHMn1wjLuxgOOWxnPNv0zkkgqdFe1zGX+Y3epgy
 s8g7SdJZ+eyQvYcS54TOCAgj5v9o32CRTxHQQx2y292zp2g4Vip+SrHLa+NoMAT5vHOZ
 kFqA==
X-Gm-Message-State: AOAM530rlXcVj9ZrQN5Ph0tgTz9JssTk8tX/Q3RhnUyxMxm3i58Hnwio
 gpCTsxx1DK+WI0WPIm7Muhwtc/0FqQivGvWI8OvoKp86XNERYw==
X-Google-Smtp-Source: ABdhPJwIjZQ726PShCX7fnKHldfDeEx5Yuw6dgjOhjf4O0rbsfrPpvm4KYvPSQbvAlTxl3lAMk4B1w+cm++WoCMA+7Q=
X-Received: by 2002:a17:907:72d0:b0:6db:4788:66a9 with SMTP id
 du16-20020a17090772d000b006db478866a9mr3817213ejc.516.1646910666475; Thu, 10
 Mar 2022 03:11:06 -0800 (PST)
MIME-Version: 1.0
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 10 Mar 2022 03:10:55 -0800
Message-ID: <CAMo8BfKsLmdjRzmX6+nD3u-+8-6dx5VuU-kNH9gwx04NhQ5fGA@mail.gmail.com>
Subject: qemu-softmmu -cpu help broken
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: 18
X-Spam_score: 1.8
X-Spam_bar: +
X-Spam_report: (1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I've noticed that the command
 qemu-system-xtensa -cpu help
no longer prints anything. Apparently because cpu_list is no longer defined
in list_cpus inside softmmu/cpus.c

Bisection points to the following commit:
e0220bb5b200 ("softmmu: Build target-agnostic objects once")

Reverting the change for the cpus.c fixes it for me:

diff --git a/softmmu/meson.build b/softmmu/meson.build
index 8138248661a2..adede5e604db 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -1,5 +1,6 @@
specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
  'arch_init.c',
+  'cpus.c',
  'ioport.c',
  'memory.c',
  'physmem.c',
@@ -13,7 +14,6 @@ specific_ss.add(when: ['CONFIG_SOFTMMU',
'CONFIG_TCG'], if_true: [files(
softmmu_ss.add(files(
  'balloon.c',
  'bootdevice.c',
-  'cpus.c',
  'cpu-throttle.c',
  'cpu-timers.c',
  'datadir.c',

I can send a proper patch if this is the right fix, please
let me know.

-- 
Thanks.
-- Max

