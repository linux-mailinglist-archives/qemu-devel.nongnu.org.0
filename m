Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A1A2FB5C8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 12:51:52 +0100 (CET)
Received: from localhost ([::1]:52610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1pY6-00071D-3n
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 06:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1pWU-0006KP-3R
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:50:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1pWR-00024Z-G1
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611057005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+631dB54hObrupYubPtQkJyLL4fsiVTiIHAwNM3YpQ=;
 b=a5gBGH7rblHfU3/9o15hrxyC7nOEIHvPacNzLUKBIyPNwK4TLY0TCvPC+8ePD1qJQqUHp6
 CtrYfJBmy61pVQgCsYTT8ubHMum8Yk5oys0054dWvyRZFDiGj4kQ4+iAnZhmF6gQ2kye8j
 2/yVGDd09hLDq4KQzYTiBL3IXhooxEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-RHs7KWtXOpezIaSNoGA_3Q-1; Tue, 19 Jan 2021 06:50:02 -0500
X-MC-Unique: RHs7KWtXOpezIaSNoGA_3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C51A1005513;
 Tue, 19 Jan 2021 11:50:00 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-157.ams2.redhat.com [10.36.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60C5F189A4;
 Tue, 19 Jan 2021 11:49:49 +0000 (UTC)
Subject: Re: [PATCH v2 9/9] gitlab-ci: Add alpine to pipeline
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-10-jiaxun.yang@flygoat.com>
 <20210118101159.GC1789637@redhat.com>
 <fb7308f2-ecc7-48b8-9388-91fd30691767@www.fastmail.com>
 <307dea8e-148e-6666-c6f1-5cc66a54a7af@redhat.com>
 <20210118145016.GC1799018@redhat.com>
 <a9d9fb1d-f356-adb4-3763-a015e0d13320@redhat.com>
Message-ID: <a5b6e842-6a9d-c702-d369-d97b03f79e19@redhat.com>
Date: Tue, 19 Jan 2021 12:49:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a9d9fb1d-f356-adb4-3763-a015e0d13320@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 BALATON Zoltan via <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/2021 16.12, Thomas Huth wrote:
> On 18/01/2021 15.50, Daniel P. Berrangé wrote:
>> On Mon, Jan 18, 2021 at 03:44:49PM +0100, Thomas Huth wrote:
>>> On 18/01/2021 14.37, Jiaxun Yang wrote:
>>>>
>>>>
>>>> On Mon, Jan 18, 2021, at 6:11 PM, Daniel P. Berrangé wrote:
>>>>> On Mon, Jan 18, 2021 at 02:38:08PM +0800, Jiaxun Yang wrote:
>>>>>> We only run build test and check-acceptance as their are too many
>>>>>> failures in checks due to minor string mismatch.
>>>>>
>>>>> Can you give real examples of what's broken here, as that sounds
>>>>> rather suspicious, and I'm not convinced it should be ignored.
>>>>
>>>> Mostly Input/Output error vs I/O Error.
>>>
>>> Right, out of curiosity, I also gave it a try:
>>>
>>>   https://gitlab.com/huth/qemu/-/jobs/969225330
>>>
>>> Apart from the "I/O Error" vs. "Input/Output Error" difference, there also
>>> seems to be a problem with "sed" in some of the tests.
>>
>> The "sed" thing sounds like something that ought to be investigated
>> from a portability POV rather than ignored.
> 
> The weird thing is that we explicitly test for GNU sed in 
> tests/check-block.sh and skip the iotests if it's not available... so I'm a 
> little bit surprised that the iotests are run here with an apparently 
> different version of sed...?

Oh, well, I've fired up a bootable ISO image of Alpine, and ran "sed 
--version" and it says:

  This is not GNU sed version 4.0

Ouch. But I guess we could add a check for that to our tests/check-block.sh 
script, too...

  Thomas


