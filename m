Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D51C31DD85
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 17:43:32 +0100 (CET)
Received: from localhost ([::1]:40314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCPvH-0006UG-ML
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 11:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCPsJ-00052P-Hi
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:40:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCPsG-0000gL-S6
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:40:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613580023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FRAjaoZbfHiWZ9xbtK9hTm0aXjgbOqoCxtKsIXunXko=;
 b=C3bUN3urTsOY45HHGNWBFO5yPuXqQGBP7BpP7fVLwIvZFuDTpWYdVsYW8P/DIrmsF/oR7t
 H996Akjii0yzeUwi4BnbnvtslKrT8bFtnYl28qXLmOzXlgsNX91MB6e0ongt7fG8rP4HN+
 kNgSFG1nCw+UuQhTqbzG50ZnO2zp1RM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-O0pbxu9eOhuog6ElVL1sWw-1; Wed, 17 Feb 2021 11:40:19 -0500
X-MC-Unique: O0pbxu9eOhuog6ElVL1sWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93493801975;
 Wed, 17 Feb 2021 16:40:18 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71B3010013D7;
 Wed, 17 Feb 2021 16:40:11 +0000 (UTC)
Subject: Re: [PATCH v4 15/24] python: add mypy to pipenv
To: Cleber Rosa <crosa@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-16-jsnow@redhat.com>
 <YCyd1jN4e3VxHSkx@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <c27419a2-08c8-0048-5bc2-ece51de95ae2@redhat.com>
Date: Wed, 17 Feb 2021 11:40:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YCyd1jN4e3VxHSkx@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 11:38 PM, Cleber Rosa wrote:
> On Thu, Feb 11, 2021 at 01:58:47PM -0500, John Snow wrote:
>> 0.730 appears to be about the oldest version that works with the
>> features we want, including nice human readable output (to make sure
>> iotest 297 passes), and type-parameterized Popen generics.
>>
>> 0.770, however, supports adding 'strict' to the config file, so require
>> at least 0.770.
>>
>> Now that we are checking a namespace package, we need to tell mypy to
>> allow PEP420 namespaces, so modify the mypy config as part of the move.
>>
>> mypy can now be run from the python root by typing 'mypy qemu'.
>>
> 
>   $ mypy qemu
>   qemu/utils/accel.py: error: Source file found twice under different module names: 'qmp' and 'qemu.qmp'
>   Found 1 error in 1 file (errors prevented further checking)
> 
> I guess you meant 'mypy -p qemu'.
> 

Ah, crud! Yes, this is something that has popped up recently.

mypy's "figure out where we are when run without arguments" 
functionality does not work exactly correct in some cases.

I forget the specifics, but "mypy qemu" used to work for this series, 
and at some point it ... stopped working. I updated the pytest 
invocation, but I didn't update the comments here.

There's a github meta-issue about this, and about how mypy's package 
discovery is extremely confusing:

https://github.com/python/mypy/issues/8584

It's extremely a big landmine on which you may hoist yourself.

>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/Pipfile      |  1 +
>>   python/Pipfile.lock | 37 ++++++++++++++++++++++++++++++++++++-
>>   python/setup.cfg    |  1 +
>>   3 files changed, 38 insertions(+), 1 deletion(-)
>>
> 
> With that change,
> 
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>
> 


