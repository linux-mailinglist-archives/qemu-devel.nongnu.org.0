Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C45621819
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 16:23:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osQRd-0005WV-Ry; Tue, 08 Nov 2022 10:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osQRa-0005W6-Rk
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:23:18 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osQRY-0001Qn-F9
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:23:18 -0500
Received: by mail-wr1-x434.google.com with SMTP id bs21so21526272wrb.4
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 07:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i1NjSSdk/tsRebihPWNVFmoQN4Q5qdIKWrjBpA0MGRE=;
 b=GfveKDfuImm8JHoTfmQbKTmlq3GFme3W57obxJsjgdVGUgd+t12D3m4SEnFzKXF5LZ
 Ofya460jgF60RUnfQ9FuZHKY8BjdZ10vYB0joPBUC5HWPV4+YAYSkt8Z0Z51ah3I6RLT
 tLXeOiMMrz4ELBmiM12xe/APkRrFP01+oHOwPAHsSI9YtiPyeVGgBWzxvh139lAj1RZm
 w+FeeP9vIqxz8mLUJp7eSkp6c1jGQzXKHZJPuSstY6BycsOeZdqRKk00ja3NzcBR6mPY
 g6yJydGhcfRAGlcXyg1gQC98yhnsFSv9x/5lqelUgYHJzpSthjCsRLi29xUdO80bNU17
 YJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i1NjSSdk/tsRebihPWNVFmoQN4Q5qdIKWrjBpA0MGRE=;
 b=QbBUblqkNksqvBGW+6DwxBJ2mLE2bfA7XFUQGXHDmaBEljt13UChweuXwkKQp4/6rQ
 x9GgHDxwc2IO7RBLMr28QHm3fEVeH3DEBLa1JkFcJc+dvmgg9upDVYliyOhmlYUHj8Rb
 +YbIUJlicr7xtV5cQzDo7D2mwJhsiIRo0jnZbtdnFG2RAuh/W/ySwWsTlc189nbxYqcm
 ZtyR3npjG6FoX/wdC1AShWsFtwmVGWeBkWz8SHmzHbwROi1MsR+xG7onewpc/0iQEDYD
 uNPyJEEAJNqIhAvI9nyaqUq+2zyQ1JEvc5JMfRzoNnvlPpB0qyy0Em/SbK7twenHA7h+
 HQIQ==
X-Gm-Message-State: ACrzQf13ZI/ByFc5GtO2dtIW6/3p7iwvMPWgldPYXy9/dlFF4rcg+tF4
 MN5mbJwGk4CO69kNsqiD3TV70g==
X-Google-Smtp-Source: AMsMyM7s3CINARRi0GtnA6xxR9wvJcd0cUnxuIODntcPrm94TFea4zLlPGaf3dPHhnUDmR62PRDKBw==
X-Received: by 2002:a05:6000:178a:b0:236:e1a4:7c5a with SMTP id
 e10-20020a056000178a00b00236e1a47c5amr25463937wrg.428.1667920993856; 
 Tue, 08 Nov 2022 07:23:13 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d5290000000b0022e36c1113fsm10551438wrv.13.2022.11.08.07.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 07:23:13 -0800 (PST)
Message-ID: <80cb567b-cd68-42e4-6408-523c96909695@linaro.org>
Date: Tue, 8 Nov 2022 16:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PULL 00/55] MIPS patches for 2022-10-30
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth
 <michael.roth@amd.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221030222841.42377-1-philmd@linaro.org>
 <CAFEAcA-d=GrGNm9vhc6Q-UnQAQt+RLnwRj=dbif=iMKTRAabpQ@mail.gmail.com>
 <ed6dcb59-a936-e254-4786-0630cbe80f0e@linaro.org>
 <6a8ecf61-e6c6-62fb-60e1-d4bf9fcf67e3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6a8ecf61-e6c6-62fb-60e1-d4bf9fcf67e3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/11/22 16:09, Thomas Huth wrote:
> On 08/11/2022 15.23, Philippe Mathieu-Daudé wrote:
>> On 8/11/22 14:59, Peter Maydell wrote:

>>> Was this the last use of C++ in the tree, or am I forgetting
>>> some other part that still needs the C++ compiler?
>>>
>>> If it is the last thing, we should put in the "Build Dependencies"
>>> part of the release notes that a C++ compiler is no longer required
>>> and mention that the configure options to specify it will go away in
>>> a future release.
>>
>> I guess the last use is from the Guest Agent on Windows...
>>
>> $ git ls-files | fgrep .cpp
>> qga/vss-win32/install.cpp
>> qga/vss-win32/provider.cpp
>> qga/vss-win32/requester.cpp
> 
> Yes, I think the c++ configure options are still required for that 
> Windows stuff ... but IIRC Paolo once mentioned that we could simplify 
> the linker logic in configure or meson.build once the nanomips stuff has 
> been converted, since we now do not have to mix C and C++ linkage anymore?

Oh I guess I got it, we only need to link qga.exe as a standalone binary
unrelated to the qemu-system/user binaries, so we can simplify most of
the linkage?


