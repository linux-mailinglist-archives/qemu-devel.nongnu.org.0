Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E384B452DBC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 10:17:17 +0100 (CET)
Received: from localhost ([::1]:40754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmuaa-0008Bw-S6
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 04:17:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mmuYp-0007OW-SR
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:15:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mmuYn-0007YM-1n
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637054124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPpvBOtbgQZAhLE6TqQWOHQ/fYMAYsK2kbi4Aix7kDU=;
 b=RcouJ383JvLsCppRBE5STTJUPoqW6/OmOOTLV7jE8bg2YKA6Tnhr4kCKHv2PrtCLrrUAXO
 IA3SlkVN1IMjQGT+BKenSjWLLu0Ski0hr3twvQMS4KaN3rm7ShTHQwayKHuTcOnctp2jDy
 I3ZnlyUZUfL15GK6mKEGCKTCWlQz1Q8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-g4kxrbzJO1GDIjsd09ZNEQ-1; Tue, 16 Nov 2021 04:15:21 -0500
X-MC-Unique: g4kxrbzJO1GDIjsd09ZNEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65B7918125CC;
 Tue, 16 Nov 2021 09:15:20 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 081EE5D6BA;
 Tue, 16 Nov 2021 09:15:18 +0000 (UTC)
Message-ID: <938ec78f-1ca1-f3df-26be-790e53d9cc7e@redhat.com>
Date: Tue, 16 Nov 2021 10:15:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Cirrus-CI all red
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <701011ce-8bc1-9e93-82ed-a4d72c70b2da@redhat.com>
 <4e540821-9bc2-77b5-ad70-ebc5df53e039@redhat.com>
 <YYpF4coXvnStffD5@redhat.com> <87fss5k1lv.fsf@linaro.org>
 <YYpcR/SBHNlqj5CV@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YYpcR/SBHNlqj5CV@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Ed Maste <emaste@freebsd.org>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/11/2021 12.32, Daniel P. Berrangé wrote:
> On Tue, Nov 09, 2021 at 11:27:42AM +0000, Alex Bennée wrote:
>>
>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>
>>> On Tue, Nov 09, 2021 at 10:45:18AM +0100, Thomas Huth wrote:
>>>> On 09/11/2021 10.39, Philippe Mathieu-Daudé wrote:
>>>>> FYI, as of today, the latest merge history is red (last 10 days):
>>>>> https://cirrus-ci.com/github/qemu/qemu
>>>>>
>>>>> If we want to keep using this, we should somehow plug it to
>>>>> GitLab-CI (i.e. Travis-CI is run as an external job there) so
>>>>> the project maintainer can notice job failures.
>>>>
>>>> Well, considering that all the cirrus-run based jobs are currently failing
>>>> due to the non-working API token, that does not seem to work very well
>>>> either.
>>>
>>> Who owns the API token ? For other projects, this was addressed a while
>>> ago by refreshing the token. I would have tried this myself for QEMU
>>> but I don't have privileges on the QEMU projects in github/gitlab.
>>
>> OK I've updated the token (after I figured out the path to it):
>>
>>    - top right, Settings
>>    - scroll to bottom "Your GitHub Organizations"
>>    - click gear icon
>>    - scroll to API settings, click Generate New Token
>>
>> It seems to be triggering the builds now although GitLab still reports
>> failures for some other reason now.
> 
> The cirrus-run image we're using is lockde to version 0.3.0. I'm
> testing an update to version 0.5.0 which has various reliability
> fixes, essentially around making it retry on transient errors.

We should maybe also simply bump the timeout for the cirrus jobs ... 
sometimes they get delayed and just need a little bit more than 60 minutes 
to finish ... so would it be OK to us 70 or 80 minutes here?

  Thomas


