Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE334CEAD3
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 12:13:05 +0100 (CET)
Received: from localhost ([::1]:37660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQooy-0000tC-28
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 06:13:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQonQ-0007ve-Nl
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:11:28 -0500
Received: from [2607:f8b0:4864:20::52e] (port=35472
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQonP-00082l-9d
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:11:28 -0500
Received: by mail-pg1-x52e.google.com with SMTP id e6so11266018pgn.2
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 03:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FZsCEDgyY83g2ZdMIjsm4aB0k7mu1P+oe6bYBYyYzhY=;
 b=H5YqoYMVhxRTfp7mUDkibE9VDlGjyJZCaUu5d1Jm7ilGNJ6V1UJfBak8oTxxwFAy3k
 yDsn3UOjBfed44Wuwp+F6UDweart6fdOjsTKFGMPnTOHADwkPGqj8lHwqyfBvyCfVtKu
 3LgNXekML4/E2Hy+BuXYYjj/aMKc9gwZMEluI937Oj9RMjkvN3Gymd49lUR9HSX+4FtV
 3OWQhkIxH4H+W4Kmb9yz30GVjSnB38twse2APgDgzW40fOvNwiUBaml/2Z1OjsdHyhch
 DYo7qLof8jZA5V6FxgolQtJPeQEZgF2CzCooS8sbm/rNXocsMZrzgwSXJyuGLn6Wu7nu
 doWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FZsCEDgyY83g2ZdMIjsm4aB0k7mu1P+oe6bYBYyYzhY=;
 b=iPn40JMIn+21wr33rSrapKQlrIdB28eswde5HjETH4bZRxuS5Z4D+kM8ULId92350m
 mCgFVvR0Zxwl/K25FTMIX4CGmYMYn9IZSFCESD7V77z/VyMXP8q0ftUzq61vBvc4Zp6q
 neqPTFKpj4R1XTZ2RLCwSnXpSfWVeGB7UV/vomC7Yfxl8nz5S5rRGTqOY8R1/yZPCOb3
 9ZtV1oWu69THxnnp+ndyhL6ql/ig/mX7mhxL2h0AmcZexDQxPpk+TuIP3sgtCOMsDbkS
 Jq4CDOSy5egodYhP8sGWOGl6/J/og8VrXOkBBtC4iDArJNQlI5MafpfJpABJ4DBAcZOn
 rQjg==
X-Gm-Message-State: AOAM5312RlTLWBIIW0AdNC3F3+yaFKx002x7d0rI5TyNicfVsMtUIa+n
 7RFkM1GpOQgg1X06eBLkyoFcMpG6vBw=
X-Google-Smtp-Source: ABdhPJyQhWjUqlhIFpzTpl4QsATQsyrSJX7tk4DOBM+34jFyVwP/FoO9JS/wTx+vwuxgrC/DfswGyw==
X-Received: by 2002:a62:cdcd:0:b0:4f6:f5c2:47d9 with SMTP id
 o196-20020a62cdcd000000b004f6f5c247d9mr972936pfg.26.1646565085761; 
 Sun, 06 Mar 2022 03:11:25 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:9574:a172:f92a:5d0f])
 by smtp.gmail.com with ESMTPSA id
 o185-20020a6341c2000000b0036fb987b25fsm9132662pga.38.2022.03.06.03.11.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 03:11:25 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 0/2] cocoa: keyboard quality of life
Date: Sun,  6 Mar 2022 20:11:12 +0900
Message-Id: <20220306111114.18285-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Eric Blake <eblake@redhat.com>, Gustavo Noronha Silva <gustavo@noronha.dev.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch series was originally posted by Gustavo Noronha Silva,
and rebased to commit 2acf5e1d0e0f15be1b0ad85cf05b3a6e6307680c by
Akihiko Odaki.

This series adds two new options to the cocoa display:

 - full-grab causes it to use a global tap to steal system combos
   away from Mac OS X, so they can be handled by the VM

 - swap-option-command does what it says on the tin; while that is
   something you can do at the Mac OS X level or even supported by
   some keyboards, it is much more convenient to have qemu put
   Meta/Super and Alt where they belong if you are running a
   non-Mac VM

Both are off by default. For full-grab in particular, it is off also
because unfortunately it needs accessibility permissions for input
grabbing, so it requires more deliberate action by the user anyway.

Gustavo Noronha Silva (2):
  ui/cocoa: capture all keys and combos when mouse is grabbed
  ui/cocoa: add option to swap Option and Command

 qapi/ui.json    |  22 +++++++++
 qemu-options.hx |   4 ++
 ui/cocoa.m      | 129 ++++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 146 insertions(+), 9 deletions(-)

-- 
2.32.0 (Apple Git-132)


