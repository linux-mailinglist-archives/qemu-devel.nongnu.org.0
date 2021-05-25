Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB17390D19
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:56:14 +0200 (CEST)
Received: from localhost ([::1]:48572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llguC-00052z-Pr
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llgtD-0004EJ-Ld
 for qemu-devel@nongnu.org; Tue, 25 May 2021 19:55:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llgtA-00060s-EU
 for qemu-devel@nongnu.org; Tue, 25 May 2021 19:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621986906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yx+OV/6xbVm8pO3ZXQZPgAwLX2v9mUhQpsVeZvwGRTI=;
 b=JYPLAv/DgnjDJtrjlOfcTcTe2mXpLfXWHbnlawu34ShV+lEdnDgcJo2MHHrqQ5pWGZx1Pd
 y/biobPNln8VDI+302OWBfw8Thhkl2d52H1th4G4wF89qY/RAKKgm3FUHnUoD+SeHz1qun
 rtj03Wec9P+bhEZCpFm07lU2tAL6CfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-kQpCkF7-NZGy8wMsKuY5FQ-1; Tue, 25 May 2021 19:55:04 -0400
X-MC-Unique: kQpCkF7-NZGy8wMsKuY5FQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0F1E180FD65;
 Tue, 25 May 2021 23:55:03 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC7D160CEC;
 Tue, 25 May 2021 23:54:54 +0000 (UTC)
Subject: Re: [PATCH v6 23/25] python: add .gitignore
To: Cleber Rosa <crosa@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-24-jsnow@redhat.com>
 <YK1RqhFrWt6yHuRt@localhost.localdomain>
 <0d0053ab-4410-e905-7261-332f21fd8852@redhat.com>
 <20210525204237.GG1567491@amachine.somewhere>
From: John Snow <jsnow@redhat.com>
Message-ID: <b9ccbb50-4d02-183e-50db-acf742f1cbea@redhat.com>
Date: Tue, 25 May 2021 19:54:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525204237.GG1567491@amachine.somewhere>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 4:42 PM, Cleber Rosa wrote:
> On Tue, May 25, 2021 at 04:10:55PM -0400, John Snow wrote:
>> On 5/25/21 3:36 PM, Cleber Rosa wrote:
>>> On Wed, May 12, 2021 at 07:12:39PM -0400, John Snow wrote:
>>>> Ignore *Python* build and package output (build, dist, qemu.egg-info);
>>>> these files are not created as part of a QEMU build.
>>>>
>>>> Ignore miscellaneous cached python confetti (__pycache__, *.pyc,
>>>> .mypy_cache).
>>>>
>>>> Ignore .idea (pycharm) .vscode, and .venv (pipenv et al).
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>    python/.gitignore | 19 +++++++++++++++++++
>>>>    1 file changed, 19 insertions(+)
>>>>    create mode 100644 python/.gitignore
>>>>
>>>> diff --git a/python/.gitignore b/python/.gitignore
>>>> new file mode 100644
>>>> index 00000000000..e27c99e009c
>>>> --- /dev/null
>>>> +++ b/python/.gitignore
>>>> @@ -0,0 +1,19 @@
>>>> +# python bytecode cache
>>>> +*.pyc
>>>
>>> This is a duplicate from the parent .gitignore, so I would avoid it.
>>>
>>>> +__pycache__/
>>>
>>> And this one is interesting because, the only thing that *should* be
>>> in __pycache__ dirs is .pyc files (covered by the parent .gitignore
>>> file).
>>>
>>> So, I get the same behavior without these two entries here, so I would
>>> skip them.  Let me know if you have any reason for explicitly
>>> including them.
>>>
>>> - Cleber.
>>>
>>
>> Hm, not really ... Just completeness, I suppose, since this directory is
>> becoming increasingly separate from the rest of the tree.
>>
>> It isn't crucial, it just seemed like a weird omission if they weren't
>> listed here. *shrug*
>>
>> --js
> 
> And still, this dir is part of the overall tree.

For now 😇

                                                    Honestly, without
> any change in behavior, I'd *not* add those two ignore rules.
> 

If you insist.

--js


