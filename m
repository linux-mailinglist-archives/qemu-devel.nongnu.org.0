Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E1F3D5B83
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:25:37 +0200 (CEST)
Received: from localhost ([::1]:48844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81Y0-0007v6-DN
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WC-0005M9-33
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:44 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81W9-0008NR-Q7
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:43 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j2so11274421wrx.9
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d1DNiMDGg9h9DaXzc3N3hgHSj90PXnBL9MtBH1CZvWQ=;
 b=a/xnfo/SwiqCyjqioCg0vI54NgxGJktrKs2qsfYSeeFnCbAbTE6xUg/V14ecE4iKc8
 Bu3b9PrhZbq7Qszpk3IkSPeW+qEtJsrf83+YS/wI81gy9jTKvXkHHcJkfBdB58qhMx18
 dY1vxksi1MqA5XgH3ylHyOIq6MnI6y9gpPE6ZlaE6eS8FEr5uFZZAdXBKBNqBcwsrfZX
 PxnN19+BK0Hs71oBFvxs0Y7Sdt9i5UnCnQFIlSUBoC+AA94vww1mUVrlAnq4i1F/xwMQ
 2qFg5/vPdUeFpF8xfm1P+opF9KXBByrRtqdQBx9XImEXT00Ptpgt36j7i8iNJmjPhtfF
 EdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d1DNiMDGg9h9DaXzc3N3hgHSj90PXnBL9MtBH1CZvWQ=;
 b=tO/T+MXoeEvkTn1Ul32lbO16jECM31k7ltOiZr3NduOPtgJe4Y84hLz+nknO75DR10
 3vq2rcfVrkXeUwHu0qkO8GSksRdNQ3dY7AZ72BDymSDVL6fntNG7FnNdXrRIQQLmb4Y/
 1kSRIrJQwTv3NSN73DEE5gRqbPXtP5iYYfndAGTswrb782J27TgLavuDJbxa1mecDfIC
 av7j4+vvGpR6NQsVz9t+c9VcajX2Z9n7sp2EI+E5GYKd/H5dVFi+0D/wbcuZvm62TMLc
 hE+FMmQ0LNTWr7HkqfJVe6K1cfzAgaOUkDnEaFBi5uWw0dK8O6G068GwSEJbPnJ63qoK
 s56g==
X-Gm-Message-State: AOAM5301RQTgXD9gTkC5CpQdNXKILXqj/1nBxboStUyetDoWSumIiu42
 x/Mo+Lh7N+NLICnMEHFFAlVDAcwY2wFXXQ==
X-Google-Smtp-Source: ABdhPJxiLZAK/vSl+Pv80OB21cnXs70LJbg19mY51bJrmveJemHQG7jUvKhaJU2wgihLgugCtz7VQQ==
X-Received: by 2002:a5d:5506:: with SMTP id b6mr19228709wrv.318.1627309420338; 
 Mon, 26 Jul 2021 07:23:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 6sm13823427wmi.3.2021.07.26.07.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:23:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 00/10] docs: Format literals correctly in rST
Date: Mon, 26 Jul 2021 15:23:28 +0100
Message-Id: <20210726142338.31872-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In rST markup, single backticks `like this` represent "interpreted
text", which can be handled as a bunch of different things if tagged
with a specific "role":
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#interpreted-text
(the most common one for us is "reference to a URL, which gets
hyperlinked", but it can also be "reference to some other section in
the documentation", "reference to a manpage", or many other things).

The default "role" if none is specified is "title_reference",
intended for references to book or article titles, and it renders
into the HTML as <cite>...</cite> (usually comes out as italics).

This patchseries fixes various places in the manual which were using
single backticks when double backticks (for literal text) were
probably intended.  It also fixes a handful of other backtick related
errors that I noticed while finding these errors.

I used
  git grep '\(^\|[^`]\)`\($\|[^`]\)' docs
to find these mistakes. (That command will also show a lot of
valid uses of single-backtick for URL and other references.)

A handful of files made this mistake pervasively, and I've given
those their own commit each.  Changes which aren't just
single-backtick-to-double-backtick also get their own commit. 
Otherwise I've rolled up the rest of the fixes into "other
docs/devel" and "other".


Peter Maydell (10):
  docs/devel/build-system.rst: Format literals correctly
  docs/devel/build-system.rst: Correct typo in example code
  docs/devel/ebpf_rss.rst: Format literals correctly
  docs/devel/migration.rst: Format literals correctly
  docs/devel: Format literals correctly
  docs/system/s390x/protvirt.rst: Format literals correctly
  docs/system/arm/cpu-features.rst: Format literals correctly
  docs: Format literals correctly
  docs/about/removed-features: Fix markup error
  docs/tools/virtiofsd.rst: Delete stray backtick

 docs/about/index.rst                       |   2 +-
 docs/about/removed-features.rst            |   2 +-
 docs/devel/build-system.rst                | 160 ++++++++++-----------
 docs/devel/ebpf_rss.rst                    |  18 +--
 docs/devel/migration.rst                   |  36 ++---
 docs/devel/qgraph.rst                      |   8 +-
 docs/devel/tcg-plugins.rst                 |  14 +-
 docs/devel/testing.rst                     |   8 +-
 docs/interop/live-block-operations.rst     |   2 +-
 docs/system/arm/cpu-features.rst           | 116 +++++++--------
 docs/system/arm/nuvoton.rst                |   2 +-
 docs/system/arm/sbsa.rst                   |   4 +-
 docs/system/arm/virt.rst                   |   2 +-
 docs/system/cpu-hotplug.rst                |   2 +-
 docs/system/guest-loader.rst               |   6 +-
 docs/system/ppc/powernv.rst                |   8 +-
 docs/system/riscv/microchip-icicle-kit.rst |   2 +-
 docs/system/riscv/virt.rst                 |   2 +-
 docs/system/s390x/protvirt.rst             |  12 +-
 docs/tools/virtiofsd.rst                   |   2 +-
 20 files changed, 204 insertions(+), 204 deletions(-)

-- 
2.20.1


