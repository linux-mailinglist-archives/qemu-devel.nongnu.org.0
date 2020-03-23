Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5036418FB04
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 18:11:45 +0100 (CET)
Received: from localhost ([::1]:37226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGQc4-0006Ao-4f
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 13:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46633)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anthony.perard@citrix.com>) id 1jGQbB-0005fN-M0
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 13:10:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1jGQbA-0004AX-K9
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 13:10:49 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:58478)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1jGQbA-00049S-9h
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 13:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584983448;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=A38MAQ3I2EyDQePj2T0FhplyZEEph7yCewgtimy3gRk=;
 b=JBg+N/QM0z8+EaEvAQ2+vk3xuvVAKZ886ys7EDBR6GSmLXEgfgftglnt
 FmELnZythgoHZJBj3AWW4HPz+5/dp0URY1UGjnT/vxrIHyRVLDiFnnVbZ
 NqxCj9mmZSiYLrIwIo4j0kGKMOw7wmK2M9Xr5L6O6zZmHwAUw/WYayT/Z U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QY1m6jcB82mrUgfXw8am1h+ZgoyadE6ol2jMC+dCxeXXCh9XblH+ZoYwytNrKRgJILqWoEpCvI
 EYl/TzG1VZSYL2oAiIEJYtYa7qOi7hCZmyPvBHe15BoMT+Z4smYgEcIaPvMozVM3n6E89h6buV
 wrIhQ0O596ZQ8qGALfJRLmDF0JRFB1lB5IlXzGMTDdTawe0jM+uQUEI/kRZ3aSye29q3yQoSpr
 lf1DY/QD1gFUMn+Uzniwe5phCkEfL3eDDWSeqVSHxPPjoQO/PlfSG8vb3ni4YoK4rH6MTSfETs
 6B0=
X-SBRS: 2.7
X-MesageID: 14465110
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,297,1580792400"; d="scan'208";a="14465110"
Date: Mon, 23 Mar 2020 17:10:39 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: Xen guest broken following "use memdev for RAM" patch
Message-ID: <20200323171039.GI4088@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.145.155
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Since bd457782b3b0 ("x86/pc: use memdev for RAM") it isn't possible to
start Xen guest anymore.

The error from qemu:
    qemu-system-i386: xen: failed to populate ram at 0
that comes from xen_ram_alloc() in hw/i386/xen/xen-hvm.c

xen_ram_alloc() is used to populate ram for PCI rom devices for example,
but it is also called for the guest RAM. We try to detect when the call
is for the ram by comparing the memory region with the one we created
during initialisation.

During initialisation of QEMU  for a Xen guest, we create a memory
region for the RAM by calling memory_region_init_ram() in
xen_ram_init(). But that memory region isn't used by QEMU anymore (since
mc->default_ram_id is set).

For Xen, we don't want QEMU to allocate the RAM, so using the memdev
won't work.

Do you have a suggestion on
- how we can bypass the generic code that allocate ram?
- keep using something similar to what we have now with
  memory_region_init_ram()?
(with accel=xen)

Maybe we need a new hostmem backend which don't allocate any memory but
creates a memory region, to be used by Xen?

Thanks,

-- 
Anthony PERARD

