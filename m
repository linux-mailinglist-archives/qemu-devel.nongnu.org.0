Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE717323EAB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:47:55 +0100 (CET)
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEuWA-0004Mu-Kq
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEuLH-0007O7-8b
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:36:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEuLE-000694-FF
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614173795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGG2V4s4bSDDuXVhrt5ItpWZ2Cu+1z8tTsfqTBVFq1o=;
 b=bQJ7hKJ0W/lJW0xj5WbH0jGZTR9rh9efZnG5ErTkcwuPOOOyt8XWDbOG+QxDvUQi+ZdBsD
 YKjnMp7dQL/CcwGrOfy62nfuPIu9EHddCQGBEmEPRw85r5xjEzb6NS8I0xoYrPt9MVc1gG
 +7bjcq23Wyc9M9hA6M3NuIeon3btJoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-z4fxSk-gNwu-SytP04fPzg-1; Wed, 24 Feb 2021 08:36:33 -0500
X-MC-Unique: z4fxSk-gNwu-SytP04fPzg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 491B81433A1;
 Wed, 24 Feb 2021 13:32:22 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CD395D9D3;
 Wed, 24 Feb 2021 13:32:17 +0000 (UTC)
Subject: Re: Problem running functional tests from China
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <60118671-cd47-1900-59c6-96782dd7e26c@redhat.com>
 <20210224110605.GM6564@kitsune.suse.cz>
 <198ecefe-4d68-b43d-dfae-8a5ceeee9615@redhat.com>
 <20210224120140.GO6564@kitsune.suse.cz> <YDZBsz/FFZtRCokJ@redhat.com>
 <0de93d2b-32bb-d0eb-646c-e3a8bb1943a7@redhat.com>
 <YDZNKdD7ll2zoAk/@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <9fb3994b-e535-9dfa-c026-21b1463ab509@redhat.com>
Date: Wed, 24 Feb 2021 10:32:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDZNKdD7ll2zoAk/@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 avocado-devel <avocado-devel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/24/21 9:57 AM, Daniel P. Berrangé wrote:
> On Wed, Feb 24, 2021 at 01:48:25PM +0100, Philippe Mathieu-Daudé wrote:
>> On 2/24/21 1:08 PM, Daniel P. Berrangé wrote:
>>> On Wed, Feb 24, 2021 at 01:01:40PM +0100, Michal Suchánek wrote:
>>>> On Wed, Feb 24, 2021 at 12:37:53PM +0100, Philippe Mathieu-Daudé wrote:
>>>>> On 2/24/21 12:06 PM, Michal Suchánek wrote:
>>>>>> On Wed, Feb 24, 2021 at 10:29:15AM +0100, Philippe Mathieu-Daudé wrote:
>>>>>>> Just to inform the files hosted on github don't work when
>>>>>>> testing from China:
>>>>>>> raw.githubusercontent.com resolves to 127.0.0.1
>>>>> Actually not even localhost but 0.0.0.0 :)
>>>>>
>>>>>> And from where does this come from?
>>>>>>
>>>>>> Your local system, your ISP, ... ?
>>>>> Probably the ISP:
>>>>>
>>>> ...
>>>>> I raised that problem not to find a way to bypass an ISP
>>>>> firewall, but to see if there is a way to use another
>>>>> storage for test artifacts so all the community can run
>>>>> the tests.
>>>> I don't think protecting from random network malfunction is something
>>>> the qemu project can do.
>>>>
>>>> That said, downloading the test data during test run does indeed look
>>>> fragile.
>>>>
>>>> We have the concept of git submodules which is used in qemu extensively
>>>> so the test data could possibly be included directly in the git tree.
>>>>
>>>> The obvious downside is that the current and past test binaries will take
>>>> up disk space for all users that check out the repository, even those
>>>> that don't run the tests.
>>> We explicitly do not want to be distributing / including the
>>> images ourselves, as that makes the QEMU project responsible for
>>> license compliance and thus provision of full & corresponding source.
>> I am not asking that QEMU redistribute these files, I'm asking to the
>> community if someone know an alternative to store files so we can run
>> QEMU tests in Chinese cloud farms.
>>
>> Back to your comment, should we remove these tests?
> No, I don't think that we should do that.
>
> If someone has broken ISP and they need to run all tests, then they'll
> need to use a VPN.
>
> Regardless of that though, we should make sure that tests automatically
> mark themselves as "skipped" if any downloading of assets fails. ie a
> download failure shouldn't cause tests to report failure.

That is the current behavior, tests are marked "CANCEL" in case the 
download failed.

PS: canceled tests don't change the overall status of the job.

- Wainer

>
> Regards,
> Daniel


