Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14051F7AD2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 17:24:59 +0200 (CEST)
Received: from localhost ([::1]:52298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjlYA-0008P2-W3
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 11:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl5L-0004la-Qr
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:55:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43024
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl5K-00024f-6W
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591973709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvCRpjAXKNglq8ahDk7GnS4mPNv6Reg8kx+iDjbF7Mk=;
 b=gi38VNZ2/YQUeZoTHd2Gq2dO2d5+3MjkVCNvc3/bZ+RxkT+7MniMTH0Qn4TO1c7OMn52YS
 qg277tLSZPSHwnIEzsibcH4WRxaceB5Mz6eXi6PEO+2SURMz2FiV6OX3coKtqGJulByvlw
 /Cnw9iQRzk/l6e+GsBgik47qEpFuRaE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-Z6gOwRjLPk-jX-rQeytZCQ-1; Fri, 12 Jun 2020 10:52:16 -0400
X-MC-Unique: Z6gOwRjLPk-jX-rQeytZCQ-1
Received: by mail-wm1-f71.google.com with SMTP id r1so2544768wmh.7
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 07:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nvCRpjAXKNglq8ahDk7GnS4mPNv6Reg8kx+iDjbF7Mk=;
 b=mP4K8R4UC35TqqRsIIVOZwo1Jrk5RKlc5bUMWYLo0nSBDpMYqhMoZCq1cb4lV/upK9
 7IJOA+DHCgOOZS3Ss7ZQIicB3f1kyFbgDk2utZbQr/yYwv9xcpo1PfMWKvCHV1Q8XJN4
 nh8RPW6q2ZxCRoP7tCiurmo2pZTPCwLHgDOdmN40XxH1fcSy7vZ7YY32tJUi5O/6dGm5
 UvLDnGk+yUnAMtItkuL1BQO4vmZeopU1MsKTjes/ZJqsc4l47p1MfAJmt/d6+wWqurIE
 A/zujTbtPnaxffMGoRRN/joshMHnjy+fRGYyTOZJZeyTt2/mONBJA9Ip49CFzpO8gqUF
 auGQ==
X-Gm-Message-State: AOAM533+Nz5kB0mvds2nGLxG7smF8AkbfSohgajJU+ht/DqTxFh4B3wB
 Je3+SOpRwaIMF6Z9ybdUpCyLSjK5x29z/K4tYDrURiRN/f62vP+6lLhHVYotIbf/EKKOchBYI3Y
 JVRDX4XNO5Fokg7c=
X-Received: by 2002:a05:6000:114e:: with SMTP id
 d14mr15050450wrx.110.1591973535485; 
 Fri, 12 Jun 2020 07:52:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmtDwaN9rKU+LNvV0MzVfvIchwFtm/60SnVYrRVisFiJ+ASyKOW7oY3taajDa3CvXbkYkMuQ==
X-Received: by 2002:a05:6000:114e:: with SMTP id
 d14mr15050442wrx.110.1591973535343; 
 Fri, 12 Jun 2020 07:52:15 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id j4sm10109783wma.7.2020.06.12.07.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 07:52:14 -0700 (PDT)
Date: Fri, 12 Jun 2020 10:52:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 32/58] hw/pci/pci_bridge: Use the IEC binary prefix
 definitions
Message-ID: <20200612141917.9446-33-mst@redhat.com>
References: <20200612141917.9446-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200612141917.9446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 08:00:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200601142930.29408-5-f4bug@amsat.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/pci/pci_bridge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 3ba3203f72..3789c17edc 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -423,14 +423,14 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
     }
 
     if (res_reserve.mem_non_pref != (uint64_t)-1 &&
-        res_reserve.mem_non_pref >= (1ULL << 32)) {
+        res_reserve.mem_non_pref >= 4 * GiB) {
         error_setg(errp,
                    "PCI resource reserve cap: mem-reserve must be less than 4G");
         return -EINVAL;
     }
 
     if (res_reserve.mem_pref_32 != (uint64_t)-1 &&
-        res_reserve.mem_pref_32 >= (1ULL << 32)) {
+        res_reserve.mem_pref_32 >= 4 * GiB) {
         error_setg(errp,
                    "PCI resource reserve cap: pref32-reserve  must be less than 4G");
         return -EINVAL;
-- 
MST


