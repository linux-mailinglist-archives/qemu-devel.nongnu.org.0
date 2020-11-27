Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1179D2C6B9D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 19:31:37 +0100 (CET)
Received: from localhost ([::1]:56070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiiWu-0007w4-2R
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 13:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kiiV9-0007On-Uo
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:29:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kiiV6-0007Bc-Im
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606501783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c95/BQD1reQkyYDwgTsy9qz62mODFanT+OiCLgDY0z8=;
 b=BLBzbNMQtSV/I2eqxyFsUP2bSyuoOq0Moe61G51RDsDLfWIp9Kqdbnpyrtv50ttALSZHNv
 ekGZ8NtAZiLYI5SGbRn6EaDDozUQrvk5T/ToTuu47mMtdmEnizCxwW4sGmOKqQMXBbXw52
 NcpJER9XtU9TdB723AQxeXOiLgmePUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-kXflL9XMPHOnMB4oQYAM_g-1; Fri, 27 Nov 2020 13:29:41 -0500
X-MC-Unique: kXflL9XMPHOnMB4oQYAM_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FBDA802B48;
 Fri, 27 Nov 2020 18:29:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-70.ams2.redhat.com [10.36.113.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 770BC60BF1;
 Fri, 27 Nov 2020 18:29:32 +0000 (UTC)
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>
References: <20201127174110.1932671-1-philmd@redhat.com>
 <b08db31b-1411-6936-f737-0d6c8f98ebb8@redhat.com>
 <f32a1db5-5231-fc4d-1741-0b5ee13f618f@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9157dce0-4f5d-3f1e-ce75-3e9da9252203@redhat.com>
Date: Fri, 27 Nov 2020 19:29:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f32a1db5-5231-fc4d-1741-0b5ee13f618f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/2020 18.57, Philippe Mathieu-Daudé wrote:
> On 11/27/20 6:47 PM, Thomas Huth wrote:
>> On 27/11/2020 18.41, Philippe Mathieu-Daudé wrote:
>>> We lately realized that the Avocado framework was not designed
>>> to be regularly run on CI environments. Therefore, as of 5.2
>>> we deprecate the gitlab-ci jobs using Avocado. To not disrupt
>>> current users, it is possible to keep the current behavior by
>>> setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
>>> (see [*]).
>>> From now on, using these jobs (or adding new tests to them)
>>> is strongly discouraged.
>>>
>>> Tests based on Avocado will be ported to new job schemes during
>>> the next releases, with better documentation and templates.
>>
>> Why should we disable the jobs by default as long as there is no replacement
>> available yet?
> 
> Why keep it enabled if it is failing randomly

We can still disable single jobs if they are not stable, but that's no
reason to disable all of them by default, is it?

> if images hardcoded
> in tests are being removed from public servers, etc...?

That's independent from Avocado, you'll always have that problem if you want
to test with external images, unless you mirror them into a repository on
the same server (ie. gitlab), which, however, might not always be possible...

> They are not disabled, they are still runnable manually or setting
> QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE...

And who do you think is going to set that variable? Hardly anybody, I guess.
So you could also simply remove the stuff from the yml file completely instead.

> We realized by default Avocado runs all tests on the CI jobs,
> triggering failures and complains. Developer stopped to contribute/
> review integration tests because of that.

Did anybody really stop contributing "acceptance" test since they were
afraid of the gitlab-CI running them? That's new to me, do you have a pointer?

> We want developers be
> able to contribute tests to the repository fearlessly.

You can always mark your test with @skipIf(os.getenv('GITLAB_CI')) if you
don't want to see it running in the gitlab-CI, so that's not a reason to be
afraid.

> If we don't change anything, we'll keep having CI failures due
> to Avocado design issues (artifacts removed from remote servers,
> etc...).

I fail to see the relation between Avocado and vanishing artifacts from 3rd
party servers... what do you plan to do instead if something gets (re-)moved
from a server that is not under our control?

> I haven't seen any attempt on this list to improve the current
> fragile situation, but better suggestions are certainly welcome.

At least I am hoping that the "check-acceptance" tests will break a little
bit less often once Peter uses the gitlab-CI for his gating tests, too. That
will at least prevent that one of the tests gets completely broken by a new
merged pull request. Of course there's still the risk that tests only fail
occasionally due to new bugs, but that can also happen for all other test
suites (unit, qtest, iotests, ...), too.

 Thomas


