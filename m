Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4331380D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 16:36:46 +0100 (CET)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98aj-0002X3-HQ
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 10:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jfreimann@redhat.com>)
 id 1l92Ar-0003mD-Qe
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 03:45:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jfreimann@redhat.com>)
 id 1l92Ae-0006Ll-2E
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 03:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612773919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F05ndcAqzFPagk3guX25ww7RNWDXFgxYyc2o1JyZEeU=;
 b=Ljb7PzIYjR3JNai9Ek3elsZIl2DQUOdv0yuHMzPNdgitTyghxA9cxopGM1TUYRtN3H74xx
 q1Ka7xl2hA4TCGslkp4wgVoUEWljrXly5q54mbEuvET0mOGvH/rfhADS/YqRbvV1tFwl8F
 uQgk7R6wMOgD3c7BTDTAhbStmN2fdp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-exHI9aOQN4CwBmmvqYULUw-1; Mon, 08 Feb 2021 03:45:17 -0500
X-MC-Unique: exHI9aOQN4CwBmmvqYULUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4A43801975;
 Mon,  8 Feb 2021 08:45:16 +0000 (UTC)
Received: from localhost (ovpn-112-179.ams2.redhat.com [10.36.112.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38E881007612;
 Mon,  8 Feb 2021 08:45:16 +0000 (UTC)
Date: Mon, 8 Feb 2021 09:45:14 +0100
From: Jens Freimann <jfreimann@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] virtio-net: add missing object_unref()
Message-ID: <20210208084514.GE4035@linux.fritz.box>
References: <20210206123955.2196514-1-lvivier@redhat.com>
 <20210206123955.2196514-3-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210206123955.2196514-3-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfreimann@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jfreimann@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 06, 2021 at 01:39:55PM +0100, Laurent Vivier wrote:
>failover_add_primary() calls qdev_device_add() and doesn't unref
>the device. Because of that, when the device is unplugged a reference
>is remaining and prevents the cleanup of the object.
>
>This prevents to be able to plugin back the failover primary device,
>with errors like:
>
>  (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
>  (qemu) device_del hostdev0
>
>We can check with "info qtree" and "info pci" that the device has been removed, and then:
>
>  (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev1,bus=root.3,failover_pair_id=net0
>  Error: vfio 0000:41:00.0: device is already attached
>  (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
>  qemu-kvm: Duplicate ID 'hostdev0' for device
>
>Fixes: 21e8709b29cd ("failover: Remove primary_dev member")
>Cc: quintela@redhat.com
>Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>---
> hw/net/virtio-net.c | 2 ++
> 1 file changed, 2 insertions(+)
>

Reviewed-by: Jens Freimann <jfreimann@redhat.com>

Thank you Laurent!

regards,
Jens 


