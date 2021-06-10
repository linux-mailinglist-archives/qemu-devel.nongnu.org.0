Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD963A24B6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:48:41 +0200 (CEST)
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEUa-0001QT-5E
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrES3-0007Pq-VI
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrES1-00051O-RO
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623307561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=08K9nuZd2ofBRimPfG7tXw2kwCtBjM59yyyAR1qOeHM=;
 b=JnAv576NkWHoJpnl8WrzuKM47MjWdHQ3vf4DbacffaT8tCAMU7sUjobx+5R8jCDQmIuRN/
 gGOFmIAhrag/lFVj5sHcd0FjWLs0FEiTf5kUaVlq49UD0zSaE8vhLZNIPtr8ARCXfuiySN
 WrhJ+ojFbMWB88V+wEmedWJlI9to/PM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-j0o5ZantP-Cw5GEOhqkAeQ-1; Thu, 10 Jun 2021 02:46:00 -0400
X-MC-Unique: j0o5ZantP-Cw5GEOhqkAeQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 z13-20020adfec8d0000b0290114cc6b21c4so400828wrn.22
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5RdVEjzLLxo0OgPedPdaaPCRQDfMb+jHERxDP9+pq0s=;
 b=CJl3HJ4zuzibYqFL3dDoJlpC3cjJp2U6P35sGtnANUxKg+itDhPd7Z97rZAK1KIYAQ
 RSa5vrZqbkpiLEEIgLoqdyTOmzJVNXHmvuyGAdvqRrshkh3RQudNW69NeXEk9Gv3OrFZ
 9WKGn0XK9aq2oRD1Pe0fNLv5+HvXxm1UlIaV9pz6f3gF3St6y0QvFkgtRxWIQUk5Jm1v
 Ml2OLKaETT3UKa9FYL8dprvQYWUqzloC0ff6dAAAFA7IEqMCSeMdpvAXWRhZEHoBhHk3
 GIa9qJG9+Nx5K932p7aWEi3/0W+HCIhmR7o29/g0ek8x+ikB7RbV3klntF/ZzafHYaiT
 /94g==
X-Gm-Message-State: AOAM531/hYzRpvphcUOAwWRKStBKFGqVrHkmjxpIPhgQM4oAP2YA+RWE
 nCDMJ3K6PqM6eHm2vK+st7OpSMT8Sim7xEAj9Z17FcNP7SPhGZnE5+Y4HzYF5aGtgcySHjeYz1N
 wRJk8IlWIP5RBiYv02Z2eD01HBbk3Bv1zhIjMVE0taFKNMaYkqihC6TekTZrOx/DT
X-Received: by 2002:a05:600c:a04:: with SMTP id
 z4mr136034wmp.103.1623307558620; 
 Wed, 09 Jun 2021 23:45:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLLXXvrPJMrZOWDXSzbdxIyI4qAODiicQFzGdGWPndKaFVuaJn6cmJBvNN5LuXa7Bk4djAww==
X-Received: by 2002:a05:600c:a04:: with SMTP id
 z4mr136013wmp.103.1623307558427; 
 Wed, 09 Jun 2021 23:45:58 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id v132sm9175557wmb.14.2021.06.09.23.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 23:45:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] target/i386/sev: Housekeeping helping using
 SEV-disabled binaries
Date: Thu, 10 Jun 2021 08:45:45 +0200
Message-Id: <20210610064556.1421620-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
I wasted some time trying to figure out how OVMF was supposed to=0D
behave until realizing the binary I was using was built without SEV=0D
support... Then wrote this series to help other developers to not=0D
hit the same problem.=0D
Some SEV patches I was following have been queued on Eduardo's=0D
'x86-next' tree, so I used his tree as base, and included David and=0D
Connor patches to reduce merge conflicts.=0D
=0D
Based-on: https://gitlab.com/ehabkost/qemu/-/commits/x86-next/=0D
=0D
Connor Kuehl (1):=0D
  MAINTAINERS: Add Connor Kuehl as reviewer for AMD SEV=0D
=0D
Dr. David Alan Gilbert (1):=0D
  target/i386/sev: sev_get_attestation_report use g_autofree=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  qapi/misc-target: Group SEV QAPI definitions=0D
  target/i386/monitor: Return QMP error when SEV is disabled in build=0D
  target/i386/cpu: Add missing 'qapi/error.h' header=0D
  target/i386/sev_i386.h: Remove unused headers=0D
  target/i386/sev: Remove sev_get_me_mask()=0D
  target/i386/sev: Mark unreachable code with g_assert_not_reached()=0D
  target/i386/sev: Restrict SEV to system emulation=0D
  target/i386/monitor: Move SEV specific commands to sev.c=0D
  monitor: Restrict 'info sev' to x86 targets=0D
=0D
 qapi/misc-target.json         |  75 +++++++++++-----------=0D
 include/monitor/hmp-target.h  |   1 +=0D
 include/monitor/hmp.h         |   1 -=0D
 target/i386/sev_i386.h        |   5 --=0D
 target/i386/cpu.c             |   1 +=0D
 target/i386/monitor.c         |  91 --------------------------=0D
 target/i386/sev-stub.c        |  49 +-------------=0D
 target/i386/sev-sysemu-stub.c |  69 ++++++++++++++++++++=0D
 target/i386/sev.c             | 117 +++++++++++++++++++++++++++++-----=0D
 MAINTAINERS                   |   7 ++=0D
 target/i386/meson.build       |   4 +-=0D
 11 files changed, 219 insertions(+), 201 deletions(-)=0D
 create mode 100644 target/i386/sev-sysemu-stub.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


