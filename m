Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABBF1BA680
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 16:33:32 +0200 (CEST)
Received: from localhost ([::1]:48168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT4p9-0001or-OD
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 10:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jT4nm-0000Yu-4y
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 10:32:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jT4ni-00014D-Kr
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 10:32:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45790
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jT4ng-00013I-VJ
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 10:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587997919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xIV+5av9mbm6Cnj/1HBZrlwgd5bJEbYSIaAYoH81aWY=;
 b=Q+pFzA+SMU3cOEsubaWojlHQ2X64jF7Kq84UVbz5vcDZlAYSeku37qdhwkgMLQiZjUG2iP
 LKXqle17HsFas+Htr9OjfiGGutGRi6SG+p2XWpnRPgXn/rqAyzFhPV+TkcwOFfJVa3Z6Hd
 ZnNyTqf1h8+DPQG8fH+Ir61RgVRhwBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-vXo14OLaOP-2EjsVDZr4nw-1; Mon, 27 Apr 2020 10:31:57 -0400
X-MC-Unique: vXo14OLaOP-2EjsVDZr4nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A788F464;
 Mon, 27 Apr 2020 14:31:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-115-95.ams2.redhat.com [10.36.115.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1520C6062C;
 Mon, 27 Apr 2020 14:31:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 cohuck@redhat.com
Subject: [PATCH 0/2] virt: Set tpm-tis-device ppi property to off by default
Date: Mon, 27 Apr 2020 16:31:43 +0200
Message-Id: <20200427143145.16251-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/27 02:05:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: drjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using a compat in the mach-virt machine to force
PPI off for all virt machines (PPI not supported by the
tpm-tis-device device), let's simply change the default value
in the sysbus device.

Best Regards

Eric

Eric Auger (2):
  tpm: tpm-tis-device: set PPI to false by default
  hw/arm/virt: Remove the compat forcing tpm-tis-device PPI to off

 hw/arm/virt.c           | 5 -----
 hw/tpm/tpm_tis_sysbus.c | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

--=20
2.20.1


