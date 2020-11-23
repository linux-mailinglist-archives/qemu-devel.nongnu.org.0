Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FDE2C014A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 09:23:36 +0100 (CET)
Received: from localhost ([::1]:46556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh78J-0005U8-5L
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 03:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kh6xS-0001Cg-30
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 03:12:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kh6xQ-0007xs-JK
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 03:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606119139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N9aXAV4ugHm3jPLNYZMcT2DUbKXs9ePfP19cI1qQjSY=;
 b=PiVBmoy4eEeUrUn+SbD62M+F6qBZYHaFb+WDJyR/tJ9N6556mgZJFpGNnDGgVUHLwoOZR1
 w2y4B1pGH4RMTLW24Lasvc9JBXUY9DyTvgXknI+photJ+Bg82PG5uGGwJuZJI+bj49e6wc
 XoSRe0SWnJh5JTqhzaS37cAOyoXtxvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-_QBO8e7dP8uq6lKqmgpDQg-1; Mon, 23 Nov 2020 03:12:15 -0500
X-MC-Unique: _QBO8e7dP8uq6lKqmgpDQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B469108E1AC;
 Mon, 23 Nov 2020 08:12:05 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46BE960864;
 Mon, 23 Nov 2020 08:12:03 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] pc-bios: s390x: Clear out leftover S390EP string
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
References: <20201120160117.59366-1-farman@linux.ibm.com>
 <20201120160117.59366-3-farman@linux.ibm.com>
 <e29df739-baca-cd0a-d1d9-a690c0238ca4@de.ibm.com>
 <4738082f-ec10-e2a3-7756-9180a57329bb@redhat.com>
 <1ad47eb6-5aca-a766-3bad-aa38924b5ef8@de.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a194b0b1-c420-4cd6-6e75-78491382f33b@redhat.com>
Date: Mon, 23 Nov 2020 09:12:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1ad47eb6-5aca-a766-3bad-aa38924b5ef8@de.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Jason Herne <jjherne@linux.ibm.com>, qemu-s390x@nongnu.org,
 Janosch Frank <frankja@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/11/2020 09.07, Christian Borntraeger wrote:
> 
> 
> On 23.11.20 09:05, Thomas Huth wrote:
>> On 23/11/2020 08.39, Christian Borntraeger wrote:
>>> On 20.11.20 17:01, Eric Farman wrote:
>>>> A Linux binary will have the string "S390EP" at address 0x10008,
>>>> which is important in getting the guest up off the ground. In the
>>>> case of a reboot (specifically chreipl going to a new device),
>>>> we should defer to the PSW at address zero for the new config,
>>>> which will re-write "S390EP" from the new image.
>>>>
>>>> Let's clear it out at this point so that a reipl to, say, a DASD
>>>> passthrough device drives the IPL path from scratch without disrupting
>>>> disrupting the order of operations for other boots.
>>>>
>>>> Rather than hardcoding the address of this magic (again), let's
>>>> define it somewhere so that the two users are visibly related.
>>>
>>>
>>> Hmmm, this might have side effects, e.g. if you do something like a kdump
>>> or kexec to a non-Linux binary that happens to have code at 0x10008, no?
>>
>> Do these scenarios really go through the s390-ccw bios again, or do they
>> rather bypass the bios and jump directly into the new kernel?
> 
> Right they jump directly into the new kernel. So this patch could actually
> be "good enough" for 5.2 as is?

I think it should be fine, yes. I'll give it a try with my usual s390-ccw
bios tests, and if there are no regressions (and no other objections on the
mailing list here), I'll prepare a pull request.

 Thomas


