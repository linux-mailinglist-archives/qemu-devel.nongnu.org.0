Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C423DB6D1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 12:06:09 +0200 (CEST)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9PP7-0000hx-0i
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 06:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m9PO6-0008Lj-KS
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:05:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m9PO4-0006j9-NR
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627639504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X0Aa2Z4Vc+H0FTLgU3alNbEu/Zd/MON7nZH+JHW2hK8=;
 b=C6a0GPWQqvwQYMaO8Cxee7NYQ+OBWsKSCYVqs5qgsyEtxPKqNoTzlCN0OArnFYsJd+1yON
 R6HOKovox1cprn5eLqfQ409zo70dnMqFy4Qc5ODhBk+7UvbA75fn3Qwzzm7ocQZR+cHeb+
 hCgoq+rrSupLITpqhFWmaA0uEhlyt7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-K9Sw3ZT1NZiq10skvKne1g-1; Fri, 30 Jul 2021 06:05:02 -0400
X-MC-Unique: K9Sw3ZT1NZiq10skvKne1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4BD18042EA;
 Fri, 30 Jul 2021 10:05:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A1EF5C1D1;
 Fri, 30 Jul 2021 10:04:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6E5D01800905; Fri, 30 Jul 2021 12:04:56 +0200 (CEST)
Date: Fri, 30 Jul 2021 12:04:56 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [PATCH v2 8/8] virtio-gpu: Handle resource blob commands
Message-ID: <20210730100456.fvovdlsufevenp6r@sirius.home.kraxel.org>
References: <20210728134634.2142156-1-antonio.caggiano@collabora.com>
 <20210728134634.2142156-9-antonio.caggiano@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20210728134634.2142156-9-antonio.caggiano@collabora.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +    region = g_new0(MemoryRegion, 1);
> +    memory_region_init_ram_device_ptr(region, OBJECT(g), NULL, size, data);
> +    memory_region_add_subregion(&g->parent_obj.hostmem, mblob.offset, region);
> +    memory_region_set_enabled(region, true);

You leak the region instead of properly cleaning it up on unmap.

take care,
  Gerd


