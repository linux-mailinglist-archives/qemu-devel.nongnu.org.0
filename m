Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70F05BB7AF
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 12:13:18 +0200 (CEST)
Received: from localhost ([::1]:52298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZUp3-0004WV-8H
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 06:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZUny-0003Bv-2i
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 06:12:10 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZUnw-0002pE-IN
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 06:12:09 -0400
Received: by mail-ej1-x634.google.com with SMTP id r18so54473828eja.11
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 03:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=eboIrKfv6765WKD4fEcPt8C9v2e37Vf6E2OUBmYr1fg=;
 b=ycuLU6Kfeg3Nsk0S37FbMYCEULXmL/uH0getE6bXBv0NoWxPL7TW+klAmFXv8uCvTM
 e9ACq/5mg/0qGd5nYOLFV+ZanbOMxmsnp1q2e+KuoLqbOHRtFyvFbUsf69xmxox0+Pzw
 iXcRkJoendKDQvIsE+5yAayGOao/HSGQDOcShBi6ZKOR7NvBMe3EakBJlrwULG5o8KMl
 2Kw6DdH2EQkM/lgyVLeoDcskXp/9OATwjGGv84Bq3WUOU7Q/ICjInGmwAm1rKoQskEFH
 vjgE+O0KuxGZnSSmPNCNvZ2d0bt0PbGD0lEnRlwOUbg4dxyp5SeLAtApBllhpAjABdeI
 7Meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=eboIrKfv6765WKD4fEcPt8C9v2e37Vf6E2OUBmYr1fg=;
 b=Fpc4qJbqCl/zpNnTZlR7epyc0yV15ctwZ0z44Xv15LdHZanfByaPluD/7ZxA47eMgX
 +DqMBLPibr2KCk6WrWg4+tmgd2yw9JMlX3Z+7pvLdysxRDDgR+nMh5Uvex1pU3CSJSIv
 0Z/ULb88YQxKUb0T75yScX8FPLext1oYr2OUKAmm/ipoIQpqmOXIJRmwQeuVnqGy/COn
 N9pzOvrvn0Lxlo1G9sORmJ2MT6RuOwcuHySVXeLolczclet4cIyGhEWO5Cmdcrx2KFnC
 fnW8lguLv2D51MkGYZRhw4hBGEoEMcJUZs0F1kBHQE/lUttQDr4j8Ei1oqaorguw/iQJ
 /ZMA==
X-Gm-Message-State: ACrzQf1ZK4sDn8UmrQ++PextqXzKlOJwGEyqUgtQXTl8aNguJ3ZA5VE9
 AsjoVSdzly1S45j4igUPwuA2OQ==
X-Google-Smtp-Source: AMsMyM7X1KIDgiNl2eJqmXkvV4sNi/vUnR8qx2URCtBhRMNGL7uIXN3HLLSdEcs1Yujg7G2OZY81DQ==
X-Received: by 2002:a17:906:ef8c:b0:77c:8d9a:9aed with SMTP id
 ze12-20020a170906ef8c00b0077c8d9a9aedmr6633448ejb.704.1663409525419; 
 Sat, 17 Sep 2022 03:12:05 -0700 (PDT)
Received: from [10.9.7.77] (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 g3-20020aa7c583000000b00445e1489313sm15355430edq.94.2022.09.17.03.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 03:12:04 -0700 (PDT)
Message-ID: <95f7e7f4-f1f1-66d5-0a9f-7bcf6b4ca59a@linaro.org>
Date: Sat, 17 Sep 2022 12:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/5] target/loongarch: div if x/0 set dividend to 0
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220917075950.1412309-1-gaosong@loongson.cn>
 <20220917075950.1412309-6-gaosong@loongson.cn>
 <02cd3a40-d287-35b4-9d68-979c8ebd2e29@loongson.cn>
 <df217ffa-57e1-3e71-f766-fa19770bfe33@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <df217ffa-57e1-3e71-f766-fa19770bfe33@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/22 11:12, gaosong wrote:
> 
> 在 2022/9/17 下午4:59, Qi Hu 写道:
>>
>> On 2022/9/17 15:59, Song Gao wrote:
>>> div.d, div.du, div,w, div.wu, the LoongArch host if x/0  the result is 0.
>>
>> The message has a typo: "div,w" => "div.w"
>>
>> Also I don't know why we need to do this, since the manual say: "When the divisor is 0, 
>> the result can be any value".
>>
> I tested on LoongArch host,   the result is always 0.

But it is legal for a different loongarch host implementation to return some other value. 
  Therefore the test itself is not correct.


r~

