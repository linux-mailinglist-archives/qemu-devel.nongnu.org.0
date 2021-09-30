Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BA541DF29
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 18:38:45 +0200 (CEST)
Received: from localhost ([::1]:48826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVz52-0007I2-3O
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 12:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVz33-0005M8-VI
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:36:41 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:40693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVz32-00069Q-5y
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:36:41 -0400
Received: by mail-qt1-x829.google.com with SMTP id b16so6260871qtt.7
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 09:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Au7CltD8wFWSoBrMPeMEqWGovf4IXtHpXSS1LcOPOUE=;
 b=yPejOks2jlkzjUvTBfGDldbR/nxdC8TExJbDrfM4U+i1IkCPxYvuR3i7c7jkVKkXbI
 jMy0AHTomVhkt3/11v7z+FKViJn/59mhlGKeRM86ls4yc4jvE2ExxO1WySQysqW5W0qh
 nJc+Qwa5GLzolQyGxTdI6PuQJm0kBJX9NCO5DPdl/vcVtagHP96jTUlwv9JWZqDN6WKz
 a1cP6+MxG8lYPS2Rkto94AU9fbQewg9u79QGvx3nAthNNy8CNtwZ6raZtmhAV2+KcZef
 PCCX5VUsBCuF6ANGJ9eu6gi6Jve9uRMzCnuZdbxS0lJSpNCa8071ogy+2ZtvpQjcRwXk
 EAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Au7CltD8wFWSoBrMPeMEqWGovf4IXtHpXSS1LcOPOUE=;
 b=lYpuZ1U8AQcMuQu7FoJSf5g4XS+sLAQFHOWta5MEWEPRXtb0wQu6+uEVrvHdJ3UOjT
 8W2oDVrXJeLqQB0lDMHV90owOIdUz9TDRn1QgLFtx7MdB2Q56g4tLyKDsoVbM/REIaP3
 Tk2G+LM6qgjaSnAmSAc6anl/DXo39vzqhB0hlimH5ks6Zurkfv1ZJXqcTFTxGozB50RJ
 wk1atWWcBXbZcSrTpuFswUE9IhcPd64t8FwGaz9RbJrA8ZEBzP00G8uWZxOv9D/CMQEk
 Rxz/rE0SjYjodXrPZypdrz0LsZ9EgWtd9mhGNJShcvsCEzNeKqZ66lecK94d16+NMcnM
 BceA==
X-Gm-Message-State: AOAM531HnV0xqdMLfHM385j1ZpBN9LVyxqu2m8cn9gHras0hLcaq9637
 wMT2XqJKU0/VE+MBaVopz7NQKPycXGhjnA==
X-Google-Smtp-Source: ABdhPJx8UTBZxdRtj8s8v8CbJxD2oj0GPQnEnXAPfSqQ12jko57I535ZKlRjN7WVvz3mhrsrdN1cUA==
X-Received: by 2002:ac8:5492:: with SMTP id h18mr7853601qtq.152.1633019798012; 
 Thu, 30 Sep 2021 09:36:38 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id q8sm1855781qtl.80.2021.09.30.09.36.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 09:36:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tests/docker: Fix fedora-i386-cross
Date: Thu, 30 Sep 2021 12:36:34 -0400
Message-Id: <20210930163636.721311-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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

The meson + pkg-config probing issues came up wrt a recent
NBD pull request at the same time as I am trying to reproduce
a gitlab-ci failure with fedora-i386-cross, and ran into 
something apparently related.


r~


Richard Henderson (2):
  tests/docker: Remove fedora-i386-cross from DOCKER_PARTIAL_IMAGES
  tests/docker: Fix fedora-i386-cross

 tests/docker/Makefile.include                     | 2 +-
 tests/docker/dockerfiles/fedora-i386-cross.docker | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.25.1


