Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3133CC92D
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 14:51:35 +0200 (CEST)
Received: from localhost ([::1]:38602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56Gc-0003l6-Tg
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 08:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bi-0003jn-SW
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:31 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bh-0003VH-AP
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:30 -0400
Received: by mail-wm1-x32c.google.com with SMTP id w13so8614890wmc.3
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 05:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=z7J/rUuKm8358YHoVd/lSDxAvFrc+FuCzCDTJjoBxRA=;
 b=crHvPubY5bajnfvsBnOdrZUpX6pjDKM7n+9ubldtz6kWsSJYkegW28JAq/Gqj/UIK/
 4tvUBH8eC1phdchTmIY/o6JvwG42oAycQqAXD/WLBWGPr0fSO4KdA6hqVKfFhbPkoxf3
 5k0sfmEhiDY/jcVlqP75aVRG1foqH2g15XV1DTbkZiW3e7eMXp7Yh6wzYE1YGBi7++AB
 v0cyVCXmAwg2zQlcC6TNyoWkkjl6SjstduKfVURk0hL5nOpFPaszGM5DH5hFupeaqq0K
 DT4XHFaTsbcES0cL0tGvUZKqnO9WgIcMAxtpKWYIIy5uuMbzCd50nJNXZeyCVtbgdms/
 pogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z7J/rUuKm8358YHoVd/lSDxAvFrc+FuCzCDTJjoBxRA=;
 b=XbNcBpfCP8Ndz5y8asJiAdcbjcIjCsE8PqHN4fkHjdtt7ApecdjINefjCChKhDEaA3
 69Qkkm+1GsPVXhDmA1iNnnc2xTLiZ3wEetrhNHkuV1bEBmcBOPTmpryWFaZk54dE6OAu
 jIuRuNdw1GCD/1HbEN85zirhpj2R/PTiA3lYnqjoOZRoiLv+lroWFXzEl1kz+D4y80bD
 SfKhjsbfJIDvDjYUYkDcPemC0RwIM5LRSb4hgS+vw1QUBR+wc6a+mcGaprKsGUpoQUUD
 ALvAWcgtSWG9gRoVTDdXf3aW+9wVvgn5NzLgBojoFdgN1vqjurKNVERli6QvkM2XqPqV
 f3uA==
X-Gm-Message-State: AOAM530o0Bmofl7VmSzERtXMLioNHTqwBirnnVCaLXxr2GD595p2QQQz
 cUKs2ey6mxBA9Yrzy3IBCpEZ85ufnCMirw==
X-Google-Smtp-Source: ABdhPJweyBEIJfaN9tpB9p3VN6bQ1NpR16pGKj2YsOlFTlgrg7pC8ej/nmCRrIBMh5usQ7GQjoEfqw==
X-Received: by 2002:a1c:2782:: with SMTP id
 n124mr27973128wmn.114.1626612387814; 
 Sun, 18 Jul 2021 05:46:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l23sm4053391wme.22.2021.07.18.05.46.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 05:46:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/12] docs: Add some actual About text to about/index.rst
Date: Sun, 18 Jul 2021 13:46:15 +0100
Message-Id: <20210718124621.13395-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718124621.13395-1-peter.maydell@linaro.org>
References: <20210718124621.13395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some text to About to act as a brief introduction to the QEMU
manual and to make the about page a bit less of an abrupt start to
it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20210705095547.15790-6-peter.maydell@linaro.org
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


