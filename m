Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCDA69F74F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:02:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqcW-0004ZO-Ge; Wed, 22 Feb 2023 10:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUqcS-0004YX-9G
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:01:20 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUqcQ-0000Wx-Kt
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:01:20 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t15so8147400wrz.7
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 07:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cg90L6azkkL2sSN7Nlhkz3auhUk6w9D2r95dF3r8fcM=;
 b=k5+pYuzXu6a23LHl+WtaVpFYSj4vmZINgDnYnjDiC2DB8ZIkm7gpaHSpoFMvtlxso5
 /Cshm06+z8UIV9I2lflykxRO/QIqKJ8KWYKpw7ylYLBPV3+o3DO5GqH8qbiFFYR6IMHZ
 tzfmX1iz6lNGb/l3Hly6QIijCl66Hb/0h7sv5kBa6q273UnjXkppKaMGzH2OBUk8fdsP
 ETbJFJwt4zFt67xacJayCGu/McgD/MrbxXlivvLMx+6C76lu36c2ozX8d4TnC61L/tL8
 SsSAl5MLqNw9/wAPg7NxBtgyxfOxVUvSwnAPY69wGDUwZcQ/uEjEyr3DYkRjWOuUgZoP
 LwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cg90L6azkkL2sSN7Nlhkz3auhUk6w9D2r95dF3r8fcM=;
 b=XOegSKygTvE7JfmsMp/ux/W2exQIp1yvihUAw7F6S+nJw2vR4wnZkLIKwvjqC+hENn
 L6RqUW6JbSYwuH2B4Lxou5Qq4eNU7r2baehUNd/f7i7Cup8HvhPQA84v7vRWaFZqmUoz
 xwNp+Lm7RSkzlqgS40fkF5rhwlAXvGld83UF1JoAywyfnVO+moEg3palD5pamINrZeN1
 9snMLson6+7M9duzEZK2qU4VJFRIdZsD6tMOraMcsboO9wujFYZ31eCeH6w4VtCU5x+X
 yboKfWbOj4pIwsny/aWkHGPUgcZoJj2kU2FrcttuPvXB416B9TIcb/Hqs2bai8qquQO2
 g2LA==
X-Gm-Message-State: AO0yUKUZ17cledKY2QiaH3wpD65ba/ynwafrDpufbB8Te797eN0+bBNx
 qvKu63xpkYX+8bdSiyu963IT3A==
X-Google-Smtp-Source: AK7set/C0PhTYMDdTrLHAqvIgNVZm8w2z3esr+2xSqiQhdaZ6Qc44UL+eqlMeaCz4WqGV8LIC3rjRw==
X-Received: by 2002:adf:f082:0:b0:2c5:8736:c022 with SMTP id
 n2-20020adff082000000b002c58736c022mr6913343wro.62.1677078076563; 
 Wed, 22 Feb 2023 07:01:16 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adff502000000b002c573a6216fsm5941838wro.37.2023.02.22.07.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 07:01:16 -0800 (PST)
Message-ID: <fa59c2b8-e834-8724-f4e6-e494c8526ce2@linaro.org>
Date: Wed, 22 Feb 2023 16:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 08/12] tests: skip the nios2 replay_kernel test
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Cc: Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Thomas Huth <thuth@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-9-alex.bennee@linaro.org>
 <534be66c-bd70-a4e9-0e30-6892d7b0c8bd@linaro.org>
 <cb2e92b7-40bb-4975-290d-6321c5574365@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cb2e92b7-40bb-4975-290d-6321c5574365@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

On 15/2/23 21:59, Richard Henderson wrote:
> On 2/15/23 10:47, Philippe Mathieu-Daudé wrote:
>>> +    @skip("nios2 emulation is buggy under record/replay")
>>
>> It will be hard to notice the flakyness got improved. What about:
>>
>>         @skipUnless(os.getenv('AVOCADO_RUN_FLAKY_TESTS'), 'Flaky test')
>>
>>>       def test_nios2_10m50(self):
>>>           """
>>>           :avocado: tags=arch:nios2
> 
> It'll be hard for there to be any improvement without an active maintainer.

In that case no point in keeping the test...

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Last patch from any of the listed maintainers was:
> 
> commit ebedf0f9cd46b617df331eecc857c379d574ac62
> Author: Marek Vasut <marex@denx.de>
> Date:   Fri Mar 17 22:06:27 2017 +0100
> 
>      nios2: iic: Convert CPU prop to qom link
> 
> It's probably time to demote "Maintained" to "Orphan".
> 
> 
> r~


