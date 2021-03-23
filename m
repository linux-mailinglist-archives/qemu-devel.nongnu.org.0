Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F904345EF1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:07:38 +0100 (CET)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgky-0006le-Sa
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOgjk-0005S1-Gn; Tue, 23 Mar 2021 09:06:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOgjj-0002JE-3b; Tue, 23 Mar 2021 09:06:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e9so20697669wrw.10;
 Tue, 23 Mar 2021 06:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gH5U5nJof7gd04xWyXca0vk63vaATKJE/eyDSM+55fw=;
 b=kE4F9qobQ0z3nakYrY0UTOWC1fNhTYfARgCZzxQw3p4d1evNfbD0fV92ZeobVC9zeb
 hxyKytXsX35HLfEbLdGRpH0TM9XbJK30T8xwov5fpYcgJGZmH2c8/F4JV/7JCgtiv40/
 OJq+hIV+3lp/uqFey7GGBHv+uYO9P4VXtqAskwQRZPueNY0BnpceZ5uMi75PxvcGxMCE
 Hvwxp6E4+QZxTm4P70phiwxH8oG0kkZkDTvwQSQxWGNNeYkg32yOk1RYOCQEwgUPkbrU
 j1/YQif2WspmU5Ls4PAfl7ZpbdOnqecfTbBV+Tj9KRujVysxVUwgMKbY38mYipS4J2LX
 +Vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gH5U5nJof7gd04xWyXca0vk63vaATKJE/eyDSM+55fw=;
 b=lGtulk4S+A3k7o+oVyBQ40LOWwCLJgooSRONwE6CV36l4Ect4aBWJkUZ4KMiH3OjFI
 /EBbsJbcF3IHl3Sj1oyOR0nlfP/f5V8zvLv0SjUI7p3T0CpnliXL1c7/rvn2z9Woc/eo
 n84wV4hPvI5DJ7QmQiNVAsK4NCQCDM+h31BfUbLlpSlSTlzw1IaWiFJpeIQ1fTGaac9L
 0DbWvDwGJS0NO7Wvmbvceo5E3if4n7quvWpAv0i5YM4RpRnXktsMNfK70zR8A/JVOVSt
 yFXDSb8byf6lrvkFmyeGIaHXe9SfUr5p2EQVylTU11NewkGwBU5VY3RGJdN/DMa/Wfcl
 R+yA==
X-Gm-Message-State: AOAM5326vKRnVDJJ3U4c2DcklpifnrJgWPvXsDWTn08b/Ab8hL5ospEf
 to7ZIhqPb/eOZp/ujPiGuIel/pXniis=
X-Google-Smtp-Source: ABdhPJwMQBFNO7IbEko9K2q7ivMXRuPMBXixcenvOVpW2z0QtO3AMwXXiAwq9yihu9aLrWx7SWqK3w==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr4023259wrw.235.1616504776572; 
 Tue, 23 Mar 2021 06:06:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i8sm2507590wmi.6.2021.03.23.06.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:06:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] qemu-iotests: quality of life improvements
Date: Tue, 23 Mar 2021 14:06:10 +0100
Message-Id: <20210323130614.146399-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: eesposit@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds a few usability improvements to qemu-iotests, in
particular:

- arguments can be passed to Python unittests scripts, for example
  to run only a subset of the test cases (patch 1)

- it is possible to do "./check -- ../../../tests/qemu-iotests/055 args..."
  and specify arbitrary arguments to be passed to a single test script.
  This allows to take advantage of the previous feature and ease debugging
  of Python tests.

Paolo

Paolo Bonzini (4):
  qemu-iotests: allow passing unittest.main arguments to the test
    scripts
  qemu-iotests: move command line and environment handling from
    TestRunner to TestEnv
  qemu-iotests: let "check" spawn an arbitrary test command
  qemu-iotests: fix case of SOCK_DIR already in the environment

 tests/qemu-iotests/check         | 16 +++++++--
 tests/qemu-iotests/iotests.py    | 60 +++++++++++++++++++-------------
 tests/qemu-iotests/testenv.py    | 22 ++++++++++--
 tests/qemu-iotests/testrunner.py | 15 +-------
 4 files changed, 69 insertions(+), 44 deletions(-)

-- 
2.30.1


