Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D333710B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:19:46 +0100 (CET)
Received: from localhost ([::1]:59112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJM1-0007de-7l
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJKq-00074F-By
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJKo-0000RS-IW
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615461509;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wp2u4EKuxm0r7B3PpdKahyDCMcQnajG6uYH6rn97r+I=;
 b=F3UVnJ8+ByBprLztImvNjtICNWqBFkD6mjm0lmOc+hkyjg7cy79u2eOuc0SQcb5ynTcW5a
 9QUMigh+MOCroIWwpo5zGBHAiVFrnZjsLrp2z25DIj7LiDvIex+y5GNPIQX2cMoTUExDhg
 4xJtb/kyjlG75+Ty9zybP1ymRMK0Kmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-9FC04jJYP9G4xS6VJERgIw-1; Thu, 11 Mar 2021 06:18:25 -0500
X-MC-Unique: 9FC04jJYP9G4xS6VJERgIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2A41192D78D;
 Thu, 11 Mar 2021 11:18:23 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B0565D9DB;
 Thu, 11 Mar 2021 11:18:17 +0000 (UTC)
Date: Thu, 11 Mar 2021 11:18:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH v5 3/3] qmp: add new qmp display-reload
Message-ID: <YEn8d+9v52q+2NLF@redhat.com>
References: <20210311105424.1370-1-changzihao1@huawei.com>
 <20210311105424.1370-4-changzihao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210311105424.1370-4-changzihao1@huawei.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: oscar.zhangbo@huawei.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 armbru@redhat.com, yebiaoxiang@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 06:54:24PM +0800, Zihao Chang wrote:
> This patch provides a new qmp to reload display configuration
> without restart VM, but only reloading the vnc tls certificates
> is implemented.
> Example:
> {"execute": "display-reload", "arguments":{"vnc-tls-certs": true}}
> 
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> ---
>  monitor/qmp-cmds.c | 13 +++++++++++++
>  qapi/ui.json       | 19 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index c7df8c0ee268..0f791f974f30 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -334,3 +334,16 @@ MemoryInfo *qmp_query_memory_size_summary(Error **errp)
>  
>      return mem_info;
>  }
> +
> +void qmp_display_reload(bool has_vnc_tls_certs, bool vnc_tls_certs,
> +                        Error **errp)
> +{
> +    Error *local_err = NULL;
> +
> +    if (has_vnc_tls_certs && vnc_tls_certs) {
> +        if (!vnc_display_reload_certs(NULL, &local_err)) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +    }
> +}
> diff --git a/qapi/ui.json b/qapi/ui.json
> index d08d72b43923..97b38aa1666e 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1179,3 +1179,22 @@
>  ##
>  { 'command': 'query-display-options',
>    'returns': 'DisplayOptions' }
> +
> +##
> +# @display-reload:
> +#
> +# Reload display configuration
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.0
> +#
> +# Example:
> +#
> +# -> { "execute": "display-reload",
> +#      "arguments": { "vnc-tls-certs": true } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'display-reload',
> +  'data': { '*vnc-tls-certs': 'bool' } }

I think best practice would be to make this a  discriminated union
Something like this:

   { 'enum': 'DisplayReloadType',
     'data': ['vnc'] }

   { 'struct': 'DisplayReloadOptionsVNC',
     'data': { '*tls-certs': 'bool' } }

   { 'union': 'DisplayReloadOptions',
     'base': {'type': 'DisplayReloadType'},
     'discriminator': 'type',
     'data': { 'vnc': 'DisplayReloadOptionsVNC' }}

   { 'command': 'display-reload',
     'data': 'DisplayReloadOptions' }


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


