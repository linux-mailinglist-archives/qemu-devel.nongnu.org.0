Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFD75B51C2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:05:44 +0200 (CEST)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXW1H-0000t8-EF
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVwA-0004le-G3
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:00:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVw7-0006Mr-IQ
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uMmyyNXK+qGJh7bGDhd2Ky2NkHEzdNiRyJvYtNhwMNw=;
 b=b6lg4qHV6Y51SUJlCT6KbYhRzz+w7V6kvx4TY6uWL+YSPRoIxnJvbxItxV9B5H6uWX8xiW
 FXINqp2jfLY5qy1W4JuFlhAZdpTG34ibCSq1Q3oqqskMlHR8JaR8KzYWgCrb0EvUxVXbnL
 ExGbL0B94zrf8TVyKZuoCoLy8rMAZrA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-iMcvFoJzPSKfACRV1M2ghw-1; Sun, 11 Sep 2022 19:00:20 -0400
X-MC-Unique: iMcvFoJzPSKfACRV1M2ghw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y1-20020a056402358100b00451b144e23eso1174326edc.18
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=uMmyyNXK+qGJh7bGDhd2Ky2NkHEzdNiRyJvYtNhwMNw=;
 b=FGf85In5sN66jpvg7/ijDYwls8xFIRoIZhX8o7tPqCAROa4wE2QH8betgb1KEGwtLn
 5xcLf3xf1/FmUQGysJI76jf4XVVMtZYtvGR/HJP4eb8tJMltg6vWZeeI7Xbv8LtLW9up
 OMIEMHEkWj2nIysnka3O7A0PB2LkPOYJ1W1t78PTLWSuurykNJx6/o3r7NsDIkj7D8Rh
 MCCpfN//S6VLoSqF5Lg2V6ZjQrRK+QTst6hB81t34ey0GIVQ7KwihJMt9mxNRShb6BJn
 eO5PZJcEAKA7lGj2JdruHZasbnaY2Fl7JrJI2qQselFsqohwu7YLdy2SsRTFv628oTtV
 B+9w==
X-Gm-Message-State: ACgBeo0k+kTKO07Clc6nqrwFAL271zt6VrZcVz8onvwYJ5tRLykYUAQq
 swCQmZk0LLBOHHR5vff8RIWiHbplolepOZlFuKV43tSHgyKQFC4HRBG6o9IkSYxLMU9ZsBycr/b
 HPd1wvnxlYOtsI6yXeTKBel30YhQL3fusTxEFklDk3DoAX7/tBbfbQ/1mQseUkhEYOHw=
X-Received: by 2002:aa7:cb13:0:b0:448:3759:8c57 with SMTP id
 s19-20020aa7cb13000000b0044837598c57mr20133257edt.8.1662937219641; 
 Sun, 11 Sep 2022 16:00:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Pq1f03tSKeSjjNa11eMtfJHtuYnYRHI5iFJ4DXn1ARqY1aOtuEcNdlqVFe2qWHoUIp3QxBQ==
X-Received: by 2002:aa7:cb13:0:b0:448:3759:8c57 with SMTP id
 s19-20020aa7cb13000000b0044837598c57mr20133235edt.8.1662937219336; 
 Sun, 11 Sep 2022 16:00:19 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 kv6-20020a17090778c600b0077205dd15basm3164383ejc.66.2022.09.11.16.00.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:00:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/i386: More SIMD tests
Date: Mon, 12 Sep 2022 01:00:10 +0200
Message-Id: <20220911230014.340601-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This series adds more tests for MMX and 3DNow, including a specific
execuatble because the SSE tests in test-avx are not able to pick the
right input parameters for MMn registers.

Unfortunately there are a couple typos in the 3DNow! instructions that
seem to be very widespread; the source of the typos was the "official"
Intel x86 encoder/decoder (XED) and x86.csv was probably generated from
there, though I couldn't find an exact copy on github.  These are fixed
in patch 1 (Paul, where did you get _that x86.csv? :)).

The final patch removes the old SSE tests from test-i386.c, which are
less comprehensive than the ones generated from x86.csv and also had a
couple bugs.

Paolo

Paolo Bonzini (4):
  tests/tcg: i386: fix typos in 3DNow! instructions
  tests/tcg: i386: add MMX and 3DNow! tests
  tests/tcg: refine MMX support in SSE tests
  tests/tcg: remove old SSE tests

 tests/tcg/i386/Makefile.target |  18 +-
 tests/tcg/i386/test-3dnow.c    |   3 +
 tests/tcg/i386/test-avx.py     |  33 +-
 tests/tcg/i386/test-i386.c     | 573 ---------------------------------
 tests/tcg/i386/test-mmx.c      | 315 ++++++++++++++++++
 tests/tcg/i386/test-mmx.py     | 244 ++++++++++++++
 tests/tcg/i386/x86.csv         |   4 +-
 7 files changed, 605 insertions(+), 585 deletions(-)
 create mode 100644 tests/tcg/i386/test-3dnow.c
 create mode 100644 tests/tcg/i386/test-mmx.c
 create mode 100755 tests/tcg/i386/test-mmx.py

-- 
2.37.2


