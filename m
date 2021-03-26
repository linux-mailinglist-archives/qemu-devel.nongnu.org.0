Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477D634A579
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 11:28:05 +0100 (CET)
Received: from localhost ([::1]:49508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPjhE-0006Jb-A2
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 06:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPjfc-0005f0-MF
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 06:26:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPjfa-0003xx-1W
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 06:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616754380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aibDt0HD46oLGfThrXnxqKpaWwNv6lp0KOmgbv5LM3M=;
 b=WlP0YnyKrpHDoPIRYg2HekNGsAWKxfOShSp22Ss8tCSnzbpffSdjEB3ww4cA+zZjSWm4fW
 3Ffx3m+idwtfq0s9kKIXp5WW4g456shPLEizivAQchqmZz0hfrPid2452fs7vDE0Bj3JF2
 4SkTFJtKSdIz1wFQGbmWdO5ysu7lXI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-u3f82QeEPnaXbWnsCf-VtQ-1; Fri, 26 Mar 2021 06:26:18 -0400
X-MC-Unique: u3f82QeEPnaXbWnsCf-VtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9067B817472;
 Fri, 26 Mar 2021 10:26:16 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E07DD772E0;
 Fri, 26 Mar 2021 10:26:13 +0000 (UTC)
Subject: Re: [PATCH for-6.0 1/4] include/hw/boards.h: Document
 machine_class_allow_dynamic_sysbus_dev()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210325153310.9131-1-peter.maydell@linaro.org>
 <20210325153310.9131-2-peter.maydell@linaro.org>
 <af25a32c-6bff-c44c-ff9c-65721d5e9e54@redhat.com>
 <CAFEAcA9WqyauWsF-5FbJMt=0NcRoZZfJmunDhvqyaSBUV1xm8w@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <788b5a45-6518-0a96-08ea-743a6f9d66d8@redhat.com>
Date: Fri, 26 Mar 2021 11:26:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9WqyauWsF-5FbJMt=0NcRoZZfJmunDhvqyaSBUV1xm8w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 3/26/21 11:20 AM, Peter Maydell wrote:
> On Fri, 26 Mar 2021 at 09:27, Auger Eric <eric.auger@redhat.com> wrote:
>>
>> Hi Peter,
>>
>> On 3/25/21 4:33 PM, Peter Maydell wrote:
>>> The function machine_class_allow_dynamic_sysbus_dev() is currently
>>> undocumented; add a doc comment.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  include/hw/boards.h | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>>> index 4a90549ad85..27106abc11d 100644
>>> --- a/include/hw/boards.h
>>> +++ b/include/hw/boards.h
>>> @@ -36,7 +36,21 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>>                                 const CpuInstanceProperties *props,
>>>                                 Error **errp);
>>>
>>> +/**
>>> + * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
>> nit: s/of valid devices/of dynamically instantiable sysbus devices ?
> 
> I was trying to keep the summary line to be one line, which
> doesn't give much space for nuance with a function name this long...

OK no worries

Thanks

Eric
> 
> 
> -- PMM
> 


