Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1AA35DF2F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:50:07 +0200 (CEST)
Received: from localhost ([::1]:48646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWIUX-0002u2-Pp
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWISb-0001W2-Qp
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:48:05 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWISZ-0001pN-Vv
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:48:05 -0400
Received: by mail-ej1-x62f.google.com with SMTP id r12so25724386ejr.5
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 05:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=baXI92BYQA8BPyTYOuijQCXMTNOmBhcIQB7Utgcd1vM=;
 b=Uw3d1BIRBqgKsjO49I45NohFokpWegUYEAKsDaaa6T5ovrSNzfEUpQkqPQlpPtM7c+
 Ww1iivRqowjuN+9nf28cIs5W1MiiAVlgnazPKh2B3MoG2AnU+OsXyydk+CCTOt20wBlA
 E1+IXnKAFwtP3XURW8zttp0u+mLyCNxKJ1dS7pHRm20nJ1ezGzotIpfRnrOUR2o5QjuB
 jGpi9Khpu/DTQbMewq6LPKo+qcj014suD5Cu0ZlnM5xUrysdMTuM+fOLy/2Gd0UucPvf
 EFAulUIzCfhsWe//aiHTfgBW+NxmIQxFKxm0mN16PD09y1JXO5VeskewCTHmlkvAhduI
 DSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=baXI92BYQA8BPyTYOuijQCXMTNOmBhcIQB7Utgcd1vM=;
 b=bY6cx+Jkt/7Q2zgET75YvKqC0g/hbTGLyVHheKv66IjaYmmGRfdOH6+idNTLtvjCIo
 47mqeQnrKfxmPnKt1brPKd50NqNw7aqocz7/+UTg5YukEAX7u18cS+4Qu61dnVRw9did
 Uto3SxN7J0llaqYJhIbTPOOeGDqKYL+U/aVJRvjDIx17nW321WZjgGa66BGGrcQR1NM+
 fB7vOB1gHm7bFOOdeQhiz8vPplc3wSfA2gSG1g2FVmniKtj/BQCLK12CARe64Da32umm
 aa4Efd7Q2zTA/Lm8G4KdZBg5ltR7MGlPvZd3v9ENFdLgFiQ1xklDN5exfk3jEdPk7v8n
 NU9A==
X-Gm-Message-State: AOAM533m+knUF51JSS4IKG3f5ENuEuLtaIyti4vdxD4JXb5DpJpH6W6B
 Q7xvJxTT5THN/DNNr9s4gdVnmZIE/Uw=
X-Google-Smtp-Source: ABdhPJwuyOQTbnpGyZIDOacNoL+eUtxYV5+Xl7IN18C3/TwBtzrKeg5lkIRV3wuBXsmyYr5DIsF5Bg==
X-Received: by 2002:a17:906:88b:: with SMTP id
 n11mr2754451eje.26.1618318081821; 
 Tue, 13 Apr 2021 05:48:01 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s9sm8635961edd.16.2021.04.13.05.48.01 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:48:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] osdep.h changes for QEMU 6.0-rc3
Date: Tue, 13 Apr 2021 14:47:58 +0200
Message-Id: <20210413124800.216095-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c1e90def01bdb8fcbdbebd9d1eaa8e4827ece620:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210412' into staging (2021-04-12 12:12:09 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 12763913a3e44d9968a9ab0da01a0880fc7d61df:

  osdep: protect qemu/osdep.h with extern "C" (2021-04-13 13:00:37 +0200)

----------------------------------------------------------------
Fix C++ compilation of qemu/osdep.h.

----------------------------------------------------------------
Paolo Bonzini (2):
      osdep: include glib-compat.h before other QEMU headers
      osdep: protect qemu/osdep.h with extern "C"

 disas/nanomips.cpp      |  2 +-
 include/qemu/compiler.h |  6 ++++++
 include/qemu/osdep.h    | 13 +++++++++++--
 3 files changed, 18 insertions(+), 3 deletions(-)
-- 
2.30.1


