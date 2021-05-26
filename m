Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1975C391F04
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:26:04 +0200 (CEST)
Received: from localhost ([::1]:45180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyEF-0006to-5M
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lly92-0001Wr-QK
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:20:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lly8y-0001nY-W4
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622053235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFnWD8r0qgaH2WcBUcJr6caodH1KoaPzgr10m204yTo=;
 b=UVv+q02R+NGPqCQEu8wThd73rGIfRVM60TOEZTmmJ/uENmS3O+82KcuFm5mh23P7aw7RVf
 NEgjUNU4vaBnRFv5L8aFsbua89UsbceBitdAapXo5F9U/qIcNKRqT8+nyULDSSRu9Q2mgH
 tuB5SPKP2Z9zHFw//q6KP+VCNDKxKjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-81tS84PSOVOl1_wyw2SMfA-1; Wed, 26 May 2021 14:20:32 -0400
X-MC-Unique: 81tS84PSOVOl1_wyw2SMfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9704100A254;
 Wed, 26 May 2021 18:20:28 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 054C54F3C6;
 Wed, 26 May 2021 18:20:19 +0000 (UTC)
Subject: Re: [PATCH v7 29/31] python: add .gitignore
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-30-jsnow@redhat.com>
 <ec6b802f-c705-76ae-76a0-4d7b9fd9c093@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <ff5c0781-eac9-192d-7838-ae222903aee2@redhat.com>
Date: Wed, 26 May 2021 14:20:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ec6b802f-c705-76ae-76a0-4d7b9fd9c093@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

On 5/26/21 5:18 AM, Vladimir Sementsov-Ogievskiy wrote:
> 26.05.2021 03:24, John Snow wrote:
>> Ignore *Python* build and package output (build, dist, qemu.egg-info);
>> these files are not created as part of a QEMU build. They are created by
>> running the commands 'python3 setup.py <sdist|bdist>' when preparing
>> tarballs to upload to e.g. PyPI.
>>
>> Ignore miscellaneous cached python confetti (mypy, pylint, et al)
>>
>> Ignore .idea (pycharm) .vscode, and .venv (pipenv et al).
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/.gitignore | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>   create mode 100644 python/.gitignore
>>
>> diff --git a/python/.gitignore b/python/.gitignore
>> new file mode 100644
>> index 00000000000..4ed144ceac3
>> --- /dev/null
>> +++ b/python/.gitignore
>> @@ -0,0 +1,15 @@
>> +# linter/tooling cache
>> +.mypy_cache/
>> +.cache/
>> +
>> +# python packaging
>> +build/
>> +dist/
>> +qemu.egg-info/
>> +
>> +# editor config
>> +.idea/
>> +.vscode/
>> +
>> +# virtual environments (pipenv et al)
>> +.venv/
>>
> 
> after make venv, I also have untracked pyproject.toml. It probably 
> should be ignored too.
> 

Hm, I noticed that too ... I don't know which component in the python 
ecosystem is making it. I suspect there's some compatibility layer for 
setup.cfg that is trying to make one for itself.

I'll have to investigate this piece a little more.

> With it or not:
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 

Thanks though :)


