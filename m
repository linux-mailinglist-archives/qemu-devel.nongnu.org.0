Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DB83713FD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:08:16 +0200 (CEST)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWQx-0007tu-98
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWKN-0001uk-Qb
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:01:27 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:45052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWKH-0004q7-L6
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:01:27 -0400
Received: by mail-ed1-x52b.google.com with SMTP id bf4so5749517edb.11
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N4G61IabIDukIL75IQTnPOqMqxiCIpIUA8V0+YSMapw=;
 b=JQyL7gymEcGcRuIcYZNiWtsECPr66or2nJd1TaBaP55oBigPKSmOZ1KTALFNzx7M0W
 h6r/KN1/pKzXbpl8pCdLSNYeEMwDbqH8AN53qzWjXzF7i4TH8ILx0vBT2KqxAzGeSP9T
 idn2XzttfttE8iiMh/7/mJ6dyHGlGafqjUtGA2/1xj4/iU+tiXnckpq+k1ThIeFXsvVO
 xz+LtTeltNUcNHpAdBctFgCt8e9SGNN2/eZFNPtyyu1WRuxxbbJVvi73BR0IuzVRXY39
 CpZ2FqXeXSU26zrm2PjWZP9PDwFNwvYSWzOCH+9nfqV89qz3clq17uCYwQ1TPKVhYMiP
 rQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=N4G61IabIDukIL75IQTnPOqMqxiCIpIUA8V0+YSMapw=;
 b=ueJrM+RiYGv2oDwcF7oUay5gq/nlD/5c9ODpwPYcIFNDLztcP8mBHVCnb1xUorlW5r
 oj0j7tzZ1//bUNJtQlgy+3gifzk76F02zV/OIP92/INGXaUhBSDbJnx9IzGjaNZK5vmE
 KVPkyH9v78BEF9P5eiWuEJ+AFXsw0Pzyjei3B85Hax2dcllh7IOEjXIjCktWRtQ6sh1j
 JGTRuaqBidg6+/BPDQ/FlpRWRSTfXpaP7ZlNQG0kakLswYclKfiX7ByuGSWrd//AMA04
 pci114KVjYJTIV7dlbRdBVszIUbT4RsuSsnHtp7zyiw1AUxLbcJp7T9BGXOoPamoDIUb
 xUlg==
X-Gm-Message-State: AOAM533m1AiMszdOeRRPyfHyfrh9OeufyIJx1dO++CJlmXhpgtJeHfXU
 6ra8cz+Ya6W8E1jXWMHT+Id04W78hHQ=
X-Google-Smtp-Source: ABdhPJztrzTjv6oHlPJDSHxef7XJsE6aV7KJGsKDrQ3XhFEdn8MmEvJKCRZJYzmX0L2sSP7rI+5JUw==
X-Received: by 2002:a05:6402:42d0:: with SMTP id
 i16mr19391059edc.212.1620039674191; 
 Mon, 03 May 2021 04:01:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id v16sm12041464edt.53.2021.05.03.04.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:01:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] qemu-iotests: quality of life improvements
Date: Mon,  3 May 2021 13:01:05 +0200
Message-Id: <20210503110110.476887-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds a few usability improvements to qemu-iotests, mostly
for Python unittest-based tests.  In particular:

- the output of the unittest framework is not buffered, which makes it
  easier to follow the "-d" output of the tests

- arguments can be passed to Python unittests scripts, for example
  to run only a subset of the test cases (patches 1-2)

- it is possible to do "./check -- ../../../tests/qemu-iotests/055 args..."
  and specify arbitrary arguments to be passed to a single test script.
  This is especially useful together with the previous feature and eases
  the debugging of Python tests.

Paolo

v3->v4: output of Python tests regenerated when needed

Paolo Bonzini (5):
  qemu-iotests: do not buffer the test output
  qemu-iotests: allow passing unittest.main arguments to the test
    scripts
  qemu-iotests: move command line and environment handling from
    TestRunner to TestEnv
  qemu-iotests: let "check" spawn an arbitrary test command
  qemu-iotests: fix case of SOCK_DIR already in the environment

 tests/qemu-iotests/240.out       |  8 ++--
 tests/qemu-iotests/245.out       |  8 ++--
 tests/qemu-iotests/295.out       |  6 +--
 tests/qemu-iotests/296.out       |  8 ++--
 tests/qemu-iotests/check         | 19 +++++++-
 tests/qemu-iotests/iotests.py    | 80 +++++++++++++++++++-------------
 tests/qemu-iotests/testenv.py    | 22 +++++++--
 tests/qemu-iotests/testrunner.py | 15 +-----
 8 files changed, 101 insertions(+), 65 deletions(-)

-- 
2.31.1


