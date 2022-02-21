Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F454BDAE4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:41:28 +0100 (CET)
Received: from localhost ([::1]:57026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBkd-00063r-9o
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:41:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMBU3-0003LK-BF
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:24:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMBTz-0006cz-NE
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645460654;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=InS3To/p+2QDeVv6CK/8yU6B2hbwY4191NqjyD3VdB8=;
 b=dRsahT8CHEG/J2GFd27exGuD1n3gHdc8nURxY80Fkix8JPCro31BrcCtvK8wxxdz3S2pLK
 NWzqh+mL/jklpdBSFtdmH63q4rx7KqPybAdaIXPqBefPN/qHwF8mCKLRjkUTHnVqGPwdKM
 6xzvh6uxNlrScD+I8cS2WlGTOu0AszY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297--ceoeDVuO8yb1ePwUvoaPw-1; Mon, 21 Feb 2022 11:24:11 -0500
X-MC-Unique: -ceoeDVuO8yb1ePwUvoaPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4A1C106B806;
 Mon, 21 Feb 2022 16:24:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAFB084A0E;
 Mon, 21 Feb 2022 16:24:06 +0000 (UTC)
Date: Mon, 21 Feb 2022 16:24:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH] qapi, target/i386/sev: Add cpu0-id to
 query-sev-capabilities
Message-ID: <YhO8o7V2CnI3gAut@redhat.com>
References: <20220221160850.1484364-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220221160850.1484364-1-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Markus Armbruster <armbru@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 21, 2022 at 04:08:50PM +0000, Dov Murik wrote:
> Add a new field 'cpu0-id' to the response of query-sev-capabilities
> QMP command.  The value of the field is the hex-encoded 64-byte unique
> ID of the CPU0 (socket 0), which can be used to retrieve the signed CEK
> of the CPU from AMD's Key Distribution Service (KDS).
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---
>  qapi/misc-target.json |  4 ++++
>  target/i386/sev.c     | 43 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 4bc45d2474..d9b4991c86 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -177,6 +177,8 @@
>  #
>  # @cert-chain:  PDH certificate chain (base64 encoded)
>  #
> +# @cpu0-id: 64-byte unique ID of CPU0 (hex encoded) (since 7.0)

For binary data in QAPI we've pretty much standardized on using
base64 encoding. I think we should stick with that encoding.

> +#
>  # @cbitpos: C-bit location in page table entry
>  #
>  # @reduced-phys-bits: Number of physical Address bit reduction when SEV is
> @@ -187,6 +189,7 @@
>  { 'struct': 'SevCapability',
>    'data': { 'pdh': 'str',
>              'cert-chain': 'str',
> +            'cpu0-id': 'str',
>              'cbitpos': 'int',
>              'reduced-phys-bits': 'int'},
>    'if': 'TARGET_I386' }
> @@ -205,6 +208,7 @@
>  #
>  # -> { "execute": "query-sev-capabilities" }
>  # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
> +#                  "cpu0-id": "5ea2e1...90ea39",
>  #                  "cbitpos": 47, "reduced-phys-bits": 5}}
>  #
>  ##

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


