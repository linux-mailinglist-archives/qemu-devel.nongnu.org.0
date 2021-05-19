Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F60B389663
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:17:10 +0200 (CEST)
Received: from localhost ([::1]:33016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRgr-0006mV-5C
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRCz-0000Nu-LK
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:46:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRCv-0005EV-Hm
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:46:16 -0400
Received: by mail-wr1-x430.google.com with SMTP id a4so15116899wrr.2
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2IUveWwI0J+7Ncapudv20RtB39QJD/A5pUhEcIazkKo=;
 b=Iha3kwznX10Vc2kZfXhF4IUMmUUULi6iUKyIc2jGnFDz3PkqySZhZdKeDBfLEuG9+u
 OqWTiSo/9pFqsHy/LvLYXsnH7VMxRpA+i0YA6Z1GHTE6CwOnoFzkhlYFBp1UhRKM81Mw
 AjECJVB6BwXCyFjlIY9Nz0XVWt9Yxyxq8SJpHuRYY2ZzeRJ9GCzNXBmd7T3qLq39aiGk
 ZsiOjKbag0jxFQHJT4ecUO2w+qtKumJ0jk/It3MxehrwOJ69xwi0W630x1BRsWTnfbCU
 TuVvL19IMSx5kUhEATN1IsXpAEergvLXr7Uu2Rr8WFPwAHjky4+qNqV85iGJf+kfn12N
 O/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2IUveWwI0J+7Ncapudv20RtB39QJD/A5pUhEcIazkKo=;
 b=tm/mf/gpAOQgruN9iy16PzLtmZfFGxmQnGbRhBZgdTA08WK+PAjBxLpTVBp0Oe/A90
 hVybXX5UvuTgvOLo8/Zp3HW3TAzbG0ObPaphjdnyqXTqQFFGSFo0XjdtMWaITlbgLTm/
 XLVbkQTchpgGV07gHC6FRW0dH+C5xz/MlrMe0yGtWjaEqT5pLfz2H+IHjKdhOHhQTH44
 yh8nAR8zdl9h+KZ951nvIeXJL38QTMxbTwupA+pICx3XGUvxbG3sZjKhbpPf5tq76D6/
 mF8qo5NKD97zpVaC1EGwzlZ0KUq8L7EayV+3ePVnasBsPJsKYxtfxCPKRprB3+D4y1JI
 fDiw==
X-Gm-Message-State: AOAM533yNUUcpPxykv+5U2u/9zTBWV34aSCm0Rsw5JIlsjbEEp7GWNfR
 svTa9Va9+ES10QKbQy1NRMCqoRHDny8o5w==
X-Google-Smtp-Source: ABdhPJz6qo42P1rSeb0ij8vialaqMI3Lr87/6qVJzJQ6zp0AffaydltfhKYhYGf65P7pzR/MbFoNww==
X-Received: by 2002:a05:6000:1b8a:: with SMTP id
 r10mr355872wru.296.1621449971326; 
 Wed, 19 May 2021 11:46:11 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x2sm2553247wmc.21.2021.05.19.11.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:46:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] gitlab-ci: Add ccache in $PATH and display statistics
Date: Wed, 19 May 2021 20:45:47 +0200
Message-Id: <20210519184549.2192728-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519184549.2192728-1-f4bug@amsat.org>
References: <20210519184549.2192728-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a runner has ccache installed, use it and display statistics
at the end of the build.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-template.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index f284d7a0eec..a625c697d3b 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -6,13 +6,18 @@
       then
         JOBS=$(sysctl -n hw.ncpu)
         MAKE=gmake
+        PATH=/usr/local/libexec/ccache:$PATH
         ;
       else
         JOBS=$(expr $(nproc) + 1)
         MAKE=make
+        PATH=/usr/lib/ccache:/usr/lib64/ccache:$PATH
         ;
       fi
     - echo "=== Using $JOBS simultaneous jobs ==="
+    - if command -v ccache > /dev/null ; then ccache --zero-stats ; fi
+  after_script:
+    - if command -v ccache > /dev/null ; then ccache --show-stats ; fi
 
 .native_build_job_template:
   stage: build
-- 
2.26.3


