Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A9E2976D3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 20:22:25 +0200 (CEST)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kW1ho-0006ho-Dx
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 14:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kW1fF-0005Eq-7g
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 14:19:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kW1fD-0007dx-KE
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 14:19:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603477182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bv0VtzVGrXYb0S6ETwgSojAUj2F7tCGWZw5F6cc2Pw=;
 b=gZB57z4EIwXwAISo1ZDcUimu+eZFKG1ZHmmSdka8PFyxdYkyDwrnctskgNuqrjlPTu/+OC
 hoiqWNVQc/MAZxGL9ZG7b6yNdhUxsyyMEk6zuVSClk8lTSJzgimpfIEnKKjuMbXLLw2Vwa
 83wtkjHmTJbKWRp8m+9vrUaRu0OkQOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-0oKgq6wENW-UZiUS5ZzwdA-1; Fri, 23 Oct 2020 14:19:39 -0400
X-MC-Unique: 0oKgq6wENW-UZiUS5ZzwdA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA97F1018F64;
 Fri, 23 Oct 2020 18:19:37 +0000 (UTC)
Received: from localhost (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A655A5D9CC;
 Fri, 23 Oct 2020 18:19:35 +0000 (UTC)
Date: Fri, 23 Oct 2020 20:19:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 08/24] vexpress-a15: Register "virtualization" as class
 property
Message-ID: <20201023201934.4ab6a0e6@redhat.com>
In-Reply-To: <20200921221045.699690-9-ehabkost@redhat.com>
References: <20200921221045.699690-1-ehabkost@redhat.com>
 <20200921221045.699690-9-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Sep 2020 18:10:29 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/vexpress.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index 0cc35749d7d..13339302af5 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -769,12 +769,6 @@ static void vexpress_a15_instance_init(Object *obj)
>       * but can also be specifically set to on or off.
>       */
>      vms->virt = true;
> -    object_property_add_bool(obj, "virtualization", vexpress_get_virt,
> -                             vexpress_set_virt);
> -    object_property_set_description(obj, "virtualization",
> -                                    "Set on/off to enable/disable the ARM "
> -                                    "Virtualization Extensions "
> -                                    "(defaults to same as 'secure')");
>  }
>  
>  static void vexpress_a9_instance_init(Object *obj)
> @@ -822,6 +816,14 @@ static void vexpress_a15_class_init(ObjectClass *oc, void *data)
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>  
>      vmc->daughterboard = &a15_daughterboard;
> +
> +    object_class_property_add_bool(oc, "virtualization", vexpress_get_virt,
> +                                   vexpress_set_virt);
> +    object_class_property_set_description(oc, "virtualization",
> +                                          "Set on/off to enable/disable the ARM "
> +                                          "Virtualization Extensions "
> +                                          "(defaults to same as 'secure')");
> +
>  }
>  
>  static const TypeInfo vexpress_info = {


