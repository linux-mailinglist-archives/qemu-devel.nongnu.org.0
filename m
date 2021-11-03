Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFB2444572
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:09:35 +0100 (CET)
Received: from localhost ([::1]:34018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIpS-000326-8H
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miIoF-0001Xd-Jy
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:08:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miIoB-0002nz-Hr
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635955694;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=B8uy84VxcTFj6HEWA4alvlW3tjdhBfME5A/cHNZYZLI=;
 b=F8I1N4+iaXkdj3xvo4sWyYFW1RisorGSKBMMm2cSw/TKPGIehTxPB3llHsMLnplpfORh2D
 QvT0NY7gNQz/Rsx7BvEZObRoHMV8jn8xnrpiz/9wrdt50IHtBACs3zrfvQItmyO6TRfNKh
 l0lLI66t5EebulwXraOJAK0I7ecuvQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-BHmXP9XzMI-pu08bZqTJIg-1; Wed, 03 Nov 2021 12:08:11 -0400
X-MC-Unique: BHmXP9XzMI-pu08bZqTJIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF5C5BD52C;
 Wed,  3 Nov 2021 16:07:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1CE6196E5;
 Wed,  3 Nov 2021 16:07:48 +0000 (UTC)
Date: Wed, 3 Nov 2021 16:07:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH 2/3] sev/i386: Warn if using -kernel with invalid OVMF
 hashes table area
Message-ID: <YYKz0QX3AIf9oxYH@redhat.com>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-3-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211101102136.1706421-3-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 01, 2021 at 10:21:35AM +0000, Dov Murik wrote:
> Commit cff03145ed3c ("sev/i386: Introduce sev_add_kernel_loader_hashes
> for measured linux boot", 2021-09-30) introduced measured direct boot
> with -kernel, using an OVMF-designated hashes table which QEMU fills.
> 
> However, no checks are performed on the validity of the hashes area
> designated by OVMF.  Specifically, if OVMF publishes the
> SEV_HASH_TABLE_RV_GUID entry but it is filled with zeroes, this will
> cause QEMU to write the hashes entries over the first page of the
> guest's memory (GPA 0).
> 
> Add validity checks to the published area.  If the hashes table area's
> base address is zero, or its size is too small to fit the aligned hashes
> table, warn and skip the hashes entries addition.  In such case, the
> following warning will be displayed:
> 
>     qemu-system-x86_64: warning: SEV: OVMF's hashes table area is invalid (base=0x0 size=0x0)
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> Reported-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  target/i386/sev.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 682b8ccf6c..a20ddb545e 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -1201,13 +1201,18 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
>      uint8_t kernel_hash[HASH_SIZE];
>      uint8_t *hashp;
>      size_t hash_len = HASH_SIZE;
> -    int aligned_len;
> +    int aligned_len = ROUND_UP(sizeof(SevHashTable), 16);
>  
>      if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
>          warn_report("SEV: kernel specified but OVMF has no hash table guid");
>          return false;
>      }
>      area = (SevHashTableDescriptor *)data;
> +    if (!area->base || area->size < aligned_len) {
> +        warn_report("SEV: OVMF's hashes table area is invalid (base=0x%x size=0x%x)",
> +                    area->base, area->size);
> +        return false;
> +    }

I think warn_report is likely a bad idea.

If someone's use case is relying on the hashs being populated, then
we need to be able to error_report and exit, not carry on with a
known broken setup.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


