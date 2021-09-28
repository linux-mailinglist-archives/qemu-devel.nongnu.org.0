Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D12241A6E5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 07:07:32 +0200 (CEST)
Received: from localhost ([::1]:55688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV5L0-00066X-Ls
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 01:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mV5KD-0005Ru-E4
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 01:06:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mV5K8-00008m-EG
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 01:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632805594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=knrf4k1GTYjnAsg98KY4ZW1dzz5txs9fieCEytHNdzI=;
 b=WO9P0ljk2Y0ShGL7JWhGi8PDoQxggCU7DNVXUvTnKK09vTwCSSU9Syp9ZRUZ8jVQZQcy5O
 XqS+aqAGCbAEft8zRMtyRTXC66oFT8MR36OmIBa1k4I9hMJfeUzBi/dmdOafaDpXxtomlJ
 zQ0UFSNCIPLRh4PgB89uS1fqQIdIrlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-NjPF6sicONuFTqhOe_DRJQ-1; Tue, 28 Sep 2021 01:06:31 -0400
X-MC-Unique: NjPF6sicONuFTqhOe_DRJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 079C0802921;
 Tue, 28 Sep 2021 05:06:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C40981F476;
 Tue, 28 Sep 2021 05:06:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0255818003B6; Tue, 28 Sep 2021 07:06:28 +0200 (CEST)
Date: Tue, 28 Sep 2021 07:06:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Jose R. Ziviani" <jziviani@suse.de>
Subject: Re: [PATCH v2 0/2] modules: Improve modinfo.c support
Message-ID: <20210928050628.l344ydhuzr25rsox@sirius.home.kraxel.org>
References: <20210927141201.21833-1-jziviani@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210927141201.21833-1-jziviani@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 11:11:58AM -0300, Jose R. Ziviani wrote:
> This patchset introduces the modinfo_need and changes
> modinfo-generate.py/meson.build to generate/link one modinfo per target.
> 
> modinfo-generate.py will know, thanks to modinfo_need, which modules are
> currently enabled for a given target before adding it in the array of
> modules. It will give a hint about why some modules failed, so
> developers can have a clue about it:

The approach looks good to me.

>     /* hw-display-qxl.modinfo */
>     /* module  QXL is missing. */

You are using kconfig symbols here, so the comment should say so ;)

Renaming modinfo_need to modinfo_kconfig will probably also help
to make that clear.

>     /* hw-display-virtio-gpu.modinfo */
>     .name = "hw-display-virtio-gpu",
>     .objs = ((const char*[]){  "virtio-gpu-base",  "virtio-gpu-device",  "vhost-user-gpu", NULL }),

Hmm?  Leftover from an older version of the series?

>  - accelerators can be filtered as well (this only covers the device
>    part), then the field QemuModinfo.arch can be removed.

It's target-specific modules.  Although accelerators are the only
in-tree users right this is not limited to accelerators.

take care,
  Gerd


