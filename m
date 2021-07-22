Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D283D273B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 18:05:52 +0200 (CEST)
Received: from localhost ([::1]:47802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6bCp-0005eQ-8D
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 12:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6b9V-0001c5-1b
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:02:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6b9Q-0003Q3-Tt
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626969738;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2kdi5BtBWDgBhEB0P1JPsuRUhxhJFKhIqPim1vrOvo=;
 b=dzZsL+xh0CHjvxwDaI+hV4FIN5fFUHX1WrKYQjZFxm4RYKqqVeck1w5kx78nhtlrNx4Q/E
 rPcGIJLpUAbcZZMdHe5qKqMXz7lhbLxDkcBhjxjBNxnC2PBSiATYwK6tL6YA2Nj6GmiF7Z
 aFlv+ojuiD5lFWHBZTX4O6h0Q/nSVqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-akVG-CDjN96Sf3-1E93DVg-1; Thu, 22 Jul 2021 12:02:17 -0400
X-MC-Unique: akVG-CDjN96Sf3-1E93DVg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAABF10AE605;
 Thu, 22 Jul 2021 16:01:24 +0000 (UTC)
Received: from redhat.com (ovpn-114-245.ams2.redhat.com [10.36.114.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4ED919711;
 Thu, 22 Jul 2021 16:01:21 +0000 (UTC)
Date: Thu, 22 Jul 2021 17:01:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.1 v2] machine: Disallow specifying topology
 parameters as zero
Message-ID: <YPmWTutShepWX32R@redhat.com>
References: <20210722154326.1464-1-wangyanan55@huawei.com>
 <20210722154326.1464-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210722154326.1464-2-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 11:43:26PM +0800, Yanan Wang wrote:
> In the SMP configuration, we should either specify a topology
> parameter with a reasonable value (equal to or greater than 1)
> or just leave it omitted and QEMU will calculate its value.
> Configurations which explicitly specify the topology parameters
> as zero like "sockets=0" are meaningless, so disallow them.
> 
> However, the commit 1e63fe685804d
> (machine: pass QAPI struct to mc->smp_parse) has documented that
> '0' has the same semantics as omitting a parameter in the qapi
> comment for SMPConfiguration. So this patch fixes the doc and
> also adds the corresponding sanity check in the smp parsers.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 14 ++++++++++++++
>  qapi/machine.json |  6 +++---
>  qemu-options.hx   | 12 +++++++-----
>  3 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 775add0795..db129d937b 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -829,6 +829,20 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>  
> +    /*
> +     * The topology parameters must be specified equal to or great than one
> +     * or just omitted, explicit configuration like "cpus=0" is not allowed.
> +     */
> +    if ((config->has_cpus && config->cpus == 0) ||
> +        (config->has_sockets && config->sockets == 0) ||
> +        (config->has_dies && config->dies == 0) ||
> +        (config->has_cores && config->cores == 0) ||
> +        (config->has_threads && config->threads == 0) ||
> +        (config->has_maxcpus && config->maxcpus == 0)) {
> +        error_setg(errp, "parameters must be equal to or greater than one if provided");

I'd suggest a slight tweak since when seen it lacks context:

$ ./qemu-system-x86_64 -smp 4,cores=0,sockets=2
qemu-system-x86_64: parameters must be equal to or greater than one if provided


    error_setg(errp, "CPU topology parameters must be equal to or greater than one if provided");



> diff --git a/qemu-options.hx b/qemu-options.hx
> index 99ed5ec5f1..b0168f8c48 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -223,11 +223,13 @@ SRST
>      of computing the CPU maximum count.
>  
>      Either the initial CPU count, or at least one of the topology parameters
> -    must be specified. Values for any omitted parameters will be computed
> -    from those which are given. Historically preference was given to the
> -    coarsest topology parameters when computing missing values (ie sockets
> -    preferred over cores, which were preferred over threads), however, this
> -    behaviour is considered liable to change.
> +    must be specified. The specified parameters must be equal to or great

s/great/greater/

> +    than one, explicit configuration like "cpus=0" is not allowed. Values
> +    for any omitted parameters will be computed from those which are given.
> +    Historically preference was given to the coarsest topology parameters
> +    when computing missing values (ie sockets preferred over cores, which
> +    were preferred over threads), however, this behaviour is considered
> +    liable to change.
>  ERST


If you make the text changes, then feel free to add this when posting v2:

 Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
 Tested-by: Daniel P. Berrangé <berrange@redhat.com>
 


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


