Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8395839A3B8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:53:38 +0200 (CEST)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looj3-00048O-GF
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loohB-0002QE-WF
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:51:42 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:34586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loohA-0007zY-DZ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:51:41 -0400
Received: by mail-qk1-x730.google.com with SMTP id k11so4522456qkk.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=abONsupSO5clpC0+0l64f+dHa6QMf4Z2qdBok+pvNkQ=;
 b=zfQQJ8g2N4e79mMdV2BO5e82rYGG8KIzXLwkPTbr4gp9ejE630wDwn1EhyV6Y32YgN
 An4Nswo6uhRqUyztljCY6rUhLXZ9PSyUHa8uIg1+gmIFyQhDTpcVS/ZAHRQc9Gz3ithF
 2Z1wcMJquDrjUdA5f8f6RtuW3wMe/6n5DRiKayYdqFQON1kulAsGPpAeyRl91BBT/Lkp
 YT7ljw4XfaXgxtuB63kwbb7uwmjprZCnQbbSOBnFE5yt7Iqw143HKSETn08x1XT6eo0j
 q6eRl5NKU75sSAdJgAT9LpuBSUw0P3ZzRgTZUfAIb4ty1d3OA2c+iFHB7R/VGg/L18UE
 ntSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=abONsupSO5clpC0+0l64f+dHa6QMf4Z2qdBok+pvNkQ=;
 b=ROoF7FsIjTir0of5HuNn9VYn+Yd+ZO+tR53YKaS+5S+MwodLObrkNJXXI48+2XMKIT
 ztLRD7luUekeakfv06kCTjgPLRUIDn8omx+n1HLBFn+cZulSrIeI16o5CtY0nscnErhh
 bxgLeqRaEaQ0Ym8GEoQCVJSHY6BoZk1Y++RTMyvBvreFtf8u9mgpNEoBK2w9wWrxYIVY
 SDDW1ohIzRrALMUzLfySJNnqe69fnOJxhRlpWf4c99GK36YRYodY781BYzI671E1O7Nm
 tqwXL2Ne4BhpHolL5l9SLPANCJiiLTQLo/SZnxSc4sjM5HdKfhZsxA2tWHG7PzH3b0/F
 +1/g==
X-Gm-Message-State: AOAM5310QO9NRhkLfFN4BRGw16sIwn5nSwcUpnamqXhNsIQ3TToP9jYF
 e4712/YOTT4Tb8uUsiwDaJNXTQ==
X-Google-Smtp-Source: ABdhPJyORpFMpd/25Lzwrf9ARbd2U8I+Af5lrYK9YYNnjJAG/jj3opI2Fyy3tv5asdxzRkEZVajOAw==
X-Received: by 2002:a37:7345:: with SMTP id o66mr33305786qkc.201.1622731899285; 
 Thu, 03 Jun 2021 07:51:39 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.googlemail.com with ESMTPSA id v8sm2045099qkg.102.2021.06.03.07.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:51:39 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v1 1/1] tests/data/acpi/virt: add IORT files for ITS
Date: Thu,  3 Jun 2021 10:51:38 -0400
Message-Id: <20210603145138.5851-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x730.google.com
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added expected IORT files applicable with latest
GICv3 ITS changes.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 tests/data/acpi/virt/IORT         | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.memhp   | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.numamem | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.pxb     | Bin 0 -> 124 bytes
 4 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
new file mode 100644
index 0000000000000000000000000000000000000000..521acefe9ba66706c5607321a82d330586f3f280
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
new file mode 100644
index 0000000000000000000000000000000000000000..521acefe9ba66706c5607321a82d330586f3f280
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
new file mode 100644
index 0000000000000000000000000000000000000000..521acefe9ba66706c5607321a82d330586f3f280
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
new file mode 100644
index 0000000000000000000000000000000000000000..521acefe9ba66706c5607321a82d330586f3f280
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

-- 
2.27.0


