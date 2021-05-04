Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332FB37286E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:05:56 +0200 (CEST)
Received: from localhost ([::1]:41142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrwB-0005Hf-7I
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrsq-0002KF-Tv
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:28 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrsp-00032A-3o
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:28 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 p6-20020a05600c3586b029014131bbe5c7so887374wmq.3
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tLKjqMKIjh3YXoNizCAFrfsiNgZ3bBB8hCFaWw47VeQ=;
 b=S2L6lmg7CpkdVe79ff74KQGmnejFXTFQtzLhw3gcCV3xmONWFEL9MIyKoTQIL4X/ni
 skzESoBgRRiqzghGjEXEzK44/Nt3J013HmRM7RDtnPhrwkebyRI45uBe9EYD1QEZ3nbt
 o2SEWG1kVqktCNlrZIqh1T55V3q6xzZpxh3TcIXgJC7t1vY6pvy8J+sClbACFJ9lO+j/
 QXalM3HczOOzXH6Bi416oVd1zDMG90HZZBOdQqNtClop5syAXfGKGbXlSEy4ogunuo2T
 oX4CDKUGQLWk1wryigBTX8P+vOH8CSWwwidD06l9L7qdhYJlwG2VuoyJ3KB3OSIsXlGU
 jmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tLKjqMKIjh3YXoNizCAFrfsiNgZ3bBB8hCFaWw47VeQ=;
 b=Ner2NkZIZ7VcGesGKDTSF/dfOjbVSxkolG5cDJ03hcrjFruLy2Gu+lLgMw5eiGIX79
 s2Gsukq3tNv03dCewL5Dxt9NfpEjSPMTPqGY6+xOI2vLzGwEYhKn5E1YoQX89f/OZw3I
 svRyajW5baos8UxquoTCVNqFdx/qWYI2RP5ld90JytnzEVtA2iYPjhjoYNM/L74PWb3X
 17XVIByK6YfoUp3CUHZ3uPSL8ecglkYTgt6sEcWKEU2VUyetTAFFbTcuWuHNr5XgMFvu
 ABxh14v2gGk3lXqE25qv0jsvi2roVL97st9OC4X6HM4/trEikxO6qs3iI95dIQvgdEOP
 lytg==
X-Gm-Message-State: AOAM533+IrWhdSaElQC3rLJgkhUdWMlsks3RF43PdFqBcgEyxVU3c9v1
 andKyraKUbucwaoCQD+soCqFCg==
X-Google-Smtp-Source: ABdhPJwmYxvsM2AeWV7Vv/uf9D0GS114IboRhfZ3tDmdBmNw7buBySQ/bahU9MfPEzkznfrNLkBBKg==
X-Received: by 2002:a05:600c:4fd4:: with SMTP id
 o20mr3160245wmq.166.1620122545627; 
 Tue, 04 May 2021 03:02:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 61sm16437959wrm.52.2021.05.04.03.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:02:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 957941FF87;
 Tue,  4 May 2021 11:02:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 01/30] checkpatch: Fix use of uninitialized value
Date: Tue,  4 May 2021 11:01:54 +0100
Message-Id: <20210504100223.25427-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: fam@euphon.net, Isaku Yamahata <isaku.yamahata@intel.com>,
 berrange@redhat.com, f4bug@amsat.org, Greg Kurz <groug@kaod.org>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

checkfilename() doesn't always set $acpi_testexpected. Fix the following
warning:

Use of uninitialized value $acpi_testexpected in string eq at
 ./scripts/checkpatch.pl line 1529.

Fixes: d2f1af0e4120 ("checkpatch: don't emit warning on newly created acpi data files")
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Isaku Yamahata <isaku.yamahata@intel.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Cc: isaku.yamahata@intel.com
Message-Id: <20210408164610.14229-1-alex.bennee@linaro.org>
Message-Id: <161786467973.295167.5612704777283969903.stgit@bahia.lan>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8f7053ec9b..3d185cceac 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1532,6 +1532,7 @@ sub process {
 		     ($line =~ /\{\s*([\w\/\.\-]*)\s*\=\>\s*([\w\/\.\-]*)\s*\}/ &&
 		      (defined($1) || defined($2)))) &&
                       !(($realfile ne '') &&
+                        defined($acpi_testexpected) &&
                         ($realfile eq $acpi_testexpected))) {
 			$reported_maintainer_file = 1;
 			WARN("added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
-- 
2.20.1


