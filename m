Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43ED5F3EBC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 10:47:09 +0200 (CEST)
Received: from localhost ([::1]:53642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofda0-0003c3-85
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 04:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ofcr9-0004gv-6X
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:00:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ofcr2-00051H-Mb
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664870440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aqJ2yLjjZUhKVHmRUVCl9KYDgvH2j7m9F4CB63Uh9b8=;
 b=iBupNab3DH/U2hGhDzr5k430nkjWQG213EzqUYTKDYiymcluLB7O5R/sL2USJxtjmfjFeU
 z3Xe+NSJYB3wxcpUzZhPKyJmJ+5eSdgInyER97tU7cOMCP8+oI5seegb0ZKCGBFXYbR4ZA
 x0EvAr70TaQcjbZXsbZcw83PgaICRZ8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-cuMEjnlfO6WYcTL_zFPkKw-1; Tue, 04 Oct 2022 04:00:39 -0400
X-MC-Unique: cuMEjnlfO6WYcTL_zFPkKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3D22382ECC6;
 Tue,  4 Oct 2022 08:00:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F38A40C6EC2;
 Tue,  4 Oct 2022 08:00:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 24F691800082; Tue,  4 Oct 2022 10:00:31 +0200 (CEST)
Date: Tue, 4 Oct 2022 10:00:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Denis V. Lunev" <den@virtuozzo.com>
Cc: qemu-devel@nongnu.org, Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Vadim Rozenfeld <vrozenfe@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ben Warren <ben@skyportsystems.com>
Subject: Re: [PATCH 1/1] qxl: add subsystem_vendor_id property
Message-ID: <20221004080031.kemfawvj5auyfrei@sirius.home.kraxel.org>
References: <20220928155244.1837455-1-den@openvz.org>
 <20220929073747.psazwl2cxwuynt5n@sirius.home.kraxel.org>
 <78f7c71f-4232-505a-e865-8e921f63815e@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78f7c71f-4232-505a-e865-8e921f63815e@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

> Anyway, we need to support different PCI sub-vendor IDs
> in order to be compliant with Microsoft WHQL rules. Though,
> actually, at my opinion this requirement has nothing in
> common with libvirt people. The most convenient way
> here would be to specify these properties within vendor
> machine types and this place is a perfect match as any
> respectable has its own machine type.

Yes, when wiring this up via vendor machine types there
is no need to touch libvirt.

> I would also think that PCI level is not a good place for that
> as we would not be able to apply this change blindly as at
> PCI level this change would be too global and the same
> was initially noted by Michael Tsirkin here
> 
> https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg04384.html
> 
> Any thoughts?
> What should we do with the original patch from Ben? We
> still need an ability to expose vendor identity in QXL/virtio...

I'd suggest to add properties to PCIDevice then.  That will allow to
override the default subsystem id for both specific pci devices and
all pci devices.

take care,
  Gerd


