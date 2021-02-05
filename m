Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBF1310E77
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:20:47 +0100 (CET)
Received: from localhost ([::1]:47836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84mk-0001U0-9O
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:20:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l84Iu-0004kX-Ub
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:49:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l84Is-0007jD-ED
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:49:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612543793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eimman1xMfVALRuN07lNypgiKc2LrKqyrtig3fMC98Y=;
 b=PfFEkvYI4O4w709A5TsuxOHn+yN9osILtiGTMTBdBJR+B5TiqpC/QrjueNHv6RWde4NWs+
 HafPyo0QHwtgTsbzx4Y+R0M3jPUNwOCSYnpQ4GC0KQDwPLnN3tv1kxo17zX3osMl+F/hHv
 sj+RTK3wViYmKXnCiDxj1vWlUd/OCHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-8obJ88CTO-6CcXLRQ2rmzg-1; Fri, 05 Feb 2021 11:49:49 -0500
X-MC-Unique: 8obJ88CTO-6CcXLRQ2rmzg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4FC4100CC89;
 Fri,  5 Feb 2021 16:49:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F1BB722F0;
 Fri,  5 Feb 2021 16:49:35 +0000 (UTC)
Subject: Re: acceptance-system-fedora and acceptance-system-centos failing
 sporadically with timeout?
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, avocado-devel <avocado-devel@redhat.com>
References: <7da911b5-40d3-fd3b-768f-862c07f879ba@suse.de>
 <68c85b98-6a4b-13a7-ae86-8a63013549a7@redhat.com>
 <a3d25c79-0cf0-6c8e-7346-68d775e14e50@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dee3488c-ca1d-24bc-5900-117992d30013@redhat.com>
Date: Fri, 5 Feb 2021 17:49:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a3d25c79-0cf0-6c8e-7346-68d775e14e50@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alex Bennee <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/02/2021 17.43, Philippe Mathieu-Daudé wrote:
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

That's again the failing test on the mac99 machine where I've already sent a 
patch for. I'm looking for a log of the failing or1k machine that Claudio 
has experienced in the CentOS pipeline.

  Thomas


