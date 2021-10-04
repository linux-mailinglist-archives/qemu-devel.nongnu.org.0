Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C3F4208C6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:52:23 +0200 (CEST)
Received: from localhost ([::1]:41210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKdy-0007uO-0n
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXKJa-0000o7-8m
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:31:20 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXKJX-00070M-Ch
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:31:17 -0400
Received: by mail-ed1-x52f.google.com with SMTP id x7so60927776edd.6
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i9BT+0oePL20RQDPtlzhUNEXatQgC07FzoIPEtohDug=;
 b=NzYjoBo0JRj1DVKrrfr95ngzVNV8esWo+vPkdYXuiEsJAEvCv1HYpY+eL2KqwKy21m
 uV3sOOjNfCIS51Du2cay5TQmGMIilK8Ig/IC5sI2bEFEAXwxP2hsedgUgrKcREVnQVfP
 6rE6i4PHimUJ1mVfH6eHDt4OnWWujPiriis0edAOVFQ6oRgcZERvkUj87SlUHVQyh9t3
 qaohF9yHQVCS2jt4pBu0AyCmuGmmpwbyewk7E4ZsvSZKrH6enZtzL7R2V6zLLPHfBkYA
 A/Sh1fNx4KXE/YqTQkj1w792lKKyDOsOFo9y67/U/kllk8SfZHe1tyUvw+BLeDY6HPMw
 wxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=i9BT+0oePL20RQDPtlzhUNEXatQgC07FzoIPEtohDug=;
 b=M29/5HzeIVkOQeb4H81HyCXdXYgvlQCS5OKFecFj5f+T9J4TASPKXEi97ji3rYMW2Z
 A/OX482p0hE7GlKGQyr1/A+eH+6dpTpQf9b1BsbTXPlBWa+sLLlcDVeU4lSviSkmpwWm
 8Erl6fhOR8yewQwzncHS4/B0d1y82XQclY0VaqXzfVQAxkLQiSP86buTMaRwPbV1BDjZ
 /HszdI5T2yZI59Is2W8Mjh/Yi2OqHRG5/izKfjq/1XA2MCH0eEHrwJmu1C9bcruG/n4N
 3KtAW7ObGHvH5u/MEjh9oQVj7GY2GSJodjVG9e6QYMqoB2ay8lfGuXBSI+S3HCUPN7bc
 somw==
X-Gm-Message-State: AOAM530uWB2IJzY2g1pdxwj0UhiJW3+gGgRep+//5vYapF3OzT7EZEjA
 9WYuxF5Ovjds1r8pFtUXhkvR6ZXMzSs=
X-Google-Smtp-Source: ABdhPJwfHZU4PpSX7sBpgPoTFZa8rCST6FPI4aZzv9W5/GPGFjRgej/SsdNJQD0gDArbkVjUC8oPnQ==
X-Received: by 2002:a17:907:98d7:: with SMTP id
 kd23mr10755765ejc.542.1633339871793; 
 Mon, 04 Oct 2021 02:31:11 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id d21sm5007143edp.27.2021.10.04.02.31.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:31:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] Upgrade minimum Meson version to 0.58.2,
 recommended to 0.59.2
Date: Mon,  4 Oct 2021 11:30:48 +0200
Message-Id: <20211004093053.87883-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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

Now that 0.59.2 is out, we can show library versions in the summary.
Since that feature is supported in 0.58.2 but broken in 0.59.{0,1},
allow --meson= to use 0.58.2 but default to the bundled submodule
if the host has anything less than 0.59.2.

Paolo

Paolo Bonzini (5):
  meson: bump submodule to 0.59.2
  meson: switch minimum meson version to 0.58.2, minimum recommended to
    0.59.2
  hexagon: use env keyword argument to pass PYTHONPATH
  target/xtensa: list cores in a text file
  meson: show library versions in the summary

 configure                     |   8 +-
 docs/meson.build              |  14 +--
 meson                         |   2 +-
 meson.build                   | 166 ++++++++++++++++------------------
 plugins/meson.build           |   4 +-
 scripts/mtest2make.py         |   7 +-
 target/hexagon/meson.build    |   3 +-
 target/xtensa/cores.list      |   9 ++
 target/xtensa/import_core.sh  |   3 +
 target/xtensa/meson.build     |   4 +-
 tests/qapi-schema/meson.build |   4 +-
 tests/qtest/meson.build       |   2 +-
 tests/unit/meson.build        |   2 +-
 trace/meson.build             |   4 +-
 14 files changed, 115 insertions(+), 117 deletions(-)
 create mode 100644 target/xtensa/cores.list

-- 
2.31.1


