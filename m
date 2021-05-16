Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6D5381F3C
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 16:21:29 +0200 (CEST)
Received: from localhost ([::1]:34952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liHe5-00067L-22
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 10:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liHUl-00061M-GW
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:11:51 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:37794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liHUX-0008Na-Sa
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:11:51 -0400
Received: by mail-qv1-xf30.google.com with SMTP id z1so1927132qvo.4
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 07:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q46XpBRrbV5Y/83UzCfjQOUj4oog4uLqUP4RrR436kE=;
 b=m8sdsDJCRPDRWxpApWkUik/FHHLiu3RhNWv0KVIRJRv4JxYvKujykv0mu4RSMHEmn9
 /wNymcuIx84nSBj2aOb75RLCo5q5OHwpcm+ZuBye1YrzeDrNAzll4r7ov7AiAOBOHoF8
 WZiD6ysm5c8QWkcMnGa+Sd8vwC31p0CzpxMnxCpSdWYHTwj8V7LInPmD10QLzplSYLWI
 s1RGmGGXDplgOHM8l2QAowfNFfN3wI0HRgYhJowIOVMAAtTIDJb6aTz3wJL9jQGGjKBb
 dFfRyTS43Y5g9oz4O4j8l66M9Sfe3vGskaneXRGqW3u9vj7zUonxfQs68EycJuFsaGC7
 pJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q46XpBRrbV5Y/83UzCfjQOUj4oog4uLqUP4RrR436kE=;
 b=fpDz3BY8vN3SKDTkL7JMOJq1bDiezKz+W3jUoyM072l+fHq5zI8lHTIYLzqx1p7IiV
 OwI8Rg91OA9tFqs2XP3eIMYqHfNBbtlt2VGRR+zXV0Z0lBhu+kSzVNP5sVehLIfWd10h
 9VCMFng0tHxejFTWlToO/H0Tb4h+rDT9YdLoUA+2ttRFMsN4eky9CURLfwd8iTUzhTyW
 5R0l8pUlfC2wpJSob99cenfV7Hoa8yFK/x/rbzM7ygD/HeXcL4BPSU5ijl8gjJO+f4MY
 y6jLQesmj31KIpi7LY43T2jke4UNr1uGJOgAezwFpgvdUmUix2m3LsE39fDSoDco6orX
 4ftg==
X-Gm-Message-State: AOAM532Rdyy21zsUNSbZTJ1N90ZNMMxdEv3UKVtly4vCIyxp1tzPc0z1
 fIDQh8jphNAdh/FJ7cTd3lWjK4RQat0vDBETDM4=
X-Google-Smtp-Source: ABdhPJyl3CfSQWOCXrVqcZQopu8QRDWmiiz927tqK+9T4sv89D6tQGNjg7UbL68vg7xxAEgvkYG7gQ==
X-Received: by 2002:a0c:ec10:: with SMTP id y16mr16060227qvo.34.1621174294836; 
 Sun, 16 May 2021 07:11:34 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id j28sm8350102qkl.35.2021.05.16.07.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 07:11:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/4] tcg patch queue
Date: Sun, 16 May 2021 09:11:29 -0500
Message-Id: <20210516141133.739701-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 2 drops the bsd cleanup and includes a minor improvement
to the dump of the constant pool.


r~


The following changes since commit 2d3fc4e2b069494b1e9e2e4a1e3de24cbc036426:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2021-05-12' into staging (2021-05-13 20:13:24 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210516

for you to fetch changes up to 6c6a4a76eea900112c343ba4f9c5737e298feddf:

  accel/tcg: Align data dumped at end of TB (2021-05-16 09:05:14 -0500)

----------------------------------------------------------------
Minor MAINTAINERS update.
Tweak to includes.
Add tcg_constant_tl.
Improve constant pool dump.

----------------------------------------------------------------
Matheus Ferst (1):
      tcg: Add tcg_constant_tl

Philippe Mathieu-Daudé (3):
      MAINTAINERS: Add include/exec/gen-icount.h to 'Main Loop' section
      exec/gen-icount.h: Add missing "exec/exec-all.h" include
      accel/tcg: Align data dumped at end of TB

 include/exec/gen-icount.h |  1 +
 include/tcg/tcg-op.h      |  2 ++
 accel/tcg/translate-all.c | 11 +++++++++--
 MAINTAINERS               |  1 +
 4 files changed, 13 insertions(+), 2 deletions(-)

