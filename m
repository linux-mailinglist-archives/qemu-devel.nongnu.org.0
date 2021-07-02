Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219143B9F08
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:21:46 +0200 (CEST)
Received: from localhost ([::1]:37484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGIr-00089J-6k
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lzGG9-0002wB-L9
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:18:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lzGG5-00054O-0b
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625221130;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9ZlfNCYgF+RbytB8w65+xmVC1x7N/6a0Zj+aJkMwlrQ=;
 b=L9E32lZk5AHB3HD8Itrydv+PV3dhZ7f/iqeifXVWYJq6UVqXzhkbO1V3a19w2SOFEeaD9I
 GV31RYTn2leYttBOEGNNkL14QUQa746GP3HSn8HDbW+qZjIFaOX4fRw11JkO979f6/ytRy
 UoA/I31Qb4tz6/YhG9cWYO1BsjyIEU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-LeB7_EIZOUmYF7WkEytebw-1; Fri, 02 Jul 2021 06:18:43 -0400
X-MC-Unique: LeB7_EIZOUmYF7WkEytebw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95A03802C89;
 Fri,  2 Jul 2021 10:18:42 +0000 (UTC)
Received: from redhat.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C13D5DA60;
 Fri,  2 Jul 2021 10:18:36 +0000 (UTC)
Date: Fri, 2 Jul 2021 11:18:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH 5/6] pc/machine: Disallow any configuration of dies
 for non-PC machines
Message-ID: <YN7n+avKTj6Lj5bn@redhat.com>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-6-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210702100739.13672-6-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 02, 2021 at 06:07:38PM +0800, Yanan Wang wrote:
> Since a machine type does not support topology parameter of dies,
> it's probably more reasonable to reject any explicit specification
> to avoid possible confuse, including "dies=0" and "dies=1" although
> they won't affect the calculation of non-PC machines.
> 
> Also a comment of struct SMPConfiguration is fixed.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 2 +-
>  qapi/machine.json | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 58882835be..55785feee2 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -747,7 +747,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      unsigned threads = config->has_threads ? config->threads : 0;
>      unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>  
> -    if (config->has_dies && config->dies != 0 && config->dies != 1) {
> +    if (config->has_dies) {
>          error_setg(errp, "dies not supported by this machine's CPU topology");
>      }

This will cause a functional regression. Libvirt always specifies
dies=1 if QEMU supports it.  I don't see a need to reject it,
since conceptually it is reasonable to say that all existing
CPUs have a single die. It simply that 99% of CPUs don't support
more than 1 die.

> diff --git a/qapi/machine.json b/qapi/machine.json
> index c3210ee1fb..253f84abf6 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1297,7 +1297,7 @@
>  #
>  # @dies: number of dies per socket in the CPU topology
>  #
> -# @cores: number of cores per thread in the CPU topology
> +# @cores: number of cores per die in the CPU topology
>  #
>  # @threads: number of threads per core in the CPU topology
>  #

This is a simple docs fix and ok

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


