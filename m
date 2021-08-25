Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042423F707F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:36:18 +0200 (CEST)
Received: from localhost ([::1]:54042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInSL-0000MM-1y
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mInQz-00072r-Er
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:34:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mInQx-0003rO-Lf
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629876891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rpbQncTe1/PK3AG9gjGM62Dowf8Anv802XYd5mDwcuM=;
 b=U23c+rRCW1/haG3DEMhBYZB06wasOrv4zTNOD6b9UwXjyqgJUtQM4+0eCO/etI9lhJdxmc
 1AXgPzq0wzcTmlV6aIISxSUedJMPoNieKNDZWq0tKsJi51KkU+1YCX55tlYky21xlXKIGi
 ZFc6VIrs/8gteOvMuUlFb2geXSQtU6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-F-reekBTNJ-UgFYbSSidIQ-1; Wed, 25 Aug 2021 03:34:49 -0400
X-MC-Unique: F-reekBTNJ-UgFYbSSidIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE13F34787;
 Wed, 25 Aug 2021 07:34:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B293A60C5A;
 Wed, 25 Aug 2021 07:34:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4917011380A9; Wed, 25 Aug 2021 09:34:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: pbonzini@redhat.com
Subject: Re: [PATCH 1/2] hw/arm/virt: Rename default_bus_bypass_iommu
References: <20210811085842.2511545-1-jean-philippe@linaro.org>
 <87o89nnus1.fsf@dusky.pond.sub.org>
Date: Wed, 25 Aug 2021 09:34:45 +0200
In-Reply-To: <87o89nnus1.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 24 Aug 2021 09:53:18 +0200")
Message-ID: <87o89m7zai.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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

> Did this series fall through the cracks for 6.1?

Missed 6.1.  What now?

> Jean-Philippe Brucker <jean-philippe@linaro.org> writes:
>
>> Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
>> parameter definitions cannot use underscores, because keyval_dashify()
>> transforms them to dashes and the parser doesn't find the parameter.
>>
>> This affects option default_bus_bypass_iommu which was introduced in the
>> same release:
>>
>> $ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
>> qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found
>>
>> Rename the parameter to "default-bus-bypass-iommu". Passing
>> "default_bus_bypass_iommu" is still valid since the underscore are
>> transformed automatically.
>>
>> Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> ---
>>  hw/arm/virt.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index b4598d3fe6..7075cdc15e 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2671,10 +2671,10 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>                                            "Set the IOMMU type. "
>>                                            "Valid values are none and smmuv3");
>>  
>> -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
>> +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
>>                                     virt_get_default_bus_bypass_iommu,
>>                                     virt_set_default_bus_bypass_iommu);
>> -    object_class_property_set_description(oc, "default_bus_bypass_iommu",
>> +    object_class_property_set_description(oc, "default-bus-bypass-iommu",
>>                                            "Set on/off to enable/disable "
>>                                            "bypass_iommu for default root bus");


