Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2200D2ECDB3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:22:09 +0100 (CET)
Received: from localhost ([::1]:42140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSQi-0001RA-5p
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSOd-00086x-Np
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:20:00 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSOM-00053L-PW
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:19:55 -0500
Received: by mail-pj1-x102b.google.com with SMTP id f14so1179961pju.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 02:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJcCqNbly+HuBFBx/VMoWDYh1LrAqFMypQIcCUsLO3E=;
 b=gqmPomGazmjZR/ZQSS60Ma8yPzAHWhGuR03yEsOmkg1NeuWHox1i37IvC7ivEGp2QD
 uW9QEYc4z/zei6A9JE6aAThEIsHiiAYcfyPDjaSiel1+I2djK7t7KORtDo/1e9NnZdQd
 KlkEkAU6DwH8hFz/GDd16ViS4JWgLmQ/z9OzEquF4dFtHHA45OJCcUMCsz9tv0yU+mqB
 kO5WluYTnzgpEGqncxe5dhC40swHygOUs0QDpqb8SOb30MLe4um2VG7WBbgTr7l9wSj7
 06tB7j2hlKJma0ru7UuxYl45DNaUMAj7l19Ch6mRxlDuntUSESrHUC5ojAyuWws/LiH6
 9J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJcCqNbly+HuBFBx/VMoWDYh1LrAqFMypQIcCUsLO3E=;
 b=Vgs2bN3xnRhh/wP8FbnySyZWPmMsO7vf3/nZOdoX0YM5iB6bkApzecaNSyvUfvfuUf
 PvDCQd2zZzxI8eKjURM7HrO0l/iSP7Ic5DzcibX2uIa8JY5f5e0AQ8ETw0BPLHSFlTWy
 ezY3er/zLhm4VWQ7WadpbHv07uzE+DnOKA1thNjSAsPLi+XAz1PwAeCtHXEmo3msjHaK
 UKsxpYWx+eOSmivv4svgEoaMjl1QhsfhTZ0NOvm9508XSiSI6j3D16W6U/rr7ePYEVVa
 CP6EGgg37j7XKIeoSy6pg/+/E+ZCJQpWYtHEv1E9eyQxlR3GwRt4n3R5vMKP1a5Og/4h
 5MRw==
X-Gm-Message-State: AOAM531B5ABapUhM+W18ZeNUaCl3r1RVFzLcItsQSswrc0EQgsHju63P
 /iSCBcZW0a2D0e/nxx5S6QxlJ1yR7Gn90dW/
X-Google-Smtp-Source: ABdhPJxwoqpUrLbF20CmKv8ukYcng1WKVZG2pw/Hh1kB+7JvRq7o0NPSO1M8NalgwKm/3mQY3DY+Qg==
X-Received: by 2002:a17:90b:4394:: with SMTP id
 in20mr8804400pjb.34.1610014781122; 
 Thu, 07 Jan 2021 02:19:41 -0800 (PST)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id s5sm4934662pju.9.2021.01.07.02.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:19:40 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] maintainers: Add me as Windows Hosted Continuous
 Integration maintainer
Date: Thu,  7 Jan 2021 02:19:17 -0800
Message-Id: <20210107101919.80-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
In-Reply-To: <20210107101919.80-1-luoyonggang@gmail.com>
References: <20210107101919.80-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4be087b88e..4d9df874a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3198,6 +3198,12 @@ S: Maintained
 F: .cirrus.yml
 W: https://cirrus-ci.com/github/qemu/qemu
 
+Windows Hosted Continuous Integration
+M: Yonggang Luo <luoyonggang@gmail.com>
+S: Maintained
+F: .cirrus.yml
+W: https://cirrus-ci.com/github/qemu/qemu
+
 GitLab Continuous Integration
 M: Thomas Huth <thuth@redhat.com>
 M: Philippe Mathieu-Daudé <philmd@redhat.com>
-- 
2.29.2.windows.3


