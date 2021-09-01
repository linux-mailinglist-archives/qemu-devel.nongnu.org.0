Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E1400057
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:18:27 +0200 (CEST)
Received: from localhost ([::1]:49414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM95O-0006xh-LQ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8w3-0007SV-6K
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vw-0001Q9-Em
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5on5ng1Sl2010TjZ0jPetIR27h37S0uDaqa1c7VsYug=;
 b=CMY+FtXAaV3AbRfvr936mropGh4O7Z84m1SvUUUGGAHwD3o+hvgW17eImIJu1FEeSSGzP7
 0I4SjTcucA7nCZ9dgYikKLuYmispk+iXRgXN73ZL3aKOZVJPNDi8b3WrW9Lj3xGuHNhMpQ
 rwQSmY1eRLfjnE0/rGQb8FilqzLIPQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-juCd-zCXPCatBU9IiIcLTQ-1; Fri, 03 Sep 2021 09:08:35 -0400
X-MC-Unique: juCd-zCXPCatBU9IiIcLTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77B0A100670B;
 Fri,  3 Sep 2021 13:08:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 825006B543;
 Fri,  3 Sep 2021 13:08:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 636D011380D7; Wed,  1 Sep 2021 16:33:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 3/3] qapi: deprecate drive-backup
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
 <20210505135803.67896-4-vsementsov@virtuozzo.com>
 <YJO9owtr4N+1Ta7k@paraplu.home>
 <d3207955-794e-2859-14c2-80fa6767a13d@redhat.com>
 <5cbaa5bb-65cf-82cd-7f8e-8227a5f50b6d@virtuozzo.com>
 <05a5cce6-6ef3-60f1-76a9-93c183fc7273@redhat.com>
 <cd8a347b-4068-e2e5-7fd9-e98c82b9533d@virtuozzo.com>
Date: Wed, 01 Sep 2021 16:33:47 +0200
In-Reply-To: <cd8a347b-4068-e2e5-7fd9-e98c82b9533d@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 1 Sep 2021 16:29:31 +0300")
Message-ID: <87o89cpdpw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>, libvir-list@redhat.com,
 John Snow <jsnow@redhat.com>, xiechanglong.d@gmail.com, qemu-devel@nongnu.org,
 yur@virtuozzo.com, nshirokovskiy@virtuozzo.com, wencongyang2@huawei.com,
 den@openvz.org, eblake@redhat.com, dim@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 24.05.2021 21:37, John Snow wrote:
>> On 5/24/21 10:06 AM, Vladimir Sementsov-Ogievskiy wrote:
>>> 15.05.2021 01:38, John Snow wrote:
>>>> On 5/6/21 5:57 AM, Kashyap Chamarthy wrote:
>>>>> TODO: We also need to deprecate drive-backup transaction action..
>>>>> But union members in QAPI doesn't support 'deprecated' feature. I tried
>>>>> to dig a bit, but failed :/ Markus, could you please help with it? At
>>>>> least by advice?
>>>>
>>>> Oho, I see.
>>>>
>>>> OK, I'm not Markus, but I've been getting into lots of trouble in the QAPI generator lately, so let me see if I can help get you started...
>>>>
>>>> https://gitlab.com/jsnow/qemu/-/commits/hack-deprecate-union-branches/
>>>>
>>>> Here's a quick hack that might expose that feature. I suppose we can discuss this with Markus and turn these into real patches if that's the direction we wanna head.
>>>>
>>>
>>> Hi! Markus is silent.. Maybe, you'll send patches ? )
>>>
>>>
>> He just went on PTO for 2 weeks :')
>> It's going to have to wait, I'm afraid ...
>> 
>
> Hi!
>
> Any plans or updates? John, may be you just send your patches?

Yes, please!

I intend to resume working on feature flags next week.


