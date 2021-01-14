Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319202F5D9D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:33:00 +0100 (CET)
Received: from localhost ([::1]:56192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzyzz-0001c3-7I
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:32:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzyyU-0000xH-W2
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:31:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzyyS-00007H-GH
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:31:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610616683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1jWP/Imd52vg028wrlTwedmVYNwJ2trnO1edSGszE+k=;
 b=ENFTAW7R2a9e3Xx2NhyKuFn4LJWbv0tWv0zc61Bd2bn4IiP0dsKes278Lz9ZZYe3oDjKqL
 FYzuM9Dp4msfyXGy2Vb4Ky4ukF/eQNIv8/ivgL6iwTLnEsdDGu08aUkK9z3DKnog+YzuYh
 xVlr+thZ/CU35/ivYo59smQBc2LoKMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-afRIc_IsM6OcS6_LwLzmcg-1; Thu, 14 Jan 2021 04:31:21 -0500
X-MC-Unique: afRIc_IsM6OcS6_LwLzmcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 973CB107ACF8;
 Thu, 14 Jan 2021 09:31:20 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-31.ams2.redhat.com
 [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85B5D10016FE;
 Thu, 14 Jan 2021 09:31:17 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] iotests/297: Allow checking all Python test files
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210113175752.403022-1-mreitz@redhat.com>
 <20210113175752.403022-2-mreitz@redhat.com>
 <285b6f74-da97-4b4b-70a8-ec09a8c467bb@virtuozzo.com>
 <2bb555bc-dfa5-076a-a3c3-b4bb5d1330f0@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0cf74b1c-c342-7e9d-ad80-cc2743a9763e@redhat.com>
Date: Thu, 14 Jan 2021 10:31:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2bb555bc-dfa5-076a-a3c3-b4bb5d1330f0@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.01.21 21:28, Vladimir Sementsov-Ogievskiy wrote:
> 13.01.2021 22:27, Vladimir Sementsov-Ogievskiy wrote:
>> 13.01.2021 20:57, Max Reitz wrote:
>>> I.e., all Python files in the qemu-iotests/ directory.
>>>
>>> Most files of course do not pass, so there is an extensive skip list for
>>> now.  (The only files that do pass are 209, 254, 283, and iotests.py.)
>>>
>>> (Alternatively, we could have the opposite, i.e. an explicit list of
>>> files that we do want to check, but I think it is better to check files
>>> by default.)
>>>
>>> I decided to include the list of files checked in the reference output,
>>> so we do not accidentally lose coverage of anything.  That means adding
>>> new Python tests will require a change to 297.out, but that should not
>>> be a problem.
>>
>> I have a parallel series, "Rework iotests/check", one of its aims is drop
>> group file, to avoid these endless conflicts in group file when you want
>> to send series or when you are porting patches to/from downstream.
>>
>> And you are trying to add one another "group" file :) I don't like the 
>> idea.
>>
>> Why should we loose accidentally the coverage? Logic is extremely simple:
>> all files except for the list.
>>
> 
> Also.. What about checking python in python :) ? I exercised myself,
> rewriting it into python. Take it if you like:

Why not, actually.

> (suddenly, pylint warns about "TODO"s, so I just drop a TODO line.. 
> Probably
>   we'll have to suppress this warning in 297)

I’d suppress this warning altogether, no?  I would like to keep TODO 
lines in other tests, too, without 297 failing.

Max


