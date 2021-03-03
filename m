Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F30332BA04
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:51:39 +0100 (CET)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWaw-0003Fb-AP
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWL-0004oG-BR
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:46:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWI-0007sp-N3
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614797210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c6bS7+tsRp1OgzA0OdE2ZRXYYVdxCYuj5fkOVNCrQhU=;
 b=O3DIwN6JpVXJakq6g7aR+Cg0WaOmCPRJljCo7D+Z18hmAUFI7WBex6PO5Rzv6zGPKxOiIR
 zrU16EcLwcMatH0cVCtA3K404nINOpWaFNgpezvWGMdNdqdV3YzffccWjKwXwG8JBMUpjn
 wLJ9HzL9YLZkze4JDJXVjJSLcOO9NG0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-zBz8C2kqO226nCeMhddtjQ-1; Wed, 03 Mar 2021 13:46:47 -0500
X-MC-Unique: zBz8C2kqO226nCeMhddtjQ-1
Received: by mail-wr1-f69.google.com with SMTP id i5so11602887wrp.8
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5RVXh3BmUjJ+VyKFXD9xcYy7OKg3Zpbiv8DU+lvm4FU=;
 b=PVc0oAznjo+QtzS+h2fZgqgwOvdWMOPd9me68zp37tAomaq45qhYVqNvNaIXUVhE6+
 +y6NLOHO3lS3TwCM8moq1ZbItG7ZCuKyFr3dsHPNbW/g4gnMVkJ/GxiRGUmyhHLSJFlh
 2Lf8wo0jO8TVj9scQt+3sqNdQdD3tt9lLDBFNsqqkPGoLRO1txKQf1Vi9Ld6JHZVhMno
 7QrnVTNARwbrd/RA0FZ9JznKVo5JNLdnPbNgZzXUbx0EMqwZ8FlqOY1pqPS9IyxCcawI
 OfIRkBOOt+s8ju2gPbKuOLk9Y+th8fGbhVyJEZKmW8CAnKJgXaNqhooZro3AHPQRFpBW
 OoNg==
X-Gm-Message-State: AOAM530qf5OJPZjt1ec8bNXl/0ggQ6F6IhJwaKJz5oNu5JxqO4cT+ssB
 jiMcIr3vhd2EFcsarWlH/G6lbsb/+ukj4WoPzt7QTJAfXdPzY+FkRrzxbat6Kd69R8UCRpzI5Xe
 /OrW5sK2+U+7EOlGCzpa9o/eXidFJIXsvetrY1Ex1sNo9sGlNtyS5Tgvl399MARtl
X-Received: by 2002:a5d:5405:: with SMTP id g5mr20068wrv.406.1614797206448;
 Wed, 03 Mar 2021 10:46:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEWUq0UvgT4WZf8E2zmzv3AVrsyZcByml9jP18e2lzmZ9b51FgYAL0C4x+ty68RmOerP0qHw==
X-Received: by 2002:a5d:5405:: with SMTP id g5mr20035wrv.406.1614797206195;
 Wed, 03 Mar 2021 10:46:46 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y16sm9896351wrh.3.2021.03.03.10.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:46:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] misc: Replace the words 'blacklist/whitelist'
Date: Wed,  3 Mar 2021 19:46:39 +0100
Message-Id: <20210303184644.1639691-1-philmd@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eduardo Otubo <otubo@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your=0D
Open Source Projects" guidelines [*] and replace the words "blacklist"=0D
and "whitelist" appropriately.=0D
=0D
Since v2:=0D
- added R-b tags=0D
- reworded seccomp comment (thuth)=0D
- dropped queued vfio patch=0D
- dropped device-crash-test reworked by Eduardo as commit 1a14d4e16af=0D
  ("device-crash-test: Remove problematic language")=0D
=0D
Since v1:=0D
- dropped qemu-guest-agent patches=0D
- addressed review comments=0D
- added R-b tags=0D
=0D
Series fully reviewed and expected to go via the qemu-trivial@ tree.=0D
=0D
[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md=
=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  ui: Replace the word 'whitelist'=0D
  scripts/tracetool: Replace the word 'whitelist'=0D
  seccomp: Replace the word 'blacklist'=0D
  qemu-options: Replace the word 'blacklist'=0D
  tests/fp/fp-test: Replace the word 'blacklist'=0D
=0D
 softmmu/qemu-seccomp.c        | 16 ++++++++--------=0D
 tests/fp/fp-test.c            |  8 ++++----=0D
 ui/console.c                  |  2 +-=0D
 ui/vnc-auth-sasl.c            |  4 ++--=0D
 qemu-options.hx               |  6 +++---=0D
 scripts/tracetool/__init__.py |  2 +-=0D
 6 files changed, 19 insertions(+), 19 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


