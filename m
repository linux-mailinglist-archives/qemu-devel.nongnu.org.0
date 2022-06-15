Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4954254C246
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 08:57:49 +0200 (CEST)
Received: from localhost ([::1]:59998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1MyG-0005Rr-8u
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 02:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o1Mjd-0007bT-IW
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 02:42:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o1MjZ-0006C3-AU
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 02:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655275351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C0u6wosPYf+yzMshLNo4oqYmAY58Uty69QtNHSwlHRs=;
 b=Frppg7imFRjBnSc3D4aWTgyTIZKSmtp4mTgzaXA1G7xaOjGynM9dSdryK9pQY99KwAp4Vc
 UxXVRuoK+TNLsRwOrRUGPRplcB1lAPlSPxK0vp2Nz8c8vsRDEJbjnf84Ifo6LGAij2qrJZ
 LoebkXj6K/P6jvvrcKfYC0hQ7c2u/Fo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-fekoQO3gORapDT7fEQ1UHA-1; Wed, 15 Jun 2022 02:42:24 -0400
X-MC-Unique: fekoQO3gORapDT7fEQ1UHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 137DB2999B28;
 Wed, 15 Jun 2022 06:42:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8182040466AD;
 Wed, 15 Jun 2022 06:42:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F05591800081; Wed, 15 Jun 2022 08:42:21 +0200 (CEST)
Date: Wed, 15 Jun 2022 08:42:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Kevin Locke <kevin@kevinlocke.name>
Cc: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Laine Stump <laine@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2] docs: add PCIe root bus for VGA compat guideline
Message-ID: <20220615064221.kzqd3fcsbia7h5vc@sirius.home.kraxel.org>
References: <922cc3081ff9c986188f881ef4d1cf15bd3adf48.1654739990.git.kevin@kevinlocke.name>
 <bde9fc450bc5143d616c7e9999c5d39ae9fd9cb8.1655054968.git.kevin@kevinlocke.name>
 <3eebc773-a5ae-6652-95f5-4359872ea4d4@redhat.com>
 <20220614085252.fyogpqyf7cfcty4x@sirius.home.kraxel.org>
 <YqjQF83XBlnmyM3L@kevinlocke.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqjQF83XBlnmyM3L@kevinlocke.name>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  Hi,

> I think documenting the issue with VBE registers would be helpful.
> Doing so with a recommendation for how to avoid the issue seems even
> better.  Would a recommendation to attach a device which supports VBE
> to the Root Complex if VBE will be used by the guest make sense?

Yes.  This affects all vga-compatible devices emulated by qemu except cirrus.

> As you noted, applying the recommendation to all VGA compatible
> devices may be too broad.  I'm not sure whether it makes sense to
> recommend attaching VGA compatible devices to the Root Complex to
> avoid the complexity of the VGA exception bits, or if that is a
> non-issue.  In fact, if I understand correctly, it may make sense to
> recommend attaching VGA compatible devices to separate PCI bridges if
> the VM will have multiple VGA compatible devices so that the guest can
> perform VGA arbitration.

Yes.  Also guest drivers for pci-attached might be confused in case they
find a pcie gpu which is *not* in a pcie root port (which is impossible
on physical hardware).

take care,
  Gerd


