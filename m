Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C184A3B1A90
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:57:40 +0200 (CEST)
Received: from localhost ([::1]:40966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw2Rn-0005S5-L5
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw2Pm-00032O-5v
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:55:34 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw2Pg-0007og-Od
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:55:33 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 o33-20020a05600c5121b02901e360c98c08so2185987wms.5
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MFKauYiZCp39qtpjgbCzLvgC3VwH7R0K4pMiu0Bj5i0=;
 b=ICz+FfmxmqLw3D6BW4lXPVou4Lbal5tixTCKajB4wk7LN16RDHpK2JcvpIeYDGunw5
 CoktV29lFIRFbPnjNZzBZqPl1AiHC+zP40GHtzG87/XNO4a5zjYSaqr/lbwC04BgMTeh
 v5aK2RjPRzIIS+PyvmbiyMZ1L5hyRa5+mqjeN+iRnFqkBcacyrm9jhyWencuLRvnuXPZ
 NVnfF2fRRRZmB8lIg8WjB4N2mP9XS7G4M6utf38tgU7gYLSIk2gWmy0fuYlq4uWxAKEj
 9VazQjU/5cEASRrrAJlFb+H4hjat8bVBJN0B478p7KSbp6dN2etJsrxufbHwTZx6AwkK
 vyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MFKauYiZCp39qtpjgbCzLvgC3VwH7R0K4pMiu0Bj5i0=;
 b=K35kgJqANb6nZ0kBaTLAWN/2j795A8zQE6nlheZvE9mwdlcIX8TQnYUViWem4va9JG
 KVDaUUWZpiEQxvqPcQpN/Fp0CNm8kHuXekgZxIKon9+fRuhu8nNoi2USZ3v1PLr6DxT0
 nsr/PazVJGAT6JYsnP9mRf6H4unV27NdP9CA/VWCDFEi55G/31zq7Y5zdxhyuyZUwxOb
 AtRgOA1KywA9u+dnVcmfjVeU4sOu1rltFAJykhoRZRzql5gI5MPy2VXZiCkWhCBGNgAF
 G+bdxTiLgDpCL8mJsa3vWdQ6LW5BwiHlVnEzyU8V/Y1msJY7MeoMJz0iq/5Q1jUm/d/b
 LV2w==
X-Gm-Message-State: AOAM531HnqbIt7LOzguYVbMdWJ/P6VL1lO7oHd8AFVcW9V6mb63aRFtA
 yrEOXeT80QcnYou7WAtVyRdKJrYPdG+OrA==
X-Google-Smtp-Source: ABdhPJwU8enQ81SkYxvgBSNv1MTmuQItWuV8omwkm00whciFA6Qdq3DIN4W26TYC5DZ+N1QU61NwoA==
X-Received: by 2002:a05:600c:1c2a:: with SMTP id
 j42mr10472881wms.173.1624452926656; 
 Wed, 23 Jun 2021 05:55:26 -0700 (PDT)
Received: from localhost.localdomain ([102.41.161.240])
 by smtp.gmail.com with ESMTPSA id c12sm3108461wrr.90.2021.06.23.05.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:55:26 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] plugins: New TCG plugin for cache modelling
Date: Wed, 23 Jun 2021 14:54:52 +0200
Message-Id: <20210623125458.450462-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series introduces a new cache TCG plugin that models separate
L1 data cache and L1 instruction cache and uses one shared cache for
all the cores. This is a part of my work for GSoC 2021 under the
mentorship of Alex Bennée.

v3 -> v4:
    Removed unnecessary includes.

    Removed an unused variable `insn_addr` in `vcpu_mem_access()`.

    Had a `default` label for switch statement spelt wrong. Fixed that.
    
    typedef'd all structs to reduce the clutter of using the word
    `struct` on every declaration (was causing many lines to be +80
    characters...)

    Separated cache parameters to multiple arguments: iblksize,
    dcachesize, ..., etc.

    Produced a more descriptive error message when cache parameters are
    not appropriate.

    Included a patch to update the documentation of the plugins to
    include cache plugin.

    Included a patch to add myself as a reviewer for TCG plugins.
    (Ignore if not appropriate of course)
    

Mahmoud Mandour (5):
  plugins: Added a new cache modelling plugin
  plugins/cache: Enable cache parameterization
  plugins/cache: Added FIFO and LRU eviction policies
  docs/devel: Added cache plugin to the plugins docs
  MAINTAINTERS: Added myself as a reviewer for TCG Plugins

 MAINTAINERS                |   1 +
 contrib/plugins/Makefile   |   1 +
 contrib/plugins/cache.c    | 641 +++++++++++++++++++++++++++++++++++++
 docs/devel/tcg-plugins.rst |  60 ++++
 4 files changed, 703 insertions(+)
 create mode 100644 contrib/plugins/cache.c

-- 
2.25.1


