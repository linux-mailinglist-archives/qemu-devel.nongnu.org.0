Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0A515B5C9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 01:24:42 +0100 (CET)
Received: from localhost ([::1]:45434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j22J7-0003ff-Q5
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 19:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j22I5-0002Vi-Io
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 19:23:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j22I4-0005US-85
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 19:23:37 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51092)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j22I4-0005T5-1b
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 19:23:36 -0500
Received: by mail-pj1-x102f.google.com with SMTP id r67so1582252pjb.0
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2020 16:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=phq3yzj8+XV7i3YphGGJ++evMQVs3ZsJi7SU5H9jqIc=;
 b=MulYmPTtF1asFISSljn05V3IVmuiI4DK92t/mUsAWD4QNhzIdgfYUrm+cTDl/45riR
 V4c4f2r731yoJYLP5znOG0CRbsUlB5fXPNylDJBRs8FPqVXMrmSAZS73ipa7kBG9cXEx
 +dVYdwIQ1q6JmJ9nGrFuIUGdv0nmjj2lboWQF71FrxiNrmrc/JoK4BadItvn23MBT/KY
 vJzijVABRIhKDq7onxwDyiP6okmtTgErwq+LgZ9rOGCOL07Pn8R65zQsLwctZX1z8lVr
 bZac+FfmRIIh+t/6DASXDbZk/ZGN0EpAjm9NdhGj8jkLsMEweroxSr4KzvbJeMrl1QN+
 +wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=phq3yzj8+XV7i3YphGGJ++evMQVs3ZsJi7SU5H9jqIc=;
 b=lKY7oiyMGYwX2vHbpyPR0gTchIdqQhmGF5a2U2ePsR4WFXoOX1+XxBTJ1Q+ky7wfLV
 kba67bbePmx3FiseEZ052x4fLlEXWVzt3aghymttnyE67rUaQuspi+xQfCEE2NqmiUP/
 A59bv8OGCk+Ixd5IvRP3IeLRTC4H/uIeQy8F2RVoqPbcyjPMSdWHQW9rQpR1zdYgn2sS
 aPalKdnsz6zKpdwXw+jQgfj8aGhNmZSXQ1Wx4V8ABNDYND3w21Qb25Jm1bSuTFnhj0U9
 52PwUNEm00Wan0Bzv/DvEfBcUeG+gkvTyXngF+g6XGPht2bHoxAg2XP+mHQLx5M40pGR
 Y8+Q==
X-Gm-Message-State: APjAAAUHJvNIgZxh6nK1Q3Zlk4au6OFo6nTpGVzDggD53qc6rUR7hAT3
 IuZiAR/PrVPbxVaMzmCJqGZr45W3LgI=
X-Google-Smtp-Source: APXvYqzV4trUCuJ2KUmV2leOKkj7JTaGTsJglYodPPkOeJARu/42nVQl68+LHTI/POVftMunU/A2RA==
X-Received: by 2002:a17:90a:c390:: with SMTP id
 h16mr1919422pjt.131.1581553414015; 
 Wed, 12 Feb 2020 16:23:34 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id j4sm365277pfh.152.2020.02.12.16.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 16:23:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] tcg patch queue
Date: Wed, 12 Feb 2020 16:23:29 -0800
Message-Id: <20200213002332.31821-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
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

The following changes since commit e18e5501d8ac692d32657a3e1ef545b14e72b730:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20200210' into staging (2020-02-10 18:09:14 +0000)

are available in the Git repository at:

  https://github.com/rth7680/qemu.git tags/pull-tcg-20200212

for you to fetch changes up to 2445971604c1cfd3ec484457159f4ac300fb04d2:

  tcg: Add tcg_gen_gvec_5_ptr (2020-02-12 14:58:36 -0800)

----------------------------------------------------------------
Fix breakpoint invalidation.
Add support for tcg helpers with 7 arguments.
Add support for gvec helpers with 5 arguments.

----------------------------------------------------------------
Max Filippov (1):
      exec: flush CPU TB cache in breakpoint_invalidate

Richard Henderson (1):
      tcg: Add tcg_gen_gvec_5_ptr

Taylor Simpson (1):
      tcg: Add support for a helper with 7 arguments

 include/exec/helper-gen.h   | 13 +++++++++++++
 include/exec/helper-head.h  |  2 ++
 include/exec/helper-proto.h |  6 ++++++
 include/exec/helper-tcg.h   |  7 +++++++
 include/tcg/tcg-op-gvec.h   |  7 +++++++
 exec.c                      | 15 +++++++--------
 tcg/tcg-op-gvec.c           | 32 ++++++++++++++++++++++++++++++++
 7 files changed, 74 insertions(+), 8 deletions(-)

