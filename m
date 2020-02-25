Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B3516EA4C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 16:42:36 +0100 (CET)
Received: from localhost ([::1]:59194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6cLy-0004kc-1Z
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 10:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6cKt-0003Aj-Fp
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 10:41:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6cKs-0000up-9g
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 10:41:27 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37682)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6cKs-0000u0-2P
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 10:41:26 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l5so11028050wrx.4
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 07:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f4rxWS4X+vy3OIL39nyYoUkXQqJnT2NfBi6SgRM6em4=;
 b=ShITqU+WEak288bQA3s7R5j6AC+VAANoltf5ZdtqNlY2hfieWqrAPsQ2n7UdWHUaQb
 qd/GJguFAxrupH/7Tt7NSAjJ73xjAk4yTFPCw/rS4gZU8kU9jYWGGPL9+Vw+FSnDdPFJ
 oWVgC3BeO+ad5FJ9zvBzskt0kMOr6qucFRFKIA+fYR/8rLTQ2fUQNS+csLJE+6fvIVHT
 fkTCNGMn7ulqLCItM+KeU8hSOBi8YB9hlIqPfoqIh1G9NlqCEg9vuiiII3PAtaA7ra9D
 XC88ugUBJhcc97IAZA8CPvhk81Ff3xbT7U0jGYHYgZQZaWz+QBkjsOrNlSEx5TDvZ1ww
 s1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f4rxWS4X+vy3OIL39nyYoUkXQqJnT2NfBi6SgRM6em4=;
 b=njwh8ydBsmrXNioERYj5EFFp474hU/f/hGucUmy9A2HRGEi9wjEmF8WS2IowhPanQP
 f1qS+5hnonuB8h60yeGRfL6Oyxkd4pm5sec2acV1S9YyqnukBURXD7d+jHV+oRXnHOfn
 XCXLnwzKxSLhYKlWZNmjX5+NFsauyWa3bQ5aXUsp6UR/pNqWOb0X2z1Gifvio+qykbsa
 BmknvnEJr4/l9LBhYlgcfOaHI6Rla4CZKiOHi7XdJXgfJ+BUuzp4JYh/eYfmcDT/4fD+
 w9zXyvSHlAGcEfDMd3WARJltWfyhNFHvizKEgBDIyZZ6rNXHbYn0bnP9AI3U+EIw/XE3
 wwiQ==
X-Gm-Message-State: APjAAAXWvK/Knl314DOPaQJtd1HsCLAzzWRJpFUqlBsF6wkgF3Ursajl
 blZdvjfqS0LPTnd1H6xvTf/34pKbqggVbQ==
X-Google-Smtp-Source: APXvYqzXW0rJnrg9e+guILSHONYcCR+o6qAdlWBb1WJB6arZ/TNvIVl3cLFJ9s1ReCA/DjLM8nJpdg==
X-Received: by 2002:a5d:628e:: with SMTP id k14mr11077671wru.425.1582645284007; 
 Tue, 25 Feb 2020 07:41:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c9sm24438604wrq.44.2020.02.25.07.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 07:41:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] docs: Miscellaneous rST conversions
Date: Tue, 25 Feb 2020 15:41:17 +0000
Message-Id: <20200225154121.21116-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
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

This patchset converts some texi files used in qemu-doc.texi to rST:

 * docs/security.texi
 * qemu-tech.texi
 * qemu-deprecated.texi

which all end up as sections of the "system" manual.

In all cases, these pieces of the documentation are part of
the qemu-doc HTML file, but not included in the qemu.1 manpage,
so they are just a straightforward format conversion.

security and deprecated are pure conversions with only
changes to the formatting, not to the contents.

For qemu-tech.texi, a large part of it was an extremely out of
date and partial attempt to document the limitations of our
CPU emulation. Apart from a change to the Xtensa section in
2012, no part of the actual text seems to have been updated
since 2008. I judged it better to simply dump this rather
than carry it over. Creating an actually accurate section
about the limitations of the various guest architectures
is probably easier done from scratch if we want it and are
prepared to actually keep it up to date this time...

thanks
-- PMM

Peter Maydell (4):
  docs: Convert security.texi to rST format
  docs: Remove the "CPU emulation" part of the "Implementation notes"
  docs: Convert 'managed start up options' docs to rST
  docs: Convert qemu-deprecated.texi to rST

 Makefile                                    |   6 +-
 MAINTAINERS                                 |   2 +-
 docs/system/deprecated.rst                  | 446 ++++++++++++++++++++
 docs/system/index.rst                       |   3 +
 docs/system/managed-startup.rst             |  35 ++
 docs/{security.texi => system/security.rst} |  82 ++--
 qemu-deprecated.texi                        | 386 -----------------
 qemu-doc.texi                               |  10 -
 qemu-tech.texi                              | 195 ---------
 9 files changed, 532 insertions(+), 633 deletions(-)
 create mode 100644 docs/system/deprecated.rst
 create mode 100644 docs/system/managed-startup.rst
 rename docs/{security.texi => system/security.rst} (77%)
 delete mode 100644 qemu-deprecated.texi
 delete mode 100644 qemu-tech.texi

-- 
2.20.1


