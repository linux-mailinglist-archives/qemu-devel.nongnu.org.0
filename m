Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F224472095
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 06:37:42 +0100 (CET)
Received: from localhost ([::1]:58510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwe1s-0001lA-H8
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 00:37:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xvilka@gmail.com>)
 id 1mwbHq-0003my-E0; Sun, 12 Dec 2021 21:41:58 -0500
Received: from [2a00:1450:4864:20::22a] (port=45925
 helo=mail-lj1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xvilka@gmail.com>)
 id 1mwbHn-0000E3-3l; Sun, 12 Dec 2021 21:41:58 -0500
Received: by mail-lj1-x22a.google.com with SMTP id b19so19933915ljr.12;
 Sun, 12 Dec 2021 18:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to:cc;
 bh=76uZIxbBLUi8hYre3IvEPsH76ywyUQmVUHrBimDo/JA=;
 b=nihzRgFSCaC6WDeog4d/tFdca8ZpoKgYfKMcpufqZUoRURQkzClwadRyYJLIXny39v
 bRjA3zYmELEuHRk6DwAa/QWqxRlUvBv7I27LU6uddqu67ksZ1LMVU1TtI67+UzM/Q52k
 8Cv5p3jWKEK4zeZZjarw3X+nldTghLYnaWNCguki0Phm+X2oovEydvJa5Hpsr5Q2Qzyq
 CeqL+7v+1STFzs+P9ebmDZgN/ejEzcYtzLEKdW40WcflCn0G9WCnOQFi7Cp4dPQmHjOm
 /pemT2k+qoRA+b2qiNMdhs/2bdJCIrQrt7mV2CAJykLYf6Vp8btsQSbGUVoiXQiwPSV+
 HYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to:cc;
 bh=76uZIxbBLUi8hYre3IvEPsH76ywyUQmVUHrBimDo/JA=;
 b=vd4TjmZQVWghw7a7iPN3KBcKARMmUf+BQmEG1Q+BM6lSALTx1sGbGAqb0jd6o3vCUb
 MHeZDzAu9XmWn+t16QKh2a0BxhJgYEhZMBKu4TA55T+NpbAIUQKyQVDah5y1y+CPQrTf
 dfsMwkUFbPercrv6C/ddeD6OWRcW4Potjwf8nPOtWAMWoj2s4Oum+OEXzo7llYOyIy2B
 lazz1y6dm1edZcaU42BcBgU45vLNj47qMpym9bOFrJBNJm5QMckFgcsHJiVJghhq4qKD
 QB6cS5c5vugdpyx86QC5bulFRXJ/7PN6TCJ13cgitcErTVBl+n1qQbFU/Seb70+mIZHg
 CI/g==
X-Gm-Message-State: AOAM532oJdCyPx7s2qzPoyMvK0lvadrCtQhCatzqC5KmoZ3veMlXUEye
 u+iS1BgnILNcX/qzV67dvO2JNyOxmn5qSx2cXZiHZC2Ly0Y=
X-Google-Smtp-Source: ABdhPJyhYGBtZ8n9lB4shV903mx7cUFFWWs1flXALdbB2cqaPHrWFSmpLeGNG4zSXp2yC20KyIVy+eULK0H+YBUr3RY=
X-Received: by 2002:a2e:a594:: with SMTP id m20mr25958841ljp.332.1639363311864; 
 Sun, 12 Dec 2021 18:41:51 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?0JDQvdGC0L7QvSDQmtC+0YfQutC+0LI=?= <anton.kochkov@gmail.com>
Date: Mon, 13 Dec 2021 10:41:43 +0800
Message-ID: <CA+8M6wm4Yeg7sEAge9TMxbRmiEsyWu-cj5wuRGwFO8JpD2qPFw@mail.gmail.com>
Subject: [PATCH] meson: be strict for boolean options
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=xvilka@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Dec 2021 00:32:48 -0500
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
Reply-To: anton.kochkov@gmail.com
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch allows to proceed further to be able to build with Muon buildsystem

https://sr.ht/~lattis/muon/

There are still few bugs remain, but they are on the Muon side:
https://todo.sr.ht/~lattis/muon/21

Best regards,
Anton Kochkov.

From fa80e0c17b14b8f5067d13ad7bc63e0d2cbb94ce Mon Sep 17 00:00:00 2001
From: Anton Kochkov <anton.kochkov@gmail.com>
Date: Fri, 10 Dec 2021 21:10:34 +0800
Subject: [PATCH] meson: be strict for boolean options

While Meson buildsystem accepts the 'false' as a value
for boolean options, it's not covered by the specification
and in general invalid. Some alternative Meson implementations,
like Muon, do not accept 'false' or 'true' as a valid value
for the boolean options.

See https://mesonbuild.com/Build-options.html

Signed-off-by: Anton Kochkov <anton.kochkov@gmail.com>
---
 meson_options.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson_options.txt b/meson_options.txt
index e392323732..4ca770c1bd 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -60,9 +60,9 @@ option('tcg', type: 'feature', value: 'auto',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
        description: 'TCG with bytecode interpreter (slow)')
-option('cfi', type: 'boolean', value: 'false',
+option('cfi', type: 'boolean', value: false,
        description: 'Control-Flow Integrity (CFI)')
-option('cfi_debug', type: 'boolean', value: 'false',
+option('cfi_debug', type: 'boolean', value: false,
        description: 'Verbose errors in case of CFI violation')
 option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
-- 
2.33.1

