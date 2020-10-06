Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64A6284F90
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 18:11:35 +0200 (CEST)
Received: from localhost ([::1]:35854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPpYs-0002WP-Pi
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 12:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kPpUS-0005hS-8J
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:07:00 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kPpUP-0003zT-5I
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:06:58 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t9so5474676wrq.11
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 09:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tTPWv+K33k11Df/RXVK0G/cnVnoUPqlI7VRtWVsksD8=;
 b=R1zU+qnjAl/wiMDTCaHeQ9rLQls7/izD57KfJTDT1LU9qGxSirAEh5nskIZcWp5ovi
 fVcKLdLk656k1q7x63Ho6TwZ+hL2rlKS2s1ww7LYTEM6kTNh4lQsgkl/yQz0EHqu4KGk
 loTT3N/JwzBGOFvY0S7e9HzXCbviZ0c2VhTw/Ri7xSDVe/B0jWp55H1iEigWEVJYPRuM
 a5y21zf7PUa+uQdsfUFRtI5B9O1AseM0lg38sc5914a1LI8lDa6SM1foTDBWJ98iSVuu
 Wl3Z8tMIMP6heDBT0aDCpQQUIbpzz/e3Rhxh6UkrWK6TpqhDWsCbaLoV4wLUPkyPiMBl
 BNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tTPWv+K33k11Df/RXVK0G/cnVnoUPqlI7VRtWVsksD8=;
 b=W6acpcKzpod4HV3NhYohCw52+RrRDiHFvGTrx4m7kPCWgN1nMO8QNsl84mGmdwHZmR
 WvTtmGKj8rXrgkKAGdj9IGbm4COEdWkh44RpwO874Agta77PQj6Tseyp/RNSLXOs1T+O
 kWfBJrhAi0TszGiyW1HgWNXkV6fhDbEyHacYWbfd0nPG0kngpm6xIanVFRHHw19/MADX
 P8cIMyk7VzNAy/d+pZz3jvJJncLgi3J0lKmnPwr0YvMCm0et6E41QUG3AHRYhMzOEflW
 CVgUq2DXZMsPyfo/ylQxN6Nm6Onbj7DvY2+k3TVj+RmzaeM+ZU1lIGCmBQbF9QKXDoz1
 +gvw==
X-Gm-Message-State: AOAM530WhttNA/wz0eBszIsNw+B0gxibTokQBNjkXr0izwWWrZkW0l0F
 dyHbg+sTUOF2tFuDK3eyJDbL8w/BwP4=
X-Google-Smtp-Source: ABdhPJz+ACP377mvesnQnk4ksRFGBr/IXcdf4WJ4RDGNHdIUuJssOOdMJtLRqtNVyd4EAyZvgLTWwA==
X-Received: by 2002:adf:e4c8:: with SMTP id v8mr5785200wrm.72.1602000415217;
 Tue, 06 Oct 2020 09:06:55 -0700 (PDT)
Received: from x1w.redhat.com (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id j17sm5204629wrw.68.2020.10.06.09.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 09:06:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 00/12] contrib/gitdm: First round of updates
Date: Tue,  6 Oct 2020 18:06:41 +0200
Message-Id: <20201006160653.2391972-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

As requested, here as the first round of patches
already reviewed.

Regards,

Phil.

Philippe Mathieu-Daudé (12):
  contrib/gitdm: Add more academic domains
  contrib/gitdm: Add more individual contributors
  contrib/gitdm: Add Baidu to the domain map
  contrib/gitdm: Add ByteDance to the domain map
  contrib/gitdm: Add Google to the domain map
  contrib/gitdm: Add Nuvia to the domain map
  contrib/gitdm: Add Qualcomm to the domain map
  contrib/gitdm: Add Nir Soffer to Red Hat domain
  contrib/gitdm: Add SUSE to the domain map
  contrib/gitdm: Add Yadro to the domain map
  contrib/gitdm: Add Yandex to the domain map
  .mailmap: Fix more contributor entries

 .mailmap                            |  2 ++
 contrib/gitdm/domain-map            | 10 +++++++++-
 contrib/gitdm/group-map-academics   |  4 ++++
 contrib/gitdm/group-map-individuals |  7 +++++++
 contrib/gitdm/group-map-redhat      |  1 +
 5 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.26.2


