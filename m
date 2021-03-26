Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FC34A446
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 10:29:42 +0100 (CET)
Received: from localhost ([::1]:40314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPimj-0001FX-AP
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 05:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPikQ-00080I-K7
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPikO-0002wa-QY
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616750835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e8t2iYkiXXmY7OnG3w5pEugsIdsJyEuw+n/LI4Taouo=;
 b=hAbit58P95ky17s4nyJMKG0k/QpBTOmOtu0v/bDtRdeCJouH4mIxZTU6IdyNjDybG5+RC4
 0fs72hHKMGLRyE8Kl0SFqffYeHz466kqsd0QCAkfxcwfGqgOooyaqS2ooTfCFHIaOmVDXQ
 78fVXjRHZ+lbCQ8LHgs2tPgjuDC3iYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-Qv6e_CGxOr2vDHu8vTkVYg-1; Fri, 26 Mar 2021 05:27:07 -0400
X-MC-Unique: Qv6e_CGxOr2vDHu8vTkVYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90ACD10621A3;
 Fri, 26 Mar 2021 09:27:05 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4BDE6A8F0;
 Fri, 26 Mar 2021 09:27:02 +0000 (UTC)
Subject: Re: [PATCH for-6.0 1/4] include/hw/boards.h: Document
 machine_class_allow_dynamic_sysbus_dev()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210325153310.9131-1-peter.maydell@linaro.org>
 <20210325153310.9131-2-peter.maydell@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <af25a32c-6bff-c44c-ff9c-65721d5e9e54@redhat.com>
Date: Fri, 26 Mar 2021 10:27:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210325153310.9131-2-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 3/25/21 4:33 PM, Peter Maydell wrote:
> The function machine_class_allow_dynamic_sysbus_dev() is currently
> undocumented; add a doc comment.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/boards.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 4a90549ad85..27106abc11d 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -36,7 +36,21 @@ void machine_set_cpu_numa_node(MachineState *machine,
>                                 const CpuInstanceProperties *props,
>                                 Error **errp);
>  
> +/**
> + * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
nit: s/of valid devices/of dynamically instantiable sysbus devices ?
> + * @mc: Machine class
> + * @type: type to whitelist (should be a subtype of TYPE_SYS_BUS_DEVICE)
> + *
> + * Add the QOM type @type to the list of devices of which are subtypes
> + * of TYPE_SYS_BUS_DEVICE but which are still permitted to be dynamically
> + * created (eg by the user on the command line with -device).
> + * By default if the user tries to create any devices on the command line
> + * that are subtypes of TYPE_SYS_BUS_DEVICE they will get an error message;
> + * for the special cases which are permitted for this machine model, the
> + * machine model class init code must call this function to whitelist them.
> + */
>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
> +
>  /*
>   * Checks that backend isn't used, preps it for exclusive usage and
>   * returns migratable MemoryRegion provided by backend.
> 
Besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


