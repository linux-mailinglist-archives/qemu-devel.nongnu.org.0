Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980463F8730
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 14:19:23 +0200 (CEST)
Received: from localhost ([::1]:43876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJELq-000841-OR
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 08:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJEKK-00078C-4S
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:17:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJEKI-0005R2-Ri
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629980265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H9SPrSZkzKsa6FIEWU7jpm6w2xfSbI6PkE7tQuZ3c50=;
 b=TW4u+zrv8KPfd1+g4HLq/iTYe7s2aw6KbLXzQsGze4gpGlshrTkhdZhvwPUhpIemik29UM
 d/YlLKLJqP4O2faQl07S9m8JoHekZHPX0EaOwiWn6fIRvsy0WAbPZeuexJYtdjWXxxh55P
 N7pyfckdcIKO5VEAWIz1s6Qs0dR1fNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-XRJYofoZNOi8ffPwTdxX2w-1; Thu, 26 Aug 2021 08:17:44 -0400
X-MC-Unique: XRJYofoZNOi8ffPwTdxX2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F316E87D541;
 Thu, 26 Aug 2021 12:17:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B503760877;
 Thu, 26 Aug 2021 12:17:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2E0EB18003AA; Thu, 26 Aug 2021 14:17:41 +0200 (CEST)
Date: Thu, 26 Aug 2021 14:17:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [RFC PATCH v2 24/44] i386/tdx: Add MMIO HOB entries
Message-ID: <20210826121741.cp4lsldhyha2r4pa@sirius.home.kraxel.org>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <3cf3b4e1ccbddd08bb4695930b6ebee9678f9454.1625704981.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cf3b4e1ccbddd08bb4695930b6ebee9678f9454.1625704981.git.isaku.yamahata@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: isaku.yamahata@intel.com, cohuck@redhat.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, alistair@alistair23.me,
 xiaoyao.li@intel.com, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>, mtosatti@redhat.com,
 erdemaktas@google.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +    /* PCI hole above 4gb. */
> +    start = object_property_get_uint(host, PCI_HOST_PROP_PCI_HOLE64_START,
> +                                     NULL);
> +    end = object_property_get_uint(host, PCI_HOST_PROP_PCI_HOLE64_END, NULL);
> +    tdvf_hob_add_mmio_resource(hob, start, end);
> +
> +    /* MMCFG region */
> +    mcfg_base = object_property_get_uint(host, PCIE_HOST_MCFG_BASE, NULL);
> +    mcfg_size = object_property_get_uint(host, PCIE_HOST_MCFG_SIZE, NULL);
> +    if (mcfg_base && mcfg_base != PCIE_BASE_ADDR_UNMAPPED && mcfg_size) {
> +        tdvf_hob_add_mmio_resource(hob, mcfg_base, mcfg_base + mcfg_size);
> +    }

I doubt this works.  These are initialized by the firmware not qemu.

take care,
  Gerd


