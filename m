Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC94418A64
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 19:59:16 +0200 (CEST)
Received: from localhost ([::1]:57754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUYQk-0005Q7-HQ
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 13:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUYOV-000372-3e; Sun, 26 Sep 2021 13:56:55 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUYOT-0007F4-N6; Sun, 26 Sep 2021 13:56:54 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s21so5032234wra.7;
 Sun, 26 Sep 2021 10:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kSqLI5yBxvBKqbdGccVj5k6FQVox4keI57BA3Nee2BE=;
 b=anPYD4grZK+NZRZJx6DuWxvS2XPq2uVxg/E6TmnbEsfCYOf5+SuiGvvAP/vh2Zh/H2
 /K/r5fSGrbCVSRrF/G+RnIjh61e05RzpOEQbkOJgONguMRj3LqAfvPSmaTddbFhH++F7
 hc4fLNYHR0lieSXhBwdldT7LDdAxJHgvon2pqsbusLphg8VWPp3ud/dNwN/QMb8eL/6q
 VrkMfrG7Cso0MciAtmsRbYFwQHbVevUIlFiLDjrxE9/WfQafgSW+aczL3gI/rk6R7bhF
 1/4/NjCuQr7VSrMOEoL1rnxTKyyhePAUdvo0mHHWniNuRxI3E5phNQslvxAvzNMr4VCZ
 CpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kSqLI5yBxvBKqbdGccVj5k6FQVox4keI57BA3Nee2BE=;
 b=RUopWjV5ezazMXQdb8CPjVVKemmf9uDhzCLeQdcMpDnRDgb+8ftbDTyJKx0+hOkE7p
 bB7yDAxKAZge+J8wcAlIUlrJEhbCoposVQD1j/e9Pi/e2LwCQ4v/jz0LBuRHqSjiapz2
 eGW5K8VS19UeIJ1LC084iaBj1pVH3NQpEYtCkdlv1iSSlehM8Qg8AUDZPGrsBufXDrez
 SeQkElgHs0SOxaNks5cXxsMSczfmUNVmJIxkPmzKkHwJyXYFgzkIw5RPT24XYESA+QOg
 7MkU6TyRke60MGSVomtO8JA5gFX5jsdVRrA5SzpNl5pgRjy9O0KHPTrCXi0/rxVtUGgz
 jJ0g==
X-Gm-Message-State: AOAM530vw359ut8NRTe8NeI56q9KWCxnJ56DSq3VwdBOC7+PsMepdj+Q
 hLzaY9DMgaxf3iKLRpqD3baJfh9RFIA=
X-Google-Smtp-Source: ABdhPJywN0BEcx71kgK22yvrYgWV7yiCX1d5OHTPvmjVfmoaFDTD5MOyZmAkkzJRGbpQfG6Hhh29jA==
X-Received: by 2002:a5d:6991:: with SMTP id g17mr7976831wru.218.1632679011148; 
 Sun, 26 Sep 2021 10:56:51 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 u6sm16920597wrp.0.2021.09.26.10.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 10:56:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/i386/amd_iommu: Add description/category to
 TYPE_AMD_IOMMU_PCI
Date: Sun, 26 Sep 2021 19:56:45 +0200
Message-Id: <20210926175648.1649075-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial patches, sanitizing some amdvi* names, and adding=0D
a description/category to the TYPE_AMD_IOMMU_PCI device.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/i386/amd_iommu: Rename amdviPCI TypeInfo=0D
  hw/i386/amd_iommu: Rename SysBus specific functions as=0D
    amdvi_sysbus_X()=0D
  hw/i386/amd_iommu: Add description/category to TYPE_AMD_IOMMU_PCI=0D
=0D
 hw/i386/amd_iommu.c | 41 +++++++++++++++++++++++++----------------=0D
 1 file changed, 25 insertions(+), 16 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

