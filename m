Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760DD34094A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:53:26 +0100 (CET)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuxh-0006Co-H6
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMuto-0003YN-KI
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:49:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMutd-0002GK-UA
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616082550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GDtfl9XTcAeSw0MUyZtofRtqKGWy5nTCj/jrngDsxiw=;
 b=EyukOpIulXlpjilDmSwG0plQMIBvaaG6G8EnkAXCMIw+m/kqrZzVDLyEGQUqPHnKs4RDgx
 AFJ5wl+9sQ0+b6jujEJ+ih5ZWer77D2Gcr9h0CYg+kifsn4qBDEiyZLK3V3opTy1DhORoR
 WVfUZ0iMfRWA1Lq8S2qYbqIxwLUsajQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-2WxsEVjGOv-BRFCRzIRvHA-1; Thu, 18 Mar 2021 11:49:07 -0400
X-MC-Unique: 2WxsEVjGOv-BRFCRzIRvHA-1
Received: by mail-wr1-f70.google.com with SMTP id h5so20256932wrr.17
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 08:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U321lw10ObS04yoo5eKD69BirD7DaD359om9MWH9VhU=;
 b=HmjokC94tuv1NAvKbZ5/Umog/6pCQfJRlR/MOiuCMtLQUiM7nxBUlK23ZUUvQb1UJI
 INR62wAAAH7jwGA0PkiM+SVUoVHtYb6rxAUJECjd3+sns2nANtEWK+ty6NuIgddS2Gq8
 FaH/dsJ42XmBVdaEY6eq5iiqWc6odcDYUT6v4TqkcP7yjv+JPSbY+wuyGQvSBmEYw71X
 CS5wknOSH7D7Si9PHjspVm/Sc+LwcJ5vSY8cpcQ/CVVGt1XuWDw48tNbK0KrwmfOsXXQ
 ZANUmmgE7N9g+UuUATfXMzDcZ37ORePlX6w9Uwnx8auv3Ye8TUIWSIdiwZHnC5J/MjzP
 +rGA==
X-Gm-Message-State: AOAM5336TaZjgm49tvpY0YB9qR3JI3hEMwDPIKQB6L+hD2A+i8HnDxLp
 wGz+JNU6v3x9NQ+cApb0hRmEfu0Mb4uemZdugSP1e+3Y1kVy0HAaIb86HZJVJ+oHVBERUP3VudX
 /eOfGE8Qe2Yr4VhZdHsQLeGTzDOq8cEvUDbjnHVRjvn3TsKfsd7upTl6c7SJOrfKi
X-Received: by 2002:a05:600c:2512:: with SMTP id
 d18mr4216653wma.55.1616082546258; 
 Thu, 18 Mar 2021 08:49:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLxe31YzgHoLi0VdTOpauf4UqifDGa9kECl3LYsqCgdU2pq175IKy9NGSkhXJ7MJtUbJHeKg==
X-Received: by 2002:a05:600c:2512:: with SMTP id
 d18mr4216638wma.55.1616082546073; 
 Thu, 18 Mar 2021 08:49:06 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p17sm2590936wmq.47.2021.03.18.08.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 08:49:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: 
Subject: [PULL v2 00/11] pflash patches for 2021-03-18
Date: Thu, 18 Mar 2021 16:48:53 +0100
Message-Id: <20210318154854.3671458-1-philmd@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1:=0D
- Fixed trace format string on 32-bit hosts (Peter)=0D
=0D
The following changes since commit 56b89f455894e4628ad7994fe5dd348145d1a9c5=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' i=
nto staging (2021-03-17 22:18:54 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/pflash-20210318=0D
=0D
for you to fetch changes up to 91316cbb3830bb845c42da2d6eab06de56b889b0:=0D
=0D
  hw/block/pflash_cfi: Replace DPRINTF with trace events (2021-03-18 11:16:=
31 +0100)=0D
=0D
----------------------------------------------------------------=0D
Parallel NOR Flash patches queue=0D
=0D
- Code movement to ease maintainability=0D
- Tracing improvements=0D
----------------------------------------------------------------=0D
=0D
David Edmondson (2):=0D
  hw/block/pflash_cfi01: Correct the type of PFlashCFI01.ro=0D
  hw/block/pflash_cfi: Replace DPRINTF with trace events=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  hw/block/pflash_cfi: Fix code style for checkpatch.pl=0D
  hw/block/pflash_cfi01: Extract pflash_cfi01_fill_cfi_table()=0D
  hw/block/pflash_cfi02: Extract pflash_cfi02_fill_cfi_table()=0D
  hw/block/pflash_cfi02: Set rom_mode to true in pflash_setup_mappings()=0D
  hw/block/pflash_cfi02: Open-code pflash_register_memory(rom=3Dfalse)=0D
  hw/block/pflash_cfi02: Rename register_memory(true) as mode_read_array=0D
  hw/block/pflash_cfi02: Factor out pflash_reset_state_machine()=0D
  hw/block/pflash_cfi02: Add DeviceReset method=0D
  hw/block/pflash_cfi01: Clarify trace events=0D
=0D
 hw/block/pflash_cfi01.c | 253 ++++++++++++++++----------------=0D
 hw/block/pflash_cfi02.c | 316 ++++++++++++++++++++--------------------=0D
 hw/block/trace-events   |  40 +++--=0D
 3 files changed, 320 insertions(+), 289 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


