Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3AFACE8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 10:25:34 +0100 (CET)
Received: from localhost ([::1]:42394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUou5-0002y1-TL
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 04:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44830)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <coiby.xu@gmail.com>) id 1iUot0-0002WO-Bi
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 04:24:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <coiby.xu@gmail.com>) id 1iUosy-00050T-Vm
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 04:24:26 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:40522)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <coiby.xu@gmail.com>) id 1iUosy-0004yo-Oe
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 04:24:24 -0500
Received: by mail-lf1-x12e.google.com with SMTP id j26so1334974lfh.7
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2019 01:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=v+/1D1pCf0FqmqRrpEzWJsmatlnglaF6o/w8KE6KdjQ=;
 b=bDEecYma2z7sgOpF3v+4IrFXtUTJoRVRV/UArgEYDSWicMPuQ6Pg8f2Qq6cs7G5h31
 KBEgjPzgyuIVMfASR4QYmXH2WYUEdCRVouvr9ZM/Zrq/4ltjwud/OIHcREW/9gV2kmzC
 d4E/htXszeelm7EnR2B0uddOSxr2rokYdfRAY6yCVpkDrQVhXZB8NCEGw04bW5NOw/W2
 Wj6AMXZg63ZUTHFZDsY+QDDpGS66+qOwCewfg1kK4OnJS/lkcntWE+cHYVQMRZ2p03iC
 DfrxMsLCg5yTyDg+Y8rvsPWVf83NuP5Jf9wPASpWVEIr7IwI4Se0lVnWTm8YCEFi+pgi
 odLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=v+/1D1pCf0FqmqRrpEzWJsmatlnglaF6o/w8KE6KdjQ=;
 b=WWefWYl1X1aowhqRn1U1T6C6D8EnHa99TrHvw0sPaFzL+IR40C1gkVFUWnEVxq/zT9
 P3R3dFaeVYsUyJ+GpD50zo2IgFhkRky91fjOmw0jFfftlzM8JdDXXyemkOH83Zw5y/sO
 UP9m174FSVil8lul22w6oUD9z4hXGLy7fem37cEQbrcnp5hWEZwHVczVwNXR54LIM2+o
 Alg0k0qcU2RfGTZXq/lVPTxASB6JnG8WhGRabG2g4PN4RaZa+DiLOv1mdtOW2h4yEgQk
 jjc4X7e3o7n6clrx3jLubl3EneIF3AW+tlIXKJ/H74bELXI5/8m54ZVPVBP7mtUAvrgn
 EjXg==
X-Gm-Message-State: APjAAAWPhpzi8bHY2ANjAomYHlydKKpR/Qid/GiGU5wknHPn904d/qR3
 AcGf7/1IMHqRetcMvyMNvxhLzfUpp1iPklJ9SDXLPHXrga4=
X-Google-Smtp-Source: APXvYqycRhaSbKjgMtA/iJWGM8zSmunOvmWW+Oj+bTgO0fPFvh0U+Xz39rfFH5FeXeDhyiUiWLlc1Fm4tpcweaElnqw=
X-Received: by 2002:a19:6b10:: with SMTP id d16mr1977003lfa.137.1573637062700; 
 Wed, 13 Nov 2019 01:24:22 -0800 (PST)
MIME-Version: 1.0
From: Coiby Xu <coiby.xu@gmail.com>
Date: Wed, 13 Nov 2019 17:23:46 +0800
Message-ID: <CAJAkqrXyeVn4iy7NzkR__BS9q9xT4ZWcjJszNBaSKH0U57c4hw@mail.gmail.com>
Subject: How to extend QEMU's vhost-user tests after implementing
 vhost-user-blk device backend
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::12e
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I've implemented vhost-user-blk device backend by following
https://wiki.qemu.org/Google_Summer_of_Code_2019#vhost-user-blk_device_backend.
But I'm not sure what kind of tests I should write or to extend to
take advantage of implemented vhost-user-blk device backend. The
existing two tests related to vhost user are tests/vhost-user-bridge.c
and tests/vhost-user-test.c both of which act as vhost user server to
test QEMU's implementation of vhost user client. Am I supposed to
extend these two tests? Could you elaborate on the final step "Extend
QEMU's vhost-user tests to take advantage of your vhost-user-blk
device backend"?

Thank you!
--
Best regards,
Coiby

