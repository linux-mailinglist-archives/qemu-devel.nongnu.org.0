Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F059438CEF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 03:16:48 +0200 (CEST)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meobW-0000l3-O3
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 21:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meoaa-0008VY-HJ
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 21:15:52 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meoaW-0002wo-0d
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 21:15:46 -0400
Received: by mail-pg1-x534.google.com with SMTP id h193so9309304pgc.1
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 18:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Aap2W/wmBGr157FFT/2INm0Ddfg1qrsKm9lys/6GWOo=;
 b=Qox46w5nUdp5PRX7Q7JslsKIcAfkEnSxhMQ+1Gh9QUIiF/pMWa/FuvFqLUppfO9zf6
 kTFOsom0WLrc0GaGaiDrPvnhZEi8ihVHt46KStFzDtVnQ4kvh6GwBFEqXaoU0IawiFmF
 L2VWw44PIe6slS5WMQ/TCNOLZk8cBpJghrcKrDsnFZ97Qm5z7C5U/br/f/Y7zz2n+C0g
 nY0P9mUYI0c+SLrlMb+lyzez3OHf/qR4gn3hp8ZA7SVXnHyDSGLtIR5BAb8RTMCUanqJ
 +RiwebDmxzYMBNe7nH8qpPzbRHW0QBN63Vf1vnBbRZPFhHIYjrhoxVs+Pd8av5EMZyPy
 unKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Aap2W/wmBGr157FFT/2INm0Ddfg1qrsKm9lys/6GWOo=;
 b=WuOsgFxqL5fw/mAGB5gLbvNGiH3pz4WO+iOmqBCtE1QpMHN/xYZo+PQuuTFvWHzZtK
 M4EKLraaGG9KpX6ZdY0SahqCmMYUcSbYGk2lVVLf3GRj5enLgjC7yX8oQgxDMmZVor5W
 tOE+tjvpg66Am6rqurhfhX+Kck27/2Py0i+g4ZB5AF8BYQQZ+6bbxbuGVi+apilaXqkq
 O3WrUQXSJ/ypu5MS7sD3ZeEYZtorZrRkfLEIphRF3pSQ+WSJMAmaFwM0rERmTZkWEITz
 p6IqhAmBVuoVulRLyBFjC5F4CMME8mREBC6FvkkRpMsQaJe7KBibTsi/9uzvT2omjgEC
 0pcA==
X-Gm-Message-State: AOAM532C57gY6XKzBc+pDOoMvINtwq+hkoicZlatR2zU0qeYP3sDLb+L
 /1ShKEgQr/Q5WmBMxOPXjTgdnhDM4L4CCw==
X-Google-Smtp-Source: ABdhPJyWbOAOx5G0pkTvpcBTUH55WIAW6wZfOWpu2zF2usMtvhF3Pk29hypaBbhalUr8OkkuGdPykw==
X-Received: by 2002:a05:6a00:813:b0:470:bbc2:49ae with SMTP id
 m19-20020a056a00081300b00470bbc249aemr15244668pfk.29.1635124540831; 
 Sun, 24 Oct 2021 18:15:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 142sm8422430pgh.22.2021.10.24.18.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 18:15:40 -0700 (PDT)
Subject: Re: gitlab/cirrus auth token failure
To: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <8257c433-f8fb-7766-dec3-a220e9bee84b@linaro.org>
 <f80220c1-84cd-e9c1-9542-40f4ea9aa419@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c713ff41-0546-ee6c-dafa-f83624437fc2@linaro.org>
Date: Sun, 24 Oct 2021 18:15:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f80220c1-84cd-e9c1-9542-40f4ea9aa419@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 12:42 AM, Paolo Bonzini wrote:
> On 22/10/21 20:31, Richard Henderson wrote:
>> Hi Daniel, you win the cookie because you committed cirrus.yml.
>>
>> I should have reported this before the weekend, but at some point this week the auth 
>> tokens expired(?).  All of the cirrus-run tests are now failing:
>>
>> cirrus_run.api.CirrusAPIError: API returned 1 error(s):
>> [ { 'extensions': {'classification': 'DataFetchingException'},
>>      'locations': [{'column': 13, 'line': 5}],
>>      'message': 'Exception while fetching data (/createBuild) : '
>>                 'AccessTokenAuthorization(token=[MASKED]) '
>>                 "doesn't have permissions to create builds for "
>>                 '5748266831446016!',
>>      'path': ['createBuild']}]
> 
> It seems to have fixed itself for kvm-unit-tests, so maybe it was just a temporary issue 
> within cirrus itself?

It's still failing today.

r~

