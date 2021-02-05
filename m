Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0929310863
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 10:53:08 +0100 (CET)
Received: from localhost ([::1]:59686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7xnX-0002oL-Bl
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 04:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7xm0-00028B-V2
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:51:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7xlx-0005nT-Ib
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612518687;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HujoU68ji4uC2M2iAWh64Jp4xvdz7bYBwRDosH5zmtI=;
 b=LUU+h1oRkjU1S6SlXc5p7cp0qLHFF74t5rmMAB/OmJpq8TgNgbKC4hSSCJdfc1ziqmbfc9
 BFhh2N2PDs/C7aC85DgO3jizu+D6iief15uoR1hvi+X4vNJDc/333ivTr9JNed8W3ZFSNV
 H1DtgmEF4BI01euuAPlG5pe3XCO0ekU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-hxBoSVAWOKiakQ-p4IKwFA-1; Fri, 05 Feb 2021 04:51:24 -0500
X-MC-Unique: hxBoSVAWOKiakQ-p4IKwFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D3CA801978;
 Fri,  5 Feb 2021 09:51:22 +0000 (UTC)
Received: from redhat.com (ovpn-114-212.ams2.redhat.com [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBDE810016FA;
 Fri,  5 Feb 2021 09:51:18 +0000 (UTC)
Date: Fri, 5 Feb 2021 09:51:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v3 2/2] sev: update sev-inject-launch-secret to make gpa
 optional
Message-ID: <20210205095115.GB908621@redhat.com>
References: <20210204193939.16617-1-jejb@linux.ibm.com>
 <20210204193939.16617-3-jejb@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210204193939.16617-3-jejb@linux.ibm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, jon.grimm@amd.com, tobin@ibm.com, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, frankeh@us.ibm.com,
 Dov.Murik1@il.ibm.com, pbonzini@redhat.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 11:39:39AM -0800, James Bottomley wrote:
> If the gpa isn't specified, it's value is extracted from the OVMF
> properties table located below the reset vector (and if this doesn't
> exist, an error is returned).  OVMF has defined the GUID for the SEV
> secret area as 4c2eb361-7d9b-4cc3-8081-127c90d3d294 and the format of
> the <data> is: <base>|<size> where both are uint32_t.  We extract
> <base> and use it as the gpa for the injection.
> 
> Note: it is expected that the injected secret will also be GUID
> described but since qemu can't interpret it, the format is left
> undefined here.
> 
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> 
> ---
> 
> v2: fix line length warning, add more comments about sev area
> v2: remove misleading comment
> ---
>  qapi/misc-target.json |  2 +-
>  target/i386/monitor.c | 23 ++++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 06ef8757f0..0c7491cd82 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -216,7 +216,7 @@
>  #
>  ##
>  { 'command': 'sev-inject-launch-secret',
> -  'data': { 'packet-header': 'str', 'secret': 'str', 'gpa': 'uint64' },
> +  'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
>    'if': 'defined(TARGET_I386)' }
>  
>  ##
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 1bc91442b1..5994408bee 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -34,6 +34,7 @@
>  #include "sev_i386.h"
>  #include "qapi/qapi-commands-misc-target.h"
>  #include "qapi/qapi-commands-misc.h"
> +#include "hw/i386/pc.h"
>  
>  /* Perform linear address sign extension */
>  static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
> @@ -730,9 +731,29 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
>      return sev_get_capabilities(errp);
>  }
>  
> +#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
> +struct sev_secret_area {
> +    uint32_t base;
> +    uint32_t size;
> +};
> +
>  void qmp_sev_inject_launch_secret(const char *packet_hdr,
> -                                  const char *secret, uint64_t gpa,
> +                                  const char *secret,
> +                                  bool has_gpa, uint64_t gpa,
>                                    Error **errp)
>  {
> +    if (!has_gpa) {
> +        uint8_t *data;
> +        struct sev_secret_area *area;
> +
> +        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
> +            error_setg(errp, "SEV: no secret area found in OVMF,"
> +                       " gpa must be specified.");
> +            return;
> +        }

IIUC, historically QEMU has gone out of its way to avoid creating a
direct dependancy on specific firmware implementation details such
as this, so this whole approach makes me feel really uneasy.

We have the fw_cfg interface which lets QEMU put well known data items
at specific places in memory, which the firmware can then access and
do sometime with.   That all happens at startup though before CPUs
are running, so this situation at runtime is more complex.

None the less I still wonder if we can take a better approach such that
the firmware explicitly tells us this location to use, rather than QEMU
parsing data tables to reverse engineer it.


> +        area = (struct sev_secret_area *)data;
> +        gpa = area->base;
> +    }
> +
>      sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
>  }
> -- 
> 2.26.2
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


