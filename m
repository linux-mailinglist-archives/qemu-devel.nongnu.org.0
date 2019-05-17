Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C2F21259
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 04:58:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRT4j-0003Bz-3V
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 22:58:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hRSmj-0005ap-K7
	for qemu-devel@nongnu.org; Thu, 16 May 2019 22:39:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hRSmh-00029z-Ve
	for qemu-devel@nongnu.org; Thu, 16 May 2019 22:39:49 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hRSmh-00029T-QN
	for qemu-devel@nongnu.org; Thu, 16 May 2019 22:39:47 -0400
Received: by mail-pg1-x544.google.com with SMTP id t187so2497690pgb.13
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 19:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cAffAFBxa4y/VVbarNUiRFSP9To260Z9zDP/Ls36OfI=;
	b=uAgKaDEMR61x2/ACfaSuPOgyTX+4MSjKW6lZwmQxxhJipOn3BON/CcwSuUvFPR93wb
	UHf/Q3Uj7eQaT0ewn030CGEDiv7if7C3IbRoKVs/6Vnr0VrtUkez6xL7Oj/wlAxo6Nwo
	v9797gCz8M2pdcDOT3Y2tOX0XoLrKaB/iI3u/oO5rAEYBSq9WXoGHZsswZ6RlCwYluET
	6QcdQ29J7MtUbL6javxS9Sg9V5V2unJxx8tUrn4MgWkoWLaPo1ssrW8S+aklpJw/K+dd
	UqqnYTVEHTjEGnluSPmUpmZEoPVMfDcPvt82IAZKk/uXYGcIqSu+h76VuL+clo31xApL
	fyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cAffAFBxa4y/VVbarNUiRFSP9To260Z9zDP/Ls36OfI=;
	b=YWT/ye5WEvC1IkSWlr7MPpyyWD8HX3jBNuFchEmR4VXthKmhzQrFHzvCQdfU5AGbJD
	9rzTaC4LF5xsake5ZMaVwhcJNa99WP/sJ1g4ExVUEWvR1WBSqoOuMTlexgUx4gGixoyh
	o97NblenBhxy2KwBGcOE+BU5sFI5Ucadty+BB/CgKCf2yvuiXWtehK4z3jRGhBKHtFjo
	EP+9Z3xXe2zec4SUumNw9mdzIeLgdZASFwE14WIa6wwLzdAuEIq/HFaaoDLLWPmm/ACD
	x3pwVGdFaQulOspQnvqnTrtAlNN3L7UvGjStR0xXCRhNJfFl1nYnTPEoAuJf1mS+z8c4
	Lseg==
X-Gm-Message-State: APjAAAUrfmaWEnTjOodK4xgD1b0znVc5YeNwb5TfxR1ESQ3cwxltmJq4
	ACChlOPMkPlJOF/5YZdbk1axt28MgB8=
X-Google-Smtp-Source: APXvYqzEPQlwpJvBtN0MlYlXjbaCTgi9x7dzs1Ub7okZ97jZNCWk2RxK42AkobKyEDmseA4LPiqbqA==
X-Received: by 2002:a65:624f:: with SMTP id q15mr54283982pgv.436.1558060786594;
	Thu, 16 May 2019 19:39:46 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231])
	by smtp.gmail.com with ESMTPSA id w6sm6984152pge.30.2019.05.16.19.39.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 19:39:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 16 May 2019 19:39:15 -0700
Message-Id: <20190517023924.1686-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517023924.1686-1-richard.henderson@linaro.org>
References: <20190517023924.1686-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v8 16/25] linux-user: Remove srand call
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We no longer use rand() within linux-user.

Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 66c909a1a6..689bcf436d 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -623,8 +623,6 @@ int main(int argc, char **argv, char **envp)
 
     cpu_model = NULL;
 
-    srand(time(NULL));
-
     qemu_add_opts(&qemu_trace_opts);
 
     optind = parse_args(argc, argv);
@@ -692,15 +690,6 @@ int main(int argc, char **argv, char **envp)
     {
         Error *err = NULL;
         if (seed_optarg != NULL) {
-            unsigned long long seed;
-
-            /* This will go away with the last user of rand(). */
-            if (parse_uint_full(seed_optarg, &seed, 0) != 0) {
-                fprintf(stderr, "Invalid seed number: %s\n", seed_optarg);
-                exit(EXIT_FAILURE);
-            }
-            srand(seed);
-
             qemu_guest_random_seed_main(seed_optarg, &err);
         } else {
             qcrypto_init(&err);
-- 
2.17.1


