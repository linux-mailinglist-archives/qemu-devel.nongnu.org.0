Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B8273B36
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 08:51:48 +0200 (CEST)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKc9T-00079X-LI
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 02:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kKc6W-0004xW-2u
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 02:48:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kKc6T-00034r-Gw
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 02:48:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600757320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OxTdqA6OSrPn5QCnzEGgD7GexcPXsJ3Qzsa8fr/GmMg=;
 b=EWdtITIW3XNRqEFXp6KeNo7kd1Ku3/epzssmTKrtFRHi8ffuauWeR47xwVJoIwtm0SmW9R
 cspXtsPiXLHkHfofRPqy1tiLbH/HcjZxxoJoaSDykwRK/o3+WvF8BILLgIzAOW6F4Zq6oV
 4Sp07HgbFqRbFt5MXdZffuP4J5lWBnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-rf63SeoSNZi3uLvLzoIhHw-1; Tue, 22 Sep 2020 02:48:39 -0400
X-MC-Unique: rf63SeoSNZi3uLvLzoIhHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25D231084C9A
 for <qemu-devel@nongnu.org>; Tue, 22 Sep 2020 06:48:38 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04A2918EDE;
 Tue, 22 Sep 2020 06:48:36 +0000 (UTC)
Date: Tue, 22 Sep 2020 08:48:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 17/24] cpu/core: Register core-id and nr-threads as
 class properties
Message-ID: <20200922084836.1e876578@redhat.com>
In-Reply-To: <20200921221045.699690-18-ehabkost@redhat.com>
References: <20200921221045.699690-1-ehabkost@redhat.com>
 <20200921221045.699690-18-ehabkost@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Sep 2020 18:10:38 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Cc: qemu-devel@nongnu.org
> ---
>  hw/cpu/core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/cpu/core.c b/hw/cpu/core.c
> index 3a659291eae..92d3b2fbad6 100644
> --- a/hw/cpu/core.c
> +++ b/hw/cpu/core.c
> @@ -69,10 +69,6 @@ static void cpu_core_instance_init(Object *obj)
>      MachineState *ms = MACHINE(qdev_get_machine());
>      CPUCore *core = CPU_CORE(obj);
>  
> -    object_property_add(obj, "core-id", "int", core_prop_get_core_id,
> -                        core_prop_set_core_id, NULL, NULL);
> -    object_property_add(obj, "nr-threads", "int", core_prop_get_nr_threads,
> -                        core_prop_set_nr_threads, NULL, NULL);
>      core->nr_threads = ms->smp.threads;
>  }
>  
> @@ -81,6 +77,10 @@ static void cpu_core_class_init(ObjectClass *oc, void *data)
>      DeviceClass *dc = DEVICE_CLASS(oc);
>  
>      set_bit(DEVICE_CATEGORY_CPU, dc->categories);
> +    object_class_property_add(oc, "core-id", "int", core_prop_get_core_id,
> +                              core_prop_set_core_id, NULL, NULL);
> +    object_class_property_add(oc, "nr-threads", "int", core_prop_get_nr_threads,
> +                              core_prop_set_nr_threads, NULL, NULL);
>  }
>  
>  static const TypeInfo cpu_core_type_info = {


