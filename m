Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF17A3CC928
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 14:49:14 +0200 (CEST)
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56EL-0006fg-PR
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 08:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bk-0003kR-7N
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:33 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bi-0003WB-Kh
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:31 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso8723030wmj.4
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 05:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PU0pR0OKW672khxpwhM6PMfFvQvI9Lta/Rj8udQdKIc=;
 b=sfYuCXVX4FhdpOwe64kjwXh99edHMR5aYbeEJ0WhumWfy2r4Q1q/ED1K+zns5M4dsH
 Ft/jadRxQkdw/QGGjcaCRU3gi6X9R91WDZTwCSyF0Qr2/IyjyAom1KlEP37R/5SzEWaM
 +5FPtkldOhsT7/Y4/4Y/KyO8C1kD0O5qAfKpIcou4N6D9X+eYzcU9fjNgqxfsNhudzo4
 klcPwsvHa9PgfKHz3ldSIwyllKS1j13m1qq9MTIlCL564sJVmsC4qbOYNuzRdH9kNuxc
 eFqhj+cgoHhXlMhVo7FIuoQX7dAK9Gsrz79gLdnHBpukfB3Cqzt6hjwKE+sHNmzEMj0S
 yFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PU0pR0OKW672khxpwhM6PMfFvQvI9Lta/Rj8udQdKIc=;
 b=nNvF7HR3E78QuM4FVSmeb7QZGXmcpTDZUN2cpdyuyMpRdP2JmRUyQpem8wrRMZc0Op
 JOFy/DLQ/ju198tejlEerOOHm6+KTJs5vnZtQbd4ITfXUF8kVdkmLitL4LROAfoWZ7d/
 5cHyZijB0IRIFBK0gfFOmBk3fpwfPEtsfSwf5n2QYtUHzfNv98Stjv9MZlAbnjd5GnaB
 X51CUaBTKBs4VhB9Ff8t08BZVR13lw9fZgMaVH42Zi/uNZ94VMLNTpuxs3VDxwvGKJJP
 0EjOFNxcbOfRqhREf5K43Ad+S1hmV8aG4uWAb9v99MAlZsQTwf75r5Ymm8ojpe4za/aE
 RNSA==
X-Gm-Message-State: AOAM530tAbF8H5e6DoPzbuG7kKnDljq8BpSzJ0PmTwJQHsiiXTP0Gkgh
 H8IaewlYbaANssxt+qajvbszHSQvEwirmw==
X-Google-Smtp-Source: ABdhPJznbwhQbBWZCYx35IaoCz1NqaHmtbrDeIC73AiBvxFETh/+rO21oWQxw1DvB4Jk5uaoD9a9Fg==
X-Received: by 2002:a7b:cb53:: with SMTP id v19mr20672683wmj.127.1626612389407; 
 Sun, 18 Jul 2021 05:46:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l23sm4053391wme.22.2021.07.18.05.46.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 05:46:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/12] docs: Add QEMU version information to HTML footer
Date: Sun, 18 Jul 2021 13:46:17 +0100
Message-Id: <20210718124621.13395-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718124621.13395-1-peter.maydell@linaro.org>
References: <20210718124621.13395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a line to the HTML document footer mentioning the QEMU version.
The version information is already provided in very faint text below
the QEMU logo in the sidebar, but that is rather inconspicious, so
repeating it in the footer seems useful.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20210705095547.15790-8-peter.maydell@linaro.org
---
 docs/_templates/footer.html | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/_templates/footer.html b/docs/_templates/footer.html
index 4c15e17d2a8..977053b5415 100644
--- a/docs/_templates/footer.html
+++ b/docs/_templates/footer.html
@@ -4,6 +4,8 @@
 <!-- Empty para to force a blank line after "Built with Sphinx ..." -->
 <p></p>
 
+<p>This documentation is for QEMU version {{ version }}.</p>
+
 {% trans path=pathto('about/license') %}
 <p><a href="{{ path }}">QEMU and this manual are released under the
 GNU General Public License, version 2.</a></p>
-- 
2.20.1


