Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE57430DEED
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:59:08 +0100 (CET)
Received: from localhost ([::1]:59120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KYd-0006qV-3J
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7KX3-0006N2-U4
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:57:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7KX2-0001h9-4w
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612367847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7OcViryPA9HLMM2+1f9Gz+l/s8Tw1sDszBI0Ywb8+8g=;
 b=J9va58oni/pEqDZMjz2fgoXh+hLKVvPAToKezCSUIL+pg7UwPLShatPheSSWOw+64CTwN3
 Lmu/L2ARb7z+GvhemzdoXuk5GWRZMTTm/sxqZ3B4Wb3s8M/rtK8KpBHkIbhFhgm7IsHL6x
 Yu0nbnODN5J5faWpDoAVAkgbOAFVrMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-7ME-FdEePfuyabLP-7BeEg-1; Wed, 03 Feb 2021 10:57:23 -0500
X-MC-Unique: 7ME-FdEePfuyabLP-7BeEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E3FF801961;
 Wed,  3 Feb 2021 15:57:22 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8744B5D9EF;
 Wed,  3 Feb 2021 15:57:17 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: suggest myself as co-maintainer for Block
 Jobs
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210128144144.27617-1-vsementsov@virtuozzo.com>
 <878s8d85dz.fsf@dusky.pond.sub.org>
 <2651677f-aa5e-1937-0fb6-767c080fccdc@redhat.com>
 <094df33d-f944-7a68-c0b4-a7c509287a6b@virtuozzo.com>
 <20210201145056.GD13157@merkur.fritz.box>
 <304b3b7c-a58e-901d-7f52-b6efb1c1fbfe@virtuozzo.com>
 <e1b4aba3-e94b-de1b-05b4-780f41feb5a8@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <bf84fbb9-228e-6346-3eeb-99da4c3a7cbc@redhat.com>
Date: Wed, 3 Feb 2021 10:57:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e1b4aba3-e94b-de1b-05b4-780f41feb5a8@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, mreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 3:22 AM, Vladimir Sementsov-Ogievskiy wrote:
> 01.02.2021 19:20, Vladimir Sementsov-Ogievskiy wrote:
>> 01.02.2021 17:50, Kevin Wolf wrote:
>>> Am 01.02.2021 um 12:03 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 28.01.2021 18:28, John Snow wrote:
>>>>> On 1/28/21 10:09 AM, Markus Armbruster wrote:
>>>>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>>>>>
>>>>>>> I'm developing Qemu backup for several years, and finally new backup
>>>>>>> architecture, including block-copy generic engine and backup-top 
>>>>>>> filter
>>>>>>> landed upstream, great thanks to reviewers and especially to
>>>>>>> Max Reitz!
>>>>>>>
>>>>>>> I also have plans of moving other block-jobs onto block-copy, so 
>>>>>>> that
>>>>>>> we finally have one generic block copying path, fast and 
>>>>>>> well-formed.
>>>>>>>
>>>>>>> So, now I suggest to bring all parts of backup architecture into
>>>>>>> "Block Jobs" subsystem (actually, aio_task is shared with qcow2 and
>>>>>>> qemu-co-shared-resource can be reused somewhere else, but I'd 
>>>>>>> keep an
>>>>>>> eye on them in context of block-jobs) and add myself as 
>>>>>>> co-maintainer.
>>>>>>>
>>>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy 
>>>>>>> <vsementsov@virtuozzo.com>
>>>>>>
>>>>>> With pleasure:
>>>>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>>>>>
>>>>>
>>>>> Absolutely! Glad to see it.
>>>>>
>>>>> Reviewed-by: John Snow <jsnow@redhat.com>
>>>>>
>>>>
>>>> [..]
>>>>
>>>>> Great!
>>>>>
>>>>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>>>
>>>> Thanks!
>>>>
>>>> Could someone pull it?
>>>
>>> I've put it in my block branch (with s/suggest myself/Add Vladimir/ in
>>> the subject line), but I don't know when I'll send the next pull
>>> request. If someone else sends one first, feel free to include it with:
>>>
>>> Acked-by: Kevin Wolf <kwolf@redhat.com>
>>>
>>>> I don't have any signed PGP key for now, to send pull requests :\
>>>> Interesting, could I get one while sitting in Moscow?
>>>
>>> If you're planning to send pull requests, should a git tree of yours be
>>> added to the MAINTAINERS sections, too?
>>>
>>
>> I didn't add it because of signed key absence. As it turned out, Denis 
>> Lunev (my boss) already has a signed key, so it's not a problem.
>>
> 
> Unfortunately, Den doesn't have an access to his private key, so this 
> variant doesn't work. So, probably someone could recognize me in a video 
> call?
> 
> My key is here: 
> http://keys.gnupg.net/pks/lookup?search=Vladimir+Sementsov-Ogievskiy&fingerprint=on&op=index  
> (note that there is only one Vladimir Sementsov-Ogievskiy, so I can't 
> imagine who can that be other than me :)
> 

I'm not sure what protocol here is, but you and I and several others met 
face to face in edinburgh and could at least weakly identify you. Maybe 
we can sign with a low level of trust for now, and improve it when we 
get a chance to do a real key signing meetup later?

I think Peter needs to trust your key, ultimately, so I think it's up to 
him for what criteria he will personally trust.

--js


