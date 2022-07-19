Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC07579673
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:37:55 +0200 (CEST)
Received: from localhost ([::1]:47756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDjfu-0005cX-N3
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oDjcu-0001PC-MG
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:34:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oDjcr-0000Qc-UJ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658223285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BPaFrMRK7o9dr7xjb16qjnP2LtSy75XziEpBJ4AfjiQ=;
 b=dQ+4KZFG4v7DlPRbAlnaGUdsDRmX6Q8m1rVP7USeyUoAynsRNgM6RWofbdY8qCWcX+fc6/
 2/22dc3NuxLxmGvyyYrAGJd8bqI5Hf3RqZXEgRuSj2L2JWcXNI4p1mldIgp+jl717xqLAr
 BFZtX+3iZjOw84MOZVQj4P0JSuFeBIE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-GSCm7cBfNnauiR27HWv3mQ-1; Tue, 19 Jul 2022 05:34:43 -0400
X-MC-Unique: GSCm7cBfNnauiR27HWv3mQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 hs16-20020a1709073e9000b0072b73a28465so2858553ejc.17
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 02:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BPaFrMRK7o9dr7xjb16qjnP2LtSy75XziEpBJ4AfjiQ=;
 b=MXOavZF5aG1HPp6fEIxmxqt3jB7ZEBXtNOcBPMh2aK9vLceyUi8pSqECwNJOaShQ+j
 7IbS8pHyqssfrx64hcDwYXdIQRFRiOQktORt0YOIScjYCefwFjIjT5t/q0ca4Px4BgWG
 703srLUz6u4tUzrqUpTmKOObrIHX4Hr2sU+i2HG7oN1H5vp5NH7lqm11SVmfUOjoQSbh
 ZnpTwgQq6q8sqwo9d17pyBq8eCqQFvnIV6T2vpho96uxZPufa59HUKykqxkzsCw0Iguv
 IadEfznumri+MASFKdVeqqpX9HtP0Ur7sM3CJl6glV03K/zk4Z4ebshkEWWtt82ZPBBQ
 +C4A==
X-Gm-Message-State: AJIora8GSfrYfDZ7b8InH/4D6QcshMyyq7Yf04R/EcxHZcSExfztd7aH
 92dibav4KHPV0WTmaaHeNOIHv0BosNH4YWVz7vLPyeJeKMi4Xs1R/T7CzgHY5uRMnOG3tfrG3ZY
 JQXz+NP3pJ5HFTQYyAhwCBPrheLhddT3ZbMcAx2Ex8Ht9QaVw253MxaUaPlx9YIch4OA=
X-Received: by 2002:a17:907:2ccf:b0:72f:2bc8:d7f6 with SMTP id
 hg15-20020a1709072ccf00b0072f2bc8d7f6mr9249645ejc.145.1658223280805; 
 Tue, 19 Jul 2022 02:34:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u9pESlaZxD4ul0mrRVI528QrD8OgiIwgqApY7HJRL+A7Vr8Orq59PPZSBxPiDMvyxw1lsNGA==
X-Received: by 2002:a17:907:2ccf:b0:72f:2bc8:d7f6 with SMTP id
 hg15-20020a1709072ccf00b0072f2bc8d7f6mr9249620ejc.145.1658223280400; 
 Tue, 19 Jul 2022 02:34:40 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 f4-20020a17090631c400b0072ee9790894sm5758399ejf.197.2022.07.19.02.34.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:34:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Misc patches for QEMU 7.1 freeze
Date: Tue, 19 Jul 2022 11:34:36 +0200
Message-Id: <20220719093439.528810-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit 0ebf76aae58324b8f7bf6af798696687f5f4c2a9:

  Merge tag 'nvme-next-pull-request' of git://git.infradead.org/qemu-nvme into staging (2022-07-15 15:38:13 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 3746b8ca3e8bc216d03df5813080eeb06bdafabb:

  util: Fix broken build on Haiku (2022-07-19 11:32:21 +0200)

----------------------------------------------------------------
* Boolean statistics for KVM
* Fix build on Haiku

----------------------------------------------------------------
Paolo Bonzini (2):
      monitor: add support for boolean statistics
      kvm: add support for boolean statistics

Thomas Huth (1):
      util: Fix broken build on Haiku

 accel/kvm/kvm-all.c       | 10 +++++++++-
 linux-headers/linux/kvm.h |  1 +
 monitor/hmp-cmds.c        |  2 ++
 qapi/stats.json           |  4 +++-
 util/cutils.c             |  4 ++++
 util/oslib-posix.c        |  4 ----
 6 files changed, 19 insertions(+), 6 deletions(-)
-- 
2.36.1


