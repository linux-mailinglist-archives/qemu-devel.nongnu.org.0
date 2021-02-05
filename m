Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90F4310FEC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:31:48 +0100 (CET)
Received: from localhost ([::1]:37614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85tT-0005Vn-Rk
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84kw-0000uq-1k
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:18:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84kV-0003L9-Ds
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612545506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IGa1pgQ/AXW4WZ4zKvD9M8LC5UujMj5DWAZK3qBm83A=;
 b=hq5/SlyUgJh9rgjWKPidmDUDvQpBe6vJERQWgQ2hlArQaFwZgnpyZB9MhO7k5Xn8DKMtyj
 JO86ai0tNWY8KulWynicoTc1yfJ4sTlTlOPBKc30VBeobrXF7no/pI99ITeQ6cEOqQp5vP
 1f/reyI3T/qaQuc8SrOyi2werDuNGFg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-00YkfLL3NgqXpIXjH1txWA-1; Fri, 05 Feb 2021 12:18:22 -0500
X-MC-Unique: 00YkfLL3NgqXpIXjH1txWA-1
Received: by mail-ej1-f71.google.com with SMTP id jg11so7126233ejc.23
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:18:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KlB3WwY2i2D4EQAlurNaD/gKTRdbN+b1KU/vGUtOHc0=;
 b=QMq4Bpx0qaoSFTSVxsAwnSNIpCxwef7kBCVoPyEg4asRKZdbQlJgUi15+eSVst63rJ
 79ZTHXsRb/W9M/FTdxOjpweTSw8nVjjO7LKCWJ2O/EyKuNdxJcJLBq1w5tazwHil5q8B
 dg7YToxgXd/ajmgqknPxpL1U636jCsP8JrKu3DEyXjKHUgkWnm8cW3XQCBuVKuA9xCSc
 LNbGK04uZVPvSHbwBuVCIpN+FRdkt/g69qC0lsBPlqOPhWQYp1CeFSCR65WJ5sNZChXZ
 /s9oKb5zwdn+zl2owGOCA90xRpJAXVrlkLzFZtpUJ6zGORa1KH5IfSQ03poVAVn6abiM
 YguA==
X-Gm-Message-State: AOAM533t6e+d4JdTR8ssesZrBFIdsgOUHIW8rT6oQxIjfcTp8tNvh3CW
 mjsAr29R/QeBWmcrK7XPuCoaRbXBaN+6gAlVnD7s0oWqkfiVP6MgIGnYiozV/ZvjGyIVlRtcRHV
 +WpN9XaTuivyeyAE9B/Vtze/1H1+A6TUWfngiIwpmGqgeEthvypvs0e9LCWVFr0CW
X-Received: by 2002:aa7:d755:: with SMTP id a21mr4432856eds.301.1612545500749; 
 Fri, 05 Feb 2021 09:18:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIPSgNDdYGjFqBrrFDkU5cTu7f7Fw6WJEC+BPD4DZKI3gQ0qR8ATJ4AVEcnoc56ZmACuWRlw==
X-Received: by 2002:aa7:d755:: with SMTP id a21mr4432832eds.301.1612545500560; 
 Fri, 05 Feb 2021 09:18:20 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r11sm4216270edt.58.2021.02.05.09.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:18:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] misc: Replace the words 'blacklist/whitelist'
Date: Fri,  5 Feb 2021 18:18:09 +0100
Message-Id: <20210205171817.2108907-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your=0D
Open Source Projects" guidelines [*] and replace the words "blacklist"=0D
and "whitelist" appropriately.=0D
=0D
Since v1:=0D
- dropped qemu-guest-agent patches=0D
- addressed review comments=0D
- added R-b tags=0D
=0D
Missing review: PATCH #6 "qemu-options: Replace the word 'blacklist'"=0D
=0D
Series expected to go via the qemu-trivial@ tree.=0D
=0D
[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md=
=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  ui: Replace the word 'whitelist'=0D
  tools/virtiofsd: Replace the word 'whitelist'=0D
  scripts/tracetool: Replace the word 'whitelist'=0D
  scripts/device-crash-test: Replace the word 'whitelist'=0D
  seccomp: Replace the word 'blacklist'=0D
  qemu-options: Replace the word 'blacklist'=0D
  tests/fp/fp-test: Replace the word 'blacklist'=0D
  hw/vfio/pci-quirks: Replace the word 'blacklist'=0D
=0D
 hw/vfio/pci.h                         |  2 +-=0D
 hw/vfio/pci-quirks.c                  | 14 ++++++-------=0D
 hw/vfio/pci.c                         |  4 ++--=0D
 softmmu/qemu-seccomp.c                | 16 +++++++-------=0D
 tests/fp/fp-test.c                    |  8 +++----=0D
 tools/virtiofsd/passthrough_ll.c      |  6 +++---=0D
 tools/virtiofsd/passthrough_seccomp.c | 12 +++++------=0D
 ui/console.c                          |  2 +-=0D
 ui/vnc-auth-sasl.c                    |  4 ++--=0D
 hw/vfio/trace-events                  |  2 +-=0D
 qemu-options.hx                       |  6 +++---=0D
 scripts/device-crash-test             | 30 +++++++++++++--------------=0D
 scripts/tracetool/__init__.py         |  2 +-=0D
 13 files changed, 54 insertions(+), 54 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


