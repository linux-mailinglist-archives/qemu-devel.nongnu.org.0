Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA0442A782
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 16:42:49 +0200 (CEST)
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maIzQ-0003v0-GH
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 10:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1maIxd-0001ZL-E9
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1maIxX-0002ry-VM
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634049649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kgINEWyu/a4U0Sv2IRkSORXSBParJUtQxoiGf8yuIec=;
 b=IKAtxtB6a/Sz2SjK11X533Z5FHUrTmci4j4maLaNfhkTzZWtiCAMVT00D6Tp+not006dZ/
 97Fxm62cK4eRHV6w5kkie18MfxJLbY48/SyCdDGjEOrThQ4LbXMY2Hu0PXiTrVl9WOg0Kf
 CHmNwv8mf2ETruntDNLqcKGfvT1+FYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-iWjIPkXFONK9S_LfyvrfNw-1; Tue, 12 Oct 2021 10:40:46 -0400
X-MC-Unique: iWjIPkXFONK9S_LfyvrfNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14F91801AB0;
 Tue, 12 Oct 2021 14:40:45 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 557C15C1B4;
 Tue, 12 Oct 2021 14:40:43 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 0/3] s390x: reduce my maintainership duties
Date: Tue, 12 Oct 2021 16:40:37 +0200
Message-Id: <20211012144040.360887-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I currently don't have enough resources to work on s390x as
much anymore, so I need to reduce my workload. For many topics,
we should be well-covered already, so I'll drop out from those.

Don't worry (or rejoice?), though; I don't plan to disappear.

Cornelia Huck (3):
  vfio-ccw: step down as maintainer
  s390x/kvm: step down as maintainer
  s390x virtio-ccw machine: step down as maintainer

 MAINTAINERS | 6 ------
 1 file changed, 6 deletions(-)

-- 
2.31.1


