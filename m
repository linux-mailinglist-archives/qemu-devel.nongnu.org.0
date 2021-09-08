Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35F4403BCA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 16:52:34 +0200 (CEST)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNywB-00028w-Eh
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 10:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNyvH-0001SL-8g
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNyvE-0008Au-BQ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631112691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xdcq6IvaSa3T2M3kHi4m6gWRUhSMRrS3PNOGfddoAUU=;
 b=DMsp++wEZv08+DsqwVbjpnACElLaJUyvFeVeyrSneW2FZt1n/HucIn32kRgF8Oz5L9PNUH
 Ix1zQPB2YxDqTIqNbwJm7kpIrsXQMZEF0shJAy8CFc70fTfQchFU3yM1YCHDZ8VLWsCibv
 sm8y9115a1IyZTUeGvJlwatX1kSTQEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-K28g00CsNh68rxfDYinxHg-1; Wed, 08 Sep 2021 10:51:28 -0400
X-MC-Unique: K28g00CsNh68rxfDYinxHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B05A801E72;
 Wed,  8 Sep 2021 14:51:27 +0000 (UTC)
Received: from redhat.com (ovpn-113-24.phx2.redhat.com [10.3.113.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB25E77BE7;
 Wed,  8 Sep 2021 14:51:26 +0000 (UTC)
Date: Wed, 8 Sep 2021 09:51:25 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL v4 11/43] qom: Add memory-backend-epc ObjectOptions support
Message-ID: <20210908145125.kfcbu77urwmfq5ll@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
 <20210908100426.264356-12-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908100426.264356-12-pbonzini@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 12:03:54PM +0200, Paolo Bonzini wrote:
> From: Yang Zhong <yang.zhong@intel.com>
> 
> Add the new 'memory-backend-epc' user creatable QOM object in
> the ObjectOptions to support SGX since v6.1, or the sgx backend
> object cannot bootup.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> 
> v1-->v2:
>    - Added the new MemoryBackendEpcProperties and related documents,
>      and updated the blurb(Eric Blake).

A bit odd to see this in the pull request, but probably too late to
worry about it now unless there is another reason to respin it.
(Generally, patch version information should be...

> Message-Id: <20210719112136.57018-4-yang.zhong@intel.com>
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

...here, after the --- separator, so that 'git am' will drop it).

>  qapi/qom.json | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index a25616bc7a..16ba30e5b9 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -647,6 +647,23 @@
>              '*hugetlbsize': 'size',
>              '*seal': 'bool' } }
>  
> +##
> +# @MemoryBackendEpcProperties:
> +#
> +# Properties for memory-backend-epc objects.
> +#
> +# The @share boolean option is true by default with epc
> +#
> +# The @merge boolean option is false by default with epc
> +#
> +# The @dump boolean option is false by default with epc
> +#
> +# Since: 6.1

Unless there's a reason to respin the pull request, we'll need a
followup patch to bump this to 6.2.

> +##
> +{ 'struct': 'MemoryBackendEpcProperties',
> +  'base': 'MemoryBackendProperties',
> +  'data': {} }
> +

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


