Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDD43C4670
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 12:12:14 +0200 (CEST)
Received: from localhost ([::1]:47512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2sv7-0006fL-Nc
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 06:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2suB-0005vb-EL
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 06:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2su5-0005Wt-FU
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 06:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626084668;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jHURF0O8iapO6swEZhZE4I1ULv7gi40VAZ5TRiGm1jQ=;
 b=PPlutC3V4siJDn8ZCxlpQ7S2VjdhP7hVjSMYugbJ2PykHYp0PlzfbeM2iBpTt4arvTJryK
 FCJiNd0FrAr4q4w4Al3Oy7pAjU+fqNcT/zcNOWzdDZ7FlsHBlekOtt+Wq9grCjef6qliel
 c2iM4OYVW6vgy3Jwd9XAWO/5/NZGhYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-Q6TGs8JNOEO-lOiw63bU_Q-1; Mon, 12 Jul 2021 06:11:03 -0400
X-MC-Unique: Q6TGs8JNOEO-lOiw63bU_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AC9391272;
 Mon, 12 Jul 2021 10:11:02 +0000 (UTC)
Received: from redhat.com (ovpn-114-105.ams2.redhat.com [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AE1E1971B;
 Mon, 12 Jul 2021 10:11:00 +0000 (UTC)
Date: Mon, 12 Jul 2021 11:10:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 2/4] qemu-options: re-arrange CPU topology options
Message-ID: <YOwVMUkX948MrNxC@redhat.com>
References: <20210628113047.462498-1-berrange@redhat.com>
 <20210628113047.462498-3-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210628113047.462498-3-berrange@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Richard Henderson <richard.henderson@linaro.org>,
 "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 12:30:45PM +0100, Daniel P. Berrangé wrote:
> The list of CPU topology options are presented in a fairly arbitrary
> order currently. Re-arrange them so that they're ordered from largest to
> smallest unit
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  qemu-options.hx | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ba3ca9da1d..aa33dfdcfd 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -196,17 +196,17 @@ SRST
>  ERST
>  
>  DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> -    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
> +    "-smp [cpus=]n[,maxcpus=cpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
>      "                set the number of CPUs to 'n' [default=1]\n"
>      "                maxcpus= maximum number of total cpus, including\n"
>      "                offline CPUs for hotplug, etc\n"
> +    "                sockets= number of discrete sockets in the system\n",
> +    "                dies= number of CPU dies on one socket (for PC only)\n"
>      "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
>      "                threads= number of threads on one CPU core\n"
> -    "                dies= number of CPU dies on one socket (for PC only)\n"
> -    "                sockets= number of discrete sockets in the system\n",
>          QEMU_ARCH_ALL)

Stupid typo in this posting - didn't adjust the trailing ',' when moving
the lines.

>  SRST
> -``-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
> +``-smp [cpus=]n[,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
>      Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
>      are supported. On Sparc32 target, Linux limits the number of usable
>      CPUs to 4. For the PC target, the number of cores per die, the
> -- 
> 2.31.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


