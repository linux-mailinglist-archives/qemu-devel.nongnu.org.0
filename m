Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461C52F66A1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:04:46 +0100 (CET)
Received: from localhost ([::1]:38898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l063B-00074s-9E
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l05Ux-0002kE-LG
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:29:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l05Uu-00035c-1a
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610641758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C2ylkCMJ6GzLyC9y+l2WtRI/gvxNKPLIUNZE/LoGiyw=;
 b=gcgErG1qwGPkVNhBg3vZXyhgOcrkGQN8GxpGerfZOkmtB78mX3BLk/L0ULyhFtvhc6plnc
 RmU2JPpHBVcJ4nVzYvcSgqbcpWxg6Z5guhS/wbufK4Q7+jOfsExAYeu8NxVSBrfnjRNVoT
 v2NatXiTP9hFpcnG/8+R0X/LkU6P9do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-da7tYr08PcO5waa3in6P5Q-1; Thu, 14 Jan 2021 11:29:16 -0500
X-MC-Unique: da7tYr08PcO5waa3in6P5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A960806661
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 16:29:15 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D858610D0;
 Thu, 14 Jan 2021 16:29:13 +0000 (UTC)
Date: Thu, 14 Jan 2021 17:29:11 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] machine: add missing doc for memory-backend option
Message-ID: <20210114162911.GW2986915@angien.pipo.sk>
References: <20210111222729.757402-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210111222729.757402-1-imammedo@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mprivozn@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 17:27:29 -0500, Igor Mammedov wrote:
> Add documentation for '-machine memory-backend' CLI option and
> how to use it.
> 
> PS:
> While at it add a comment to x-use-canonical-path-for-ramblock-id,
> to make sure it won't go away by accident.

This should also be the main point of the patch, without it it's not
very useful to document how it's going to behave.

> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  backends/hostmem.c |  8 ++++++++
>  qemu-options.hx    | 25 ++++++++++++++++++++++++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index 4bde00e8e7..f6f4e818c7 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -497,6 +497,14 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
>          host_memory_backend_get_share, host_memory_backend_set_share);
>      object_class_property_set_description(oc, "share",
>          "Mark the memory as private to QEMU or shared");
> +    /*
> +     * Do not delete/rename option till 4.0 and older machine types exist,

If libvirt is going to use this option, please make the statement
stronger:

This option must be considered stable (as if it didn't have the 'x-'
prefix including deprecation period) as long as 4.0 and older machine
types exists.


> +     * Option will be used by upper layers to override (disable) canonical path
> +     * for ramblock-id set by compat properties on old machine types ( <= 4.0),
> +     * to keep migration working when backend is used for main RAM with
> +     * -machine memory-backend= option (main RAM historically used prefix-less
> +     * ramblock-id).
> +     */
>      object_class_property_add_bool(oc, "x-use-canonical-path-for-ramblock-id",
>          host_memory_backend_get_use_canonical_path,
>          host_memory_backend_set_use_canonical_path);
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 459c916d3d..c02628bd26 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -35,7 +35,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>      "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
>      "                nvdimm=on|off controls NVDIMM support (default=off)\n"
>      "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
> -    "                hmat=on|off controls ACPI HMAT support (default=off)\n",
> +    "                hmat=on|off controls ACPI HMAT support (default=off)\n"
> +    "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n",
>      QEMU_ARCH_ALL)
>  SRST
>  ``-machine [type=]name[,prop=value[,...]]``
> @@ -96,6 +97,28 @@ SRST
>      ``hmat=on|off``
>          Enables or disables ACPI Heterogeneous Memory Attribute Table
>          (HMAT) support. The default is off.
> +
> +     ``memory-backend='id'``
> +        An alternative to legacy ``-mem-path`` and ``mem-prealloc`` options.
> +        Allows to use a memory backend as main RAM.
> +
> +        For example:
> +        ::
> +        -object memory-backend-file,id=pc.ram,size=512M,mem-path=/hugetlbfs,prealloc=on,share=on
> +        -machine memory-backend=pc.ram
> +        -m 512M
> +
> +        Migration compatibility note:
> +        a) as backend id one shall use value of 'default-ram-id', advertised by
> +        machine type (available via ``query-machines`` QMP command)
> +        b) for machine types 4.0 and older, user shall
> +        use ``x-use-canonical-path-for-ramblock-id=on`` backend option,

And also document here that this option is considered stable despite the
'x-' prefix.

The current wording doesn't entirely inspire confidence that it will be
considered as if it were stable.


