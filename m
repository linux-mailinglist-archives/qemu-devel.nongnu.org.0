Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7787C3DB692
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 12:02:31 +0200 (CEST)
Received: from localhost ([::1]:34278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9PLa-0005N4-GW
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 06:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m9PK4-0004UG-Ha
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:00:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m9PK1-0003zB-NG
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627639252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LGi/KjgpIPwWbsP1NwU2YjlPXh+NOQbSDwOTg/renNc=;
 b=AXUUA+I1tvOOt5j4HaM3RkT4KW/AYGepVLo1OLgTxtaI5d5k22vxMNNmEhuwGbl3aVgn9D
 iFf3PWKes9yzn/gT0cMytq/3WPtTSmXqlzfcEwl3vqdpQpfVc2e4c5FZVxZvX+ctrlPs/v
 suhqkHtn6r5lkEZe7++7tgjVenX0K7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-V28elPeMM4WAEz1lCoGZwQ-1; Fri, 30 Jul 2021 06:00:51 -0400
X-MC-Unique: V28elPeMM4WAEz1lCoGZwQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A10D9100F762;
 Fri, 30 Jul 2021 10:00:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E81C310074F8;
 Fri, 30 Jul 2021 10:00:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7DE001800905; Fri, 30 Jul 2021 12:00:45 +0200 (CEST)
Date: Fri, 30 Jul 2021 12:00:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [PATCH v2 7/8] virtio-gpu: Initialize Venus
Message-ID: <20210730100045.u2tiw4vbb2arxafh@sirius.home.kraxel.org>
References: <20210728134634.2142156-1-antonio.caggiano@collabora.com>
 <20210728134634.2142156-8-antonio.caggiano@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20210728134634.2142156-8-antonio.caggiano@collabora.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.717, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Jul 28, 2021 at 03:46:33PM +0200, Antonio Caggiano wrote:
> Enable VirGL unstable APIs and request Venus when initializing VirGL.

I guess having a runtime switch for that would be a good idea, and
probably have default it off while the API is unstable still.

take care,
  Gerd


