Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4E031D44D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 04:40:16 +0100 (CET)
Received: from localhost ([::1]:50130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCDhH-0000R0-Cv
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 22:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCDfn-0007vz-Rp
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCDfm-0002lX-7z
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613533121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k4ExN99/jA0q01ANYcGKIWOwqUFvxLTsNiQcxDKAZ2M=;
 b=X7U/UFVw+jiYLOFR3aLmSdnMl5lAvbCgRJP+Csv/iPnGl6vIIjqkytueTrKPByOZR1yTQS
 mRENJ9nhjk403O72QVrzUUy7UL3eTyZhNkuFZWNQwvXFO0EHZ7GQlgot/PeFxW7TBHJARI
 B/TgSMwbLYQ7iMi9OyBByV/0KAtuzgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-w31LwqlzMaSvPQS0dftLuw-1; Tue, 16 Feb 2021 22:38:38 -0500
X-MC-Unique: w31LwqlzMaSvPQS0dftLuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7405C28F;
 Wed, 17 Feb 2021 03:38:36 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4F296A03C;
 Wed, 17 Feb 2021 03:38:31 +0000 (UTC)
Subject: Re: [PATCH v4 05/24] python: add qemu package installer
To: Cleber Rosa <crosa@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-6-jsnow@redhat.com>
 <YCx+CY3SPhnVtSgr@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <f37068cb-f9e4-c763-b78e-83b08932b232@redhat.com>
Date: Tue, 16 Feb 2021 22:38:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YCx+CY3SPhnVtSgr@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On 2/16/21 9:23 PM, Cleber Rosa wrote:
> On Thu, Feb 11, 2021 at 01:58:37PM -0500, John Snow wrote:
>> Add setup.cfg and setup.py, necessary for installing a package via
>> pip. Add a rst document explaining the basics of what this package is
> 
> Nitpick 1: setup.cfg and setup.py are indeed used by pip, your
> statement is correct.  But, it hides the fact that these can be used
> without pip.  On a source tree based install, you may want to simply
> use "python setup.py develop" to achieve what "pip install -e" would
> do (without pip ever entering the picture).
> 

This is intentional. pip and setup.py actually use different pathways 
that are not identical. I do not recommend you call setup.py directly 
anymore. Once pyproject.toml is more widespread, there won't even *be* a 
setup.py.

> Nitpick 2: while most people will understand what you mean by "rst
> document", I believe that "Add a README file in reStructuredText
> format" would be more obvious.
> 

Sure.

>> for and who to contact for more information. This document will be used
>> as the landing page for the package on PyPI.
>>
>> I am not yet using a pyproject.toml style package manifest, because
>> "editable" installs are not defined by PEP-517 and pip did not have
>> support for this for some time; I consider the feature necessary for
>> development.
>>
> 
> I'm glad you kept it like this... I bet there's going to be another
> PEP out, replacing the status quo, by the time I finish this review.
> 

Actually, between writing this series last year and this latest respin, 
pip supports editable installs for pyproject.toml distributions now :)

...but I was still hesitant to take the leap, because maybe that's still 
too modern for the 3.6-based distributions we target and support.

...And I left the message alone, because I didn't re-research the exact 
reason I'm not using pyproject.toml now. Eh.

>> Use a light-weight setup.py instead.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/PACKAGE.rst | 32 ++++++++++++++++++++++++++++++++
>>   python/setup.cfg   | 19 +++++++++++++++++++
>>   python/setup.py    | 23 +++++++++++++++++++++++
>>   3 files changed, 74 insertions(+)
>>   create mode 100644 python/PACKAGE.rst
>>   create mode 100644 python/setup.cfg
>>   create mode 100755 python/setup.py
>>
>> diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
>> new file mode 100644
>> index 00000000000..0e714c87eb3
>> --- /dev/null
>> +++ b/python/PACKAGE.rst
>> @@ -0,0 +1,32 @@
>> +QEMU Python Tooling
>> +===================
>> +
>> +This package provides QEMU tooling used by the QEMU project to build,
>> +configure, and test QEMU. It is not a fully-fledged SDK and it is subject
>> +to change at any time.
>> +
>> +Usage
>> +-----
>> +
>> +The ``qemu.qmp`` subpackage provides a library for communicating with
>> +QMP servers. The ``qemu.machine`` subpackage offers rudimentary
>> +facilities for launching and managing QEMU processes. Refer to each
>> +package's documentation
>> +(``>>> help(qemu.qmp)``, ``>>> help(qemu.machine)``)
>> +for more information.
>> +
> 
> This gives the impression that those are the only subpackages (and
> they were).  Better to reword it taking into account the qemu.utils
> subpackage and possibly others (leave it open so that it doesn't rot
> so quickly).
> 

Intentional again. I don't, for the moment, consider that utils package 
something "supported" in the public sense, so I didn't feel the urge to 
draw attention to it.

> - Cleber.
> 


