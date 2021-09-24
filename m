Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582E7417687
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:04:59 +0200 (CEST)
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlow-0007P9-B0
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTlhG-0003h7-1M
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:57:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTlh8-0005LT-5B
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632491812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LfLQpc7b6fe08VADwiop/w3R8LlUh4auMRvPRfWTcnc=;
 b=VB/FDVXcC1oQsM8HuHW1dQBC+wCUFs/is8SQLX9N7bR3mCOvTIpz+qNKuxyI/seQQtgfCO
 2HYurR5NphreZSghcmcWdVZPFX1NPRPixElZVxvpCZuOxTZwf0S7Zq3mH6uyXPoAWZr+YF
 LBiwGOtb69+tADNLJPqnaarW4KdGYms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-imSbhn0pNLqbvmOW6Uqqlg-1; Fri, 24 Sep 2021 09:56:47 -0400
X-MC-Unique: imSbhn0pNLqbvmOW6Uqqlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5AF68015C7;
 Fri, 24 Sep 2021 13:56:46 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC68E5F707;
 Fri, 24 Sep 2021 13:56:42 +0000 (UTC)
Date: Fri, 24 Sep 2021 08:56:40 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5 04/26] qom: Add memory-backend-epc ObjectOptions support
Message-ID: <20210924135640.svjs3avfaguq5kxf@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
 <20210924112509.25061-5-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210924112509.25061-5-pbonzini@redhat.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: yang.zhong@intel.com, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 01:24:47PM +0200, Paolo Bonzini wrote:
> From: Yang Zhong <yang.zhong@intel.com>
> 
> Add the new 'memory-backend-epc' user creatable QOM object in
> the ObjectOptions to support SGX since v6.1, or the sgx backend
> object cannot bootup.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Message-Id: <20210719112136.57018-4-yang.zhong@intel.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qapi/qom.json | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index a25616bc7a..0222bb4506 100644
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
> +# Since: 6.2
> +##
> +{ 'struct': 'MemoryBackendEpcProperties',
> +  'base': 'MemoryBackendProperties',
> +  'data': {} }

Is the intent to add more members to data in later patches?  Otherwise,...

> +
>  ##
>  # @PrManagerHelperProperties:
>  #
> @@ -797,6 +814,7 @@
>      { 'name': 'memory-backend-memfd',
>        'if': 'CONFIG_LINUX' },
>      'memory-backend-ram',
> +    'memory-backend-epc',
>      'pef-guest',
>      'pr-manager-helper',
>      'qtest',
> @@ -855,6 +873,7 @@
>        'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
>                                        'if': 'CONFIG_LINUX' },
>        'memory-backend-ram':         'MemoryBackendProperties',
> +      'memory-backend-epc':         'MemoryBackendEpcProperties',

...this could have just been MemoryBackendProperties.

>        'pr-manager-helper':          'PrManagerHelperProperties',
>        'qtest':                      'QtestProperties',
>        'rng-builtin':                'RngProperties',
> -- 
> 2.31.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


