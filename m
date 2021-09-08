Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA39403BCF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 16:53:54 +0200 (CEST)
Received: from localhost ([::1]:46296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNyxV-0003ad-6p
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 10:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNywR-0002vd-F2
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:52:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNywP-0000th-Ti
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631112765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OtmDlEj6ZtcXQtLZn3SoZmY3jY1X2c2kvhk93duJZtg=;
 b=YnF+39DOhIZfUF0ih2CmB5ve31y9f+Ry2i4FCtMOmUqoTwGx72AVwNkva2+JcM72bCNRZE
 UN0+dx4vOn4luJkqOatYdAdf0y9DKHED9p0RyAnvHsWf4n32/wFIgz9kz4NAT24zuouOea
 iSFibFnPl2NBi6CyxQjk1XVXJMu/7N4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-GfK5FnF-Ohe-SbDgV0xHuA-1; Wed, 08 Sep 2021 10:52:44 -0400
X-MC-Unique: GfK5FnF-Ohe-SbDgV0xHuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13F71189CD21;
 Wed,  8 Sep 2021 14:52:43 +0000 (UTC)
Received: from redhat.com (ovpn-113-24.phx2.redhat.com [10.3.113.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AF575C1BB;
 Wed,  8 Sep 2021 14:52:42 +0000 (UTC)
Date: Wed, 8 Sep 2021 09:52:40 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL v4 13/43] vl: Add sgx compound properties to expose SGX
 EPC sections to guest
Message-ID: <20210908145240.baqge5v2kovmoq5m@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
 <20210908100426.264356-14-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908100426.264356-14-pbonzini@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 12:03:56PM +0200, Paolo Bonzini wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> Because SGX EPC is enumerated through CPUID, EPC "devices" need to be
> realized prior to realizing the vCPUs themselves, i.e. long before
> generic devices are parsed and realized.  From a virtualization
> perspective, the CPUID aspect also means that EPC sections cannot be
> hotplugged without paravirtualizing the guest kernel (hardware does
> not support hotplugging as EPC sections must be locked down during
> pre-boot to provide EPC's security properties).
> 

>  qapi/machine.json         | 26 +++++++++++++++
>  qemu-options.hx           | 10 ++++--
>  9 files changed, 166 insertions(+), 8 deletions(-)
>  create mode 100644 hw/i386/sgx.c
...
> +++ b/qapi/machine.json
> @@ -1194,6 +1194,32 @@
>            }
>  }
>  
> +##
> +# @SgxEPC:
> +#
> +# Sgx EPC cmdline information
> +#
> +# @memdev: memory backend linked with device
> +#
> +# Since: 6.1

Another instance where we'll want the followup patch to correct things
to 6.2.

> +##
> +{ 'struct': 'SgxEPC',
> +  'data': { 'memdev': 'str' }
> +}
> +
> +##
> +# @SgxEPCProperties:
> +#
> +# Properties for SgxEPC objects.
> +#
> +# @sgx-epc: sgx epc section properties.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'SgxEPCProperties',
> +  'data': { 'sgx-epc': ['SgxEPC'] }
> +}
> +
>  ##
>  # @MemoryDeviceInfo:
>  #
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8f603cc7e6..ceca52818a 100644
> --- a/qemu-options.hx

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


