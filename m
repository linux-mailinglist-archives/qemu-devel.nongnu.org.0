Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5653420F2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 16:28:30 +0100 (CET)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNH37-0005hb-65
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 11:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lNH26-0004yw-16
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 11:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lNH24-0000RM-9c
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 11:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616167643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/YI2sLH5O7vRZj/FhxbkaAE6jVfQ/U2crRwjJsktYes=;
 b=FCu6I+n5iT0NNYl301P1sDd3RV6m9AA0iWgpzrzuLIZ61HHnb7IE66I/usdMGnNpBwQAjM
 bnroUQOh5til5ALFgDsBv20CDlRcg9UnYOGL2/wFT2BIwhRdcjjRvzI5m0xC97dYP1Nt6O
 VKfryA5jwmHPiqPaeHB8sdHw/O9asR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-rs1CaJHhMmOkNcOI-ymzSQ-1; Fri, 19 Mar 2021 11:27:20 -0400
X-MC-Unique: rs1CaJHhMmOkNcOI-ymzSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 738998189DD;
 Fri, 19 Mar 2021 15:27:19 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-73.gru2.redhat.com
 [10.97.116.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5E645D9E3;
 Fri, 19 Mar 2021 15:27:13 +0000 (UTC)
Subject: Re: Serious doubts about Gitlab CI
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
Date: Fri, 19 Mar 2021 12:27:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 3/19/21 8:34 AM, Philippe Mathieu-Daudé wrote:
> On 3/19/21 11:59 AM, Paolo Bonzini wrote:
>> On 19/03/21 11:18, Andrew Jones wrote:
>>>> Yikes, that is 41 hours per CI run. I wonder if GitLab's CI minutes are
>>>> on slow machines or if we'll hit the same issue with dedicated runners.
>>>> It seems like CI optimization will be necessary...
>>>>
>>> We need to reduce the amount of CI we do, not only because we can't
>>> afford
>>> it, but because it's wasteful. I hate to think of all the kWhs spent
>>> testing the exact same code in the exact same way, since everyone runs
>>> everything with a simple 'git push'.
>> Yes, I thought the same.
>>
>>> IMHO, 'git push' shouldn't trigger
>>> anything. Starting CI should be an explicit step.
> * tests/acceptance: Only run tests tagged 'gating-ci' on GitLab CI
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg756464.html
>
> * gitlab-ci: Allow forks to select & restrict build jobs
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg758331.html

In my opinion that series is the first step towards a smart CI. It got 
some reviews of Thomas and myself already but it didn't move ahead. If 
Philippe for some reason cannot continue that work, I'm volunteering to 
take it over.

- Wainer

>
>> It is possible to do that on a project that uses merge requests, for
>> example like this:
>>
>> workflow:
>>    rules:
>>      - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
>>      - if: '$CI_COMMIT_BRANCH
>>        when: never
>>
>> For us it's a bit more complicated (no merge requests).
>>
>> Another common feature is failing the pipeline immediately if one of the
>> jobs fail, but GitLab does not support it
>> (https://gitlab.com/gitlab-org/gitlab/-/issues/23605).
>>
>>> Also, the default CI
>>> should only trigger tests associated with the code changed. One should
>>> have to explicitly trigger a complete CI when they deem it worthwhile.
>> This is interesting.  We could add a stage that looks for changed files
>> using "git diff" and sets some variables (e.g. softmmu, user, TCG,
>> various targets) based on the results.  Then you use those to skip some
>> jobs or some tests, for example skipping check-tcg.  See
>> https://docs.gitlab.com/ee/ci/variables/#inherit-cicd-variables for more
>> information.
>>
>> Paolo
>>
>>


