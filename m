Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54F53535A9
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Apr 2021 00:29:41 +0200 (CEST)
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSolw-0005EL-6U
	for lists+qemu-devel@lfdr.de; Sat, 03 Apr 2021 18:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3_utoYAcKCoM2lu01ylnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--venture.bounces.google.com>)
 id 1lSokc-0004Pw-Iv
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 18:28:18 -0400
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a]:48462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3_utoYAcKCoM2lu01ylnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--venture.bounces.google.com>)
 id 1lSoka-0002jY-6F
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 18:28:18 -0400
Received: by mail-qv1-xf4a.google.com with SMTP id b15so7047170qvz.15
 for <qemu-devel@nongnu.org>; Sat, 03 Apr 2021 15:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=CcXHgvhVeEHG+eKI2QyebbLaHc7ecWlehjfmZSzEvfA=;
 b=GUDw7b8hFE0uIo4DkT6io+xPP9AwIOpmjROOIVQx6r5MC4UePjlJ3w8AciGmuIfq1d
 ScIykgZf0StwRW39T6aaPT7hi4DL/QOIu8Byav9IL3g9uNJMUzoiJ3Wln4StbXoFvfWH
 KY6fwoM+Ij/re8+VDHKmacRgCHwMV97OYCmeK9RPeGeduvOjPUV2Twi3k8mDEDCsFIym
 LHkhaQR1ljpkUlXbKLgUr5SKlcGq0M/NjoKkL38bjkznnIF2oeIsAeVH7pMaTxbBfp3q
 SVMt4iTY2LAja8YSJGwcdR5JGPF4QmyMxEQIHM2C9Yw4UDKVHzixS2nAFvofZ4xb9xJV
 FMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=CcXHgvhVeEHG+eKI2QyebbLaHc7ecWlehjfmZSzEvfA=;
 b=nslzIqtwwPJnHIO8tyhJq2MzghgYAEv4NGFz9wS1ubltoKsf68TXLwcLw0gVSzhbxh
 oJzZo+dIkeCrKHZ+b4ty9Fb55+9+ikWnEd0RMe3VY5JDC6PcrUjy8sK6tPdjSO0FWXHg
 lZzioqwU50y3ZU3LUpNQBv3t2wbZ0CB/TMa1EKnOpb+vnz8COe3Wm+E59nd8LYPJxZSa
 C/E6qFhHc78HMX1tyFBzIIg7pY/KaI5TEmHwt9XzuMX3fr53XoDmFdoiyZJafEG3QbUU
 gbI1q4dmm7ZhLz1AyCzJ5iO2ld4uya8L53SQ8a5LBDMqTGIoku2xx7lvHO+71qe09KZQ
 KS6w==
X-Gm-Message-State: AOAM53190PCnbZCLWF/E8qe7kYhhqv5+ghagVBZDw4nlxtrxPqagDJd0
 Cpas5PipUleCR0f8zOrTnDMTWuIuJw7c
X-Google-Smtp-Source: ABdhPJyr8zVwk7jPhA2TZXfMdsEB+d68Qnhe6cXqoj30ULUMjtyXPwSAhmY5l7NyHlUsP0okLJ1MftWqKvoU
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:bcbb:2e0c:25df:d735])
 (user=venture job=sendgmr) by 2002:a05:6214:20c8:: with SMTP id
 8mr18417622qve.15.1617488894304; Sat, 03 Apr 2021 15:28:14 -0700 (PDT)
Date: Sat,  3 Apr 2021 15:28:08 -0700
Message-Id: <20210403222810.3481372-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH 0/2] hw/i2c: Adds pca954x i2c mux switch device
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=3_utoYAcKCoM2lu01ylnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--venture.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

The i2c mux device pca954x implements two devices:
 - the pca9546 and pca9548.

Patrick Venture (2):
  hw/i2c/core: add reachable state boolean
  hw/i2c: add pca954x i2c-mux switch

 MAINTAINERS                      |   6 +
 hw/i2c/Kconfig                   |   4 +
 hw/i2c/core.c                    |   6 +
 hw/i2c/i2c_mux_pca954x.c         | 182 +++++++++++++++++++++++++++++++
 hw/i2c/meson.build               |   1 +
 hw/i2c/trace-events              |   5 +
 include/hw/i2c/i2c.h             |   3 +
 include/hw/i2c/i2c_mux_pca954x.h |  60 ++++++++++
 8 files changed, 267 insertions(+)
 create mode 100644 hw/i2c/i2c_mux_pca954x.c
 create mode 100644 include/hw/i2c/i2c_mux_pca954x.h

-- 
2.31.0.208.g409f899ff0-goog


