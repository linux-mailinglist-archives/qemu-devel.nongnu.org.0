Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C48333AAD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:51:23 +0100 (CET)
Received: from localhost ([::1]:48974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwR0-0005E7-62
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJwPO-0003uR-NA
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:49:42 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJwPN-0003kG-0v
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:49:42 -0500
Received: by mail-wm1-x32b.google.com with SMTP id i9so6809523wml.0
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NNMa1QRJpNqX+GsZR0IJNP2KXIqHi7BQecd+LgFoRWU=;
 b=qAyDWbduZa2D+k/hB1hs2x8wDhp9XbwtwC1/Xdppx1P5a7nrVk6KHPmbdKaprdcoXb
 mzq7WV7uX0RShGIHpUfYxJmyx962UXOMyn8Ny4LfB388qt2nYCfmoFWLj3kXPmA2RBRx
 aMAggACukyazXbT4f0XdZdNJz/dQPX15cffkSmH7VRFqKtPIUgepsSBBK2iEulbsvlnj
 6dK3j/a+CTdj6RvhWBvRFh3G7sdIHjm8w00iO+PigMp05rgtbJTQVDrV+9qC491rqA/t
 Zspg3yFlNVPWftXAAhOCLhJVXk5jzKZTrqove0x8pZloHPYT29SBFrQaHMLbRDIWDDCi
 hnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NNMa1QRJpNqX+GsZR0IJNP2KXIqHi7BQecd+LgFoRWU=;
 b=H+bkcdtdXfBBvAi9i1nnrpPw5EEsJDhKI3AC599olpioZxkXc1pmD5ctobADEcYTLo
 gn4Wd+dezncUsJX0aBalLrmdGCTu0HmWfHu68yXWtBXDMGCURHAj6GdJg4iHqj8GKCWL
 tvfA98cuJnpTI4pPEZ3w9x/DdgIs5oeqXRlYF4ERQzAlpOzhCNop9+4ZAcj8bPgAoX3w
 V1M4QmNDEZtMATEYFar0jfrny4eMqqB8lOfgw3nf2Q/fExkL7baqV1dnDWjhTU6b9gSu
 LRA+tFMfAlK/71tMJapI7gcDbxxQ89WGjbL+FbtpGcaVFa5Qne7a6hbCC++TfLeKYLWj
 0Esg==
X-Gm-Message-State: AOAM533UQTZ8VweCXE3zA2zh1Bfqi6iZItyuyCzOd8iVevI+sNV3PjmC
 YEzIcPUnEbL5mFUpVAEiIsiP8hMcnDk=
X-Google-Smtp-Source: ABdhPJyGHvq+QuIpU2tXRq+WGX/OJ0r/Vn0ppeWTu+ZIIyzQ4E4dS3636QPc8l36QUBIxEBBlstxiw==
X-Received: by 2002:a7b:c396:: with SMTP id s22mr2700295wmj.38.1615373379393; 
 Wed, 10 Mar 2021 02:49:39 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s11sm9060808wme.22.2021.03.10.02.49.38 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:49:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Upgrade Meson to 0.57.x
Date: Wed, 10 Mar 2021 11:49:33 +0100
Message-Id: <20210310104937.253532-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While Meson 0.57 was already tested with QEMU prior to the release, it had
a few regressions so I opted for waiting until a few weeks after 0.57.1.
This way, distros that want to avoid the bundled versions of Meson do not
have to deal with the bugs in 0.57.

There are some new features and changes that are of interest for QEMU:

- there is a new "env" keyword argument to custom_target, which
is nice to have in the hexagon target.  This is handled by patches 1
and 4; patch 1 also fixes some Windows portability issues, which currently
are masked by not having a softmmu target for hexagon.

- that build.ninja sorting order is stable and rerunning meson will
not trigger a full rebuild.  Unfortunately this is not enough to
avoid full rebuilds in subsequent CI pipeline phases, those seem to
be caused by "wrong" timestamps after a checkout (see for example
https://gitlab.com/gitlab-org/gitlab/-/issues/234078).

- with the new version it is possible to use "meson test" to run
the QEMU testsuite.  This is not yet done by default, and it won't be
for 6.0, but you are encouraged to try it out.

- there is an easier method to load a project's version from an external file

Paolo Bonzini (4):
  hexagon: do not specify Python scripts as inputs
  meson: bump submodule to 0.57.1
  meson: switch minimum meson version to 0.57.0
  hexagon: use env keyword argument to pass PYTHONPATH

 configure                     |  7 +----
 docs/meson.build              | 12 ++++----
 meson                         |  2 +-
 meson.build                   | 54 ++++++++++++++++-------------------
 plugins/meson.build           |  4 +--
 target/hexagon/meson.build    | 31 +++++++-------------
 tests/meson.build             |  2 +-
 tests/qapi-schema/meson.build |  4 +--
 tests/qtest/meson.build       |  2 +-
 trace/meson.build             |  4 +--
 10 files changed, 52 insertions(+), 70 deletions(-)

-- 
2.29.2


