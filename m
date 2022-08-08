Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29558C8FB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:05:52 +0200 (CEST)
Received: from localhost ([::1]:43864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2S7-0002nP-Fz
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oL2Jo-0007kE-Hi
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:57:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oL2Jl-0001f6-4T
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659963431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NI/nALmT/u2cS2/1eh2/EsuChGBhlqhuGAPlGlmxqwo=;
 b=Z76CPZgvBJWyEVBuv6ntNEbEKsnQtEMDP2XS5YmH973b+sWNQVnZ+wIxcFR80cpbotvdEw
 8ohWeX2BzM2gIHD992YuJhkRpjo/PqSmJFFRC1RV7LU/7QWKbvw+YYSerPUz9If9naU28I
 umD3xvJyXBjugjmX8swruYZv0cua858=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-uedX7kHfN0yOPUo92ypSxw-1; Mon, 08 Aug 2022 08:57:10 -0400
X-MC-Unique: uedX7kHfN0yOPUo92ypSxw-1
Received: by mail-ej1-f71.google.com with SMTP id
 gn23-20020a1709070d1700b0073094d0e02cso2388786ejc.20
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 05:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=NI/nALmT/u2cS2/1eh2/EsuChGBhlqhuGAPlGlmxqwo=;
 b=XZ3xWAR36SJTd5LZ/Ih6nhBUY1NGgVqZLIIYotVnpG3IagT+P9uIb10FvPABExp2X9
 D+KIGJHUm7QWZOrZCym5D7KW7ro3JG9eGNjHGnumLOcf0d8mDW7OhNiP5Dfe4/7yvpg/
 1X6DnU8wQkX/mFaBTS0M4LSYFQDKhOBj483SG3yCkQrD+C/zh98Ry0/FJ3SURJ+FtzOd
 ofLzfD34XcAydhvNnPY0GLu1vEn5x1ioXLTEcs7ix4D30t9sVE6wjec3hyis1J1Qhiv0
 oVaEFUXZzDvr7fkDJNCqvMJlt3IeE2o9emgO2rlbvCSTfutrioJnH0Rq7y4YBoD5t0D2
 o1oQ==
X-Gm-Message-State: ACgBeo1bD3/mm6zjA6z+b6zT9lOdkDaC5T97ZoMAFAaTvP5WMtOX/t7j
 u5ntZCAtLzNN8Im0oGKGa2DlframCliNEKuAeqkfTJYpoVcCR4uuzSuUAfhnuRmpat4A3uEN4D0
 jZ/dKcX5dptZSpKjNnenzwqHZy9qxCVxRbH+inTAfgDie06j2OMS2YvumRVgt9mlSDF0=
X-Received: by 2002:aa7:c713:0:b0:43d:40ff:5f16 with SMTP id
 i19-20020aa7c713000000b0043d40ff5f16mr17730890edq.256.1659963428696; 
 Mon, 08 Aug 2022 05:57:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR44Wr3yWkR/xILS9yr7+XmQ2DHpeKS/sxCTQciubmBa4SV8o3NVVNmWlr8OMwsWhTStkInhdg==
X-Received: by 2002:aa7:c713:0:b0:43d:40ff:5f16 with SMTP id
 i19-20020aa7c713000000b0043d40ff5f16mr17730868edq.256.1659963428319; 
 Mon, 08 Aug 2022 05:57:08 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a1709060fd600b0072f1e7b06d9sm4965945ejk.59.2022.08.08.05.57.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 05:57:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Misc QEMU 7.1 fixes for 2002-08-08
Date: Mon,  8 Aug 2022 14:57:01 +0200
Message-Id: <20220808125706.60511-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The following changes since commit 3916603e0c1d909e14e09d5ebcbdaa9c9e21adf3:

  Merge tag 'pull-la-20220729' of https://gitlab.com/rth7680/qemu into staging (2022-07-29 17:39:17 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to f6a5f380627ab2af384bf2f2940d29386dea11ff:

  tests/qtest: add scenario for -readconfig handling (2022-08-08 14:54:56 +0200)

----------------------------------------------------------------
* Fix and tests for -readconfig
* Fixes for changeable block size

----------------------------------------------------------------
Daniel P. Berrangé (1):
      tests/qtest: add scenario for -readconfig handling

Mark Cave-Ayland (2):
      scsi-disk: fix overflow when block size is not a multiple of BDRV_SECTOR_SIZE
      scsi-disk: ensure block size is non-zero and changes limited to bits 8-15

Paolo Bonzini (2):
      vl: fix [memory] section with -readconfig
      vl: remove dead code in parse_memory_options()

 hw/scsi/scsi-disk.c           |  25 ++++--
 softmmu/vl.c                  |  32 ++++---
 tests/qtest/meson.build       |   1 +
 tests/qtest/readconfig-test.c | 195 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 229 insertions(+), 24 deletions(-)
 create mode 100644 tests/qtest/readconfig-test.c
-- 
2.37.1


