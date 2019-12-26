Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A25712AA2B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Dec 2019 05:38:01 +0100 (CET)
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ikKuO-00010h-3L
	for lists+qemu-devel@lfdr.de; Wed, 25 Dec 2019 23:38:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54000)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuri.benditovich@daynix.com>) id 1ikKtO-0000AJ-V6
 for qemu-devel@nongnu.org; Wed, 25 Dec 2019 23:37:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuri.benditovich@daynix.com>) id 1ikKtO-0002sn-1S
 for qemu-devel@nongnu.org; Wed, 25 Dec 2019 23:36:58 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45311)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuri.benditovich@daynix.com>)
 id 1ikKtN-0002rM-KQ
 for qemu-devel@nongnu.org; Wed, 25 Dec 2019 23:36:57 -0500
Received: by mail-wr1-x441.google.com with SMTP id j42so22753592wrj.12
 for <qemu-devel@nongnu.org>; Wed, 25 Dec 2019 20:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=viF/XLB0Y6COYGFBVmDNTIBzWXJQ18Ao4lNa3AG2v7s=;
 b=gB67JbqwD38wZkCs514b9VRZu+cMQJ/yfKCDMHetkFtbDeUQ3LdV+NMXva/+t2PlFh
 G5drnsMUQVZ2uCq2NvD0/tXiiBfsFBBSVSkUgiPUcxcwzvlGNciVPwZyOdR+zrwVVPpi
 ZFH+JyS0VNrkhyyX/Vrmd/T/sHX6ZfYCG5iiirfnHc0bxqSVppyOD61+0CPwlqYKiay8
 Hl3PLVQfwVtXnxQzm0PUN85Mepm1EBu23vKFbqqyuOBRoY7H+DqBg5/TkZAVZIU/XHfU
 iQhjbIPnHXl9CJj+vRldgwRxISdFIwtNqIn2HDB9gzP40hqlEFydcJUMLpZi0srU59bG
 mcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=viF/XLB0Y6COYGFBVmDNTIBzWXJQ18Ao4lNa3AG2v7s=;
 b=ajWCvgJ99vqif4Nyuh3SpZuqy++dWH3rruoPw1xh8o1YPDt0TtYCV4Nap65EmToj2/
 hWLQU+ECdtz/CS0xaejuyHi83llHsi+2P5ZKmqN+nGDQ9VC0xmjumfmoi2xDaoYzu2sg
 qBNPAnaJYx+wHjj8dQFXAG2ZpNXT43TBWN9flJ6RE78CFiAh1TRJsJu7mdNuWOwrRbCm
 1bIKDkDF/8SnhFiBG9+mADY5hEB6RHi8kjD4Itp/lMGVUepyJmFC0Xm4+nqQGMArt6vY
 rUPaNZD5f7cibu3ZgMt7BU0AGIYdraP3C7YRpHwTUMLtVv+cagLJ3Hv0lsBxnI3z2+gs
 JRiw==
X-Gm-Message-State: APjAAAVhuDrExN8anCjcT3/rbealIn/sVddvNbldqGt/c3rvRH0KgQHc
 nwlffZro6tOcJUtcR2zEbrDzXQ==
X-Google-Smtp-Source: APXvYqwdvuOks45B4jCXzN/8U+F7tKZZXUH0lzBAZlp1ivKuTPjjBZgtRpdW63pN2BmA7+bUuvxA6A==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr43103987wrn.29.1577335016226; 
 Wed, 25 Dec 2019 20:36:56 -0800 (PST)
Received: from f2.redhat.com (bzq-79-182-106-171.red.bezeqint.net.
 [79.182.106.171])
 by smtp.gmail.com with ESMTPSA id a1sm29428800wrr.80.2019.12.25.20.36.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Dec 2019 20:36:55 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] Solve problem of hot removal of virtio-net-pci
Date: Thu, 26 Dec 2019 06:36:47 +0200
Message-Id: <20191226043649.14481-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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

There is regression of hotplug removal of virtio-net-pci on q35
introduced long time ago in 3.0.0 with commit:
 48564041a73adbbff52834f9edbe3806fceefab7
 exec: reintroduce MemoryRegion caching

virtio-net does not destroy some of caching resources upon
hot unplug and on further hot plug the device with the same
name can not be added.
These 2 patches solve the problem.

Yuri Benditovich (2):
  virtio: reset region cache when on queue deletion
  virtio-net: delete also control queue when TX/RX deleted

 hw/net/virtio-net.c | 3 ++-
 hw/virtio/virtio.c  | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.17.1


