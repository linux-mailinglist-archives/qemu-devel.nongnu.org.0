Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCA05C0568
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 19:41:23 +0200 (CEST)
Received: from localhost ([::1]:33742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob3is-0007Lp-3X
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 13:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3fD-00044s-Ez
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:37:35 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3f9-0006s8-JJ
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:37:35 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c198so6603114pfc.13
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 10:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=n7Ry0cGx1w1i9cdPL1p6BkIrVVVJBrL2QgvsfdIo8R4=;
 b=PT9oKGeTBItDwGpT8Lc2Tig3umfYpuJhzSH3dOXH9G0+SwIfbz9cUE8CrsVyzKa7EK
 ieEUYr51oCJRJl0dkv+Dn89mlNJeB+1sdMnOcrC3bTx1GEPX/JdYOYNVbuNBBdrdwxF/
 +FweAEmJb3uhOx2NwiZQ8Ybn4MqAIFhoiWj8jWNTXSG6CtMJaC6ScWVB4H+pp8os9GEp
 m0NeQTIEegjBDOybYToJSnycAyCAx6PV0jRQOjfsQ1VbwcfuzVCW7D79q6/cd8GcDz43
 N+A2dQMcF+QVoGmgtkWZDY2aPjDx8BHvz/UK/KE2Lu0MJi7yRxnklJP1SRKlQm+jR5sT
 Waxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=n7Ry0cGx1w1i9cdPL1p6BkIrVVVJBrL2QgvsfdIo8R4=;
 b=jZjE2nmXwaX3yt1YLb5lMqXdmpcAeef/F6Ha1CszhLA6Pz6EJoiIDtw74yWSbk3A6p
 9j4vDKXWlR/uOi3FQ3YZ/hxl5Uz89PS4KI7o6TgyRgRMkEdWUchXnKhZ03YA4b6RQ4YI
 cVc3eWsb6gz/yepyCKJ2JKS/LNlq+0q8IuGKONgpskQ4uZBJglXYUUJ2vCsLanqYHuOC
 35Jmb1rsshRqmGCx1S6hEju3dxVl6/+btFQqO0V7MYgL4zrbBIeK30Cd4RsNI2YOdo+q
 7Dv9fIV2GTZWvjmPvjTJiLckvkmoiNYEuRibJqtC8OdAD7wKHtP8A7Mui6O809NxxnOh
 V3yA==
X-Gm-Message-State: ACrzQf02k3fjDPjVmiRivUYOkEgcwsqnE5O9jL6iQkEucADw5BE10fuS
 g3gsquAq2zs58RPRWIWPybM=
X-Google-Smtp-Source: AMsMyM4B+Of/aMTXA2v7nw1bylsgjGLb+IUy6xUugYEIthY2+W1/PiUHKkjTiiGbJAiFmYEi/D7ZdQ==
X-Received: by 2002:a63:a51e:0:b0:439:857:2758 with SMTP id
 n30-20020a63a51e000000b0043908572758mr25347611pgf.105.1663781849197; 
 Wed, 21 Sep 2022 10:37:29 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e30-20020a63545e000000b00429c5270710sm2226874pgm.1.2022.09.21.10.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 10:37:28 -0700 (PDT)
Message-ID: <7cc5af3b-5e66-27fe-785c-6f449bebeb82@amsat.org>
Date: Wed, 21 Sep 2022 19:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 03/10] disas: use result of ->read_memory_func
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
 <20220921160801.1490125-4-alex.bennee@linaro.org>
In-Reply-To: <20220921160801.1490125-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 21/9/22 18:07, Alex Bennée wrote:
> This gets especially confusing if you start plugging in host addresses
> from a trace and you wonder why the output keeps changing. Report when
> read_memory_func fails instead of blindly disassembling the buffer
> contents.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas.c          | 20 ++++++-------
>   disas/capstone.c | 73 ++++++++++++++++++++++++++++--------------------
>   2 files changed, 53 insertions(+), 40 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

