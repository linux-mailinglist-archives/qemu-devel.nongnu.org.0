Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6993DDD63
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 18:17:58 +0200 (CEST)
Received: from localhost ([::1]:39432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAadY-0003jf-Jk
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 12:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabT-0000xF-P6
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:51 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabS-0006os-02
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:47 -0400
Received: by mail-ej1-x633.google.com with SMTP id hs10so23098332ejc.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 09:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SaomH00ol/Yj235xEbK4QvdWV1G7l618jcb6ZKuT4iw=;
 b=GHcZ0MjjCGXCnSheDh+acdKRD07Kba2namKsH+h6lJz37K8Or3J0rl53uZi2AwJ4Ju
 Vp/MDNGlajT4ozZohgER2u/2SxrYsEaB6N8u+5BBjaCs/lDugXM7JrnvPVcVOu+9Fg5H
 iy/c5V/PDtrdZ3V6qPXXoIX/MtI8GFKaJbz0eYw4ZqCREmj+a5mpmklqq2OfEyTA8uQj
 UkEjv8vGSA2lzz6mYkn7l1+wHwOf/2RBIw4PFykwYuS2Q19g827tAg9A2UxnOY38oU13
 rF0tqsWvaKfNQTVYSxHY8ThJNlFT92eSs7V9Sj4v0GxHN0CAAzNMgIPG+0QAH5q4Gh4I
 qfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SaomH00ol/Yj235xEbK4QvdWV1G7l618jcb6ZKuT4iw=;
 b=H1vGaL+YAmirv3Kiav3Rk+5VOR24fmbhMRinklf4fO9aD1reGdThs19EyimQMnV+bS
 EuChCcZC7TFq42yZTvNL78Vhnybu803rTqIQeKqp2t0cHBaCWw4CFMhznT5N7g2iftLv
 uRatqQ56HRCdaOSd2SDGcVwEfW6vEJup6K0+GfJLM26WJ/pZbgVbRq/i0ojCH4EB8WON
 H9kd+B2jp/IDsMwYznNQD7DZXtxBdMNNsIQSafGxawKKYehkXVRf0AYRZTU1jwNFrPxy
 TpW2U5IpPgych7CsINz38SSGFr+1Bl5kspUit1o619IhE0dB/hfMiqcBR86YnSzDtmWK
 Dseg==
X-Gm-Message-State: AOAM5320tqRAgI7EJ4oap69GyZYHwKreWo9zU8lsW0orun/gWI6Wqnem
 V5MEid4++plwArqp2rGpcxUQNVSFHiAs3g==
X-Google-Smtp-Source: ABdhPJwuhkAsXf0DjHzfg8vWDMLbxar+y2xVOL8xKBEFG0onBAB4jAcJHfqqErOhpApxLDXzdCv7fg==
X-Received: by 2002:a17:906:aed3:: with SMTP id
 me19mr15900506ejb.187.1627920943377; 
 Mon, 02 Aug 2021 09:15:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f15sm4835144ejb.125.2021.08.02.09.15.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 09:15:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] vl.c, coverity patches for QEMU 6.1-rc2
Date: Mon,  2 Aug 2021 18:15:34 +0200
Message-Id: <20210802161542.381976-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7742fe64e5c2c2c9f9787d107b693eaac602eaae:

  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210729-pull-request' into staging (2021-07-29 18:49:39 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to e17bdaab2b36db54f0214a14f394fa773cee58df:

  coverity-model: write models fully for non-array allocation functions (2021-07-30 12:04:01 +0200)

----------------------------------------------------------------
Fix for smp-opts in configuration file.
Update Coverity model to what's currently uploaded.

----------------------------------------------------------------
Paolo Bonzini (8):
      vl: introduce machine_merge_property
      vl: stop recording -smp in QemuOpts
      coverity-model: update address_space_read/write models
      coverity-model: make g_free a synonym of free
      coverity-model: remove model for more allocation functions
      coverity-model: clean up the models for array allocation functions
      coverity-model: constrain g_malloc/g_malloc0/g_realloc as never returning NULL
      coverity-model: write models fully for non-array allocation functions

 scripts/coverity-scan/model.c | 235 ++++++++++++++++++++----------------------
 softmmu/vl.c                  |  47 ++++++---
 2 files changed, 143 insertions(+), 139 deletions(-)
-- 
2.31.1


