Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35C323356
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 22:36:21 +0100 (CET)
Received: from localhost ([::1]:37892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEfLw-0002C1-Ip
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 16:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEfKf-0001ef-4h
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:35:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEfKc-0008MD-7Q
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614116096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ioMHxitY9UNAoIpGhDlBin8w77qo1R4wHvhl5zk76mg=;
 b=h9oOZC4k6xqv7U4BxQyj7rSpPjRSPXMZuVJChSr8TTJeCPJnSsFnMCBuOtA8J/1hIIyUYg
 eFRx78/AmmYUBCAP3wVCVPJFU7AF4czRtrOKquHf5vs4bbB4eq1BpjnlDqZQ5jCaSp35jK
 m6Am3Mb4G1S+muKSxVcwlp7mTv3HVhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-DYeAW0gBPEe0ELFt28QXhQ-1; Tue, 23 Feb 2021 16:34:54 -0500
X-MC-Unique: DYeAW0gBPEe0ELFt28QXhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 488EF107ACF5;
 Tue, 23 Feb 2021 21:34:53 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14AF519C46;
 Tue, 23 Feb 2021 21:34:44 +0000 (UTC)
Subject: Re: [PATCH v5 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-2-crosa@redhat.com>
 <3f0a3854-425d-27e7-d466-f6f4db4dd9aa@redhat.com>
 <e884e35a-cb4c-059b-7b67-1c69f7869347@redhat.com>
 <20210223164718.GA987581@amachine.somewhere> <YDU/PgzQCaY10Udl@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <4e479647-390c-cb86-458d-18c412b1d37b@redhat.com>
Date: Tue, 23 Feb 2021 18:34:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDU/PgzQCaY10Udl@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Andrea Bolognani <abologna@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/23/21 2:45 PM, Daniel P. Berrangé wrote:
> On Tue, Feb 23, 2021 at 11:47:18AM -0500, Cleber Rosa wrote:
>> On Tue, Feb 23, 2021 at 05:37:04PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 2/23/21 12:25 PM, Thomas Huth wrote:
>>>> On 19/02/2021 22.58, Cleber Rosa wrote:
>>>>> As described in the included documentation, the "custom runner" jobs
>>>>> extend the GitLab CI jobs already in place.  One of their primary
>>>>> goals of catching and preventing regressions on a wider number of host
>>>>> systems than the ones provided by GitLab's shared runners.
>>>>>
>>>>> This sets the stage in which other community members can add their own
>>>>> machine configuration documentation/scripts, and accompanying job
>>>>> definitions.  As a general rule, those newly added contributed jobs
>>>>> should run as "non-gating", until their reliability is verified (AKA
>>>>> "allow_failure: true").
>>>>>
>>>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>>>> ---
>>>>>    .gitlab-ci.d/custom-runners.yml | 14 ++++++++++++++
>>>>>    .gitlab-ci.yml                  |  1 +
>>>>>    docs/devel/ci.rst               | 28 ++++++++++++++++++++++++++++
>>>>>    docs/devel/index.rst            |  1 +
>>>>>    4 files changed, 44 insertions(+)
>>>>>    create mode 100644 .gitlab-ci.d/custom-runners.yml
>>>>>    create mode 100644 docs/devel/ci.rst
>>>>>
>>>>> diff --git a/.gitlab-ci.d/custom-runners.yml
>>>>> b/.gitlab-ci.d/custom-runners.yml
>>>>> new file mode 100644
>>>>> index 0000000000..3004da2bda
>>>>> --- /dev/null
>>>>> +++ b/.gitlab-ci.d/custom-runners.yml
>>>>> @@ -0,0 +1,14 @@
>>>>> +# The CI jobs defined here require GitLab runners installed and
>>>>> +# registered on machines that match their operating system names,
>>>>> +# versions and architectures.  This is in contrast to the other CI
>>>>> +# jobs that are intended to run on GitLab's "shared" runners.
>>>>> +
>>>>> +# Different than the default approach on "shared" runners, based on
>>>>> +# containers, the custom runners have no such *requirement*, as those
>>>>> +# jobs should be capable of running on operating systems with no
>>>>> +# compatible container implementation, or no support from
>>>>> +# gitlab-runner.  To avoid problems that gitlab-runner can cause while
>>>>> +# reusing the GIT repository, let's enable the recursive submodule
>>>>> +# strategy.
>>>>> +variables:
>>>>> +  GIT_SUBMODULE_STRATEGY: recursive
>>>> Is it really necessary? I thought our configure script would take care
>>>> of the submodules?
>> I've done a lot of testing on bare metal systems, and the problems
>> that come from reusing the same system and failed cleanups can be very
>> frustrating.  It's unfortunate that we need this, but it was the
>> simplest and most reliable solution I found.  :/
> Hmmm, this makes it sound like the job is not being run in a
> fresh pristine checkout. IMHO we need to guarantee that in
> general, at which point submodules should "just work", unless
> the running is blocking network access ?

Setting the git strategy may work out:

https://docs.gitlab.com/ee/ci/runners/README.html#git-strategy

- Wainer

>
>
>
> Regards,
> Daniel


