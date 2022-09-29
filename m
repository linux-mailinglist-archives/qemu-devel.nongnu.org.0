Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C24E5EF015
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:13:05 +0200 (CEST)
Received: from localhost ([::1]:59188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odofI-0000nu-2K
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1odo7Q-0003B6-Na
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:38:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1odo7M-0007Nk-Lp
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664437079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=umTg/C/f7jmJ8Pmk5d0s46IM8pBCiLG0zmwDUorl/3k=;
 b=XLXrHuOnYhubvoYWp/6XgdrjSjsYL8Q9WxpS98A1kRMourKH4f9jPiIeTv+1HxPBa/uXqe
 Z9G/s12/SIHfFk3Ihh8ZeZo9K2/fYBTGFDbo8KzZDnyVPuTS3aLA32MMaXPgOdeTvBSG7B
 L2QK/T91BJDjwqMKIcWpLbiKmstUzE8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-j6OVUwi7NYqpLxT9L43ivQ-1; Thu, 29 Sep 2022 03:37:50 -0400
X-MC-Unique: j6OVUwi7NYqpLxT9L43ivQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC6A12932486;
 Thu, 29 Sep 2022 07:37:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 391151400C3B;
 Thu, 29 Sep 2022 07:37:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A206D180062C; Thu, 29 Sep 2022 09:37:47 +0200 (CEST)
Date: Thu, 29 Sep 2022 09:37:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Denis V. Lunev" <den@openvz.org>
Cc: qemu-devel@nongnu.org, Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 Yan Vugenfirer <yvugenfi@redhat.com>
Subject: Re: [PATCH 1/1] qxl: add subsystem_vendor_id property
Message-ID: <20220929073747.psazwl2cxwuynt5n@sirius.home.kraxel.org>
References: <20220928155244.1837455-1-den@openvz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928155244.1837455-1-den@openvz.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 05:52:44PM +0200, Denis V. Lunev wrote:
> This property is needed for WHQL/inboxing of Windows drivers. We do need
> to get drivers to be separated by the hypervisor vendors and that should
> be done as PCI subvendor ID.
> 
> This patch adds PCI subsystem vendor ID to QXL device to match that
> convention.

We have pci_default_sub_vendor_id + pci_default_sub_device_id in
hw/pci/pci.c.  If you want another subsystem id for another vendor
there is a single place to change it for all devices.

Right now there is no runtime switch for them, so updating it requires
a two-liner patch for your vendor build.  We can discuss changing that,
but that should best be coordinated with libvirt folks to make sure
the management stack actually allows setting the subsystem id without
needing hacks.

take care,
  Gerd


