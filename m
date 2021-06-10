Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CFB3A26F7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:26:25 +0200 (CEST)
Received: from localhost ([::1]:50020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrG1A-00019K-Eq
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lrFo9-0007qQ-PN
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lrFo7-0005Ds-Eu
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623312774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIwVqjduEHoYPmBns0QkHDJV+OUYZ5jyGk7cgbbFVj0=;
 b=FXVpw5DtgPLWiI0e/oZTUE8riAuFTI327u7WSWYaMdtgdljSbS6bdAlWcA3jyaSuDTVx6k
 jME/hVFGQ1kXUKgRWdHXJQyzAza30SA9Oh/wnJgutXQ04xOz4Uiociu46VRypbAA0J0OAU
 /jcYiolfw2KEXpMnjMFRpoo8xpimDBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-UAUZEmjxNzmSA8iuZCO-Jw-1; Thu, 10 Jun 2021 04:12:52 -0400
X-MC-Unique: UAUZEmjxNzmSA8iuZCO-Jw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19A50802938;
 Thu, 10 Jun 2021 08:12:52 +0000 (UTC)
Received: from work-vm (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C899C18F0A;
 Thu, 10 Jun 2021 08:12:50 +0000 (UTC)
Date: Thu, 10 Jun 2021 09:12:48 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 03/11] target/i386/monitor: Return QMP error when SEV is
 disabled in build
Message-ID: <YMHJgPdC1Uk5phmi@work-vm>
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210610064556.1421620-4-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> If the management layer tries to inject a secret, it gets an empty
> response in case the binary built without SEV:
> 
>   { "execute": "sev-inject-launch-secret",
>     "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
>   }
>   {
>       "return": {
>       }
>   }
> 
> Make it clearer by returning an error, mentioning the feature is
> disabled:
> 
>   { "execute": "sev-inject-launch-secret",
>     "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
>   }
>   {
>       "error": {
>           "class": "GenericError",
>           "desc": "this feature or command is not currently supported"
>       }
>   }
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  target/i386/monitor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 119211f0b06..c83cca80dc2 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -28,6 +28,7 @@
>  #include "monitor/hmp-target.h"
>  #include "monitor/hmp.h"
>  #include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qerror.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/sev.h"
>  #include "qapi/error.h"
> @@ -742,6 +743,10 @@ void qmp_sev_inject_launch_secret(const char *packet_hdr,
>                                    bool has_gpa, uint64_t gpa,
>                                    Error **errp)
>  {
> +    if (!sev_enabled()) {
> +        error_setg(errp, QERR_UNSUPPORTED);
> +        return;
> +    }
>      if (!has_gpa) {
>          uint8_t *data;
>          struct sev_secret_area *area;
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


