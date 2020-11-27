Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1F12C6373
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 11:53:03 +0100 (CET)
Received: from localhost ([::1]:60082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kibN8-0001BB-Nu
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 05:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kibLR-0007w6-7B
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:51:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kibLN-00028N-UO
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606474272;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=31GD9iqeeqEWKSyd14ufvGRN0byVDsCe1gnwsnTuiCY=;
 b=iMNSSh7Zr459PCERsorVMddxztHxMRm1q2GpLtrGqC24ud0dDeVkSmhEOYK9NemtSZqKPC
 Rxs1TXuLpUNrfDtugU8gNCpbJOXJJKtcFwCw4OlG9cwkD0EREIA7TptO+Mvy1UqQzJe6Na
 9VGanzvHxi4EmuL3LE2VEziqg328Ndo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-xs_EpbXZOCyLFLT-FZDIrw-1; Fri, 27 Nov 2020 05:51:08 -0500
X-MC-Unique: xs_EpbXZOCyLFLT-FZDIrw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 845AA185E4A0;
 Fri, 27 Nov 2020 10:51:07 +0000 (UTC)
Received: from redhat.com (ovpn-113-125.ams2.redhat.com [10.36.113.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0568960636;
 Fri, 27 Nov 2020 10:51:02 +0000 (UTC)
Date: Fri, 27 Nov 2020 10:50:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH for-6.0 6/6] qapi: Deprecate 'query-kvm'
Message-ID: <20201127105059.GC1596141@redhat.com>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-7-r.bolshakov@yadro.com>
MIME-Version: 1.0
In-Reply-To: <20201116131011.26607-7-r.bolshakov@yadro.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copying libvir-list for the deprecation warning.


On Mon, Nov 16, 2020 at 04:10:11PM +0300, Roman Bolshakov wrote:
> 'query-accel' QMP command should be used instead.
> 
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  qapi/machine.json | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

docs/system/deprecated.rst needs to be updated for any deprecation
to be visible to consumers of QEMU.


> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 5648d8d24d..130b0dbebc 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -579,6 +579,9 @@
>  #
>  # Returns information about KVM acceleration
>  #
> +# Features:
> +# @deprecated: This command is deprecated, use 'query-accel' instead.
> +#
>  # Returns: @AccelInfo
>  #
>  # Since: 0.14.0
> @@ -589,7 +592,8 @@
>  # <- { "return": { "enabled": true, "present": true } }
>  #
>  ##
> -{ 'command': 'query-kvm', 'returns': 'AccelInfo' }
> +{ 'command': 'query-kvm', 'returns': 'AccelInfo',
> +  'features': [ 'deprecated' ] }
>  
>  ##
>  # @query-accel:
> -- 
> 2.29.2
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


