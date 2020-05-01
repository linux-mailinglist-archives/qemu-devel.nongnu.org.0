Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621421C1F6B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 23:15:07 +0200 (CEST)
Received: from localhost ([::1]:51972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUczx-0000vQ-Ql
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 17:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUcyk-00087f-Q1
 for qemu-devel@nongnu.org; Fri, 01 May 2020 17:13:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUcyj-0005Lm-Lt
 for qemu-devel@nongnu.org; Fri, 01 May 2020 17:13:50 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUcyj-0005DR-9D
 for qemu-devel@nongnu.org; Fri, 01 May 2020 17:13:49 -0400
Received: by mail-pj1-x102f.google.com with SMTP id t40so396910pjb.3
 for <qemu-devel@nongnu.org>; Fri, 01 May 2020 14:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+7aO59CuVkObP6ThafNRJqYigrwtPnCK3YSB5MRD++Q=;
 b=cMxb3nmY/PRrJU5AfOTMhNaReRkF7XPHuepRPppTVoDMU95gsfy9BWyJzCNrfYHlHM
 8aDD8GsCo8rwBfusakfpJEE0MRJVI4VA33alNAn8kgntu7I2UAZRf++rMJdIuBLYSCbi
 OvVuif/xhUxBtPdkYiPZAIJHB8dKgiBOdyeUMFg00bjfJQkRcTHMiS/ZL/umrL6SbSGw
 fCOLcH6UyoepnsN0K6S00saPZmw+DmlzhvYwEnd5v1Q5/PgOak0IN92XKuUY3DmK4rNP
 mWNiywB15bv+D/j1ounn6fsjN9V6NyIko08yvFX8YccXjwXED9wQTALtvzouvJ0/W6ly
 JD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+7aO59CuVkObP6ThafNRJqYigrwtPnCK3YSB5MRD++Q=;
 b=QMb2zpXl/z72mM7jETRaoV1scrlBqeXZyfB2PFAAaxIVVLsLai+fbUtjBetnqL4kEq
 ZJo5ZuaRA6DW7u7vv+G5r77ML/bVPNN3KP/BhUw5PX+5TNAEHFTRjcmdLah7Tjj0rCnK
 6nHS5d/AfCpO4h0D3WFDDbfcOA+UTcztJm6Zu2sayXt+zs1IgXVVSpQbLjx8c7c0DquS
 kN3CP/Iuy2pjTHSPXw9tgkQvYWYmpWFqx4U0XRUaJZU0tvD5QtrzQJ4PwjiDhVtv2fZ5
 reR1goe0Z2qh4Hg01fSQQNlGx2Jw/CINOmAyAr+tRGrbL8RSrslkXmFyPbUWNNLCILxt
 YIQg==
X-Gm-Message-State: AGi0PuZNCFSxBw7XQgpfjg3KEcBKWOHoarPk12KHQe2aKnCDfyLhp6XF
 UvV7EjfCI2KJHyKmulYO69ee0huJWjc=
X-Google-Smtp-Source: APiQypJtS0rFUo3y+jXGds+2SW5UiDNkmEkZCclIpO/fRpciPZ+wnju5u9ezjTZjCDmib3SMExVI3g==
X-Received: by 2002:a17:90a:db83:: with SMTP id
 h3mr1740507pjv.87.1588367627266; 
 Fri, 01 May 2020 14:13:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id g22sm514552pju.21.2020.05.01.14.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 14:13:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] target/arm: partial vector cleanup
Date: Fri,  1 May 2020 14:13:39 -0700
Message-Id: <20200501211345.30410-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::102f
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is not complete, but shows the direction I'd like to go.

It may well help what Peter is doing with the neon decodetree
conversion.  It may be helpful to apply before the conversion
in order to reduce the number of special cases.  As may
continuing with the cleanup; I'll probably work on that more
next week.


r~


Richard Henderson (6):
  target/arm: Create gen_gvec_[us]sra
  target/arm: Create gen_gvec_{u,s}{rshr,rsra}
  target/arm: Create gen_gvec_{sri,sli}
  target/arm: Remove unnecessary range check for VSHL
  target/arm: Tidy handle_vec_simd_shri
  target/arm: Wrap vector compare zero GVecGen2 in GVecGen2Fn

 target/arm/helper.h        |   40 ++
 target/arm/translate.h     |   39 +-
 target/arm/translate-a64.c |  102 +---
 target/arm/translate.c     | 1074 +++++++++++++++++++++++-------------
 target/arm/vec_helper.c    |  113 ++++
 5 files changed, 903 insertions(+), 465 deletions(-)

-- 
2.20.1


