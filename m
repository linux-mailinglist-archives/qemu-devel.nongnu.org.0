Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07112444446
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:07:19 +0100 (CET)
Received: from localhost ([::1]:47208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHrC-0006n1-4K
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHot-0003Dh-GB
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:55 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHos-0000SS-1h
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:55 -0400
Received: by mail-wm1-x331.google.com with SMTP id 71so2203726wma.4
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gfk0HUN9ze4SJjJgo6PiF6eooVZ7u9fwxLyfj7EmvVs=;
 b=cwBlsxebqUmUCr/60S8o0azg/KQHAWZgRd6FwXyJhLQJVItZhbkkMdj8XxZKtd0hGA
 gi977r6trewOscUUHRhYKHY180BnE/4Gjhg+P9UwgItTpZ0aHmDhaFSK9+OnZoUqAisE
 oDJc5OzS1rFvemxtzdtCXU0PxcI8I3B8WObG3EK89kngfpupZmK4hW27g5FkOiP30bvH
 H36P66OufDxkXF0ZhYdWYvpGwisaMzjh1OdYxazYTbD8JNgB/LsqgxN5HLGD+diN6gyH
 sIuOC8EXHdAF5uK5RHUtnQwFWh7t+cQaZ9Hwp6z87z3nGrVREz8upGMNiohxoKGeqprX
 ZYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gfk0HUN9ze4SJjJgo6PiF6eooVZ7u9fwxLyfj7EmvVs=;
 b=tv0AOq9nDKsFNUQ8WP2e7DAzS4/Ok8FOmbRjwOmAjkdaESkGeMqdKS1oY4dWaOY+SM
 MzjyZCagEIsZiW5T6RbqFPbzfMYlijJLHqiHrTLK4dC9vKJruuCo7IfPb+8mZT+C0vEo
 1xnNxt+Jp+3Cv++K5wLcg2T9pjXfIREBHpbV3MYU4g2BzuBv0i86NMbI7uOhcOZw1K5G
 D5gw3AyxJZndtR6LskMrdvTh9ku78v6qzliu8sY4942OupVPfwWPtOLOUAa5Zu/OHLMJ
 4uw+jBdsSCaTyQvK0Z5xOqCeiIKTSaHfNnGGFFKt4K8nvi4PrXVWl8O3xWdeetIWcB3+
 WWBQ==
X-Gm-Message-State: AOAM533MRaPIPPC+cFVPvycUuxj/JRZYY+SHYnzbkqFZBppkgyloe3mN
 62WeWR0Mxa/mN8l0x+EGBljExAl3lPU=
X-Google-Smtp-Source: ABdhPJyqMALiwilbNNoYMzYeJpa5VvDTA4MtztEYxKVb6vMf8X+XKP9DYxHlVxqXITqRvy5JBPnsxw==
X-Received: by 2002:a05:600c:3b28:: with SMTP id
 m40mr4556193wms.100.1635951892124; 
 Wed, 03 Nov 2021 08:04:52 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/27] MAINTAINERS: update location of microvm docs
Date: Wed,  3 Nov 2021 16:04:21 +0100
Message-Id: <20211103150442.387121-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Fixes: e8eee8d3d9 ("docs: Move microvm.rst into the system manual")

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211012151447.4147923-1-alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 310a9512ea..5455ff4179 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1609,7 +1609,7 @@ microvm
 M: Sergio Lopez <slp@redhat.com>
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
-F: docs/microvm.rst
+F: docs/system/i386/microvm.rst
 F: hw/i386/microvm.c
 F: include/hw/i386/microvm.h
 F: pc-bios/bios-microvm.bin
-- 
2.31.1



