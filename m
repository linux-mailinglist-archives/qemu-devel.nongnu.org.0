Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716CD1105E4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 21:22:15 +0100 (CET)
Received: from localhost ([::1]:58170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icEgU-0007jP-Qo
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 15:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49663)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuri.benditovich@daynix.com>) id 1icDWO-0008E1-3Q
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 14:07:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuri.benditovich@daynix.com>) id 1icDWL-0005A5-5D
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 14:07:39 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35820)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuri.benditovich@daynix.com>)
 id 1icDWJ-0004jr-M0
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 14:07:37 -0500
Received: by mail-wm1-x32d.google.com with SMTP id u8so4873509wmu.0
 for <qemu-devel@nongnu.org>; Tue, 03 Dec 2019 11:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=jwWgYywEnWoSew5XhoR8bqdd7adswMy3z3eeULc55TI=;
 b=z0Sc31hrrKPFjABURR5o/1lLDq2gxgmDdIlC7ImQqahJThDqfLYqJC7lqdEtXxU2o+
 Teu4y0RFmbtdGv6WPXj0zQdR1uvGP6Uo/2gvJLWZPp/vYkScZNy7pAtmTQ7lrdH6uSqo
 EIhA0aPGElVMDxoH0gbXqre9Z0ziDl42Eo7SuKY3A3zmtCqHdJZ02sDUMUw39X5scMdj
 HrVmIP6Bij4a1dBe0kENrr95eJb+zviqe7W0ZeR50f4Sc5BgYYRGxLnU9KJaqR0I6nZh
 RaGYusofWbVsI7oH2YJvR4AmPC1d7EATaNhduNyIuOcoKt05661wQfa1oXXbIyMfNul8
 Re6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jwWgYywEnWoSew5XhoR8bqdd7adswMy3z3eeULc55TI=;
 b=uHegeHVctNYeIkO2wKsJ4XFQKaHgh1fSJ2t6uV0IH6RGW7BEtcyYqYGy5neJ05AiUq
 sHntoBHzI1lLhJmVOdjf7gFPCDuvB91zVYSccm4GRpvoP6Q5hwKDbdMKb4OssccbEC5a
 nAZ68z49Moae6VJpEXfe5nwBiW8xuvV4QQj6KhSqA0U34CXht9J9jCz3SOBPF2kBtAin
 zkwWfIfpDuhkwHZYuJffHVvrROUi0jYDe7fV+N6mRxhPQ/xvr3DEAG1XdP38r02YuZkR
 1JEWQwbNQLlE2K83/6z8FA92XsQLZkqDZVmz0quu0tG+ru4NZKCPFICUfDfDi6ROH8ml
 R+Bw==
X-Gm-Message-State: APjAAAUpBafGhhxjgNAJREg0qe/93/M29goHU0p48HlWSk7ww3K9zELw
 GD4Hgicf/TEZO6B17/nh0oAvwA==
X-Google-Smtp-Source: APXvYqwATRl9bJHZjYgCspQOmcCUsqXSdQqOZeWAWalf8cNaL90z7jQXAqq50MdMVRpHl+dEkLlqhQ==
X-Received: by 2002:a05:600c:21c6:: with SMTP id
 x6mr18503342wmj.177.1575400045109; 
 Tue, 03 Dec 2019 11:07:25 -0800 (PST)
Received: from f2.redhat.com (bzq-79-182-78-197.red.bezeqint.net.
 [79.182.78.197])
 by smtp.gmail.com with ESMTPSA id t12sm4828810wrs.96.2019.12.03.11.07.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Dec 2019 11:07:22 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: ehabkost@redhat.com, marcel.apfelbaum@gmail.com, kraxel@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Remove 'remote wakeup' flag from USB config descriptor
Date: Tue,  3 Dec 2019 21:07:14 +0200
Message-Id: <20191203190716.18917-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32d
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches addresses possible functional problem of USB
devices with 'remote wakeup' capability, redirected to Windows VM
(local redirection using libusb or spice redirection using usbredir).

Changes from v1: minor fixes per v1 review and checkpatch

Yuri Benditovich (2):
  usb-host: remove 'remote wakeup' flag from configuration descriptor
  usb-redir: remove 'remote wakeup' flag from configuration descriptor

 hw/core/machine.c    |  2 ++
 hw/usb/host-libusb.c | 20 ++++++++++++++++++++
 hw/usb/redirect.c    | 20 ++++++++++++++++++++
 hw/usb/trace-events  |  1 +
 4 files changed, 43 insertions(+)

-- 
2.17.1


