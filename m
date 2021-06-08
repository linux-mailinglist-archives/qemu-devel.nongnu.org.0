Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734FF39F9C8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:58:40 +0200 (CEST)
Received: from localhost ([::1]:56892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqdBf-0000gA-0O
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqdAU-0008HB-OH
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:57:26 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqdAS-0003vG-Fj
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:57:26 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so14239702pjz.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 07:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qstUPoEjJqICFY5E1oneumgeSfIsY3ZIdIiFxxDmJBs=;
 b=mPs9E+deXnxkpG2PWvwmelVZEhcH/1DAuUE0oPVv+5tzTUtYK9JOLDzYsZ9yE9NjYb
 q5IaxK4uMfZw4bORrcLzyXYMMkVYIA2P2nMLgjIRlyw+mdAScV5An7WpO+q1HK6UAgOT
 H7RHF9QxzsFplyIjG8usKH/3mj9exNwfccJlQ4LbtwLDa0nmSi/YAG5Ae1DSUzLr66nA
 xax+VHmCM3lyz34c15AUe3emoqihZpfBX0NeqN4a//TJPFf0scSw9LeTOqDwmwQYHh+C
 046t1N7x65NSpV/0FwOp0LIERpY3LU3LOE2S2athwIpJ55FUez1b97RVeofhg5KpLJ7P
 ZVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qstUPoEjJqICFY5E1oneumgeSfIsY3ZIdIiFxxDmJBs=;
 b=Je1z4mmyUXVaIinXwi/B2BH6+fmHOC4gx4UYBLugvPkbOpyiRccLYPAbvSw8XULh0u
 ELkSHEjyEkxGMPxaZTO9iwznFtzPOabeGMDHiVln9jUM1hRqz5SZw8wLnK3T6TuLVUF5
 UArw99Cp0h178lw1oFCXKqXtK+XFpWIPmudOUMcnWehjupxNiUDdwEEOtehYwXk+3PUP
 b50l7hhjQHTuvDS1A38IAWdAZSoP2+i46ODW67UkMl3osVxzsJQZNoTixA3/NrTx6lVQ
 8rHebLgxuTCwq+BvO2UgZrLd0j+WHSHcVZgM6mymFF+fo9Iwf8kEgAeG01VkoXfo+jSY
 noJw==
X-Gm-Message-State: AOAM5327HfUcKVEELuJA7JsrwRqRFhibrKk4+sFJjj5HeQZgddwXzD/2
 k09ZHCWZCv6mESfskBdnXLmhBQ==
X-Google-Smtp-Source: ABdhPJzwA1GSBKg3ehhLdWaKhK8UqzzR07L8wXbXYKpSshN5jPOztyz/pqsjwObiiY9rL9KNmrurvw==
X-Received: by 2002:a17:902:7c03:b029:f0:bbde:fc1e with SMTP id
 x3-20020a1709027c03b02900f0bbdefc1emr381927pll.57.1623164242613; 
 Tue, 08 Jun 2021 07:57:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g63sm10950405pfb.55.2021.06.08.07.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 07:57:22 -0700 (PDT)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org> <87im2ol8xu.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17efdd43-6ee6-eb9d-df3a-f53f3eefc892@linaro.org>
Date: Tue, 8 Jun 2021 07:57:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87im2ol8xu.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 7:27 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 6/4/21 8:53 AM, Alex Bennée wrote:
>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>> machines is about to be broken...
>>
>> Um, what?
> 
> Really what we want is to probe the -M (machines) that a binary
> supports rather than just barfing the test because we've built a QEMU
> that doesn't support all the random 32 bit machines.
> 
>> r~
>>
>>
>>
>>   and besides it's not likely this is
>>> improving out coverage by much. Test the "virt" machine for both arm
>>> and aarch64 as it can be used by either architecture.
> 
> I think this point still stands though, I don't think we get much from
> running the cdrom test with realview et all on qemu-system-aarch64.

That is commentary I can get behind.  The former has connotations of doom and 
gloom and the opposite of where I think we should go.


r~

