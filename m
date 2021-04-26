Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A392236B423
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 15:32:09 +0200 (CEST)
Received: from localhost ([::1]:35072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb1LL-0004bg-TN
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 09:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lb1Jq-0003fY-JG
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lb1Jm-00014O-Tp
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619443829;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eK6mS+3OmNvKp3QenHtJPjC74VBA+VG6iJ6K4vJ5o5g=;
 b=ilrg2Lc5L8uJsI3D2slEtQbztBqIZiesFroD641N3yKmTmiSGa9V7lovDufQHC2OB3DIio
 gWdNYHrJsXWwcdjuXnJ675WEgL3lXrEEehj6QXGaOFGIw4H0sG7i0dBoNRnpxZ0Wa42kWf
 uVYsRHMV/KMGzHYmumAqH6xIseMa6l8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-zxIFlPtZOTSW93goUWbWmA-1; Mon, 26 Apr 2021 09:30:21 -0400
X-MC-Unique: zxIFlPtZOTSW93goUWbWmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3564A8189C8;
 Mon, 26 Apr 2021 13:30:20 +0000 (UTC)
Received: from redhat.com (ovpn-113-42.ams2.redhat.com [10.36.113.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93C5B687D8;
 Mon, 26 Apr 2021 13:30:13 +0000 (UTC)
Date: Mon, 26 Apr 2021 14:30:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "caodongli@kingsoft.com" <caodongli@kingsoft.com>
Subject: Re: [PATCH v2] hw/i386: Expand the range of CPU topologies between
 smp and maxcpus
Message-ID: <YIbAYqpWBG5k8yp5@redhat.com>
References: <2021042610084739495617@kingsoft.com>
MIME-Version: 1.0
In-Reply-To: <2021042610084739495617@kingsoft.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: ehabkost <ehabkost@redhat.com>, "like.xu" <like.xu@linux.intel.com>,
 mst <mst@redhat.com>, "richard.henderson" <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 pbonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 26, 2021 at 10:08:52AM +0800, caodongli@kingsoft.com wrote:
> Change the criteria for the initial CPU topology and maxcpus, user can
> have more settings

Can you provide a better explanation of why this is needed. What
valid usage scenario is blocked by the current check ?

AFAICT, it partially reverts an intentional change done in several
years ago in :


  commit bc1fb850a31468ac4976f3895f01a6d981e06d0a
  Author: Igor Mammedov <imammedo@redhat.com>
  Date:   Thu Sep 13 13:06:01 2018 +0200

    vl.c deprecate incorrect CPUs topology
    
    -smp [cpus],sockets/cores/threads[,maxcpus] should describe topology
    so that total number of logical CPUs [sockets * cores * threads]
    would be equal to [maxcpus], however historically we didn't have
    such check in QEMU and it is possible to start VM with an invalid
    topology.
    Deprecate invalid options combination so we can make sure that
    the topology VM started with is always correct in the future.
    Users with an invalid sockets/cores/threads/maxcpus values should
    fix their CLI to make sure that
       [sockets * cores * threads] == [maxcpus]



> 
> Signed-off-by: Dongli Cao <caodongli@kingsoft.com>
> ---
> hw/i386/pc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8a84b25..ef2e819 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -751,7 +751,7 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
>              exit(1);
>          }
> 
> -        if (sockets * dies * cores * threads != ms->smp.max_cpus) {
> +        if (sockets * dies * cores * threads > ms->smp.max_cpus) {
>              error_report("Invalid CPU topology deprecated: "
>                           "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
>                           "!= maxcpus (%u)",

This is 

> --
> 1.8.3.1
> 
> 
> 
> 
> 
> 
> 
> 
> 
> caodongli@kingsoft.com
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


