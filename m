Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B0635AAEF
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 06:54:15 +0200 (CEST)
Received: from localhost ([::1]:36358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV5dO-0002oO-7G
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 00:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lV5cf-0002Pg-8p
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 00:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lV5cd-0004Un-8h
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 00:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618030406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JXvsnzl5elCW3wpiWMP26qqX9QPSXaBSTlbD2NcboFQ=;
 b=Bq1wNCfj0BNOH4wpcuFhYr0p43vIzX2sCKd0zuWqCtuaRlEmBVxCtfJfy8SJNBOZA8oDDe
 m/RgrZmHMvMgtLrYVxKPhNj+D0KZIm7R67RxY951e4+5Ty3tGAe3HECESL7rVhfoAr2Zf0
 PVsMcfcQbNsm/rCmixq6quLV+JuD9mM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-qyMUW30bMjOjzdbQMtI7aQ-1; Sat, 10 Apr 2021 00:53:24 -0400
X-MC-Unique: qyMUW30bMjOjzdbQMtI7aQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 031D9802B5B;
 Sat, 10 Apr 2021 04:53:23 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 123ED5B4BF;
 Sat, 10 Apr 2021 04:53:20 +0000 (UTC)
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20210409160339.500167-1-groug@kaod.org>
 <20210409160339.500167-3-groug@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] cpu/core: Fix "help" of CPU core device types
Message-ID: <c1646fdf-29cd-c58a-c65d-d06b65fe50d0@redhat.com>
Date: Sat, 10 Apr 2021 06:53:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210409160339.500167-3-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/04/2021 18.03, Greg Kurz wrote:
> Calling qdev_get_machine() from a QOM instance_init function is
> fragile because we can't be sure the machine object actually
> exists. And this happens to break when passing ",help" on the
> command line to get the list of properties for a CPU core
> device types :
> 
> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> qemu-system-ppc64: ../../hw/core/machine.c:1290:
>   qdev_get_machine: Assertion `machine != NULL' failed.
> Aborted (core dumped)
> 
> This used to work before QEMU 5.0, but commit 3df261b6676b
> unwillingly introduced a subtle regression : the above command
> line needs to create an instance but the instance_init function
> of the base class calls qdev_get_machine() before
> qemu_create_machine() has been called, which is a programming bug.
> 
> Use current_machine instead. It is okay to skip the setting of
> nr_thread in this case since only its type is displayed.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Fixes: 3df261b6676b ("softmmu/vl.c: Handle '-cpu help' and '-device help' before 'no default machine'")
> Cc: peter.maydell@linaro.org
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   hw/cpu/core.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/cpu/core.c b/hw/cpu/core.c
> index 92d3b2fbad62..987607515574 100644
> --- a/hw/cpu/core.c
> +++ b/hw/cpu/core.c
> @@ -66,10 +66,16 @@ static void core_prop_set_nr_threads(Object *obj, Visitor *v, const char *name,
>   
>   static void cpu_core_instance_init(Object *obj)
>   {
> -    MachineState *ms = MACHINE(qdev_get_machine());
>       CPUCore *core = CPU_CORE(obj);
>   
> -    core->nr_threads = ms->smp.threads;
> +    /*
> +     * Only '-device something-cpu-core,help' can get us there before
> +     * the machine has been created. We don't care to set nr_threads
> +     * in this case since it isn't used afterwards.
> +     */
> +    if (current_machine) {
> +        core->nr_threads = current_machine->smp.threads;
> +    }
>   }

Ack for QEMU 6.0 to get rid of the crash. But note that using 
current_machine might also be wrong in some cases. It's e.g. possible that 
the user started QEMU with a different machine type (e.g. -M g3beige) and 
then uses some QOM commands to introspect the available devices - in that 
case, this instance_init function will be executed with current_machine 
pointing to a G3 Mac - which is certainly also not what we want here. It 
likely does not crash, but still ... using current_machine or 
qdev_get_machine() in an instance_init() function is just wrong. This 
nr_thread stuff should likely be done in the realize function instead.

  Thomas



