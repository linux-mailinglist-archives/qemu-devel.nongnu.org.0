Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DD7429533
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 19:06:14 +0200 (CEST)
Received: from localhost ([::1]:49294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZyke-0005Rl-N4
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 13:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mZyiC-0004fp-76
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mZyi6-0006ZQ-No
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633971811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p2O5aWA1zS1SmjZOk4gGk8Az/yw5NNfli8KVOfouv1Q=;
 b=O64/PdsWP5TRzEAcqRHwQ9BamK8eZVXImQU7+vHRN5zTLc/+pBF/EHv08p6HfEKEtwM9tR
 tVBkOdJRs7XKiWcrfwKK3XYIc4TureZ6hl7aZcPQqf5hajmul3jwdBl4kZdbgQjCRbzVIL
 y55UWSrlMj/Q5U6DjdqaPqqCzEJymtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-0cvWxgkfNVqZ-35Lkm8Aag-1; Mon, 11 Oct 2021 13:03:27 -0400
X-MC-Unique: 0cvWxgkfNVqZ-35Lkm8Aag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA63E101AFA9;
 Mon, 11 Oct 2021 17:03:26 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38E8760BF4;
 Mon, 11 Oct 2021 17:03:26 +0000 (UTC)
Date: Mon, 11 Oct 2021 12:03:24 -0500
From: Eric Blake <eblake@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH 3/6] numa: Add SGXEPCSection list for multiple sections
Message-ID: <20211011170324.2f5oacnghualbu45@redhat.com>
References: <20211011111554.12403-1-yang.zhong@intel.com>
 <20211011111554.12403-4-yang.zhong@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211011111554.12403-4-yang.zhong@intel.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: pbonzini@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 07:15:51PM +0800, Yang Zhong wrote:
> The SGXEPCSection list added into SGXInfo to show the multiple
> SGX EPC sections detailed info, not the total size like before.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  qapi/misc-target.json | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 594fbd1577..89a5a4250a 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -334,6 +334,21 @@
>    'returns': 'SevAttestationReport',
>    'if': 'TARGET_I386' }
>  
> +##
> +# @SGXEPCSection:
> +#
> +# Information about intel SGX EPC section info
> +#
> +# @index: the SGX epc section index
> +#
> +# @size: the size of epc section
> +#
> +# Since: 6.2
> +##
> +{ 'struct': 'SGXEPCSection',
> +  'data': { 'index': 'uint64',
> +            'size': 'uint64'}}
> +
>  ##
>  # @SGXInfo:
>  #
> @@ -347,7 +362,7 @@
>  #
>  # @flc: true if FLC is supported
>  #
> -# @section-size: The EPC section size for guest
> +# @sections: The EPC sections info for guest
>  #
>  # Since: 6.2

Given this has not yet been in a stable release, we can make this change...

>  ##
> @@ -356,7 +371,7 @@
>              'sgx1': 'bool',
>              'sgx2': 'bool',
>              'flc': 'bool',
> -            'section-size': 'uint64'},
> +            'sections': ['SGXEPCSection']},
>     'if': 'TARGET_I386' }

...but are we sure we have the best interface possible if we are still
expressing uncertainty about the QAPI used to represent it?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


