Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA4D3B3E7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 13:19:57 +0200 (CEST)
Received: from localhost ([::1]:44540 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haILD-0000p3-HR
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 07:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43031)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1haIGa-00071s-HE
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 07:15:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1haIGZ-0000Qy-IP
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 07:15:08 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1haIGZ-0000PZ-CO
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 07:15:07 -0400
Received: by mail-wm1-x341.google.com with SMTP id g135so8081094wme.4
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 04:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=7rfgpjpo8Dkmi3ZlErqQoopVtfGWnDV2oN6PN5CbzrA=;
 b=kC/dAe+C6yh1He/EskjX0Cswz8BOpsp5k2NW9GZL9l8ppLor7BUE/aQkhC8l+SCUUP
 EKeOMxnoHca4yvlo9qCIBLD/cxA3GWzce0A32jVduCUE72Ww4SN+SdMcqvAMoVU1C6oQ
 3RAhpXGfvV4cgkyDORhytHNwSM1AKpKxQ7Bh7HV6v8n8np3qXmJC42PpDjcOU7ILjP1L
 um6zduEbN1prcBB+WZ824vJmKFw7mgFfBj8m/9rOFu1fF8OQZSCya4sfa1GmgsiJ8TPM
 hBU+kqjJL1v4XZSu3oODTjM+NM/yxuqtDc60aDTG6hm/WvLmnxCQCDCqJb1H8sHsd715
 NeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=7rfgpjpo8Dkmi3ZlErqQoopVtfGWnDV2oN6PN5CbzrA=;
 b=Yp2I0Wu+MsHIV9YCyD9F/MXM2/eFNfT2DuMSluCwlDGAJmWKM8A8pDOYO3uBILuZ3X
 C0/2Pmc5In5G475rq5bINMQQyU4Ond+IeYBYq8B7Lpi1HB/WUX1RzthWV9+8SjBwX1WJ
 IWc1cDkfVHG6mecroFQUvsH/WN/W73Buw4L55qrqP2bS1p2lgO7c/15SyutJjSqI+Dj3
 XDX1PxVXmMIiuxoienPmqfr9lst7Oqxb4VSNq+uOm3OTiXEaCLq3z8HF3glPM7rDLXe6
 pjIKwVjks9rpstqNJQSCOH0bql3Z0iUmCNMdrKRdaVgBEjLmtROoffUSK56ygiYq8X87
 EvXQ==
X-Gm-Message-State: APjAAAUK67VewWB7hVSKWCiAUL5EgQdNoVCfLV7trEEa3l0YLI4ojp5u
 ZVmKzWogn//IO3s/yverLuhRfy/j
X-Google-Smtp-Source: APXvYqzwKqdMTO1YBD+FU8lVgh+xZL1NQYGaIoqMZ+YrhXajqcBeD4L+1TUJIkZtOJnWdfkYMHzGhg==
X-Received: by 2002:a1c:5687:: with SMTP id
 k129mr12325999wmb.133.1560165304966; 
 Mon, 10 Jun 2019 04:15:04 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id u13sm11934414wrq.62.2019.06.10.04.15.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 04:15:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 10 Jun 2019 13:14:54 +0200
Message-Id: <1560165301-39026-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [RFC PATCH 0/7] Proof of concept for Meson integration
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

Hi all,

this is just a simple example of introducing Meson into the build system,
converting a few contrib/ subprojects to use it instead of Makefile.objs.
There are certainly many rough edges, but I wanted to throw this out to
show what it could look like.

I chose contrib/ because it's a simple example of how the current build
system causes clutter in the toplevel Makefiles and how interrelated the
Makefile, Makefile.objs and contrib/*/Makefile.objs file are even for
such simple executables.

Paolo

Paolo Bonzini (7):
  configure: do not include $(...) variables in config-host.mak
  configure: set $PYTHON to a full path
  configure: integrate Meson in the build system
  libvhost-user: convert to Meson
  vhost-user-blk: convert to Meson
  vhost-user-scsi: convert to Meson
  rdmacm-mux: convert to Meson

 .gitignore                            |   5 +-
 Makefile                              |  26 +-
 Makefile.objs                         |   6 -
 configure                             |  66 ++-
 contrib/libvhost-user/Makefile.objs   |   1 -
 contrib/libvhost-user/meson.build     |   7 +
 contrib/rdmacm-mux/Makefile.objs      |   3 -
 contrib/rdmacm-mux/meson.build        |   6 +
 contrib/vhost-user-blk/Makefile.objs  |   1 -
 contrib/vhost-user-blk/meson.build    |   3 +
 contrib/vhost-user-scsi/Makefile.objs |   1 -
 contrib/vhost-user-scsi/meson.build   |   3 +
 meson.build                           |  20 +
 scripts/ninjatool.py                  | 964 ++++++++++++++++++++++++++++++++++
 14 files changed, 1066 insertions(+), 46 deletions(-)
 delete mode 100644 contrib/libvhost-user/Makefile.objs
 create mode 100644 contrib/libvhost-user/meson.build
 delete mode 100644 contrib/rdmacm-mux/Makefile.objs
 create mode 100644 contrib/rdmacm-mux/meson.build
 delete mode 100644 contrib/vhost-user-blk/Makefile.objs
 create mode 100644 contrib/vhost-user-blk/meson.build
 delete mode 100644 contrib/vhost-user-scsi/Makefile.objs
 create mode 100644 contrib/vhost-user-scsi/meson.build
 create mode 100644 meson.build
 create mode 100644 scripts/ninjatool.py

-- 
1.8.3.1


