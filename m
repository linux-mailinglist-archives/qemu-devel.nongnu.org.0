Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EAE111B9E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 23:25:16 +0100 (CET)
Received: from localhost ([::1]:59608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icGbb-0005kp-6U
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 17:25:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37572)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crmull121@gmail.com>) id 1icFVj-0008TA-7x
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 16:15:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crmull121@gmail.com>) id 1icFVg-00082K-8T
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 16:15:06 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:39451)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <crmull121@gmail.com>) id 1icFVg-0007gi-1B
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 16:15:04 -0500
Received: by mail-lj1-x22d.google.com with SMTP id e10so5486240ljj.6
 for <qemu-devel@nongnu.org>; Tue, 03 Dec 2019 13:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=5oATEj7h/vMT0yVmTV7JHpbZYEkGfnHC7nf8w+7PC40=;
 b=WfFFgLYmNr9XfsQoukEPi1oDHyY0w+4gZTTZJ63E1FrvQeyw3dFfWAAmL8gZ+HNDiK
 Vgug0K22n+Aw2tMxTybqVxHqkINZobZDTdR+bttoj8NsMBTVos7GYNz3RBrQrS3yHW28
 zSZf174uE/ZXxezNmiiytP4fIj0OF8lU7YcebLTVY+wl19PsW0FuWidZW9HFWz741wRO
 cZmLw+W0z50OIzxSOfzjRxOtjSe1J+7eKufjw9WeiddgxiN88R56E4Mk9H1VD97hVDIN
 A5kDw8NzqE3/F5Ac36Q0Wxs1lBb+yHa43hsYN9VWH+q6LmmxtAY663CXGNH41B13m92R
 HyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=5oATEj7h/vMT0yVmTV7JHpbZYEkGfnHC7nf8w+7PC40=;
 b=jJz1O3HPPZL5QY6BcJeUb7tU0f3U27lmB4AZJmiaXEGfv0c9gVmr6pTQiYRNagLU7l
 HMrnqF7MMxjX5FIp4ZDZm+uhUBTRF13MDbECAE44e8RGtZ4UBv2tntUz5THA7/zGqW+W
 k7U5srtmxdy+zmxm/7jloKdOr6fDrPhjcnlqQhoqhOnMyYAAa0uYKiJ5u6My24Z7DhD3
 d03JoClZ9BF4zsB74O3Tr1yMUEYE4r4+v9AfaLaJg4DzEy4hR9iyQGuyl0IofbE6FkaP
 1m1QxkghiErpJvLDgCpCV0NycW08ZJUklQQymplUPZse6V+jetT9Uu/A3bGTbNEcYYAa
 mtFw==
X-Gm-Message-State: APjAAAUWzEiQdzCoI7tPbgHXnvmoHeA8w5Hn2xNPB+Y2Or7uFHWDfopI
 JGoSKay2NtbWJUkuMj9Hvp6D1usKOAtrTuOx/SegqXwM
X-Google-Smtp-Source: APXvYqx64LCSxrvVLpsAFmWrq+kDhcP7TVe8qTwDJgsdX64sJ6uOWghIaAgnI11gH5XXFMUcNiemGVJjVi/XOfMys7s=
X-Received: by 2002:a2e:9b05:: with SMTP id u5mr3770790lji.59.1575407698476;
 Tue, 03 Dec 2019 13:14:58 -0800 (PST)
MIME-Version: 1.0
From: Craig Mull <crmull121@gmail.com>
Date: Tue, 3 Dec 2019 15:14:47 -0600
Message-ID: <CAPT-DMXZr4WSUoifEQ=hi9vCU1iZ7U2k6TLWScKfsUuMHtFMwQ@mail.gmail.com>
Subject: Lack of OS vendor support for blockdev-snapshot
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::22d
X-Mailman-Approved-At: Tue, 03 Dec 2019 16:35:03 -0500
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
Cc: dwarcher@us.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Any insight as to why OS vendors (RHEL and Ubuntu in particular)
aren't supporting blockdev-snapshot?

- RHEL claims no support for Qemu-based snapshots in any flavor
- Ubuntu hasn't enabled blockdev-snapshot in it's 19.10 release

-craig

