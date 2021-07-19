Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC9E3CE656
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:48:02 +0200 (CEST)
Received: from localhost ([::1]:44380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5WQz-00012E-4K
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5WPV-0008Tv-6j
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:46:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5WPR-0001WW-Ge
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626713184;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SGjEHHGPGK+T8qu3HSJVSSd/mlfWqFWBjri8o4U6Dto=;
 b=FmEutEqqEvsBNYqvBJC9rA1wCLlHzgzixcQiUp7PzzLfL6A+DCocZhGiVQD8YEvuQTtami
 oKtT8+2Gbq+zcLkxTqFP8qZ7sx5wF9W7zgQo/GNqPzlvxdJfoDP9uH9KCVG1vdSOw63JdH
 YtWL7PraLfShLsD2KaQDrifw4nlsFQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-PeEk5sxVPzKm7quO4eSDog-1; Mon, 19 Jul 2021 12:46:23 -0400
X-MC-Unique: PeEk5sxVPzKm7quO4eSDog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2FFF107B263;
 Mon, 19 Jul 2021 16:46:21 +0000 (UTC)
Received: from redhat.com (ovpn-112-193.ams2.redhat.com [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C9165D9F0;
 Mon, 19 Jul 2021 16:46:10 +0000 (UTC)
Date: Mon, 19 Jul 2021 17:46:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 01/11] machine: Disallow specifying topology
 parameters as zero
Message-ID: <YPWsThPiZa3mF+zp@redhat.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210719032043.25416-2-wangyanan55@huawei.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 11:20:33AM +0800, Yanan Wang wrote:
> In the SMP configuration, we should either specify a topology
> parameter with a reasonable value (equal to or greater than 1)
> or just leave it omitted and QEMU will calculate its value.
> 
> Configurations which explicitly specify the topology parameters
> as zero like "sockets=0" are meaningless, so disallow them.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 31 +++++++++++++++++++++++--------
>  hw/i386/pc.c      | 29 +++++++++++++++++++++--------
>  qapi/machine.json |  4 ++--
>  3 files changed, 46 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 775add0795..d73daa10f4 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -745,11 +745,25 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>  {
>      unsigned cpus    = config->has_cpus ? config->cpus : 0;
>      unsigned sockets = config->has_sockets ? config->sockets : 0;
> +    unsigned dies    = config->has_dies ? config->dies : 1;

It looks odd to set dies=1 by default at initially, when everything
else is set to 0.  I realize you're just copying existing pc_smp_parse
code in this respect, but I feel like could benefit from a separate
initialization with a comment to explain why we're hardcoding it
to 1....

>      unsigned cores   = config->has_cores ? config->cores : 0;
>      unsigned threads = config->has_threads ? config->threads : 0;
> +    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
> +
> +    if ((config->has_cpus && config->cpus == 0) ||
> +        (config->has_sockets && config->sockets == 0) ||
> +        (config->has_dies && config->dies == 0) ||
> +        (config->has_cores && config->cores == 0) ||
> +        (config->has_threads && config->threads == 0) ||
> +        (config->has_maxcpus && config->maxcpus == 0)) {
> +        error_setg(errp, "parameters must be equal to or greater than one"
> +                   "if provided");
> +        return;
> +    }
>  
> -    if (config->has_dies && config->dies != 0 && config->dies != 1) {
> +    if (dies > 1) {
>          error_setg(errp, "dies not supported by this machine's CPU topology");
> +        return;
>      }

.... eg how about here adding

     /* Never try to assign multiple dies when defaulting omitted topology */
     if (dies == 0) {
         dies = 1;
     }



> diff --git a/qapi/machine.json b/qapi/machine.json
> index c3210ee1fb..c11b2e6f73 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1288,8 +1288,8 @@
>  ##
>  # @SMPConfiguration:
>  #
> -# Schema for CPU topology configuration.  "0" or a missing value lets
> -# QEMU figure out a suitable value based on the ones that are provided.
> +# Schema for CPU topology configuration. A missing value lets QEMU
> +# figure out a suitable value based on the ones that are provided.

Hmm, so we had actually documented that '0' had the same semantics
as omitting a parameter. This was done in:

  commit 1e63fe685804dfadddd643bf3860b1a59702d4bf
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 17 17:53:06 2021 +0200

    machine: pass QAPI struct to mc->smp_parse

which hasn't been released yet.

This was possible, but never documented, with the traditiaonl -smp
impl before it was qapi-ified. I think that historical behaviour
was simply a side effect of the QemuOpts impl rather than an
intentional design, hence not documented.

At the very least I think need to get rid of this bit of docs about
"0" before this release, otherwise we'll have stronger need to
consider a real deprecation process.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


