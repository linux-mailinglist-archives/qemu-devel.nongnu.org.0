Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C236361A5E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 09:12:49 +0200 (CEST)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXIem-0007P7-9Q
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 03:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lXIdM-0006lF-Hh
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:11:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lXIdK-0004p4-1Y
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618557077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bi06xcak41WEfg6uAzy/+N11jZ+D6OSUzpk3DrcL40=;
 b=GT5REdiDeTtyj5yDD2lN4TWz63VcPyZgE1R6hruZQwdsQzYXuQTqtwPsbBytGSh7ex0UFo
 KrL0G0FSmKjy6q5Me5VEvcMJIeCsOhdXZGLWdmgi4cEptGjb+B4KoR5GtP5Uc6F/hAA2lE
 zTlB70tp9PCernLZJO30D2ZuRs8wuVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-az_St-pYPiy14tJ1PJP9nA-1; Fri, 16 Apr 2021 03:11:15 -0400
X-MC-Unique: az_St-pYPiy14tJ1PJP9nA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ADC16D246;
 Fri, 16 Apr 2021 07:11:14 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-131.ams2.redhat.com
 [10.36.113.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBC7F5E1A4;
 Fri, 16 Apr 2021 07:11:12 +0000 (UTC)
Subject: Re: about mirror cancel
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu block <qemu-block@nongnu.org>
References: <b2e5b990-ca1c-53f0-0e0c-31396156fa4a@virtuozzo.com>
 <5df8166f-a204-6510-e27a-1b334f0bb3f3@redhat.com>
Message-ID: <ea96f574-dc36-2546-53be-ddb02ba02880@redhat.com>
Date: Fri, 16 Apr 2021 09:11:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <5df8166f-a204-6510-e27a-1b334f0bb3f3@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.04.21 09:05, Max Reitz wrote:
> On 15.04.21 20:46, Vladimir Sementsov-Ogievskiy wrote:

[...]

>> Note, that if cancelling all in-flight requests on target is wrong on 
>> mirror cancel, we still don't have real bug, as the only 
>> implementation of .bdrv_cancel_in_flight is stopping reconnect waiting 
>> in nbd driver. So, we'll cancel requests only if connection is already 
>> lost anyway.
>>
>> But that probably means, that correct name of the handler would be 
>> .bdrv_cancel_in_fligth_requests_that_will_most_probably_fail_anyway()..
> 
> It’s documentation states that it should cancel all in-flight requests, 
> so it’s more likely it just isn’t implemented where it could be.

Oh, I now see you added it in the same series.  Well, then I suppose 
you’re free to change the semantics as you see fit.

But be aware that even cancelling those requests means that you abandon 
the target.  So it must then fail instead of emitting the COMPLETED 
event (AFAIR the mirror job emits COMPLETED when cancelled in READY with 
force=false).

If the user wants the mirror job to create a consistent copy and so 
cancels it after READY (with force=false), I don’t know whether 
cancelling those hanging requests is what we want.  If the cancel hangs 
and the user sees this, they are still free to decide to cancel again 
with force=true, no?

Max


