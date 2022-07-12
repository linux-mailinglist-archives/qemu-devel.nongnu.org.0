Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621BD57125E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 08:44:10 +0200 (CEST)
Received: from localhost ([::1]:44600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB9cu-0003Iv-85
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 02:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB9G6-00040j-Kx
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:20:34 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB9G4-0002IQ-Mp
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:20:34 -0400
Received: by mail-pj1-x102a.google.com with SMTP id p9so6744752pjd.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 23:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FcVDMx6XBLuLD21szWjiKhXVc6asjVfFqXJMCZRcXHg=;
 b=q/BizUmI3IbofzdhuvEvIIGRPg0V2A57D1uK7UCvGy5CvYQEa0t3deOyTvYdfna7bI
 yINuwu+LJUTLN9d4oas4LkVGIhp57qAYfKf2cRT9u+pV/WaOc/xBt7vSnO6wmOOo8kzm
 MnKMobPqW0InFuNjP25TzzvmwGMZv56APBS1BLCDRgBycndexTOLRqYP+LNe0p9E5VAV
 Nd4tR+K+YKhOnZzBYI9BbO2lHVMy5TPaXAMzwTJjwdmuM8VSaXhfj1LKZjEfKeOlFA4w
 rrp7TWflgkJS6rM8AWZ2IthBlR4wtoaDtIlifXtpUWrgZVF+/EuzDT5v2wmPaaTJxYYH
 I7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FcVDMx6XBLuLD21szWjiKhXVc6asjVfFqXJMCZRcXHg=;
 b=CizQakDJ5jap4ZrGIpMZj/s500km54JpBU8IjRl6rlp7TRzSTJdghaC/IxMX2BAMJ9
 wvr6HPPLBqctNj1+eaiyxXxakJM1WP7miQ3ykD1aQYAdfujNiTxpJdXxjlaMgH7d2fZq
 4VcatXeq02Hd1P98s0yMY1Kmoknzv6DqZ4kS0piOeGEbGQCb5JTN4Y5wgleqvJeUL+FV
 51LYZXkc/LR1HKVSxk+VXbRo10eXrGajcoq48ZaiCUU60S4CFupB4RpWLjSVdsPXbNuo
 2TDLKgM+ya3vfzgdoQCZeNAXWmJb3gXi/sQt0uLYXXk9i25lkz3dx2EzWwNSoIHYfj3/
 VMMg==
X-Gm-Message-State: AJIora8WwdMOQcJwL0+30HjmOStj6B3G6o50FKk5oLNQeiWFOC9ynuBz
 S14OeHljuA4zvIF2tje97pV28ZH2km+XGXXQ
X-Google-Smtp-Source: AGRyM1vcUhmXdGfFLyoewfKjRFqPeO08epDhtTG4/ZCRcgaxL4Id9nXfyw96wykR44fnP3SbWuokbQ==
X-Received: by 2002:a17:90a:e008:b0:1ef:831a:1fff with SMTP id
 u8-20020a17090ae00800b001ef831a1fffmr2380124pjy.221.1657606831060; 
 Mon, 11 Jul 2022 23:20:31 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 f2-20020aa79682000000b0052ab7144de8sm6040776pfk.10.2022.07.11.23.20.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 23:20:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] tcg patch queue
Date: Tue, 12 Jul 2022 11:50:23 +0530
Message-Id: <20220712062025.197634-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit 9fed1bca6bc643ce91b6117f4974421aaede4751:

  Merge tag 'pull-target-arm-20220711' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-11 22:02:09 +0530)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220712

for you to fetch changes up to b0f650f0477ae775e0915e3d60ab5110ad5e9157:

  accel/tcg: Fix unaligned stores to s390x low-address-protected lowcore (2022-07-12 10:43:33 +0530)

----------------------------------------------------------------
Fix for duplicate tlb check on unaligned access.
Fix for w^x code gen buffer mapping.

----------------------------------------------------------------
Ilya Leoshkevich (1):
      accel/tcg: Fix unaligned stores to s390x low-address-protected lowcore

Shaobo Song (1):
      tcg: Fix returned type in alloc_code_gen_buffer_splitwx_memfd()

 accel/tcg/cputlb.c | 8 +++++---
 tcg/region.c       | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

