Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404A04B6BBA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 13:10:09 +0100 (CET)
Received: from localhost ([::1]:41094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJwel-0002Tv-T5
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 07:10:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJwbL-00014H-2F
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 07:06:35 -0500
Received: from [2607:f8b0:4864:20::436] (port=34445
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJwbI-0001Sq-TH
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 07:06:34 -0500
Received: by mail-pf1-x436.google.com with SMTP id g1so14721821pfv.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 04:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SYXy41yVp5dZ8BusZcX2STeLpB6B1RW9XMVc4l8KAJc=;
 b=o0ouJ8A+EJebdsB0o1b0wSc3d3964eKbdca1Q3QL7hujboRzoSgEc6fpaUFP98wa7r
 qI/M0bTLBqXTWH2UeI1f14puLidVyS8xBzvcXOIcAhoRjAy2c+9CG1x3aphfmFotAeSp
 NMN7iF3vIpuYySHBln2nG+iu15GyACplmdKU+tWNkoaIxcF6R6QExv7hBTSHMcGJjB2j
 zerN5coxjOcDBIefu4SrSW6Y/SQhKSCip0xQ4j9oA6KPZOLvqMt7FB+ZTwUZ1je1DHxn
 ORYx+GpS/u/r3KLBBwVFcPZAnQAieqqETtu0+aahnKzhQjam5axzlVZrHw6BP6TQnJlE
 szcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SYXy41yVp5dZ8BusZcX2STeLpB6B1RW9XMVc4l8KAJc=;
 b=kfO6O9VTco79OYp/ZrGjk2f/biO7nKNI8dkgIcMuG8ky4MsXxa+wi4dPuy02fNQ0z4
 AjK+wNYJEfnwI231uYZ+TbAk9QRP1ycbTB3Pk1T5tYjhGsOW5Pg1v9E6aaPgk3+Lr+Iw
 IB5bhWO7WBNPYdkIbShiVPq0lY9YXLFu/9F7CHduajqabIpftn57+fDSLUokF5eOp1Au
 BYkIDAfmoSvmx3xGmlQ24GtqC+THp+eo9YwmuXpts3RdBvD20ShoaP5ukqKSxsFO5C/B
 8xIE2IB7EMp/Oj0iOMcqkkjtAGR9pPzOxmEshhqQeo7g8KxIvjgRUxxl5mEV39JBMo3o
 4Zog==
X-Gm-Message-State: AOAM533vdto/zq1OhGk2O+5i5qsOcjpFxhcmyu787lJqjRH4kN+FzCQw
 PeLaNMDv9DugdgJduTXgiCcOGempANw=
X-Google-Smtp-Source: ABdhPJwKRJGWtaMdPakanme805yhlnjFitFLHGQ8s8VEGabGpVdArQtHd+4Oxz9RqP1Hn9wh4pXNXg==
X-Received: by 2002:a05:6a00:1681:: with SMTP id
 k1mr4062059pfc.48.1644926791149; 
 Tue, 15 Feb 2022 04:06:31 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id n22sm17044024pjv.24.2022.02.15.04.06.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 04:06:30 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 0/4] buildsys: More fixes to use GCC on macOS
Date: Tue, 15 Feb 2022 13:06:21 +0100
Message-Id: <20220215120625.64711-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Few fixes to be able to use GCC extensions which are not
available on Clang.

Philippe Mathieu-Daudé (4):
  osdep: Avoid using Clang-specific __builtin_available()
  osdep: Un-inline qemu_thread_jit_execute/write
  audio: Rename coreaudio extension to use Objective-C compiler
  ui/cocoa: Ignore 'initializer overrides' warnings

 audio/{coreaudio.c => coreaudio.m} |  0
 audio/meson.build                  |  2 +-
 include/qemu/osdep.h               | 21 ++-------------------
 ui/cocoa.m                         |  5 +++++
 util/osdep.c                       | 20 ++++++++++++++++++++
 5 files changed, 28 insertions(+), 20 deletions(-)
 rename audio/{coreaudio.c => coreaudio.m} (100%)

-- 
2.34.1


