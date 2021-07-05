Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EB23BBAA2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:58:24 +0200 (CEST)
Received: from localhost ([::1]:42364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LMt-0006FY-S9
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKU-0003Xp-GW
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:54 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKS-0003r8-E5
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:54 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso9507874wmc.1
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 02:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pX/+HettxtPW1MHBO5zXwFGRViUJe2V8GhG6S/aFs7s=;
 b=o8TDwKm+cxUNaa+MmnfC+1aktzZMYgBMArJFAvhMDYMmZiHFhQcSfoHzb9VirPg3uN
 4tBN01Qry242IO0NZLiT/orPeO/5UHs+lbbkI04VCk3WCXbal59ryObM1OpqmNOkfRNR
 jJC9s1xtFKy+ajOq6kD2F0Gx7E3IHltEyPFh6zYBMnQLlwmZoLQbDD8Vw3GjcUOT+8Ur
 itC22lJpQAbfnK8nyuo73GRkHgLTKpWTMPEszJjDQb+Ho390qtnZ1QYr4lDwN3940Rfm
 n9kpO44FX3f8eavbQtj2xl4YaOEUqIKwuYIIz4ySos6cU4T8NjasOGyi+/FEMMd7ZcTN
 59Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pX/+HettxtPW1MHBO5zXwFGRViUJe2V8GhG6S/aFs7s=;
 b=h4tre0AcWprhkDfFRVudomAfog1VdLHY7fXuBo5xMqfZ54t38hHoaf03DurQCY+boA
 1y62+s8LrtNLVA1J0zFqwxZC2rqyTSBgFclm73Ny5T9w8+RbeuQ5GAT9JgY5crp4kkIx
 6N0czl4kZi+2oaE6wu+usnNbdL00+qLMOEfV9kXLNWySKkTbUM+EDiidR+LkefDGA/VH
 eG28EQk/ghy1WMK9Vg8e3QZSAUfW6ng4Hz5HH+wQjispNLLBTk2ZXpX9AwQ5AQe7G9C/
 H1u8EqcwHUEHD2B//F+q2St7AZGmfz0vv7QyOiswZT4LfRLTBRRA5RTuUwTJi+4IERJu
 a1iw==
X-Gm-Message-State: AOAM532dV/zT1XC0tDMO8a/EAvT1ipHR5MPUZeiL7wCG6JH8BjEnkg1r
 B/ohO+mL5jRXLvfDWLp9k1kNzqUd3NO7oKhK
X-Google-Smtp-Source: ABdhPJyVpXLxXk1K9JGeWJgc/X5vkb2I25E25uxPQzcVPQ0rfLgqeHTFU1Cl8D/yW+mqrYMZRspjPQ==
X-Received: by 2002:a1c:1dd1:: with SMTP id d200mr13925537wmd.82.1625478950425; 
 Mon, 05 Jul 2021 02:55:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i5sm12528727wrr.4.2021.07.05.02.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 02:55:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] docs: State QEMU version and license in all HTML footers
Date: Mon,  5 Jul 2021 10:55:40 +0100
Message-Id: <20210705095547.15790-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset is an effort to fix something up which I promised
Markus I would do after we got the initial conversion to Sphinx
done. The old QAPI reference documentation noted the documentation
license in the texinfo source (but not in the generated HTML or
in the generated manpages); Sphinx generated docs currently don't.

The patchset starts with some tidyup that is possible now that
we have a single combined HTML manual rather than five separate ones.
Rather than putting common-to-all-QEMU info like the deprecation,
build and license pages into the "system" manual, we can move them
out to a new top level section which I have called "About". So that
the manual doesn't now start too abruptly, I've also added some
actual "about" text here (mostly cribbed or adapted from our website
or from other parts of the manual).

Secondly, it uses the Sphinx template-override functionality to
add more text to the footer added to each HTML page, which will
now read:

# © Copyright 2021, The QEMU Project Developers.
#
# Built with Sphinx using a theme provided by Read the Docs.
#
# This documentation is for QEMU version 6.0.50.
#
# QEMU and this manual are released under the GNU General Public License, version 2.

where the last line is a hyperlink to the about/license page.

I'm open to suggestions on:
 * name of the new top-level section
 * text wording
 * whether we need to have the version number in the footer
   (it's already in the sidebar under the QEMU logo, but this
   seemed a bit too inconspicious, so I added it to the footer
   since I was messing with it anyway)

You can find a built version of the docs at:
https://pm215.gitlab.io/-/qemu/-/jobs/1399259647/artifacts/public/index.html

I had a look at getting our manpages to also state the license,
but this is tricky due to various deficiencies in Sphinx.
(We never have stated the license in our manpages, so this isn't
a regression compared to the old texinfo setup.)

Markus: do you feel this series is sufficient that we can remove
the TODO lines in docs/interop/qemu-ga-ref.rst,
docs/interop/qemu-qmp-ref.rst and docs/interop/qemu-storage-daemon-qmp-ref.rst
as now being done?

thanks
-- PMM

Peter Maydell (7):
  docs: Fix documentation Copyright date
  docs: Stop calling the top level subsections of our manual 'manuals'
  docs: Remove "Contents:" lines from top-level subsections
  docs: Move deprecation, build and license info out of system/
  docs: Add some actual About text to about/index.rst
  docs: Add license note to the HTML page footer
  docs: Add QEMU version information to HTML footer

 docs/_templates/footer.html                 | 14 +++++++++++
 docs/{system => about}/build-platforms.rst  |  0
 docs/{system => about}/deprecated.rst       |  0
 docs/about/index.rst                        | 27 +++++++++++++++++++++
 docs/{system => about}/license.rst          |  0
 docs/{system => about}/removed-features.rst |  0
 docs/conf.py                                |  2 +-
 docs/devel/index.rst                        |  7 +-----
 docs/index.rst                              |  1 +
 docs/interop/index.rst                      |  9 ++-----
 docs/meson.build                            |  3 ++-
 docs/specs/index.rst                        |  7 ++----
 docs/system/index.rst                       | 11 +--------
 docs/tools/index.rst                        |  7 ++----
 docs/user/index.rst                         |  7 +-----
 MAINTAINERS                                 |  1 +
 16 files changed, 55 insertions(+), 41 deletions(-)
 create mode 100644 docs/_templates/footer.html
 rename docs/{system => about}/build-platforms.rst (100%)
 rename docs/{system => about}/deprecated.rst (100%)
 create mode 100644 docs/about/index.rst
 rename docs/{system => about}/license.rst (100%)
 rename docs/{system => about}/removed-features.rst (100%)

-- 
2.20.1


