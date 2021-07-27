Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE753D70EE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 10:11:23 +0200 (CEST)
Received: from localhost ([::1]:57162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8IBO-0007cE-Ex
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 04:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8I9H-0006DJ-M1
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:09:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8I9C-0003Lg-C1
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627373344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwliveE3vtlmj/y+O0bhlRBjHclCQzz8vHUhqWQcSMk=;
 b=Uin2FignKo+kAInXwRpmMTwh76SUSxFbyR9XiRvMY/q807B3Wv4bvDchaa56Kl/9S+Jt5J
 U57uCDZSlTwUAd/0jjZCTbj/mE5Y6X+ZIgmcGgLSsn9RZi0341i4oAghAgcAeCNAdYAbUl
 fdZngwUBSB/cc9BGnp/2oaIRAMarBc4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-RORNGuWzP3qUQ67_jkSaBg-1; Tue, 27 Jul 2021 04:09:03 -0400
X-MC-Unique: RORNGuWzP3qUQ67_jkSaBg-1
Received: by mail-wr1-f72.google.com with SMTP id
 u11-20020a5d434b0000b029013e2027cf9aso5647042wrr.9
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 01:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fwliveE3vtlmj/y+O0bhlRBjHclCQzz8vHUhqWQcSMk=;
 b=gKNUIeVktA1aUMcomONMetm8RkOL9TZES2lasUchNdV9eh+m2dGxSoWXqoDqfH1E0s
 L7y6N8mnB970j/F4TU6A2yGsaV6sqO8iLDagtGbtFA2Cl5W30MUnDkQHt/q3A7/YvKy1
 2GGXv+vNr/qsLLeNBm4V9vsbu64Ahelg0Ey7lEbhWCCe75dy3glW59Vg51agX8zyZnIQ
 M/I9nl1LvkZ5+n/ZDM5h6FZkYRK4nsxOFnkqn2ZY/0xoqME8vYJ0+jlHhyEhL/XI+L5n
 rvK6cYjniZn9B0+JcRkcURXdF8ttCkMAwQaoufGNeUBsfs8dW48Vr3bun7O4Si/H0AOe
 Zr5A==
X-Gm-Message-State: AOAM532lAJe8Qf+x45d5LYGoqwPdeU0gyrbnWjp6HxSQEniIsoReN4I9
 OaPGV+4Ym5zrxS4hTHUAd84OGCbb0R6LA8lF9u3uW97Ejs2u6+TL9yMVCH61RiiVZyiqzO6IwPS
 GMCd/a18rBjbB88k=
X-Received: by 2002:adf:e0c4:: with SMTP id m4mr23241174wri.312.1627373341968; 
 Tue, 27 Jul 2021 01:09:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZII8NS0ckUiIk8tyOK9mPueaebU5jr0vip4uHaAS2wB4M+IUuzwW4OJx0iESBfeY9Tutihg==
X-Received: by 2002:adf:e0c4:: with SMTP id m4mr23241162wri.312.1627373341766; 
 Tue, 27 Jul 2021 01:09:01 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8352f.dip0.t-ipconnect.de.
 [217.232.53.47])
 by smtp.gmail.com with ESMTPSA id y3sm2266228wrh.16.2021.07.27.01.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 01:09:01 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 v4 1/4] docs: Document GitLab custom CI/CD
 variables
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210726150429.1216251-1-philmd@redhat.com>
 <20210726150429.1216251-2-philmd@redhat.com>
 <09a71f22-2f9f-e8bd-148a-a8695af86f8f@redhat.com>
 <efbe182f-710c-fa2e-abf7-9b2bf067ee2c@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9cba80d2-3052-84e3-3372-1c913a7583ff@redhat.com>
Date: Tue, 27 Jul 2021 10:09:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <efbe182f-710c-fa2e-abf7-9b2bf067ee2c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/07/2021 09.55, Philippe Mathieu-Daudé wrote:
> On 7/27/21 7:59 AM, Thomas Huth wrote:
>> On 26/07/2021 17.04, Philippe Mathieu-Daudé wrote:
>>> We introduced the QEMU_CI_AVOCADO_TESTING variable in commit f56bf4caf
>>> ("gitlab: Run Avocado tests manually (except mainstream CI)"), but
>>> forgot to document it properly. Do it now.
>>>
>>> Suggested-by: Thomas Huth <thuth@redhat.com>
>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>    docs/devel/ci.rst | 40 ++++++++++++++++++++++++++++++++++++++++
>>>    .gitlab-ci.yml    | 19 ++-----------------
>>>    2 files changed, 42 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
>>> index b3bf3ef615b..53df04afb7f 100644
>>> --- a/docs/devel/ci.rst
>>> +++ b/docs/devel/ci.rst
>>> @@ -8,6 +8,46 @@ found at::
>>>         https://wiki.qemu.org/Testing/CI
>>>    +Custom CI/CD variables
>>> +======================
> 
> [*]
> 
>>> +
>>> +QEMU CI pipelines can be tuned setting some CI environment variables.
>>
>> "tuned *by* setting" ?
> 
> OK.
> 
>>
>>> +
>>> +Set variable globally in the user's CI namespace
>>> +------------------------------------------------
>>> +
>>> +Variables can be set globally in the user's CI namespace setting.
>>> +
>>> +For further information about how to set these variables, please
>>> refer to::
>>> +
>>> +
>>> https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
>>>
>>
>> The anchor does not seem to exist anymore?
> 
> It will exist once this patch get merged, see [*] ;)

The above URL points to the official gitlab documentation...

>>> index 6dc5385e697..9762dda2ee3 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -16,24 +16,9 @@
>>>    # QEMU CI jobs are based on templates. Some templates provide
>>>    # user-configurable options, modifiable via configuration variables.
>>>    #
>>> -# These variables can be set globally in the user's CI namespace
>>> -# setting:
>>> -#
>>> https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
>>>
>>> -# or set manually each time a branch/tag is pushed, as a git-push
>>> -# command line argument:
>>> -#
>>> https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
>>>
>>> +# See
>>> https://qemu-project.gitlab.io/qemu/devel/ci.html#custom-ci-cd-variables
>>> +# for more information.

... and not to the new one here. I think you mixed that up.

  Thomas


