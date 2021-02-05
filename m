Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03913101DE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 01:52:11 +0100 (CET)
Received: from localhost ([::1]:57384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7pM2-0003LL-7z
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 19:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7pJl-0002B7-UK
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 19:49:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7pJi-00022Y-7a
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 19:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612486184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLTNRrzP2IMBcT20ZznMX9a2Yl4rhnxequXcc1SFyEI=;
 b=bNK28rM+Z576OKgKXMWrTj5T1ggDCwqjERZoT46Bp7sYv5EWLBYHUAjc4QyKh8ToKMrwqD
 +h3M3HY2DT1Cgig8M483T9MgWSd1j3V06n0hp6Ch8OePS7z+TYqoPYYG5ZUWFbKkVcOJyc
 UatUqksHQ+Oq77v74rsRSjighYIBJoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-GNrBeqWDPo-8nSXOjPyr0w-1; Thu, 04 Feb 2021 19:49:41 -0500
X-MC-Unique: GNrBeqWDPo-8nSXOjPyr0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D0778030B7;
 Fri,  5 Feb 2021 00:49:40 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81CF260BE2;
 Fri,  5 Feb 2021 00:49:39 +0000 (UTC)
Subject: Re: [PATCH] README: Add Documentation blurb
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201104193032.1319248-1-jsnow@redhat.com>
 <16d9f8d6-170d-633e-6c52-a6f3ee1de6fb@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <9d31519b-76ca-38a7-4c26-06c98d4d578b@redhat.com>
Date: Thu, 4 Feb 2021 19:49:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <16d9f8d6-170d-633e-6c52-a6f3ee1de6fb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 9:07 AM, Thomas Huth wrote:
> On 04/11/2020 20.30, John Snow wrote:
>> Add it in a prominent place: Right after figuring out what QEMU is,
>> users may wish to know how to use it more than they want to know how to
>> build their own version of it.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   README.rst | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/README.rst b/README.rst
>> index 58b9f2dc15c4..758ea8fd2ff0 100644
>> --- a/README.rst
>> +++ b/README.rst
>> @@ -31,6 +31,17 @@ QEMU as a whole is released under the GNU General 
>> Public License,
>>   version 2. For full licensing details, consult the LICENSE file.
>> +Documentation
>> +=============
>> +
>> +Documentation can be found hosted online at
>> +`<https://www.qemu.org/documentation/>`_. The documentation for the
>> +current development version that is available at
>> +`<https://www.qemu.org/docs/master/>`_ is generated from the ``docs/``
> 
> That URL is now redirecting to https://qemu.readthedocs.io/en/latest/ 
> ... could you maybe update your patch and resend?
> 
>   Thanks,
>    Thomas

does "v: latest" on readthedocs mean 5.2.0 or the current development 
head? Looks like the current development head.

https://www.qemu.org/documentation/ points to /docs/master, which is why 
I took that link. Is it worth updating that link, too? The website in 
particular should be rephrased to point to the latest stable release 
docs as a default, I suspect.

The README should probably keep pointing to the latest development docs.

--js


