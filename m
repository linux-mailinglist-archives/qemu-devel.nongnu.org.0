Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643033D3E27
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:06:51 +0200 (CEST)
Received: from localhost ([::1]:39214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ydO-0003H9-EK
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybC-0000Dx-LM
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybA-0005Yc-I8
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l4so3095833wrs.4
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7A3WGnkOs+qRthpwoEL0FOqFN/r46SG5xMOZzViNpoY=;
 b=XxpLtdpws22A0O6Qbyr3WLEh56h4QZZC7E4JQz/yK3wCGLCTAbhNLp+1Zj/jnZgCgr
 MERvIzDFhLO1ayYDTVZrVGkaEvfednhKm439eQXIh6p2In6/yYv1cEpSWm02lWbhyMwE
 Qa/k5Cn+WGA6eforPszjgymvV2M7wLeyXoggbAUZohx4q4bPFqqdwVHh+kVej4PtEn1n
 ss1kSViVRl/BqEBVrnNtgNz91tudLU+lMSpi7cEyzuhe86Lfy0rCtp0Yc6QvQF24sDko
 /iH7qOyOdr9sQ8rzgmzOStMFD5vU+LGYVPFa8xHw1N6Vc2FOpDujgT/8Ehp8h+b67Y9e
 Krzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7A3WGnkOs+qRthpwoEL0FOqFN/r46SG5xMOZzViNpoY=;
 b=iN77ZncBWq3Y/lEQ5+Cx56ZS26dRTU7am4udNgegXTj08SpIeKQcI5WDClP5qDmapO
 b1KIFf7d9VqYdPfiNkRxR0LK+AHr2zLzn+D+Dt4TGLpZ9zdGf6ZoNyxwy20TaIPFBR/D
 Oe8HFqqryiTWJ2JWDZ4mHhvCaa72RSv3Dy2xE3ZfTGYZKZjl+2TZcCxeLi5LS24Nf4V3
 o2JgsyRXzY+fuVj6PmAEmrEZM+rnO8A005F3f9tf/lcWvLf1g7VcxaTEVzVlUZBBbKsR
 qS5A2kibhr5gsTFIvkJvqgLARPF86opumAaXNOP15ULfO5EOpl1kOMQahd6s+eU4y4mX
 cCCQ==
X-Gm-Message-State: AOAM530rWa9u5DbUl/05bOgXKKdn6+PUsF8vf99Hrf5r4qcLve52Xhfr
 DEPZO/c/Rszu+cjdViPnzD5iBQ==
X-Google-Smtp-Source: ABdhPJzOj915DS/e6ajiyhnu2Hl1Tpymx8n+dTT3aHtZp6JNUKHxzFTIPHfLr/VOL7mlPkf84ivlaQ==
X-Received: by 2002:a5d:6a51:: with SMTP id t17mr2122244wrw.305.1627059871251; 
 Fri, 23 Jul 2021 10:04:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s4sm31617662wmh.41.2021.07.23.10.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1423D1FF98;
 Fri, 23 Jul 2021 18:03:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/28] gitdm.config: sort the corporate GroupMap entries
Date: Fri, 23 Jul 2021 18:03:35 +0100
Message-Id: <20210723170354.18975-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lets try and keep them that way.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210720232703.10650-10-alex.bennee@linaro.org>

diff --git a/gitdm.config b/gitdm.config
index 7378238c20..a3542d2fc7 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -28,15 +28,15 @@ EmailMap contrib/gitdm/domain-map
 #
 # Use GroupMap to map a file full of addresses to the
 # same employer. This is used for people that don't post from easily
-# identifiable corporate emails.
+# identifiable corporate emails. Please keep this list sorted.
 #
 
-GroupMap contrib/gitdm/group-map-redhat Red Hat
-GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
 GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
 GroupMap contrib/gitdm/group-map-ibm IBM
 GroupMap contrib/gitdm/group-map-janustech Janus Technologies
+GroupMap contrib/gitdm/group-map-redhat Red Hat
+GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 
 # Also group together our prolific individual contributors
 # and those working under academic auspices
-- 
2.20.1


