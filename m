Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84962410580
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 11:34:03 +0200 (CEST)
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRWjS-00024R-HY
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 05:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mRWhO-0008Jb-BN
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 05:31:54 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mRWhM-0003c9-E3
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 05:31:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id y132so9121144wmc.1
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1UiXJN8o6EICo3/XA6naRiecUM1xvTySsauOAA6fqrg=;
 b=iox9XARuMAK9OAv2R/qMUFEUDpyuemQrwAkZ66Zv12bGWw9Js9NhfPpBUZJYaPLpIZ
 x8jJW+LSZiMuaejKzCJpd7SPUb9V9McFlUKwOjL67BJW2qQH3xaeweuhNs2wpBvY8AtI
 lEpPveE5RAOqVczZKbLdWsQCV6TpgGAKWL5WL16YgBs2rIjy7tCXxeOKbKb/KGrVZysd
 oqZvVSzsxa9up4vhxqmMMB9KXLiplTMNHXmDBDX378SAHABfUeBFElxbGaDdfYosSwRH
 Rz4TxlJBIBh5YQG00G3DTCDS1LG31Q8P5taDiP1tuMqOzeCJaNiOK3eHB9KIV6H21jjx
 P2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1UiXJN8o6EICo3/XA6naRiecUM1xvTySsauOAA6fqrg=;
 b=C2Lmk46D3tFRF9ZdKQX4Ug6VdDdAmck+I2jwS5oCynTT4tv12iEcvo8uS0XB638P1g
 xKSeEYRqTavisZT8EWEFN3iexAY186Hza5ZAFvr0+daiqRb5HvoRTyC1h3kbo7hjGBRw
 wmjCOub7SiOEwKpxKGbMqJWW6n8vnmTsV/RLJDP9aT7Z6MQo8560shjFfdX0DlQVpgZY
 jVObpc0eq9A/cKGwECJZEhqolRMAJv7Vfv+tdOAfrkZmD/Tjn4T8KBwMMHnekftCYzuu
 hL5HNUhZLJWgJo7VcfFnnlxpWyNTUeGguGemiW/z0pKq3xnkbw4lMuFsxazB5cEzBMs0
 vbFg==
X-Gm-Message-State: AOAM532sUuvYcbXzUZwgoPCx/0nI/U8LIzKMJT8fES69Z7QKtZImjSSe
 ngM+lEkWHpTWVCrd++Y52XWCz5PdQjE=
X-Google-Smtp-Source: ABdhPJx05Cwr/ZTLYLH2zUjmE5ShT/hMXDzy5Rf8xTexSomb0nH+NwrXK+foTg7eM9rVbTPrQ2UD1A==
X-Received: by 2002:a05:600c:3b89:: with SMTP id
 n9mr19446528wms.186.1631957510039; 
 Sat, 18 Sep 2021 02:31:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j14sm9233858wrp.21.2021.09.18.02.31.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 02:31:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Update meson version
Date: Sat, 18 Sep 2021 11:31:37 +0200
Message-Id: <20210918093140.5797-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
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

The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529:

  Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' into staging (2021-09-14 18:14:56 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to ccc3f971c37bd2202a21abc9f0be093f10426364:

  hexagon: use env keyword argument to pass PYTHONPATH (2021-09-15 09:12:55 +0200)

----------------------------------------------------------------
* Update Meson to 0.58.2

----------------------------------------------------------------
Paolo Bonzini (3):
      meson: bump submodule to 0.58.2
      meson: switch minimum meson version to 0.58.2
      hexagon: use env keyword argument to pass PYTHONPATH

 configure                     |  8 ++-----
 docs/meson.build              | 14 +++++------
 meson                         |  2 +-
 meson.build                   | 54 ++++++++++++++++++++-----------------------
 plugins/meson.build           |  4 ++--
 scripts/mtest2make.py         |  7 ++----
 target/hexagon/meson.build    |  3 ++-
 tests/qapi-schema/meson.build |  4 ++--
 tests/qtest/meson.build       |  2 +-
 tests/unit/meson.build        |  2 +-
 trace/meson.build             |  4 ++--
 11 files changed, 47 insertions(+), 57 deletions(-)
-- 
2.31.1


