Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AD841F9F1
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 07:32:00 +0200 (CEST)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWXct-0002KY-NP
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 01:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWXbY-0001Xg-DW
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 01:30:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWXbX-0008PV-04
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 01:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633152634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UhCcaWupU802WW3sEv3HBNqIJfhwc5jucLV4OTXtkEQ=;
 b=FA/zR752F2Nub45YqhtMB5sQ3U4CcDavW2UIHkYkM+ckZkH0qXa4fE3VcV4EvUCosMcs/7
 ETI839QD6/rccjl/ZGENpNKmHqqly9F5FO0FnywrYmGqp8B2TSeN/ZyVinhQ8VTkfnoXkp
 fNFGP285f9xRpoaITkPlSxmKWbZ94ls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-1-usNF8UNhGa5TCwtFNiYw-1; Sat, 02 Oct 2021 01:30:32 -0400
X-MC-Unique: 1-usNF8UNhGa5TCwtFNiYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79CD41084681;
 Sat,  2 Oct 2021 05:30:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F8E960C05;
 Sat,  2 Oct 2021 05:30:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C6D72113865F; Sat,  2 Oct 2021 07:30:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: pbonzini@redhat.com
Subject: Re: [PATCH 1/2] hw/arm/virt: Rename default_bus_bypass_iommu
References: <20210811085842.2511545-1-jean-philippe@linaro.org>
 <87o89nnus1.fsf@dusky.pond.sub.org>
 <87o89m7zai.fsf@dusky.pond.sub.org>
Date: Sat, 02 Oct 2021 07:30:24 +0200
In-Reply-To: <87o89m7zai.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Wed, 25 Aug 2021 09:34:45 +0200")
Message-ID: <87ee94q9hr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Markus Armbruster <armbru@redhat.com> writes:
>
>> Did this series fall through the cracks for 6.1?
>
> Missed 6.1.  What now?

If I understand this correctly, it's a regression in 6.1.  Paolo, please
advise on what should be done.

>> Jean-Philippe Brucker <jean-philippe@linaro.org> writes:
>>
>>> Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
>>> parameter definitions cannot use underscores, because keyval_dashify()
>>> transforms them to dashes and the parser doesn't find the parameter.
>>>
>>> This affects option default_bus_bypass_iommu which was introduced in the
>>> same release:
>>>
>>> $ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
>>> qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found
>>>
>>> Rename the parameter to "default-bus-bypass-iommu". Passing
>>> "default_bus_bypass_iommu" is still valid since the underscore are
>>> transformed automatically.
>>>
>>> Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
>>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>> ---
>>>  hw/arm/virt.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index b4598d3fe6..7075cdc15e 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -2671,10 +2671,10 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>>                                            "Set the IOMMU type. "
>>>                                            "Valid values are none and smmuv3");
>>>  
>>> -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
>>> +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
>>>                                     virt_get_default_bus_bypass_iommu,
>>>                                     virt_set_default_bus_bypass_iommu);
>>> -    object_class_property_set_description(oc, "default_bus_bypass_iommu",
>>> +    object_class_property_set_description(oc, "default-bus-bypass-iommu",
>>>                                            "Set on/off to enable/disable "
>>>                                            "bypass_iommu for default root bus");


