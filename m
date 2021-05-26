Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB95391F42
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:37:31 +0200 (CEST)
Received: from localhost ([::1]:39432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyPK-0005Lc-Q7
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llyKK-00025o-47
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:32:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llyKE-0008Qk-Rm
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622053934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1EJcF4QxQhqc8qdegRMHO/hi9K9kjppkxMlQ+8JZuDo=;
 b=aTJLHwqzYghWnu6QZmICL3S6nO7PoQnYdJ2bOr4QbNwwJPmDAr4WfdcSuSiKs7tEUAqXhE
 RmamEeX8fnv8zyiyWBM6IvSPIt+nkY1EkJjyVup42sNKMoqAoDOZnU/l7dMDriVm9Z6M9v
 todAtICfN2fLqct76X2DoDRfopyc+gg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-9PC39flrMXmQtByijnkTeA-1; Wed, 26 May 2021 14:32:12 -0400
X-MC-Unique: 9PC39flrMXmQtByijnkTeA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CF6B6D241;
 Wed, 26 May 2021 18:32:11 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADED060C5A;
 Wed, 26 May 2021 18:32:00 +0000 (UTC)
Subject: Re: [PATCH v7 17/31] python: add pylint to pipenv
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-18-jsnow@redhat.com>
 <75ef5c16-eac7-1d67-b140-5c02d209327b@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <c279e517-2c35-d294-1a86-03502c1c97a3@redhat.com>
Date: Wed, 26 May 2021 14:31:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <75ef5c16-eac7-1d67-b140-5c02d209327b@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 5:14 AM, Vladimir Sementsov-Ogievskiy wrote:
> 26.05.2021 03:24, John Snow wrote:
>> We are specifying >= pylint 2.8.x for several reasons:
>>
>> 1. For setup.cfg support, added in pylint 2.5.x
>> 2. To specify a version that has incompatibly dropped
>>     bad-whitespace checks (2.6.x)
>> 3. 2.7.x fixes "unsubscriptable" warnings in Python 3.9
>> 4. 2.8.x adds a new, incompatible 'consider-using-with'
>>     warning that must be disabled in some cases.
>>     These pragmas cause warnings themselves in 2.7.x.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> Not sure how to review this one, numbers looks like numbers, hashes 
> looks like hashes, so it's OK :)
> 

Thanks for going down the list of unreviewed patches :) the change in v7 
from v6 here is requiring pylint > 2.8.0 for the venv, I used to ask 
only for 2.7.0.

I have no idea how to review these lockfiles either. I don't scrutinize 
them too closely -- just as long as they appear to work in the CI 
environment, I am happy.

> I've tried to regenerate Pipfile.lock from venv, and I see that new 
> generated Pipfile.lock has same hashes..
> 
> Still, new generated Pipfile.lock has some additional entries: appdirs, 
> distlib, filelock, importlib-resources, packaging, pluggy, py, 
> pyparsing, six, tox, virtualenv.. Not sure is it OK.
> 

If you did that at the *end* of the series, it's because I added tox as 
a development requirement, but didn't update the Pipenv -- because we 
don't actually use tox *in* the venv.

However, I wanted 'pip install .[devel]' to work, so it needs to pull in 
tox there.

Eventually, I'll update the Pipenv for some other reason and it'll 
probably pull in Tox at that point -- maybe a little wasteful, but not 
harmful.

> Another differencies are:
> 
> for importlib-metadata:
> 
>   "markers": "python_version < '3.8'"   ->   "markers": "python_version 
> < '3.8' and python_version < '3.8'"
> 
> (looks like a bug in pipenv, isn't it)
> 

Or at least a version difference. TBQH I do not understand what these 
markers mean, but they DO seem volatile. I decided not to worry about 
them, as long as Pipenv seems to do the right thing ...

> for zipp:
>   "markers": "python_version >= '3.6'"  ->   "markers": "python_version 
> < '3.10'"
> 
> 
> The thing I hope is: we will not have commits like this one often..
> 

Only when make-check-pipenv starts to fail for some reason and I need to 
update the dependencies. Hopefully not extremely often ... if it becomes 
too much of a pain I will just get rid of it.

I'm not 100% confident this will help more than it hurts yet, but I'll 
find out over the next release or two.

> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> 

Thanks :)


