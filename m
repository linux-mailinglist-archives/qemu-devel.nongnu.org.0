Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B13597F33
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 09:29:22 +0200 (CEST)
Received: from localhost ([::1]:55616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOZxw-0005YM-R9
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 03:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOZul-00041Y-An
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 03:26:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOZug-00014l-5Z
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 03:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660807556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FVuRpqtmYUOD7r0LbcqQ1J9ypHjvQkskKJ5MCpwTKNk=;
 b=hb/IL2CEvz/MjWBsrMDkbm8TcGdNy7kHSBNWUV+05J0rcc/uQCWcJo+6s8BFXf7eSYwf+A
 bC3jMdRgAOcaalrPiNFCnTCmSsBiqvYx6w19+zKEU28smKAUmMl7kN5YtYgch0F4qrAvTF
 WILo+gbNHEIrgfF7XosmcL8jRA23Lbo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-281-Y_05gtGBP8q9Xtw-ueWMhg-1; Thu, 18 Aug 2022 03:25:55 -0400
X-MC-Unique: Y_05gtGBP8q9Xtw-ueWMhg-1
Received: by mail-wm1-f72.google.com with SMTP id
 i132-20020a1c3b8a000000b003a537064611so562888wma.4
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 00:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=FVuRpqtmYUOD7r0LbcqQ1J9ypHjvQkskKJ5MCpwTKNk=;
 b=XA5iM4ks7rAQf3zml6Bd+ZEUSNFxhFnzfTejqMhy7/J103yU5+D0GxTO/Vvdes0R3A
 wu5e2bgmkuceJQBf3qG18M71OMdPi+cikSqVhymBjG7jThUGq8c5W3VMO59j0UQ5Bs9h
 XpbGlnvN+rBEw9e9AGYO2w0yXLNUDZ7IpNa/xd/no2q5jEu8J1r/bVZ3P7YmISs8P/PY
 6y8JlYuUKv+okSfBrxBaKJ0rBv55/tjbKOAqfyXPeOzARPmN+WCyYrcdHdT66tXLnZI0
 50eh4pYiVr5oMYLAz7GQDr+dhD5UAwRxNunP7wtGdh+XOEyQywXYaRY6qfuBvRmxLjiJ
 Z93Q==
X-Gm-Message-State: ACgBeo3426rQ8Y/NK+EajTc8vZkxJKwsBWc5fB5L7F8bUoMtpWzS06E5
 sAMw+a3By1yJq3d3YagrJT3pKuIvCO0SeDR9hyA9Isce3n89AXu4SnqnbS20c3PqXo6y2aidabx
 oJTA52KCmBdSMUaA=
X-Received: by 2002:a5d:4a84:0:b0:225:20ed:872b with SMTP id
 o4-20020a5d4a84000000b0022520ed872bmr791886wrq.267.1660807554480; 
 Thu, 18 Aug 2022 00:25:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4j9THFiI8I9KAvtTCQNLvJ0Wzt1zB8t/lO2D+kFHLle6JvEYPDHdUrWg3IHUmfko3q+MBsFQ==
X-Received: by 2002:a5d:4a84:0:b0:225:20ed:872b with SMTP id
 o4-20020a5d4a84000000b0022520ed872bmr791877wrq.267.1660807554287; 
 Thu, 18 Aug 2022 00:25:54 -0700 (PDT)
Received: from [10.0.0.51] (88-103-235-154.rci.o2.cz. [88.103.235.154])
 by smtp.gmail.com with ESMTPSA id
 c10-20020adfa70a000000b0022529d3e911sm583398wrd.109.2022.08.18.00.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 00:25:53 -0700 (PDT)
Message-ID: <8c005cf6-24c0-bdbc-e892-3a4c520bb0ad@redhat.com>
Date: Thu, 18 Aug 2022 09:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Cc: Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel@nongnu.org
References: <20220817034630.1600434-1-bmeng.cn@gmail.com>
 <87zgg2rpu5.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] .gitlab-ci.d/buildtest.yml: Increase the check-gprof-gcov
 job timeout
In-Reply-To: <87zgg2rpu5.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/08/2022 09.07, Alex Bennée wrote:
> 
> Bin Meng <bmeng.cn@gmail.com> writes:
> 
>> Current project timeout is 1 hour, but the check-gprof-gcov job never
>> completes within 1 hour. Increase the job timeout to 90 minutes.
> 
> I've tried to do some data mining on this test which seems to indicate
> that the average successful completion time for gprof-gcov is 27 mins.
> So it seems the sometimes *something* causes it to run a lot more
> slowly. I wonder if increasing the timeout just masks the problem?

I think it's very certainly the migration test that is causing the timeout 
now. In former times, the test was skipped, see e.g.:

  https://gitlab.com/qemu-project/qemu/-/jobs/2795092179#L48

Since commit 2649a72555e the tests are run and take ca. 2 * 20 minutes:

  https://gitlab.com/qemu-project/qemu/-/jobs/2798625330#L48

That's why I started a discussion here for how to reduce the amount of time 
of the migration tests in the CI:

  https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01219.html

  Thomas


