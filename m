Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1B364B548
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:38:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p54W8-0001HJ-5y; Tue, 13 Dec 2022 07:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54Vq-0001ET-2Y
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:35:58 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54Vo-00062I-Ih
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:35:57 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 n9-20020a05600c3b8900b003d0944dba41so7832415wms.4
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 04:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=syOoJ6QfHbT1mHY1LElg19fus+7+qsrsI/XddduWUC8=;
 b=UXi1cOspPqeiEgmVJxV3WfL9DIpL6mXkrykjdbnvUZlOp2QQedqySUZ0WDcQQhewXn
 BWu9cWpuYp+0X5E/vWNxskY8GN0pE1vl7ELCIjn5tfbVRK4kxzb3r6g+SYrOa9t40zoa
 16CRd6K/DKv5R9NU+GK5A6mPk0yVImGxpVlhMD/ci8sgELdEcI8XBNGIqWuPnC+hnbtK
 iQP8IFW7PjDpIJT8kIBpwcLOuAIu3f3qP2JjGV9F3ngGkShhT2ENlen3G5C3AjKHfmO1
 JveXORRKF4Rgp406B+fv8I5VH0PL4LbUJXfC/JA/j7wNjfCHAOHDvWzK25QoGBqToSSZ
 xecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=syOoJ6QfHbT1mHY1LElg19fus+7+qsrsI/XddduWUC8=;
 b=MeXKHjYQhCpeXZCqT4ngiutXMN5e86szEsW9xguPXeUNtfxt1hXgjVy3NXP5pc/ANR
 AskqGezyNnYnRW058EeUs4ioWGdQNKGTWrFfg1NrMPA7223TuzNnpvLys7Xa6CYfImhr
 GlkleTH/4BKf5d7X2HiyfIaUO5YI//POhmDaHdePkzRqAc/BOXJujxP/7c42f/OeMX1N
 VfwirXT/K2i3AwjLD3OuEnJ0uStroFQT8GclWqIBCSBKnkHanV3FV8DW+fOCfLTSr/4p
 I1fAEsDXDPklwTXvkZuSicVgjUZNSkeLgokc0lyUXHW1ARK8UkcOw6mHZCkF3jFPvakZ
 ooYA==
X-Gm-Message-State: ANoB5plqz2xux5j+8g/iep7u/s2nTVQ8ZWiIC0kTTkqoFVe+em1UMMKc
 z5CnUTXFGuFxu7AxdpTqMSMoNXyiy7kRGM40rcc=
X-Google-Smtp-Source: AA0mqf6uF7F2Yuvg1b+t3XcONjrA6f9qOWU2/EU379zo/5X0RMjBNgXzCNjsLb2kAv/PAjiX4pX2rA==
X-Received: by 2002:a05:600c:805:b0:3d1:ebdf:d592 with SMTP id
 k5-20020a05600c080500b003d1ebdfd592mr15090720wmp.22.1670934953371; 
 Tue, 13 Dec 2022 04:35:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4ed400b003c71358a42dsm17514329wmq.18.2022.12.13.04.35.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 04:35:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 0/4] ppc: Clean up few headers to make them target
 agnostic
Date: Tue, 13 Dec 2022 13:35:46 +0100
Message-Id: <20221213123550.39302-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Few changes in hw/ & target/ to reduce the target specificity
of some sPAPR headers.

Philippe Mathieu-Daudé (4):
  target/ppc/kvm: Add missing "cpu.h" and "exec/hwaddr.h"
  hw/ppc/vof: Do not include the full "cpu.h"
  hw/ppc/spapr: Reduce "vof.h" inclusion
  hw/ppc/spapr_ovec: Avoid target_ulong spapr_ovec_parse_vector()

 hw/ppc/spapr.c              | 1 +
 hw/ppc/spapr_ovec.c         | 3 ++-
 include/hw/ppc/spapr.h      | 3 ++-
 include/hw/ppc/spapr_ovec.h | 4 ++--
 include/hw/ppc/vof.h        | 2 +-
 target/ppc/kvm_ppc.h        | 3 +++
 6 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.38.1


