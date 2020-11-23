Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A4D2C1351
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 19:44:56 +0100 (CET)
Received: from localhost ([::1]:51314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khGpb-0003PE-8F
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 13:44:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khGmc-0002YE-N5
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:41:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khGma-0001ou-II
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606156907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6wfhCxixyJnnrZO5dM+Qk7H1Pz1ZMkKNs6F0BJldQmw=;
 b=WjLvd6E9AsPFsX/A5tl+zd6TiSOI8QVhOyJW3wxcjJX85y4xgsv1iC8PDJa41WPaXhy3yQ
 b+7zj6PuZmTdweAMZ/LFFEdOZU2OdnbQOPJ1y77LMJibVOKRBIEnn4Yd59Cv8+iL5aVa93
 YS0Jf9YugZCTHL/cgh8wgIa1z0vqvLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-qu12vhumNCGf8X-zTYyLOA-1; Mon, 23 Nov 2020 13:41:45 -0500
X-MC-Unique: qu12vhumNCGf8X-zTYyLOA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC16280EFA8;
 Mon, 23 Nov 2020 18:41:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0E215C1BD;
 Mon, 23 Nov 2020 18:41:41 +0000 (UTC)
Subject: Re: [PATCH] hw/watchdog/wdt_diag288: Remove unnecessary includes
To: Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20201118090344.243117-1-thuth@redhat.com>
 <800135fc-4552-b872-0117-4d9194393094@redhat.com>
 <873616kan8.fsf@dusky.pond.sub.org>
 <CAFEAcA9gg_cxcG59BHKosJmTeyyJ_7_Uofcyb9kMXSRAFnYebg@mail.gmail.com>
 <8a91ad94-9a18-1f8b-b73d-92872495fdc3@redhat.com>
 <874klgtkn6.fsf@dusky.pond.sub.org>
 <20201123165908.79203631.cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7e1483d6-8767-0d0f-105d-b55d2d6d6165@redhat.com>
Date: Mon, 23 Nov 2020 19:41:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201123165908.79203631.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/11/2020 16.59, Cornelia Huck wrote:
> On Mon, 23 Nov 2020 11:47:25 +0100
> Markus Armbruster <armbru@redhat.com> wrote:
> 
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> On 18/11/2020 15.30, Peter Maydell wrote:  
>>>> On Wed, 18 Nov 2020 at 14:24, Markus Armbruster <armbru@redhat.com> wrote:  
>>>>>
>>>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>>>  
>>>>>> On 11/18/20 10:03 AM, Thomas Huth wrote:  
>>>>>>> Both headers, sysbus.h and module.h, are not required to compile this file.  
>>>>>
>>>>> module.h is: it defines type_init().  
>>>>   
>>>>>>>  #include "qemu/timer.h"
>>>>>>>  #include "hw/watchdog/wdt_diag288.h"
>>>>>>>  #include "migration/vmstate.h"
>>>>>>>  #include "qemu/log.h"
>>>>>>> -#include "qemu/module.h"  
>>>>>>
>>>>>> Cc'ing Markus because of:  
>>>>   
>>>>>>     Include qemu/module.h where needed, drop it from qemu-common.h  
>>>>>
>>>>> If it still compiles and links, it must get it via some other header.  
>>>>
>>>> Yes: wdt_diag288.c -> include/hw/watchdog/wdt_diag288.h ->
>>>>  include/qom/object.h -> include/qemu/module.h  
>>>
>>> So what's now our expectation here? Should every file that uses type_init()
>>> also include module.h ? That's IMHO not very intuitive...
>>> Or are we fine that type_init() is provided by qom/object.h which needs to
>>> be pulled in by every device sooner or later anyway?  
>>
>> I think it's okay to rely on indirect inclusion.
> 
> So, what's the final verdict? Maybe just tweak the description?
> 
> "Neither sysbus.h nor module.h are required to compile this file.
> diag288 is not a sysbus device, and module.h (for type_init) is
> included eventually through qom/object.h."

Yes, I think that's the way to go. Could you update the description when
picking up the patch, or shall I send a v2?

 Thomas



