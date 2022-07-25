Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A965803EE
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 20:19:57 +0200 (CEST)
Received: from localhost ([::1]:57072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG2gO-0008VV-HH
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 14:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bm-0004md-OO
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:15:14 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bk-0005pl-Rd
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:15:10 -0400
Received: by mail-pl1-x62d.google.com with SMTP id w7so11122057ply.12
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 11:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ViJBlpwDyPMMbahD+o1p+IIPNsSREaHwlObWQOXKMwY=;
 b=IewS8qWsSk2wEK0DAhao5gNI8wth6xFFF0W2Qu5r/ZA8yP8Kah0uDXsdS+ZPORJADi
 BcCOUAbW9/gpDK7yOgQA1B78tWkprN1pskSTdHNPyYdF0FTzBv3fZVRFH3wnvzrypUsb
 SwJpIa2yUfUcgWqeAigG871Ojxk25RBNknmTFMgBZIeIcQtKx6iG5Sngpk77bNTBiqri
 xh05yQqy4a7kSkn0kASJLiBv1J/ie9eV7M+YvqPJ202PKOsKJINGE0D200wZvuzEyyN2
 n2L57QL1ZMQx5da7BU06vIM23Xrgtbg6/hRmAV+NoywqfZ1d5BPDvd/sGXSYRN4i3/XP
 21kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ViJBlpwDyPMMbahD+o1p+IIPNsSREaHwlObWQOXKMwY=;
 b=BteouSgtGGhcXf5W3S7LNOWslix2MGetSH24wdk/WFYvyEFpLK5SR4yGwFV5/KqE9n
 8GUe9K2VF4AkCl5dvv6M+a3NZ4Vyua7gbp3m6+W0xpa2qJcUXIiCIY0bTgeLQUPV7ni/
 DkHXVVe4YP+HFnJ0+k8XHmuIny0JxCkui4guK+2zo6iQGjX3ii1LbZqtna4Qfj/G1qSL
 yVZ07flRAF7boq2HMHNYVNF2gkEwZ/PTlfoWxlsT2N//sobAk7nwDG2MHDEADKzLFIPs
 ycVE7xpKUmhbmE4Dbh2ZsBdhnvjDtWbWqB5nT1B4w8liYB9hBUdWfvZmJKZBqHvGPEg5
 Itgg==
X-Gm-Message-State: AJIora/xOwKWgEjHnmujiBJgc6sRjQUd+SGi7ji2LywqLFJI2JwNcMr9
 oG777YFNkmB8aLkOqq7mNJxuYriDl6MKQA==
X-Google-Smtp-Source: AGRyM1v3aGw1a+iQsmPJkl5nOi4q7OwIJSjlPPLdpuX0fyvs86Oo7Fy6Zk+hcCXUsljnS06n5JkpnQ==
X-Received: by 2002:a17:902:9005:b0:16d:296b:6272 with SMTP id
 a5-20020a170902900500b0016d296b6272mr13341562plp.144.1658772905687; 
 Mon, 25 Jul 2022 11:15:05 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 bg5-20020a1709028e8500b0016d8d277c02sm1125004plb.25.2022.07.25.11.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 11:15:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH 0/3] target/arm: Fix kvm probe of ID_AA64ZFR0
Date: Mon, 25 Jul 2022 11:14:54 -0700
Message-Id: <20220725181457.41083-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Our probing of this SVE register was done within an incorrect
vCPU environment, so that the id register was always RAZ.


r~


Richard Henderson (3):
  target/arm: Create kvm_arm_svm_supported
  target/arm: Set KVM_ARM_VCPU_SVE while probing the host
  target/arm: Move sve probe inside kvm >= 4.15 branch

 target/arm/kvm64.c | 50 +++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 23 deletions(-)

-- 
2.34.1


