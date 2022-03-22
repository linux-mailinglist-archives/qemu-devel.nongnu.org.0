Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81FA4E4666
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 20:01:23 +0100 (CET)
Received: from localhost ([::1]:59154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWjku-00082F-OC
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 15:01:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWjj0-0007HS-Dm
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 14:59:22 -0400
Received: from [2607:f8b0:4864:20::432] (port=47020
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWjix-0008I2-TY
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 14:59:21 -0400
Received: by mail-pf1-x432.google.com with SMTP id s11so18897669pfu.13
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 11:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Rj02rijt9kd/yFjxeDzUWwje7+O2DDvHu2lOtwIQ68U=;
 b=YkR263zDgIWAkAQAoOLc8VbRRfRufn9ceS7RYbv++SLu6MItVNNtzLjS7zksMPHMrV
 gya8+yEm92glQ4kQ6RhLIlD/CthSLj3TqqXU+LFqVZ1cPWFM04uWSxhq8wvtbkbjpkil
 gfTHP+T/i0lI5BgrYKwtPPduNHsejT+fFd4SLVKKGbE5sPBgTMd/FNzXJjkdckH2zACA
 0uKoS4Dl52yKZlB40ywTkqpVYtGJskq9Xjld+8FGal3tXgciKfetC/WRGL/dJF4ibMrS
 im7Wlhn6eS8aJwkeT1GbBRvOrYkUiRh+FLNoxr+G6+DHQJJ8CUtfULXhfHW7wPYURIon
 Kkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rj02rijt9kd/yFjxeDzUWwje7+O2DDvHu2lOtwIQ68U=;
 b=7UVrE9Jh/NU9S5AWy2FwggBn1cBkDLGkIyGK6ce2Nupz2c5DfKtI6XlS7wy2Vl3kEj
 92HNOEMWK0C5KK45Ni21nx7RAWoKKhlaIXO0w1nH5LLJWvZd9RTRESKyO2vADnG0Wpuc
 qGQZ9248940is+H0zw18HnIbIvlnrO+eY70RSU3Z3XhhxnSn4RfHPRJfPEEHMdEhq1QM
 XpZEUIlxqi/RKD8ImsBfYp53T/6FvX3OrxkUG97UmP/hinnt+vkJ6b1565rdwgJ3ExUW
 pzKzNOZYu1iV4rdhqpbZnew8Gi8AHcHX2hEO6BkCOPw73Z+iHe8x4SmWALVrHbWyszWW
 UwPA==
X-Gm-Message-State: AOAM531msOSziXdZxOQ77fiuhiTkk1soEd7cY3HJiKtaLEC1XKn1s5ZR
 c0FCiG5ebdfYiXjdIP4GSvc=
X-Google-Smtp-Source: ABdhPJyXkrin/F5QgEZL2jAvig8pVRzqDRGvPFXVx3OhBOcSXKAskk5gVUiuZ6qiH/0CxKNuFChQkA==
X-Received: by 2002:a63:cc:0:b0:380:afc4:bb07 with SMTP id
 195-20020a6300cc000000b00380afc4bb07mr22961050pga.341.1647975558048; 
 Tue, 22 Mar 2022 11:59:18 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 rj13-20020a17090b3e8d00b001c77bc09541sm391623pjb.51.2022.03.22.11.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 11:59:17 -0700 (PDT)
Message-ID: <6a32d012-98b2-698b-82f8-8ed62cf47c4d@gmail.com>
Date: Tue, 22 Mar 2022 19:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] gdbstub: Set current_cpu for memory read write
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bmeng.cn@gmail.com>
References: <20220322154213.86475-1-bmeng.cn@gmail.com>
 <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Thomas

On 22/3/22 16:56, Peter Maydell wrote:
> On Tue, 22 Mar 2022 at 15:43, Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> When accessing the per-CPU register bank of some devices (e.g.: GIC)
>> from the GDB stub context, a segfault occurs. This is due to current_cpu
>> is not set, as the contect is not a guest CPU.
>>
>> Let's set current_cpu before doing the acutal memory read write.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> ---
> 
> This works, but I worry a bit that it might have unexpected
> side effects, and setting globals (even if thread-local) to
> cause side-effects elsewhere isn't ideal...

Yeah, gdbstub is like a JTAG probe, CPU accessors/views shouldn't be
involved. Having current_cpu==NULL seems the correct behavior.

There was a thread few years ago about an issue similar to this one.
IIRC it was about how to have qtest commands select a different address
space instead of the 'current cpu' one.

I wonder why target_memory_rw_debug() involves CPU at all. Maybe it is
simply not using the correct API?

