Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857D231128A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 21:33:40 +0100 (CET)
Received: from localhost ([::1]:43116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l87nP-0007mH-1N
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 15:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l87ll-000726-7U
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:31:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l87lf-0003LZ-42
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612557108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTxifm2ySGD0U26rJ7d7dyCXsdvUIAViyfMQs17cUmw=;
 b=NoVxG80+x26M1MbFJ6RpsmGK4SdBUUsq8zvhCsJ7VwRepb5G3lyGftFrX9RNc1FqNI87qi
 JxO2ldj1LX71PUekcDwugQlWvGBYRd1kVHPHARLBGj+gku2JIGTp4snhe2o24en/4SKgQF
 6zFQru8jZOGl2ZR5VCc/2SVLTRrP0J4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-IA03hnvdMxelsakYIXnDTw-1; Fri, 05 Feb 2021 15:31:46 -0500
X-MC-Unique: IA03hnvdMxelsakYIXnDTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EA62192D787;
 Fri,  5 Feb 2021 20:31:45 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 417BE10021AA;
 Fri,  5 Feb 2021 20:31:41 +0000 (UTC)
Subject: Re: acceptance-system-fedora and acceptance-system-centos failing
 sporadically with timeout?
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 avocado-devel <avocado-devel@redhat.com>
References: <7da911b5-40d3-fd3b-768f-862c07f879ba@suse.de>
 <68c85b98-6a4b-13a7-ae86-8a63013549a7@redhat.com>
 <a3d25c79-0cf0-6c8e-7346-68d775e14e50@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <ce8b4da1-4467-53e0-9dcb-203535fd5b96@redhat.com>
Date: Fri, 5 Feb 2021 15:31:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a3d25c79-0cf0-6c8e-7346-68d775e14e50@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 11:43 AM, Philippe Mathieu-Daudé wrote:
> Cc'ing Avocado team & John (Python inferior exit delay?).
> 
> On 1/28/21 11:10 AM, Thomas Huth wrote:
>> On 28/01/2021 10.45, Claudio Fontana wrote:
>>>
>>> is it just me, or is the CI sometimes failing with timeout?
>>>
>>> Fedora:
>>> https://gitlab.com/hw-claudio/qemu/-/jobs/986936506
>>
>> I've sent a patch for that issue just yesterday:
>>
>>   https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06852.html
>>
>>> CentOS:
>>> https://gitlab.com/hw-claudio/qemu/-/jobs/980769080
>>
>> Never seen that one before - if you hit it again, could you please save
>> the artifacts and have a look at the log file in there to see what's
>> exactly the problem?
> 
> https://gitlab.com/philmd/qemu/-/jobs/1008007125
> 
>   (28/36)
> tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_ppc_mac99:
> ERROR: Test reported status but did not finish (90.09 s)
> 
> Attached debug.log.
> 

¯\_(ツ)_/¯

I don't know what "reported status but did not finish" means.

The debug log looks like it passes, too, so... I don't know that this 
has much do with code I maintain yet. I'm sure the Avocado team will 
find me if I am wrong :)

--js


