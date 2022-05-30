Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1E45381A0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 16:32:18 +0200 (CEST)
Received: from localhost ([::1]:43682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvgRN-0007wK-IS
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 10:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgPL-0006rn-6F
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:30:11 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgPH-0000CA-KZ
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:30:10 -0400
Received: by mail-pg1-x530.google.com with SMTP id v15so10282319pgk.11
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 07:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i3/OxlO7oGqE0PkfDEtin6NtfkIr9GswQp4bWAf5Uic=;
 b=isSUMQR8bVna8hpXp2dZ2CkMwf4afhearxUbbP9a5n9MvqolOGy/yMV0FZPCSS/DZd
 upzN1W+GX4wffM2u/uTMKxqVRcdR5AJ5KVE/Ce77lMe/n2XcGW6NAAcXkpdIdCuAhp8r
 YqRRcqEokcAMpGoFrTK1ql43P7vwjqSbLffFKgxLb0/Yq64zy7LjtrWX3wKRpCwbG1Bj
 J516o0LpxAqGLZyyReGzUypZK/kakYdn3hSFIIe08HaD/08SN0XdRRbbRBFqmg7O1x/M
 IVuN3bnHj8/7WTLSpfbSfotOoWaApaW9sTZvjwOwxszjiZRfLq9m8mMdocBm9wytNvr8
 WGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i3/OxlO7oGqE0PkfDEtin6NtfkIr9GswQp4bWAf5Uic=;
 b=pHX28LvVNPR1wKJWsHGWyDx2GKc36id4WX+upZKSX2E1hOwoOUCaU/YsuHbVkx/cnL
 jjluyhQ5pe9DazPrr7VcURLM2JOqE3bsLskEeA49ce02qQbkAonfsouFWICXt0zQ47ZG
 jx86fvFs61XXpVKp0NCIcF/i1zmQ8Ic+rZ6B+gwRdK2fZMZ0lEcS+YJu7IWrTkVxv/yq
 HRMYrb8Ec4ZGer7p5a+Y0UpsDwcz/pw1KrNCkE9u/w0Q68WNNw0L8uG+/x9u+d6x2b5z
 351EJMc26iLloVIyCaPdErjegtU9hyzHR1ni8aU2MLPFDTTXvQPtcYQ7UmKe/GufvqfY
 uC3Q==
X-Gm-Message-State: AOAM532O0jffy7RSRN/j5hFIykAV38VZwQcJcvyE5Hp5e8f2NL4Y05GU
 RX+tUs8DLcs1YIbIBC1saLU=
X-Google-Smtp-Source: ABdhPJxqOijYmlLKO7UkqDDyejHm0HiCZUlu6eEtI3a/D06n6GQqSar/JpJrxQZCo4T8Jbq2AA3Sow==
X-Received: by 2002:a65:694a:0:b0:3fb:9d3b:431b with SMTP id
 w10-20020a65694a000000b003fb9d3b431bmr15813368pgq.276.1653921006234; 
 Mon, 30 May 2022 07:30:06 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r4-20020aa79624000000b0050dc76281fdsm8888920pfg.215.2022.05.30.07.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 07:30:05 -0700 (PDT)
Message-ID: <56ddc6f3-8ce5-c2f6-1dba-5b0c22b0bf35@amsat.org>
Date: Mon, 30 May 2022 16:30:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] target/xtensa: add clock input to xtensa CPU
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20220422191542.415701-1-jcmvbkbc@gmail.com>
In-Reply-To: <20220422191542.415701-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 22/4/22 21:15, Max Filippov wrote:
> Create clock input for the xtensa CPU device and initialize its
> frequency to the default core frequency specified in the config.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>   target/xtensa/cpu.c       | 15 +++++++++++++++
>   target/xtensa/cpu.h       |  5 +++++
>   target/xtensa/op_helper.c |  7 ++++---
>   3 files changed, 24 insertions(+), 3 deletions(-)

Thanks.

