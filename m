Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59650297723
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 20:38:29 +0200 (CEST)
Received: from localhost ([::1]:49598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kW1xM-0001Sz-BF
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 14:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kW1t5-0006iU-D8
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 14:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kW1t0-000143-1L
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 14:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603478036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kumoEuWRBPzRWCvUkMOw8ybS10+CYQtH8g1O1Bupe80=;
 b=Fzc+eauHpz/H9Pm9bVYJ5JGOz02guWFnhd825FflLPFu84lW+YCoznbOgHghkttRwX2Rxs
 JpsRWIzP6kNsxWlzq0ZIHXWdSSp4m0fVWOqzfrCyH+CvElwF9vTe/zVd5cMnBRUmEHruPI
 l9s5PdleViWZjnO7DXefOBlTNxYnPmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-U6n-wkpsOl6kHmLgXQn5hQ-1; Fri, 23 Oct 2020 14:33:53 -0400
X-MC-Unique: U6n-wkpsOl6kHmLgXQn5hQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0CCE1084D97;
 Fri, 23 Oct 2020 18:33:47 +0000 (UTC)
Received: from localhost (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEC685D9CC;
 Fri, 23 Oct 2020 18:33:45 +0000 (UTC)
Date: Fri, 23 Oct 2020 20:33:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 16/24] virt: Register "its" as class property
Message-ID: <20201023203343.14b465c8@redhat.com>
In-Reply-To: <20200921221045.699690-17-ehabkost@redhat.com>
References: <20200921221045.699690-1-ehabkost@redhat.com>
 <20200921221045.699690-17-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, 21 Sep 2020 18:10:37 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
> 
> Note: "its" is currently registered conditionally, but this makes
> the feature be registered unconditionally.  The only side effect
> is that it will be now possible to set its=on on virt-2.7 and
> older.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/virt.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d1ab660fa60..986b75a6b89 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2484,6 +2484,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set on/off to enable/disable emulating a "
>                                            "guest CPU which implements the ARM "
>                                            "Memory Tagging Extension");
> +
> +    object_class_property_add_bool(oc, "its", virt_get_its,
> +                                   virt_set_its);
> +    object_class_property_set_description(oc, "its",
> +                                          "Set on/off to enable/disable "
> +                                          "ITS instantiation");
> +
>  }
>  
>  static void virt_instance_init(Object *obj)
> @@ -2511,11 +2518,6 @@ static void virt_instance_init(Object *obj)
>      } else {
>          /* Default allows ITS instantiation */
>          vms->its = true;
> -        object_property_add_bool(obj, "its", virt_get_its,
> -                                 virt_set_its);
> -        object_property_set_description(obj, "its",
> -                                        "Set on/off to enable/disable "
> -                                        "ITS instantiation");
>      }
>  
>      /* Default disallows iommu instantiation */


