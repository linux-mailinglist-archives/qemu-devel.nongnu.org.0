Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DC53498D3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:58:19 +0100 (CET)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPUFO-0001X2-DO
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPU83-0005kP-5E
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:50:48 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPU7v-0004ov-M5
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:50:42 -0400
Received: by mail-wr1-x444.google.com with SMTP id c8so3145046wrq.11
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 10:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eyxVLi3qklA4+DC3CZYA5cHRvLWYkhKrNl7/VhKt6xI=;
 b=Ht5IgYu/SeGUHKDdhYbtiQ1lGQ9UaphCJZvO7BXQzMu854k10BoT8v942/A1BmeHgS
 W/d4yVWfdR38ROI2maBMTMHVlN+Jky4S9AAfGl+Bq/i9UvSOyWDKYXF1tCkyk0bOUjmF
 /OPEIvsL+VyZaoBkZRuLVaA70LT0Fy4EWsRSz6oX6h5brsuTkbu3oL6jbQ9jgmWT+Vs6
 tTnY7shQ1swA26gZ54t5x7ormJmXewQJJnOSHZavjyrfP5StD6qCci1bal6zCd1bKDRS
 nNrjvScEpF/bgKXKt0NwOAgcQ5CMcg4FxDhEAu5fGAzRHsmrpRLi6xbY5EzXeoJ4hSlP
 JMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eyxVLi3qklA4+DC3CZYA5cHRvLWYkhKrNl7/VhKt6xI=;
 b=X1Nj2v58TIt6ACbxeq9uzwlxpGOufuA3w1q0r/tqRbMMup7eEbq4EGx3UmTBO2WwbN
 QLfZWQ9AhdDqdlUvzKCXiSiMfW6CqUv4YKk03lq+34JfHRqdIvXx8WgBaYjZJGqLBWVk
 Vgw1tIW+N3RQkWsGN+aURyM2xqPSU7edSZmVL3WQKbd7SpUiBaMlC49f8aMcenlAgnXo
 Ex+6E/EgfU+XF2350jaG/mlgm8yId6zx9PpkE/ox9vn8YiidZ/J+wjffiEhzkyg3Uqbu
 DZsteO5IHMUoxMhVgSRmIJctkznWWMF/Wp/UZVKJ6+9f/AD8J+mN+uC9P4yVe4MUfSUg
 W/Pg==
X-Gm-Message-State: AOAM531K/kLacAdH0XEJBbSXz0gFnzQYmAJT0JhhJvMmfU/jvkiv1mLK
 LwI0BQB6AG3QtfN1Eka6URC4ZpnOuP8H44uH
X-Google-Smtp-Source: ABdhPJyzF0qvTqSLt1di7+XFRIuUzoWcNETv9ZGlFZ4xMs/7rDfOKjIfdfVRLcsONIWh3eNvEnTZKQ==
X-Received: by 2002:a5d:564b:: with SMTP id j11mr10444997wrw.326.1616694625309; 
 Thu, 25 Mar 2021 10:50:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s9sm8180794wmh.31.2021.03.25.10.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 10:50:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 0/2] document gdbstub debugging of multicore machines
Date: Thu, 25 Mar 2021 17:50:21 +0000
Message-Id: <20210325175023.13838-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The way gdb and our gdbstub handle multicore and multicluster
machines is not very obvious.  This patchset adds some documentation
of how to do it. In particular it gives the necessary runes
for how to get gdb to work with machines which have multiple
clusters of heterogenous CPUs (that's the sifive_u board, some
of the MPS2/MPS3 boards, and the Xilinx one).

I don't think there's any way for the stub to tell gdb
"I have 2 inferiors, attach to both of them", unfortunately,
so the user has to manually connect to them. (We should talk
to the gdb folks to confirm that and perhaps suggest protocol
enhancements. For 6.0, at least let's document the current state
of affairs.)

(We noticed the lack of docs as part of
https://bugs.launchpad.net/qemu/+bug/1921092)

thanks
-- PMM

Peter Maydell (2):
  docs/system/gdb.rst: Add some more heading structure
  docs/system/gdb.rst: Document how to debug multicore machines

 docs/system/gdb.rst | 63 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

-- 
2.20.1


