Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F438CCA4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:49:19 +0200 (CEST)
Received: from localhost ([::1]:48414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9Gw-0004CK-TB
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lk9Ea-0001vG-2f; Fri, 21 May 2021 13:46:52 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lk9EY-0005dS-Fm; Fri, 21 May 2021 13:46:51 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v12so21848127wrq.6;
 Fri, 21 May 2021 10:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VbAEiIv2LknR+pAI5WWQcRyeE6G+rY08dxfxzzhlsqo=;
 b=tC7Noqc+PnZ5I6A3U3IDFAK5mYS0aiDvtk/uHrJQamszMfyyYaYYurkctxh3pUKTX+
 e+N5kRYNRxJCkfmshen0lStxgbns3HcZ+atsUIoPzVfMz49A8EUVZ329TLbcChWzTZjK
 hc99MtShTSaKOs4J+Ta2UJZKedidyH9zUmPNPywX1c5JREpvTuEK5yhmvULxPls7L7uf
 N2MqmS1RGJ+4K7Np+dXeaX4wxAy+sP+KuwMurdtr3zj4a7eFSiDxBpwlLP1I6XJo/adX
 umHPga6MIdh/5aHiQpxP57hM5LI8W+fO1x+XyBMPSqKulIRC4N5srQqzUuI5Y+xoH8zK
 Ud4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VbAEiIv2LknR+pAI5WWQcRyeE6G+rY08dxfxzzhlsqo=;
 b=oFX7NoaNH1q169S5IJ6OqNgp3lkn7JY2huNLQiNErbPvEa/QKT6RW0VFFLL9l+C+wN
 68yH4zPCk80ySyNF/OmcYY0BoT3xDbHJW/H5g653K9gsv80FYxAZkMYd+0H8WfXQ1h1J
 b7st4Mh7yxsGE19QSzvnonuPzfKz5Nsdkfcrh4/sgkusgBgFjGag1UgW/PzyeWc425h/
 O5u25MOsSJ0iDgvSX56cwSE7CFyYd4DGdfYmdjDzaAMbZJDpCOg/N9w6SCOQhQ57zci+
 GykMrVieZyuZwOYcbE6Ry3DHox0KlPTUuJWon1pYPEiC1KAu0hcUAlNRkNlIGyoagYvW
 gWpA==
X-Gm-Message-State: AOAM531vv7ykLtu4a4brQpLzICkF+8HLVlFJgw1RvCyfnGYPJwueTske
 VrRqc/lKJEJRWh1BG61GNTo=
X-Google-Smtp-Source: ABdhPJzqz52Xe4e0NZb6Iizrr8pR0GH0kVvcUAuCg2RIaRbDRX+Xh2VCdcMOLNtqXDbYM/NPfjl97A==
X-Received: by 2002:adf:fa45:: with SMTP id y5mr11021449wrr.311.1621619208439; 
 Fri, 21 May 2021 10:46:48 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id o11sm2885546wrq.93.2021.05.21.10.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 10:46:47 -0700 (PDT)
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
 <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
 <27149825-16a4-6820-2740-ab110eb231a5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6815ab09-50b5-825c-d565-8fe1e9ed6c5b@amsat.org>
Date: Fri, 21 May 2021 19:46:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <27149825-16a4-6820-2740-ab110eb231a5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 7:14 PM, Thomas Huth wrote:
> On 21/05/2021 16.29, Peter Maydell wrote:
>> On Fri, 21 May 2021 at 15:19, Philippe Mathieu-Daudé <f4bug@amsat.org>
>> wrote:
>>> If you think these tests belong to tests/tcg/, I am OK to put
>>> them they, but I don't think adding the Avocado buildsys
>>> machinery to the already-complex tests/tcg/ Makefiles is going
>>> to help us...
>>
>> This does raise the question of what we're actually trying
>> to distinguish. It seems to me somewhat that what tests/acceptance/
>> actually contains that makes it interestingly different from other
>> tests/ stuff is that it's specifically "tests using the Avocado
>> framework". On that theory we might name it tests/avocado/.
> 
> I think there are two aspects:
> 
> 1) These tests are using the avocado framework
> 
> 2) These tests are downloading other stuff from the internet (unlike the
> other tests that we have)
> 
>> Or we could just leave it as it is -- is the current naming
>> actually confusing anybody? :-)
> 
> Yes, I think "acceptance" is rather confusing. So far they haven't been
> part of your PR acceptance tests (well, now they are part of the
> gitlab-CI, though), and it's also not about tests that have been set up
> by customers, which is what you normally think of when hearing
> "acceptance tests". So a different name would be adequate.

IIUC the current "acceptance tests" are the ones Peter runs,
which are *gating* the merge process. They can not fail.

The current tests in tests/acceptance/ use Avocado (as said Thomas,
to easily download artifacts) and shouldn't be considered gating;
they could fail.

This is my confusion so far. It should be OK to add tests using the
Avocado framework which might fail and aren't gating.

