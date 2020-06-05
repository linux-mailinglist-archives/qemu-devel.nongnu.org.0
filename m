Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA001EF449
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 11:34:44 +0200 (CEST)
Received: from localhost ([::1]:42612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jh8kN-0001M4-8p
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 05:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jh8ip-00005E-T4
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 05:33:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56850
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jh8in-0004Vo-UX
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 05:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591349584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dIGeqE1tCRYYScOHb1CnnLxUmVHWvJnQyUmWMyI7suQ=;
 b=btEubqJ1W3tZScys9vD57fHEcGTsE1Zax4qRaKwE0oky3tOxg1pNkf0nERdrTvNz0Jk+Io
 kKrYJmCXkegPiTpXjXOZ5nrTj1oqiqY5E7YmVg2t0BXF0oCp4x5V8ak+BLrJs9Ti2xVvlF
 Fka0uTUyv47RQXVPcWUT+ZGbuX8G09Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-gm2LiLFyOQKP_jLJZxO3Ow-1; Fri, 05 Jun 2020 05:33:00 -0400
X-MC-Unique: gm2LiLFyOQKP_jLJZxO3Ow-1
Received: by mail-wm1-f72.google.com with SMTP id h6so2545764wmb.7
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 02:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dIGeqE1tCRYYScOHb1CnnLxUmVHWvJnQyUmWMyI7suQ=;
 b=LVLMwZJrcDfc+qkQ0CBj3eXk9Gf7ueTg90szTY6mxlaS+IrfbRCZqtxhheKuanxYJX
 GqjhyZy3FlTUy22umR6ndlti1JRblalcHcbmEYtHeVrQa29Icmnw1kDClDjr2xt8FGGw
 6/XQsW5Bmgx1AzLpzHJuuvU5JMWrTnEd3KzSn7pWYcK02GlxA+8MpHcEPoQ0Cx0gRRa7
 OrWXhwXnA9SUatfxvVI0UWH+RRrbN2ZrkJLbaf8eIcKj6haMFpHHXMjcyuYj8xTu5cWV
 sMITpdhaSUr7GGMgKZhnBF1+pgUBuliSSYSxfFbtf1I7YMvf9I+nHhLMfcX7wsseXBlr
 LA8Q==
X-Gm-Message-State: AOAM531tYyMDznG1ouXAhbtukfYDLnmy8uAn9TmzIJJAf8yg/6+quPe4
 7LgYSYpTdZN7IZcLLn6hlrH4+mEUF4SzuhTW1E9bvk1BOfLPN9x5sjAlPxjHoq4pG3lkw0tiUgS
 y8gpV8CiaCVZU6CA=
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr8449703wrv.162.1591349579226; 
 Fri, 05 Jun 2020 02:32:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoIyYIu+0pWVVNLJenN4/RyPr/q9dEjJYTm4q97k3ESv8etnnIbHVlrXSWBHs3Nodq70Qn4A==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr8449688wrv.162.1591349578980; 
 Fri, 05 Jun 2020 02:32:58 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id b18sm10898655wrn.88.2020.06.05.02.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 02:32:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/11] accel: Allow targets to use Kconfig
Date: Fri,  5 Jun 2020 11:32:45 +0200
Message-Id: <20200605093256.30351-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:27:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review:
- 4/11 rules.mak: Add strequal() and startwith() rules
- 5/11 rules.mak: Add base-arch() rule

This series include generic patches I took of the KVM/ARM
specific series which will follow.

- List orphan accelerators in MAINTAINERS
- Add accel/Kconfig
- Allow targets to use their how Kconfig

Since v5:
- Fixed typo in patch #4 subject
- Added David R-b tag
- Stripped --- comments

Since v4:
- Addressed rth review comments in rules.mak

Since v3:
- Fixed base-arch() rule (rth)
- Dropped 'semihosting: Make the feature depend of TCG'

Since v2:
- Addressed Thomas review comments
- Fixed problem when including TARGET instead of BASE_TARGET

Since v1:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg689024.html
- Drop HVF MAINTAINERS patch (merged elsewhere)
- Kconfig-select SEMIHOSTING (bonzini)
- Drop user-mode selection patches
- consider m68k/nios2/xtensa/riscv (pm215)
- reword Kconfig SEMIHOSTING description (pm215)
- reset some of rth R-b tags

Previous RFC for semihosting posted earlier:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg631218.html

Philippe Mathieu-Daudé (11):
  MAINTAINERS: Fix KVM path expansion glob
  MAINTAINERS: Add an 'overall' entry for accelerators
  MAINTAINERS: Add an entry for the HAX accelerator
  rules.mak: Add strequal() and startwith() rules
  rules.mak: Add base-arch() rule
  Makefile: Remove dangerous EOL trailing backslash
  Makefile: Write MINIKCONF variables as one entry per line
  accel/Kconfig: Extract accel selectors into their own config
  accel/Kconfig: Add the TCG selector
  Makefile: Allow target-specific optional Kconfig
  accel/tcg: Add stub for probe_access()

 Makefile               | 15 +++++++++----
 rules.mak              | 49 ++++++++++++++++++++++++++++++++++++++++++
 accel/stubs/tcg-stub.c |  7 ++++++
 Kconfig.host           |  7 ------
 MAINTAINERS            | 19 +++++++++++++++-
 accel/Kconfig          |  9 ++++++++
 6 files changed, 94 insertions(+), 12 deletions(-)
 create mode 100644 accel/Kconfig

-- 
2.21.3


