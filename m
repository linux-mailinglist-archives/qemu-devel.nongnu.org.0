Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10F02EF59B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:16:14 +0100 (CET)
Received: from localhost ([::1]:50142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxuQq-0007bh-Tv
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxuP8-0006MD-D5
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:14:22 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxuP6-0000Qc-Iq
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:14:22 -0500
Received: by mail-wr1-x432.google.com with SMTP id m5so9519378wrx.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BrjNW/l5RzOiMdeRnEtjfA7sSUpt4OkW0QFrU5+nuSE=;
 b=aZPZbSYlnjw/247dozjHAdZqbC69NI+1lSNp4vrYriSpNahjZKRcngKTC2z3cc3Ahb
 fWd8p/yb0a42NspiByKZYyw4fuh+EhBOYz+G0YlVlOclKaokwhjFFRARLRPWINUQdqIn
 XAnO2iec536Py+agmF7wlHw+Q8hmO07PRtqSXBba/EXmPu4XVC5+t0ZEqXZWwWfKfL/U
 ydmTFcwsMnBn9CybpjzlyQWCjQ9yYZPPJsQXUJmGI8DeQk9Mx3iaTmRFISxgD7xVH954
 0lllkD7xmT3ERZjg6ptbBOAvwfLJWIK9Vs3Qrh7PVk6BbdQx2TmgBSgNG+R8b4TP0oIq
 6lUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BrjNW/l5RzOiMdeRnEtjfA7sSUpt4OkW0QFrU5+nuSE=;
 b=VNzK41K0QM4sWJ/IsZj0IkpmWYRKLsMkR8ySJwVH/wLlgKzYouyvvWFqt4coE8i+rE
 XnW/f1S3MT0Y906RXAVS9y3hd5i634Lb5PDu+5JTkxjAEg0TnW2BJGW8/xSx1g25qiWf
 1oPfj5vKAvR0wNBxk9uRcXSycbpjBpzGDUKbCm5plFBo6rUMmxxHbJbKrUO3qEqSeqfW
 w+5UiXLSx5x6tmxaO6TSm44MPFFuLSgP1HNJehiSciZuFTISKNZR5S4chbeB87o7iQvj
 QzieLcmlSX6Tzs8Qwhv0KwCPF+F+uWGZuojy3+6i6of9LXhhZVTU3CVOUgHYAxcprlXL
 ioIA==
X-Gm-Message-State: AOAM531h9vZZ/87G+wYYbjFPPECjKhWgug1Lw1GZbfh6hMlaTULfdqqG
 XPG5GIJX9uildJFdS6T9F9BGgjyTuGMt7w==
X-Google-Smtp-Source: ABdhPJxYcYsBMKYMeIrBemcpO3/bOLO6EeJ0xpsKnCvn0+n5nyogVaMrZZrvBsE40yYftoRmxzcW4w==
X-Received: by 2002:a5d:4307:: with SMTP id h7mr4414498wrq.353.1610122458648; 
 Fri, 08 Jan 2021 08:14:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m8sm13261765wmc.27.2021.01.08.08.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:14:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Build all docs in a single manual
Date: Fri,  8 Jan 2021 16:14:14 +0000
Message-Id: <20210108161416.21129-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from v1 up top since they're minor:
 * rebase to account for two new manpages
 * patch 1 fixes the accidental omission of one of the
   new manpages from the meson.build list
 * patch 2 has been reviewed already

Summary of the patchset:

When we first converted our documentation to Sphinx, we split it into
multiple manuals (system, interop, tools, etc), which are all built
separately.  The primary driver for this was wanting to be able to
avoid shipping the 'devel' manual to end-users.  However, this is
working against the grain of the way Sphinx wants to be used and
causes some annoyances:
 * Cross-references between documents become much harder or
   possibly impossible
 * There is no single index to the whole documentation
 * Within one manual there's no links or table-of-contents info
   that lets you easily navigate to the others
 * The devel manual doesn't get published on the QEMU website
   (it would be nice to able to refer to it there)

Merely hiding our developer documentation from end users seems like
it's not enough benefit for these costs.  Combine all the
documentation into a single manual (the same way that the readthedocs
site builds it) and install the whole thing.  The previous manual
divisions remain as the new top level sections in the manual.

thanks
-- PMM

Peter Maydell (2):
  docs: Add qemu-storage-daemon(1) manpage to meson.build
  docs: Build and install all the docs in a single manual

 docs/conf.py         | 46 ++++++++++++++++++++++++++++++-
 docs/devel/conf.py   | 15 ----------
 docs/index.html.in   | 17 ------------
 docs/interop/conf.py | 28 -------------------
 docs/meson.build     | 65 ++++++++++++++++++--------------------------
 docs/specs/conf.py   | 16 -----------
 docs/system/conf.py  | 28 -------------------
 docs/tools/conf.py   | 37 -------------------------
 docs/user/conf.py    | 15 ----------
 9 files changed, 71 insertions(+), 196 deletions(-)
 delete mode 100644 docs/devel/conf.py
 delete mode 100644 docs/index.html.in
 delete mode 100644 docs/interop/conf.py
 delete mode 100644 docs/specs/conf.py
 delete mode 100644 docs/system/conf.py
 delete mode 100644 docs/tools/conf.py
 delete mode 100644 docs/user/conf.py

-- 
2.20.1


