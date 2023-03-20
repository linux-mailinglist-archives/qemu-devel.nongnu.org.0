Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650006C244F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 23:15:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peNlw-0005Cj-EJ; Mon, 20 Mar 2023 18:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vtoYZAcKCv0ptrqtinlttlqj.htrvjrz-ij0jqstslsz.twl@flex--komlodi.bounces.google.com>)
 id 1peNls-0005CQ-3K
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 18:14:30 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vtoYZAcKCv0ptrqtinlttlqj.htrvjrz-ij0jqstslsz.twl@flex--komlodi.bounces.google.com>)
 id 1peNlq-0004Ox-7m
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 18:14:27 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 mu10-20020a17090b388a00b0023f37e8dbfeso4562967pjb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 15:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679350462;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VnwqWbrnbj2a24htccRJhGB6icQ8NJprqxPFF4WjQ8g=;
 b=d7Djctr55FX9iWWGeLGA8D2b+Ts3LApKlk/Anh0Y5Z4mU42ZEfL9Rc3k76zCVkyY/+
 xQ04dMBb/Me+ytQM9WNfwYqwnZemsBzu+DC9Vo2KasHCG/FAnpjcoAuOwVFX6oIn8KIu
 sBSlhLwq+cr7jmGrfDeAS83hXDdd1uVZLuVjcuDXOBADJY5DJ4rux9ffhNdaxLCapq1R
 tOYsTiHRkjM1YGdphPQ9O6dLYOJFl0elGWKTWQbYMB7vOsUB2zTZHykRzf8tkshEYY5L
 B+SvkaQpb4tKi0K72dXeEvFBst3MWnVnfabMALjmOJDhMPimnT3gTcf7a2qXf2GiJnm8
 NHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679350462;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VnwqWbrnbj2a24htccRJhGB6icQ8NJprqxPFF4WjQ8g=;
 b=qDYycDdxbKQuw8Wrl9LHSw99Dn335N4Yol/yNiRbFCK19S/SM4cRZHUg1Es/UPOKaI
 sr0GuaWiENqYKj9MD5BY9b3nABf2UuJS7T6cO2Fh4q0kkwvVDRCO296IAz1WDJDmguUX
 XgSOrJgsgA8Xxp5Ilvb1skns0ibwDGZtzHuderYAhuPTn1nxh2Q5N1h6ggALddNFwJPq
 uenBx25RFW8xb/VeeaCQcveyqADmiwa+dduxRQDctz5rxsZ0E2icbgNCeBA7qR1jYUnm
 K3zJjF0ilrURmBHNS3F95SjDGMmydzvLVvjJj49wX8LZJhMx1v2JkzrQO+xG5Y9Bhg1Y
 26hg==
X-Gm-Message-State: AO0yUKXNHfWvPaFtMm64LChcYkHwbQUPwMwV37m0WjUf2h5KBbt3MSIw
 zQKzEVUp2Hl4pdLoZprRcdPg1Ub22gXR
X-Google-Smtp-Source: AK7set8fAy70m1e90WnTqm4x2pCLXQUgj9yqMxRSaFp1F+m4nWVXRgT8hJyw40XFMnmMjlLfQc3v2K/a7R1B
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a05:6a00:181c:b0:623:129f:6269 with SMTP
 id y28-20020a056a00181c00b00623129f6269mr199053pfa.1.1679350462537; Mon, 20
 Mar 2023 15:14:22 -0700 (PDT)
Date: Mon, 20 Mar 2023 22:14:17 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <20230320221419.2225561-1-komlodi@google.com>
Subject: [PATCH 0/2] hw/i2c: Reset fixes
From: Joe Komlodi <komlodi@google.com>
To: cminyard@mvista.com
Cc: qemu-devel@nongnu.org, komlodi@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3vtoYZAcKCv0ptrqtinlttlqj.htrvjrz-ij0jqstslsz.twl@flex--komlodi.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all,

This series fixes some I2C state variables not being reset when a reset
would happen.

These stale variables would infrequently cause issues, something around
the order of 5/1000 runs, since the machine would have to be reset at a
point where they would be in a state that would cause problems.

Thanks!
Joe

Joe Komlodi (2):
  hw/i2c: smbus_slave: Reset state on reset
  hw/i2c: core: Add reset

 hw/i2c/core.c        | 25 ++++++++++++++++++++++---
 hw/i2c/smbus_slave.c |  9 +++++++++
 2 files changed, 31 insertions(+), 3 deletions(-)

-- 
2.40.0.rc2.332.ga46443480c-goog


