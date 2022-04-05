Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD90F4F299A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 11:47:40 +0200 (CEST)
Received: from localhost ([::1]:51142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbfml-0006wt-Qm
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 05:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbfT0-0003G9-A5
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:27:14 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbfSs-0002vu-1I
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:27:09 -0400
Received: by mail-wr1-x431.google.com with SMTP id d3so7526994wrb.7
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 02:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ljO+cAdYFAzNeekbMGXlqD4Ycub0kBMsKwkWirsXUSE=;
 b=X4qtK6/9ayGXlGS3/ImgO4+UctbulaMVt1pZHfrVr8Ey4BwAQ0QrVR0MkyrTThsYfz
 CtvjCKKqW2KdUa4kK6xvkKQP1iSXFjPqG8ulayOX4pZ8sA2gm0pS4UrPTcK3pEm+wmqH
 urfUHaHYHmm8cRmuZKMBJVUEXfO+T2meKVaSYjmSFNkgAtQkDpSwa+KDT5OlsnjTey4D
 W6FlgDToeYDgztezz2FzM6qx6/PoxqcgeJtBQw/+SS4nDd/i5p9zikGACrAtzYibDTtt
 51/CeaUF6xOMsyW/4rmKwLqwLSe0aECDbAk5u+H/3bvtpStCPSIwScmQ3FdTbc5XTjJb
 upew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ljO+cAdYFAzNeekbMGXlqD4Ycub0kBMsKwkWirsXUSE=;
 b=OXXc4E5/phpNbw2tBy53GZmdn/TRUfhiOOXm+bthgI6EBqL4HRvsjvkGX2eVD052vn
 bXxh64r+0D3UqI1j/nuAAz58jcWMN3sk6tTscYwyaY3XpB7whMnxF3ng5sGWdOB3Oc3o
 sIZ8+DhcyYfvWZ5kxrjT36LOP67qnnNwS36Xu/IXLLwLnGVoRXkOEGUgijzD5UrgaPBT
 REwxVy10dXK4cdRVPz9pX9/X31gqs4pcBsha9mug5dlsiu+aylj+UZQFvqBHTZvcjKd8
 PrggnvJNLFkarenp7IlOrMw+MlktgeXpIeJemKOcuDc4evhzmYruEoQ0RtRWWwT2BtIM
 PAdg==
X-Gm-Message-State: AOAM532QUkr0N03MMjwpaukZR+jUOtyLAQITLUY0QowYssF4k64/iAtW
 lq8Zc4zxNJpghOMaWiAyI9dk7IzRgafU6Q==
X-Google-Smtp-Source: ABdhPJx4sRrxzNXUEVne/q0v/OFauOw21Jod15qZXEzsBu1VLqqItA6fIGuhGPyrb/aMb6rZQZXwzg==
X-Received: by 2002:a5d:5545:0:b0:206:1685:ac61 with SMTP id
 g5-20020a5d5545000000b002061685ac61mr1943508wrw.53.1649150818639; 
 Tue, 05 Apr 2022 02:26:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a5d6c6f000000b002040552e88esm13467159wrz.29.2022.04.05.02.26.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 02:26:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] docs/system/devices/can.rst: correct links to CTU CAN FD
 IP core documentation.
Date: Tue,  5 Apr 2022 10:26:51 +0100
Message-Id: <20220405092651.725041-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405092651.725041-1-peter.maydell@linaro.org>
References: <20220405092651.725041-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Pisa <pisa@cmp.felk.cvut.cz>

Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-id: 20220402204523.32643-1-pisa@cmp.felk.cvut.cz
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/devices/can.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/devices/can.rst b/docs/system/devices/can.rst
index 16d72c3ac37..fe37af82237 100644
--- a/docs/system/devices/can.rst
+++ b/docs/system/devices/can.rst
@@ -182,7 +182,7 @@ Links to other resources
  (5) `GNU/Linux, CAN and CANopen in Real-time Control Applications Slides from LinuxDays 2017 (include updated RTLWS 2015 content) <https://www.linuxdays.cz/2017/video/Pavel_Pisa-CAN_canopen.pdf>`_
  (6) `Linux SocketCAN utilities <https://github.com/linux-can/can-utils>`_
  (7) `CTU CAN FD project including core VHDL design, Linux driver, test utilities etc. <https://gitlab.fel.cvut.cz/canbus/ctucanfd_ip_core>`_
- (8) `CTU CAN FD Core Datasheet Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/Progdokum.pdf>`_
- (9) `CTU CAN FD Core System Architecture Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/ctu_can_fd_architecture.pdf>`_
- (10) `CTU CAN FD Driver Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/driver_doc/ctucanfd-driver.html>`_
+ (8) `CTU CAN FD Core Datasheet Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/doc/Datasheet.pdf>`_
+ (9) `CTU CAN FD Core System Architecture Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/doc/System_Architecture.pdf>`_
+ (10) `CTU CAN FD Driver Documentation <https://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/doc/linux_driver/build/ctucanfd-driver.html>`_
  (11) `Integration with PCIe interfacing for Intel/Altera Cyclone IV based board <https://gitlab.fel.cvut.cz/canbus/pcie-ctu_can_fd>`_
-- 
2.25.1


