Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B38539A2E0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:14:11 +0200 (CEST)
Received: from localhost ([::1]:59520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loo6s-0006BL-6L
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loo5l-0005Sx-7r
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loo5i-00077g-Sa
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622729577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7mB1DwRxZ6CtO7TJUuEG49GqBnu4whMHyNxFV0863U=;
 b=iakNNx6s580zPKQPMUvTZ2g5vlH+D6fIUioB+va79taDE+mYI+YLDDXxtpjbT/cH/Xvvvj
 vAPa4L3N5NUAsA11RwqUNVf53mfDW1urtMC7+IlolTrGQl1rHEDz28OrtOSz3/dyH7FU4Q
 2cgyThvKedv/H+dX/8b3W2+fFaN2NFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-Hkf87-QbM1mOPK0RcdjZTQ-1; Thu, 03 Jun 2021 10:12:54 -0400
X-MC-Unique: Hkf87-QbM1mOPK0RcdjZTQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 414326D246;
 Thu,  3 Jun 2021 14:12:53 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE11910023AB;
 Thu,  3 Jun 2021 14:12:21 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] GitLab: Add "Bug" issue reporting template
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210603001129.1319515-1-jsnow@redhat.com>
 <20210603001129.1319515-2-jsnow@redhat.com>
 <YLiWt21tQdFJo/4c@stefanha-x1.localdomain> <YLie2HCFd5asHyga@redhat.com>
 <YLjCc37t9meGQZ1q@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <5713fc0b-7b49-6931-b293-8e79e4df5439@redhat.com>
Date: Thu, 3 Jun 2021 10:12:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLjCc37t9meGQZ1q@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 7:52 AM, Stefan Hajnoczi wrote:
> On Thu, Jun 03, 2021 at 10:20:24AM +0100, Daniel P. Berrangé wrote:
>> On Thu, Jun 03, 2021 at 09:45:43AM +0100, Stefan Hajnoczi wrote:
>>> On Wed, Jun 02, 2021 at 08:11:28PM -0400, John Snow wrote:
>>>> Based loosely on libvirt's template, written by Peter Krempa.
>>>>
>>>> CC: Peter Krempa <pkrempa@redhat.com>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>   .gitlab/issue_templates/bug.md | 63 ++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 63 insertions(+)
>>>>   create mode 100644 .gitlab/issue_templates/bug.md
>>>>
>>>> diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
>>>> new file mode 100644
>>>> index 00000000000..9445777252b
>>>> --- /dev/null
>>>> +++ b/.gitlab/issue_templates/bug.md
>>>> @@ -0,0 +1,63 @@
>>>> +<!--
>>>> +This is the upstream QEMU issue tracker.
>>>> +
>>>> +Before submitting a bug, please attempt to reproduce your problem using
>>>> +the latest development version of QEMU, built from source. See
>>>> +https://www.qemu.org/download/#source for instructions on how to do
>>>> +this.
>>>
>>> It's likely that those unfamiliar with QEMU, especially non-developers,
>>> won't be able to do this:
>>>
>>> The wording requires the reader to figure out that "latest development
>>> version of QEMU" is none of the big 6.0.0, 5.2.0, etc download links at
>>> the top of the page but the small text "The latest development happens
>>> on the master branch" sentence below the fold. Then they need to look
>>> around the page to find out how to download the master branch and build
>>> from source.
>>>
>>> I suggest referring directly to the build instructions instead of
>>> requiring the reader to make several connections in order to do what
>>> we're (indirectly) asking:
>>>
>>>    Before submitting a bug, please attempt to reproduce the problem with
>>>    the latest qemu.git master built from source. See the "To download and
>>>    build QEMU from git" section at https://www.qemu.org/download/#source
>>>    for instructions.
>>
>> I do wonder if this will discourage people from submitting  a bug report,
>> if they're unable to actually do this. We have a fairly frequent stream
>> of users who seek help trying to build QEMU - usually they fail to even
>> get the right depedancies installed.
>>
>> Perhaps word it so it doesn't come across as such a strict sounding
>> requirement ? I'm not entirely happy with the below text, but something
>> more forgiving like:
>>
>>     If you are able to, it will facilitate QEMU bug triage if an attempt
>>     is made to reproduce the problem with the latest qemu.git master
>>     built from source. ...etc..
> 
> Sounds good.
> 
> Stefan
> 

I agree, thank you for this suggestion. I will work this in.

--js


