Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E47F23EF1B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 16:38:21 +0200 (CEST)
Received: from localhost ([::1]:57608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k43Vk-0006pR-7p
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 10:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k43Ud-0005ri-4M
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 10:37:11 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:56161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k43Ub-00069V-AK
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 10:37:10 -0400
Received: by mail-wm1-x343.google.com with SMTP id 9so1927833wmj.5
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 07:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fCOVyLdqVtKSsWNbc0T+BBm3CTamErtvndTy/IMMtbU=;
 b=UfhM3gVzZ4bH36VUIZHgvu33LYV8JJqfnjQ0IP2dOqrrHL7WGDdDhaXX2HejaObFS3
 vIjgRfjiDwUbL22seE3GpAZmIUeozR/U7/ONzR1P2G7TW69duojDcj8grGL/xZYqHsTf
 Dp45Ii0wsAW8oT6g8gmtTIZM69PELafzVBV/CG956bh3r88Pmbu0XkLvXa2u7dTxkEjU
 I5C+E1v53n+u52ceRzEp4TWEIFw8s7H1gQrWI69tizk8THFRGpCU3Ol1IQTFr1K8S6tc
 Fshu4bcBlddG4wMxONcm9N4i+NAhCZPRD7K5otiUp7VRTkQMsPygzgc0Hvuj+AiZszQj
 YllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fCOVyLdqVtKSsWNbc0T+BBm3CTamErtvndTy/IMMtbU=;
 b=dtWbKSIij7n6joGjiagpZwbpDgcNDmk1fNB3/Yl1m2xEDZmGhr6S5MOYwohOtpRzQ3
 pFr25tOhW/rPTrx/l3unMMfoRP1T/lCYSqM7e0D4z5AuqAAgQIeTEXxfH6kr43NTN43e
 YLIUXrJvwhP7fgf4CXE+eD5+YJOreGqKpCdxWD5sSUr3Jdz7fQKyiYqPwXvAkE3T0XMV
 nzfOmAmTZXjUZdBYwABIogK1z8bP+yCBHwFJR/gf5qpwl95cUCX7ieqM4BeNLVtfqsT3
 T+o+qy7dO6w0iPfSz8UOdFek5Btia6/2dk5fZWrVh9fqWQRZS4Ky6v4wrgSP1cHXANIt
 XsWg==
X-Gm-Message-State: AOAM5323irGCbwehe1vvsk2eC2inJQdDc5hlaIQv0FfKYBTKjH73sSzg
 CUVV4RHXopU8Jt5VgtE0Nf5KgnLE
X-Google-Smtp-Source: ABdhPJyr/sXEi7TCbgOEMsTm4TQLMBB0HlCEnX9KV0/2FS0aglFVK0ykHprnLnt0qvFZ0vWv6npgpg==
X-Received: by 2002:a05:600c:c7:: with SMTP id
 u7mr13639999wmm.135.1596811027192; 
 Fri, 07 Aug 2020 07:37:07 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id v8sm11033302wmb.24.2020.08.07.07.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 07:37:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 0/3] hw/misc/unimp: Improve how offset/value are
 displayed
Date: Fri,  7 Aug 2020 16:37:02 +0200
Message-Id: <20200807143705.30066-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series aims to ease looking at the '-d unimp' output reported
by the UnimplementedDevice.

- read/write accesses are now aligned
- the value format width uses the access size
- the offset (address) uses the size of the memory region it belongs

Philippe Mathieu-Daudé (3):
  hw/misc/unimp: Display value after offset
  hw/misc/unimp: Display the value with width of the access size
  hw/misc/unimp: Display the offset with width of the region size

 include/hw/misc/unimp.h |  1 +
 hw/misc/unimp.c         | 14 ++++++++------
 2 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.21.3


