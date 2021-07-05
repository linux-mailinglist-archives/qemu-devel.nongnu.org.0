Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EAA3BBAAF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:01:01 +0200 (CEST)
Received: from localhost ([::1]:52480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LPQ-0004V1-R5
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKX-0003fn-NA
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:57 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKV-0003uE-7h
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:57 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso8761773wme.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 02:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0sd/45pTyRCpyPpkUCatbJOK3VrDsW8ogT/cMj7D1pc=;
 b=BtBfHv1c2pIjUYj+j2411a20+KK4KbfB4jCDqkSKJ5zzIxboOSmy5VT5Mn3fcfpf4n
 v3V8MtcH6LGq4sjoE52FsfvNVTuzm+T8dGFvUXueWtHJRoIAP62i7cyedVlrqPJNrFiO
 W3YgEtAPn2HgvkmRiG1wUA0XY36KVUn57vsE+In5s3WjoEAaBvbcJWRjHhBPcWjn+rSa
 r6IFDtunGazb/JyyrabTUHynS5YXOoNrs8b+Lsvxby0LVpYMregYvvdORGQ/vBW8CaQf
 jcdlW0FLPNan54uQGOqqhwd7KNBCM+sPRFmzuC6edX4avZvLgtWZDVwQkBPNxuL+26Ju
 8HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0sd/45pTyRCpyPpkUCatbJOK3VrDsW8ogT/cMj7D1pc=;
 b=CvbqtWN5Vm8ajTsZs3gDk6n4RHcrrZ2m6usYaDR+7QQC04jONYY9AbbTzA7sZ4tu8o
 zs/tued0rab/5nUNvhwDuYhjTliFIeqEoDUd/r2xPAG1LZoR8tbQgwbSQr+8fhtEmBb2
 VOs/xGQa0Sudyr+/mlZuyfPdOGeuGXL5tfWgqW+3quSAo5LoFmeufTigdkQyuyaN8iTd
 M5KnhruJZsUSlAq6c1/X0nPo0J4FYnDrrO1fc+1si0pxey49iHdAS+/pSFbmcZe3oQz0
 o67BGY45RVVp5sk8nbOVcyR1T5MUeiskcRXK/lP3ashdABPqgE8QdTPVrfeY6pmlou2i
 SAew==
X-Gm-Message-State: AOAM531mQ6lr0KapSJs2y1nNBlEr7YcpTo6dFyVA+Sntho4gFNBS7zK6
 VYVwskKEefbUJm4mkpSvltAsczanXkLmlQg/
X-Google-Smtp-Source: ABdhPJyDyJDGy4s2XQOnmr9VEWBbq0J/AIcPoDpiiXz6BKYhsyPG2TYLZv56NP5nK1FMY9d5Rr9ErA==
X-Received: by 2002:a05:600c:2047:: with SMTP id
 p7mr14355615wmg.34.1625478953837; 
 Mon, 05 Jul 2021 02:55:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i5sm12528727wrr.4.2021.07.05.02.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 02:55:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] docs: Add some actual About text to about/index.rst
Date: Mon,  5 Jul 2021 10:55:45 +0100
Message-Id: <20210705095547.15790-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705095547.15790-1-peter.maydell@linaro.org>
References: <20210705095547.15790-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some text to About to act as a brief introduction to the QEMU
manual and to make the about page a bit less of an abrupt start to
it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/about/index.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/about/index.rst b/docs/about/index.rst
index cd44456a6bf..689a9861dc3 100644
--- a/docs/about/index.rst
+++ b/docs/about/index.rst
@@ -1,6 +1,23 @@
 About QEMU
 ==========
 
+QEMU is a generic and open source machine emulator and virtualizer.
+
+QEMU can be used in several different ways. The most common is for
+"system emulation", where it provides a virtual model of an
+entire machine (CPU, memory and emulated devices) to run a guest OS.
+In this mode the CPU may be fully emulated, or it may work with
+a hypervisor such as KVM, Xen, Hax or Hypervisor.Framework to
+allow the guest to run directly on the host CPU.
+
+The second supported way to use QEMU is "user mode emulation",
+where QEMU can launch processes compiled for one CPU on another CPU.
+In this mode the CPU is always emulated.
+
+QEMU also provides a number of standalone commandline utilities,
+such as the `qemu-img` disk image utility that allows you to create,
+convert and modify disk images.
+
 .. toctree::
    :maxdepth: 2
 
-- 
2.20.1


