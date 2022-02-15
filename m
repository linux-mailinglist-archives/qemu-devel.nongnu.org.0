Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FEB4B6D92
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:34:35 +0100 (CET)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJxyU-00033g-Sk
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:34:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJxpY-0000Or-RH
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:25:21 -0500
Received: from [2607:f8b0:4864:20::431] (port=43635
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJxpU-0005Qn-HL
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:25:20 -0500
Received: by mail-pf1-x431.google.com with SMTP id d187so34833626pfa.10
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 05:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=19JBUd+8LTAF76/9x2mal7WWI8xeI5xmSpfUNHdjfxI=;
 b=ZA0U/D31edDgvbYI80izWJOK17EmQmgC0T04jh5hCtNUNVRY3xUzfVFkjcYJn1ozcs
 +lcRhXAR0iVgcifxER85cXxc5egudgKmIeO70h5+BK7cIKCOPXPCMSUPSatJoyx7rJqZ
 YLHtaAehYWt3UmDOOKS+53USeg9GpbatdQYaIRKTT7LbW1CQLw0k9qoi95wVFgg4MipC
 yxl02ie8ObX+MZXLxwnea+BzWZCgMycnwKeVZ0sqCKS77h4aiokBo8lcNq21RBHvVGdr
 LcC5k0P1wHdTHOTMymQDx11tfjssGiNBR7CU2ukmKjuS463G/FE3JGsbMsaB8cGHXvn7
 Rd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=19JBUd+8LTAF76/9x2mal7WWI8xeI5xmSpfUNHdjfxI=;
 b=fSkPD5hp78gc9icrwQfbnDq3DkLuH7szsu355Ar45Nz7Qa5AIJHvCTtYqwZRdZ9LWz
 vZ4JZ5huvcRru4fUalbPLt+xY+u6ogGwr6dO0gYXso9rcjrxtCYxDgw0NuqwmKoou4Ik
 KBY2zfaCxWBF+sRWKXPfuyIMGVAWIIyva7FTl+Zoz69ITRze71fy2pkZwUxuBpUUN7sj
 q2E8s7c7NDekq/trYLB/OnjMm9MQ6gvUaWuZj/zZe1yJMBM0trdbZfo2sUxgDP5Lb/f/
 iTPd9T+zFxCLKZX9CoQnPp4p3pqH9CbWn3/74WqxOR9z3Q5bt2e1Yl4pr524D5AbsTj4
 V+mA==
X-Gm-Message-State: AOAM533u0RRZFRUMZBpGQmEANqozH05+YRl/PFIyVLzMg8DU1kuiK5xP
 +ENoIBKu4maa018lokj34bE=
X-Google-Smtp-Source: ABdhPJxUcpXh2M4iBT1adRzvRjxHxxmE580KKQPAMylp27JeZcz7Q6Ap7/D8pyIFJcC5Vi+TjE80lQ==
X-Received: by 2002:a05:6a00:bc8:: with SMTP id x8mr628426pfu.61.1644931512372; 
 Tue, 15 Feb 2022 05:25:12 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id fz21sm7335512pjb.35.2022.02.15.05.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 05:25:12 -0800 (PST)
Message-ID: <f223128e-b6df-5f48-5478-d57f54bfcda0@amsat.org>
Date: Tue, 15 Feb 2022 14:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [RFC PATCH 0/4] buildsys: More fixes to use GCC on macOS
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20220215120625.64711-1-f4bug@amsat.org>
 <CAMVc7JU3sd+h4A2R2-hScyLBJyo9Zb8SzLFapMsRdSwJ3KX_xw@mail.gmail.com>
In-Reply-To: <CAMVc7JU3sd+h4A2R2-hScyLBJyo9Zb8SzLFapMsRdSwJ3KX_xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 15/2/22 14:06, Akihiko Odaki wrote:
> On Tue, Feb 15, 2022 at 9:06 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Few fixes to be able to use GCC extensions which are not
>> available on Clang.
>>
>> Philippe Mathieu-Daudé (4):
>>    osdep: Avoid using Clang-specific __builtin_available()
>>    osdep: Un-inline qemu_thread_jit_execute/write
>>    audio: Rename coreaudio extension to use Objective-C compiler
>>    ui/cocoa: Ignore 'initializer overrides' warnings
>>
>>   audio/{coreaudio.c => coreaudio.m} |  0
>>   audio/meson.build                  |  2 +-
>>   include/qemu/osdep.h               | 21 ++-------------------
>>   ui/cocoa.m                         |  5 +++++
>>   util/osdep.c                       | 20 ++++++++++++++++++++
>>   5 files changed, 28 insertions(+), 20 deletions(-)
>>   rename audio/{coreaudio.c => coreaudio.m} (100%)
>>
>> --
>> 2.34.1
>>
> 
> Compiler portability is always nice to have. Making QEMU on macOS
> compatible with GCC is good, but I don't think that would justify
> abandoning compatibility with Clang.

I am certainly not abandoning compatibility with Clang. What gives
you this impression?

