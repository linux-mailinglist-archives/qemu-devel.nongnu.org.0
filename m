Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9603B5D19
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 13:21:54 +0200 (CEST)
Received: from localhost ([::1]:39108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxpKr-0002Z5-AG
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 07:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxpJe-0001ni-9j
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:20:38 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:45686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxpJc-00041l-Lh
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:20:38 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso10820794wmj.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 04:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fy3PaFgd8a+qI+JXp0D1QcyBb6ULOjyW1lQSTkeAiAU=;
 b=US/PsnQZdwVss66qcriri3Y0C2PMGPuImCWOb2otDyFdMe8JjBgFeWWQUVrTZvae9S
 XNcFRIvLsRf4loEKfHs5KAnY60zweLacyvGdO7ahKK0xIGB1OUTEeD0bEKEn36+eGWcG
 2VzNuCSMQNHfHFONOVJ+j+YHxQNQnxjzvz5Ty8fDPBjHxuF+2ofkSuGLLaDg6r06H/KM
 A1Aeux+dFtOuAzMwG76IKbmWIGM4d8Yoizz/5ofVWQxV2spzCNXeW2mUqo4Wz6Pv5P5Y
 BKoi7TCjtxjQsuILHCNHGKKH651mNZf+tEfFkdDWYzkXbzF3WwuYiQ8KMdQZ93aWmXYM
 mgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fy3PaFgd8a+qI+JXp0D1QcyBb6ULOjyW1lQSTkeAiAU=;
 b=VOGs75wsoEQdIvcrVdC47c2hFos1Z2CUXJf3WoFCQU/vXJpeiGiRq11RjI1y+KgxCv
 LckqPYnhgWJa+QFBLr1FSGe/zxNM/NMyfVjkqvpec/bnuq0lKTz7wby1Q0H9UILcvNkp
 1JHR8+mgB3eVyfE6/s1AS1NrXWkxOJNwW14DBgIFjGiZHFLWdCbfwKq770dxgmmlrNE7
 PjlieSgD3g36W0vxgY8z3UZDANojDzCH9OX8X95PezOpeTTfscnjn9O2mU0LUiv1l1au
 509hn/F4XfLTRFlCKLyEcyMpeNyrdaXlXc1KROQ4xjFkLpVc4BDyW+uTgaJ9kTszGL0H
 6Udg==
X-Gm-Message-State: AOAM530JvN1qX0jpIX59jVIdGOI+QmIzfqNubSYK0T9X3X1/74cmXS9a
 q8yRZScWlE0h/LvsJkiGkZOW1PLjtmEjyA==
X-Google-Smtp-Source: ABdhPJwTiiSN5bT80Vu98zF7tWU0BKRm9YSVTcRAZSwMsxdOLVJu0snkloa/d65iEMAnFJDu/gJ9xg==
X-Received: by 2002:a7b:c1c1:: with SMTP id a1mr22545524wmj.187.1624879233509; 
 Mon, 28 Jun 2021 04:20:33 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f13sm14510154wrt.86.2021.06.28.04.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 04:20:32 -0700 (PDT)
Subject: Re: tests: ReverseDebugging_AArch64.test_aarch64_virt ->
 InvalidPacketError
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <6f85be92-627c-c3ac-2d49-fd18a00dd1f9@amsat.org>
 <66d56c24-eacf-0d23-2def-0259b2c1b922@ispras.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c484c8b0-691b-100a-b863-2d1a9d94950a@amsat.org>
Date: Mon, 28 Jun 2021 13:20:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <66d56c24-eacf-0d23-2def-0259b2c1b922@ispras.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=no autolearn_force=no
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

On 6/28/21 7:14 AM, Pavel Dovgalyuk wrote:
> On 25.06.2021 20:01, Philippe Mathieu-Daudé wrote:
>> Hi Pavel,
>>
>> FYI as of commit 050cee12315 ("Merge remote-tracking branch
>> 'remotes/stsquad/tags/pull-testing-updates-250621-1' into staging")
> 
> Doesn't it mean, that the real culprit is hidden and we should bisect?

Could be, I have no idea, I don't run this test often, only when I do
changes related to aa64. I could bisect if you can't, but it won't be
soon.

>> the ReverseDebugging_AArch64 test is failing:
> 
> Shouldn't the merge be postponed in such cases?

This test isn't run on CI (you marked it @skip in commit be52eca3097).

>>   (28/37)
>> tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt:
>>
>>   ERROR (0.96 s)
>>
>> INFO | recorded log with 1690570+ steps
>> INFO | replaying the execution...
>> INFO | connecting to gdbstub
>> INFO | stepping forward
>> INFO | saving position 40000000
>> ERROR|
>> ERROR| Reproduced traceback from:
>> lib/python3.8/site-packages/avocado/core/test.py:770
>> ERROR| Traceback (most recent call last):
>> ERROR|   File "acceptance/reverse_debugging.py", line 206, in
>> test_aarch64_virt
>> ERROR|     self.reverse_debugging(
>> ERROR|   File "acceptance/reverse_debugging.py", line 140, in
>> reverse_debugging
>> ERROR|     pc = self.get_pc(g)
>> ERROR|   File "acceptance/reverse_debugging.py", line 77, in get_pc
>> ERROR|     return self.get_reg(g, self.REG_PC)
>> ERROR|   File "acceptance/reverse_debugging.py", line 72, in get_reg
>> ERROR|     return self.get_reg_le(g, reg)
>> ERROR|   File "acceptance/reverse_debugging.py", line 58, in get_reg_le
>> ERROR|     res = g.cmd(b'p%x' % reg)
>> ERROR|   File "lib/python3.8/site-packages/avocado/utils/gdb.py", line
>> 783, in cmd
>> ERROR|     response_payload = self.decode(result)
>> ERROR|   File "lib/python3.8/site-packages/avocado/utils/gdb.py", line
>> 738, in decode
>> ERROR|     raise InvalidPacketError
>> ERROR| avocado.utils.gdb.InvalidPacketError

