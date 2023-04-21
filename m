Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB486EA31E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 07:27:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjFt-0003Ws-ML; Fri, 21 Apr 2023 01:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFn-0003WG-Aq
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:18 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFl-0001g0-SK
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:15 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso716175e9.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 22:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682054652; x=1684646652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Ln7X30TzZVyfM9DQqXGhziwlCFGksoMbA8o0wStkc0=;
 b=jKeReq7oNt2Q447Zmkmi04bpFxwUb/9LaYMenSj4hVj0ZWTh+Ed7io1n1c8msIICb4
 tewwkIPax6awXydESxdCWH9BWwCRYwdtSFX5fJkKzJGr0ztuFi30DI1zgbsi6cwkpuqq
 HDVHpzUNKX2aCfvnVQfRVzCxaPzLiPc+w9YT5vRUAvviLzO3LnGdNb8bbQSueN2OYkdV
 OnMPyN0+ItzYj5PqN9eIlrGRM4lWER57NUN/5ckkf1EEktL5byog8Brkod+aQqV9O0RC
 KtXzOKHmaOoCrAmEIQ+gTzZ5p6/GAe3qq5pq6QZhbica4uS9FumOB+EqbMO6b3pxIO37
 /scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682054652; x=1684646652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Ln7X30TzZVyfM9DQqXGhziwlCFGksoMbA8o0wStkc0=;
 b=RIGzwLsKotBfG6I1pzSVkI4BWm9o1nbuAE8AdE2Mj1+EZGG7luO/cKjcjMJuIvBEm5
 5k6jC+nkk0F8xspLTxxBnpb7GPdRg5ofbTZJ3U3aAtApq7Bw7eYWeavdmr4Mw8mRCpvk
 ppMeD3i1kUOT4wtf/OuEWJ5ZKAEzGHjWJHoRfB3Z7YIZRB7zrB2Eu/WbfogY3v1aJ11A
 v1r1Ly3GjKZ8/VBEHI/kcqGcWuiCtCvEulDjLw5ry4x2/keduZ4m1Tf++6HT/gXk0WhL
 j9JrrtckwfYdn2gYivyx22HnDF9Qx+JHGZN6ipkq/ZsJmpwG2mmadrsQN0NVnaCz53Qw
 PmDQ==
X-Gm-Message-State: AAQBX9e+whkKxPPoOOOfeZYJQjfeG3asxdfHQMWL2HFgurJAn3PCW09h
 RhUQd+Nvwjj5cilOTQZ01j8jsydOso8=
X-Google-Smtp-Source: AKy350ajvL6LIoH/nzUR/ZoVq/yJ1CSa2mOP83KCAkNJTKcg5f0J/CoYAM9q/suFHHGiPHLldBFCCg==
X-Received: by 2002:a05:600c:22d4:b0:3f1:82c6:2d80 with SMTP id
 20-20020a05600c22d400b003f182c62d80mr933892wmg.5.1682054652215; 
 Thu, 20 Apr 2023 22:24:12 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003f173c566b5sm3813475wmj.5.2023.04.20.22.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 22:24:11 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
X-Google-Original-From: Karim Taha <krm.taha@outlook.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH 06/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 07:22:50 +0200
Message-Id: <20230421052255.5603-7-krm.taha@outlook.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421052255.5603-1-krm.taha@outlook.com>
References: <20230421052255.5603-1-krm.taha@outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Karim Taha <kariem.taha2.7@gmail.com>

add bsd-user/bsd-socket.c to meson.build
---
 bsd-user/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 5243122fc5..f648bd3554 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -7,6 +7,7 @@ bsd_user_ss = ss.source_set()
 common_user_inc += include_directories('include')
 
 bsd_user_ss.add(files(
+  'bsd-socket.c',
   'bsdload.c',
   'elfload.c',
   'main.c',
-- 
2.40.0


