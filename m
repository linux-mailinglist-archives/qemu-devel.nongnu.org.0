Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8394517FB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 23:51:12 +0100 (CET)
Received: from localhost ([::1]:50544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmkoh-0006uJ-OS
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 17:51:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmklo-0004Zw-Nx
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:48:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmklm-0004Lk-70
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637016489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O40fsaMGVXCUE7s+USSaE1z8VbxYoxucC6Lp145rYSM=;
 b=Nt5V+wZlc7v92J5S+fkEoozBNKPFuVu35qAh6JTFSMSni5SbSjnrteD9Aa1mjdV3d8QDUu
 /0OuCqvU3TlG139stVVqyWemOkLeGup1zxcRO2PZs7vOpohvALmtxzIe7EB2vmb1RQGpOh
 8rgCkfyZ200RKmHcZvqO6op+VyW/NXI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-7JCmOb71NPSUWZfS-B97WA-1; Mon, 15 Nov 2021 17:48:05 -0500
X-MC-Unique: 7JCmOb71NPSUWZfS-B97WA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso569592wms.1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 14:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yPFDQB/6WfHHACimkKGx1rd6n7CACiUEE8lM6M5YQ+o=;
 b=GPPXvgJHKLWt7HYjHoIQ+CfiTNtfuh84yZDfx85T+gDmMKGwNjMBHcFrR8+z8BPwwI
 j2EzsZ44L//b3tXPtGrMVArx4hmN9AWINHBTgFHkZf0/ofVuTh/SljGwGX0kjU27aO04
 x0zuVw3+/Odn4JIkdRvh8JxuBNxlgoheTG+odzl31q+lfBdlADk5ejfqmMLiNjD4QNl/
 w1LQHtzqnr4Usm+bTi+sQ/+G5xFGFZ5pP2haok4nPl6OLMK95r6/4nkQ1AoQtg5sRQrB
 Tpxchtdj+9hQFJsYpdam7uDKEC2nhcLTsTw5qGv8XcJz8o88DcOSlFYblFVLhs50c599
 4nXA==
X-Gm-Message-State: AOAM531WLBhhUeeV9JHr8AHYr4OCk30Ay36bX0CYRHe8ntPuZ6RQD+W9
 J/LgaJz1rQhzDXhGO3XXJ4iaZEryTv8EcomyCbBJRwoBY63PbF0DzNAZI55sp3iM2V5Cuxj8zwd
 b5gK9QqOpOPo/U5C3qrVwd+SoDU0FyZkE6XUGE7cIu3TiAZ0zdsYe3RAlTKkoCmMm
X-Received: by 2002:a05:600c:6021:: with SMTP id
 az33mr65208977wmb.51.1637016484129; 
 Mon, 15 Nov 2021 14:48:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqgJbHHpHi8Pekf1P34dSYWd8406gOhtM0xoFvuxoytqdstglhp01SDnQacpotenS1XoJSOw==
X-Received: by 2002:a05:600c:6021:: with SMTP id
 az33mr65208949wmb.51.1637016483970; 
 Mon, 15 Nov 2021 14:48:03 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 z5sm651971wmp.26.2021.11.15.14.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 14:48:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Machine-next patches for 2021-11-15
Date: Mon, 15 Nov 2021 23:47:59 +0100
Message-Id: <20211115224802.2602894-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 42f6c9179be4401974dd3a75ee72defd16b5092d=
:=0D
=0D
  Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into st=
aging (2021-11-12 12:28:25 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/machine-core-20211115=0D
=0D
for you to fetch changes up to 7b6d1bc9629f3dd45647ec3418e0606a92dddd48:=0D
=0D
  tests/unit/test-smp-parse: Explicit MachineClass name (2021-11-15 21:49:1=
6 +0100)=0D
=0D
----------------------------------------------------------------=0D
Machine core patches=0D
=0D
- Rework SMP parsing unit test to work on WinGW:=0D
=0D
  https://github.com/qemu/qemu/runs/4078386652=0D
=0D
  This fixes:=0D
=0D
    Test smp_parse failed!=0D
    Expected error report: Invalid SMP CPUs 1. The min CPUs supported by ma=
chine '(null)' is 2=0D
      Output error report: Invalid SMP CPUs 1. The min CPUs supported by ma=
chine '(NULL)' is 2=0D
=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  tests/unit/test-smp-parse: Restore MachineClass fields after modifying=0D
  tests/unit/test-smp-parse: QOM'ify smp_machine_class_init()=0D
  tests/unit/test-smp-parse: Explicit MachineClass name=0D
=0D
 tests/unit/test-smp-parse.c | 52 +++++++++++++++++++++++--------------=0D
 1 file changed, 33 insertions(+), 19 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


