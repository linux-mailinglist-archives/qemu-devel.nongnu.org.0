Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C24342D1B
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:39:57 +0100 (CET)
Received: from localhost ([::1]:49160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNbpc-0004it-4q
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn4-00032D-3G
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:18 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn0-0004EF-49
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:17 -0400
Received: by mail-ej1-x629.google.com with SMTP id u5so14057817ejn.8
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CCjBtNHV/27BIqfm5dJoDvU/LJdm3qeSBui9tlj/n/s=;
 b=WH2HOUppdSfGcPB6C2W+jWVmQ4Wyzeu27UvxMoqs3QJzOcLQJTpQXTTTr/FSX7lGOe
 GZv08gknIjva5crlXW0uWLjkwmZyDXMt/BTS/XQzNwKnO1nTeucWITwrJiz9cRZsDEFm
 HGRS7bvzXQsEGpsYbGsOkmj3pTqVhhjQD8dDJCQNHtq69WeyjSBbdydcmiCG4xYbeIfP
 wgJ36SwP0v2/Ph1nz2zhCxR5zXEK7iSpHav9rWoEgVZ9hTXoAutNTMqZ9UHEznk8/nNt
 iTr+UbftlM7iHV0FX3dqZHGDyibLWiVR+GE5GXGBg537k9nkoETCtUAQqw/cS+pBoZ+K
 h25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CCjBtNHV/27BIqfm5dJoDvU/LJdm3qeSBui9tlj/n/s=;
 b=ZoRQ1ECGthf/jo0BjFUJOjg6VT3W+l0rUxgl9KmgCALARpeiE9i5bY1k4owA0Bn5M5
 O3jkhuDRPvrkbI1SU55zuzHEdVIV1WkthwkxyZWhg/KXVGOEn+guxciUABP+whjzhX5z
 5xGGHMGKolmGzE8EV2WXR7v8ltOWDyPaCdvYVHvKcdXrHhLHq/gR7MADZLEA0OACmcVn
 PLkxpQNUalvV/4Gt8Yts+YLvy8IJcTtIRCZfr3y41UoTMuhxghaIl+2immIHS12GFZn9
 oEXUV7/ntxmGN91lZIfKkijUTp+5psQXzcKUBvyZbA/TM60rp5yq01KD43Lk1morGFqn
 naaw==
X-Gm-Message-State: AOAM530NikgV1SQK/PBbKtfbnQknV4vyLHamuN5Cbp/BrnA/qtYJ3SaD
 pBoFjCwZBvrZPmsGBV0/OItxvw==
X-Google-Smtp-Source: ABdhPJzK3JMP514sh1Q8o0M3KUDqIJoOA6mBdczk6zUmrmCrZWEr3uOk7IxQM/KK8VYI+Rs64mfU4Q==
X-Received: by 2002:a17:906:1a44:: with SMTP id
 j4mr9883109ejf.401.1616247428722; 
 Sat, 20 Mar 2021 06:37:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id be27sm6288678edb.47.2021.03.20.06.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 06:37:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA0091FF87;
 Sat, 20 Mar 2021 13:37:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/14] scripts/kernel-doc: strip QEMU_ from function
 definitions
Date: Sat, 20 Mar 2021 13:36:53 +0000
Message-Id: <20210320133706.21475-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210320133706.21475-1-alex.bennee@linaro.org>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some packaged versions of Sphinx (fedora33/alpine so far) have issues
with the annotated C code that kernel-doc spits out. Without knowing
about things like QEMU_PLUGIN_EXPORT it chokes trying to understand
the code. Evidently this is a problem for the kernel as well as the
long stream of regex substitutions we add to in this patch can attest.

Fortunately we have a fairly common format for all our compiler
shenanigans as applied to functions so lets just filter them all out.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/kernel-doc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 4b19851b2d..240923d509 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1745,6 +1745,9 @@ sub dump_function($$) {
             )+
           \)\)\s+//x;
 
+    # Strip QEMU specific compiler annotations
+    $prototype =~ s/QEMU_[A-Z_]+ +//;
+
     # Yes, this truly is vile.  We are looking for:
     # 1. Return type (may be nothing if we're looking at a macro)
     # 2. Function name
-- 
2.20.1


