Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E8A374D7A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 04:22:35 +0200 (CEST)
Received: from localhost ([::1]:47004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTes-0003Nr-IO
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 22:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leTc2-0008RO-Gc
 for qemu-devel@nongnu.org; Wed, 05 May 2021 22:19:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leTc0-0005I1-Oo
 for qemu-devel@nongnu.org; Wed, 05 May 2021 22:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620267576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvqyV7nnVSxO4QMqjkCvu+89OaOWQiMEE9CARBq76js=;
 b=DA1aRSUpI96yJ2xnOj+OP2Mx1j/Zip/K5+QJzJWsYMx2VZPkGuQDT0brA9DE2aGmjv32Rm
 y7tZlnA/ViBF8umuOhaPxLPCO2d0RQugpmu9ku3iN72s935o/5fe6TeA2ths5X1DSs6Au6
 z6mEvqUTHOj6VqQfIWbMQJ4i0U9DSkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-dGEJLH79NeO9pFnjXQ4P6w-1; Wed, 05 May 2021 22:19:34 -0400
X-MC-Unique: dGEJLH79NeO9pFnjXQ4P6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C62D718397A6;
 Thu,  6 May 2021 02:19:33 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-159.pek2.redhat.com
 [10.72.13.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFDBF59476;
 Thu,  6 May 2021 02:19:32 +0000 (UTC)
Subject: Re: [PATCH] tap-bsd: Remove special casing for older OpenBSD releases
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YF5y+MDiK2QInFA2@humpty.home.comstyle.com>
 <8571b8c8-f3ed-ef67-6ea3-2e6652a2e435@redhat.com>
 <1787bf01190.27f3.c0f5e3539a5acb9c2563017afaca17d6@comstyle.com>
 <35befc6a-6167-1251-75ec-35e723b7547b@redhat.com>
 <c34234c1-5221-afd3-b850-1e78e566e2b5@comstyle.com>
 <0d0e3ba7-ce55-bb63-109b-86792d3ac08a@redhat.com>
 <78602d9d-e111-05f0-c91d-debb6e78009f@comstyle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e5df409d-2560-131d-420f-db38b148cbd7@redhat.com>
Date: Thu, 6 May 2021 10:19:31 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <78602d9d-e111-05f0-c91d-debb6e78009f@comstyle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/2 下午12:10, Brad Smith 写道:
> On 4/1/2021 3:24 AM, Jason Wang wrote:
>>
>> 在 2021/3/30 上午4:38, Brad Smith 写道:
>>> On 3/28/2021 11:58 PM, Jason Wang wrote:
>>>
>>>>
>>>> 在 2021/3/29 上午11:03, Brad Smith 写道:
>>>>> It very much is correct. We don't care about such releases anymore.
>>>>
>>>>
>>>> So is there a doc/wiki to say Qemu doesn't support those OpenBSD 
>>>> release?
>>>
>>> The (OpenBSD itself and QEMU) project only makes a concerted effort 
>>> to support
>>> two previous releases. I can't remember where in the QEMU Wiki it is 
>>> mentioned.
>>>
>>> Just looking at the Meson requirement alone limits us to the 
>>> previous two releases
>>> never mind older. Even if that wasn't a consideration there would be 
>>> issues with
>>> a few other dependencies like Gtk before going back this far to 
>>> support such old
>>> OpenBSD releases.
>>>
>>>
>>
>> Ok. So I've applied this patch.
>>
>> Thanks
>
>
> I do not see where.


I don't queue it for 6.0 so it will be in the next pull request.

Thanks



