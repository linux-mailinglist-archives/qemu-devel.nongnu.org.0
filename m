Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C252C0147
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 09:22:34 +0100 (CET)
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh77I-00045H-Be
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 03:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kh71u-0006i7-1L
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 03:17:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kh71s-00016s-Ha
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 03:16:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606119415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q5P5jtPrN0xhSA6WqdSOdDNwdWcJNLL0CDkrbwSRyIU=;
 b=UGBAZ61nDQ/lmpUtryGfFhUCkPTN684QM8uKBfoeno5rNKXkodg3Sy03y+IqFPzb6j1dDP
 t2wc072KQNcMCVESY2mnmNDQSTAjWssWLAVqNH1jSx072xIuChlUAV5BiS4IfLfNl5fJTD
 cJ8LmiU3dFsAoES2noLECPGCm48jMQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-PNoN3xRLPWCol01dsRMKbg-1; Mon, 23 Nov 2020 03:16:51 -0500
X-MC-Unique: PNoN3xRLPWCol01dsRMKbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CB2B106F6E8;
 Mon, 23 Nov 2020 08:16:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAFF95D9E2;
 Mon, 23 Nov 2020 08:16:47 +0000 (UTC)
Subject: Re: [PATCH] hw/watchdog/wdt_diag288: Remove unnecessary includes
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20201118090344.243117-1-thuth@redhat.com>
 <800135fc-4552-b872-0117-4d9194393094@redhat.com>
 <873616kan8.fsf@dusky.pond.sub.org>
 <CAFEAcA9gg_cxcG59BHKosJmTeyyJ_7_Uofcyb9kMXSRAFnYebg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8a91ad94-9a18-1f8b-b73d-92872495fdc3@redhat.com>
Date: Mon, 23 Nov 2020 09:16:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9gg_cxcG59BHKosJmTeyyJ_7_Uofcyb9kMXSRAFnYebg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/2020 15.30, Peter Maydell wrote:
> On Wed, 18 Nov 2020 at 14:24, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>
>>> On 11/18/20 10:03 AM, Thomas Huth wrote:
>>>> Both headers, sysbus.h and module.h, are not required to compile this file.
>>
>> module.h is: it defines type_init().
> 
>>>>  #include "qemu/timer.h"
>>>>  #include "hw/watchdog/wdt_diag288.h"
>>>>  #include "migration/vmstate.h"
>>>>  #include "qemu/log.h"
>>>> -#include "qemu/module.h"
>>>
>>> Cc'ing Markus because of:
> 
>>>     Include qemu/module.h where needed, drop it from qemu-common.h
>>
>> If it still compiles and links, it must get it via some other header.
> 
> Yes: wdt_diag288.c -> include/hw/watchdog/wdt_diag288.h ->
>  include/qom/object.h -> include/qemu/module.h

So what's now our expectation here? Should every file that uses type_init()
also include module.h ? That's IMHO not very intuitive...
Or are we fine that type_init() is provided by qom/object.h which needs to
be pulled in by every device sooner or later anyway?

 Thomas


