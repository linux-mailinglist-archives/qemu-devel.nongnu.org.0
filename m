Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D423DB665
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 11:51:09 +0200 (CEST)
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9PAa-0006Fv-BJ
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 05:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m9P9a-0005YC-Q5
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 05:50:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m9P9Z-0004lE-CZ
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 05:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627638604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SU7JSiqmbP98YwISBASs8U+bGeYcyHzNILcKWF6XNEE=;
 b=ar69HkwsNApfugaRmAijCoJXRp7JJKifAj8AVT2BV6uEjeJaJuIs1518ylFoQ9dpnRom3X
 C9pq2GCNL5KQm2EL0+3GhMGXoCJlXzUcggw4XfE+f1dSzJwKrgsvysbJbDeMG09lcVjy6a
 +em9CqFZ6duvmeMfl8ZDyOunDRc9omA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-hLmUjeAYMBKZ41HFvBcSJw-1; Fri, 30 Jul 2021 05:50:01 -0400
X-MC-Unique: hLmUjeAYMBKZ41HFvBcSJw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EB3E106C0F9;
 Fri, 30 Jul 2021 09:50:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFAEE60BF1;
 Fri, 30 Jul 2021 09:49:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 15D4E18000BB; Fri, 30 Jul 2021 11:49:58 +0200 (CEST)
Date: Fri, 30 Jul 2021 11:49:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [PATCH v2 2/8] virtio-gpu: hostmem [wip]
Message-ID: <20210730094958.65das2gbphmxyurr@sirius.home.kraxel.org>
References: <20210728134634.2142156-1-antonio.caggiano@collabora.com>
 <20210728134634.2142156-3-antonio.caggiano@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20210728134634.2142156-3-antonio.caggiano@collabora.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> +/*
> + * shared memory
> + */
> +#define VIRTIO_GPU_F_HOSTMEM             5

Leftover from early interface design attempts.

The blob resources (with VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST)
should cover that now.

take care,
  Gerd


