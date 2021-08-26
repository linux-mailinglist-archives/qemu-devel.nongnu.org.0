Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211CA3F8DB7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 20:18:20 +0200 (CEST)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJxD-0000PZ-4f
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 14:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJmT-00037g-OM
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:07:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJmP-0000LH-On
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630001228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=33VXL4U1qbRTuU/5QwhrCQZylW9kwLggVtsgtFcLNRc=;
 b=aNG7y/6yDsXrmqo+vPS8gUsjBz9njfugjnPcCUIwet0E+cPQlIrZeZHEVP/Plnzz8mzIcj
 N7DIMnCISjL+gS4KYsPhcmb/TYTK2rVP1S2r6y6DDRGGZ1hoMnn3TH1MIeYNWaiTIPX3uw
 b6LtRE1TqzIAhJnFHP/KEgkzXd27STA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-nIHb-Dj7NbaAl4T41Pd5Qw-1; Thu, 26 Aug 2021 14:07:07 -0400
X-MC-Unique: nIHb-Dj7NbaAl4T41Pd5Qw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so4657903wml.5
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 11:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GB0xfRVEKlq5JbrRPqkV0PavmfY69/bsAfF6w8cRM50=;
 b=fqb91djuuJI4OeymD9cvNQBiN/dT5L0hGLBw29uTcVmojBZ2DTs4at0iwnWCIYXuy2
 wzTiG4f0Wqb5RLv/HEIE+Yu2wD3Or7V+9wdx0U2j4VZUiIU+QL45qOPuU9ab7exkYM+D
 IACXKZxUx2KMBD4OAWf6v9vdJvArVnQNRuPzvU1Jj8nmfa3cWdTKgJ5LqUy8PVlGr2ms
 MertcY+zrvtS2wB1aTFyQ+H+mfQaTmoMSzvD1YoPKbzoq3w9OUT3/kHf/KjL/lZ1Vsxd
 v7YzETIi4/N5HHRFmDx8UKeVAmDApx3QzdZih0Ztev4CNaaSjmgiW31VyrCm0xqGXbJc
 uTTg==
X-Gm-Message-State: AOAM5321+2eJS4zd2oemf2lEu3NTnMaLQZjLyQlLzolgG/JjmF0peV2I
 yY1oJrYnPsyB+yHePkq7eN3Ry0VjOCroq+g5tCH9V3zGSWHKv6zTM/l8cZyR1KElHJthKZvmmSr
 eK2JTM+cbnZ0AkAFeDzNZsCGpZ3SC7272sDzKI1yunL8Na5cbPtSdkD9kxHGFdiKd
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr10035291wml.47.1630001225822; 
 Thu, 26 Aug 2021 11:07:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjdJVK9pjguBo1YexWxwXEUx4tkMfoAwpeLOzovh8KBRa9wlKROMgo9eRhbcVbhl7IO9yHSA==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr10035275wml.47.1630001225644; 
 Thu, 26 Aug 2021 11:07:05 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j17sm3803394wrh.67.2021.08.26.11.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 11:07:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants by
 booleans
Date: Thu, 26 Aug 2021 20:07:02 +0200
Message-Id: <20210826180704.2131949-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Minor cleanups on the GICv3 distributor common accessors to=0D
have the overall codebase better use the MEMTX_* constants.=0D
=0D
No logical code change intended.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/intc/arm_gicv3_dist: Rename 64-bit accessors with 'q' suffix=0D
  hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants by booleans=0D
=0D
 hw/intc/arm_gicv3_dist.c | 205 +++++++++++++++++++++------------------=0D
 1 file changed, 108 insertions(+), 97 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


