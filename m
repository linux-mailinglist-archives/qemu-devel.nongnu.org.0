Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834B74E4671
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 20:05:21 +0100 (CET)
Received: from localhost ([::1]:33692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWjom-0001v1-IR
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 15:05:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWjn6-0000pT-96; Tue, 22 Mar 2022 15:03:36 -0400
Received: from [2607:f8b0:4864:20::102e] (port=46718
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWjn4-0000bs-UB; Tue, 22 Mar 2022 15:03:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso2982163pjb.5; 
 Tue, 22 Mar 2022 12:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=5Xv/26Q6cemp19vo+R8RguchOww60BalgLqjn/TfuCI=;
 b=lDY3Sgaa6f/Z5kBZ7kJunoaGajKeeWlOU88ADd5MpCqmJRUgYDLgifglmPUr3ib8K+
 NbOEMpOLZHlkzzg0iHJfbY6ZBumyBq3cAa59uMXuF3xSOtQvPjSuB0oIJr1QodQdEr8E
 j3cOK60MhZGC0VEFrE4fKa7perdsVuf1Wu6vSYnQShuLhHB9zMDENnN59OtnMexjSrTa
 FbTeMWb/59q9+PzX7Ebphx5u3SjApe5pjWkCPRhtlenrj00DI4IOA8qtJVAcNz60OjQq
 4cVXPIhQ+unnuBZ57mb1jm3dhV5Kkuf50fnHnJnwmKt0yIYGX/cDs+WtsI8Fdn9JLQOT
 jVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5Xv/26Q6cemp19vo+R8RguchOww60BalgLqjn/TfuCI=;
 b=m+w3lApCnK1hn8GVGfpRc7Sxmeq0t4oJIhbzE5ieeJ1wKW/xTlT9qqfEftb4Uz5igb
 n60hwUUo+GRjvc5Wf+TuJdVwvrgm9vT8zsIXKqowTfd6P6xpBBeGtPryZ25UhrgEAnat
 YEDYVDK81Z5KxdJVi+C7rdLLREpHrgdGYg34BFZmwJPD3J+lV6wCg2t1OST0BjCAM5S4
 +pR8gKk5NKPKt6zZWR8AblU4kkYcTuLaq5Xe/qahFu/vNvEVlGF9KMv+smZwI/fI9gA5
 ZYuTD95aCnSgi+gCJ+RCSsuCuZOsXL1MWgeb8ubZ8ynW1i7dR6GB9wQOP+knjrGVShnN
 qoRg==
X-Gm-Message-State: AOAM531olbRT0BXvAnbS+RIrXppjnU8At9l5mEhLakLi/NMhpR4awOHS
 y+FKu/EhS/wrrpl8eag/2kY=
X-Google-Smtp-Source: ABdhPJxMM1Ln7osfy1BWeMppbdqvJe5wfjDUSq20Cr5ZmkYzV1Up/DEOyntL+UXCmgntJ/WbJ6nA7g==
X-Received: by 2002:a17:902:ec8c:b0:154:7cee:774e with SMTP id
 x12-20020a170902ec8c00b001547cee774emr6847333plg.61.1647975813365; 
 Tue, 22 Mar 2022 12:03:33 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 ob8-20020a17090b390800b001c6a1e5595asm3855291pjb.21.2022.03.22.12.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 12:03:32 -0700 (PDT)
Message-ID: <6cd7b4bc-07de-6a73-ccaa-0e5c2a31adb9@gmail.com>
Date: Tue, 22 Mar 2022 20:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0] hw/intc/arm_gicv3_its: Add missing newlines to
 process_mapc() logging
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220322102824.3474956-1-peter.maydell@linaro.org>
 <afdadedc-1d35-068b-ccde-12897f9bea34@gmail.com>
 <dab530d9-53d2-3d7d-c9ac-44906ba9b386@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <dab530d9-53d2-3d7d-c9ac-44906ba9b386@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/3/22 15:58, Richard Henderson wrote:
> On 3/22/22 03:38, Philippe Mathieu-Daudé wrote:
>> On 22/3/22 11:28, Peter Maydell wrote:
>>> In commit 84d43d2e82da we rearranged the logging of errors in
>>> process_mapc(), and inadvertently dropped the trailing newlines
>>> from the log messages. Restore them.
>>>
>>> Fixes: 84d43d2e82da ("hw/intc/arm_gicv3_its: In MAPC with V=0, don't 
>>> check rdbase field")
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>   hw/intc/arm_gicv3_its.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
>>> index b96b874afdf..d9c741f5fdd 100644
>>> --- a/hw/intc/arm_gicv3_its.c
>>> +++ b/hw/intc/arm_gicv3_its.c
>>> @@ -524,12 +524,12 @@ static ItsCmdResult process_mapc(GICv3ITSState 
>>> *s, const uint64_t *cmdpkt)
>>>       trace_gicv3_its_cmd_mapc(icid, cte.rdbase, cte.valid);
>>>       if (icid >= s->ct.num_entries) {
>>> -        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 
>>> 0x%d", icid);
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 
>>> 0x%d\n", icid);
>>
>> (pre-existing: "%u" format, since icid is uint32_t)
> 
> Worse than that: 0x%d is going to be *very* misleading.
> Should fix to 0x%x right away.

Triple review is helpful :)


