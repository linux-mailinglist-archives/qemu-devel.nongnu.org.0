Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDA93BAD36
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 15:52:51 +0200 (CEST)
Received: from localhost ([::1]:42646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m02YE-0004il-6F
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 09:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m02XI-00044N-N3
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 09:51:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:46067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m02XH-0007jn-Bo
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 09:51:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso9495453wmj.4
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 06:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K68OE8IuzmYkBGLhXASjsdoFJ1EANe38vjmB3fSPmgc=;
 b=oR8O7AKNSzKjynYcPBvHxc1Wq9KLmiTez984UpV360iBOP8oNKM9/vFZvauYKDZtfj
 AfJynJy0TOtm3JD5Umhvxa77nS6lEmja1B9xM5AcysJaFv2jIk34ndqg2EBBkAaUrEb/
 Lg0iq8sU2Mu4MiDxlEuw3xyOd6ebvDj7nI4jBS7cI9GEx1b7N8MiLLnvwjg1dGgeloFy
 LXa73+kohRwt0wk2SUd2f+Q5nYqKpLvPX765fo8BmadSLG3QocI/mrsTi7JMQoBpxZ0V
 WMI0+q6uUoSg3zFkvFpe1pBDg7stOTgLVgJ6HcaQDPUQCodjsjBA+eSEPziJkKD+mQkB
 KFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K68OE8IuzmYkBGLhXASjsdoFJ1EANe38vjmB3fSPmgc=;
 b=RokZdxzMNDDaHYk9d5g1F/k/SEQBGJ6RDLsVK8YJ8UuuH89wpEnfkAWwQ0JGqdeGwX
 iVGK9xJQk7QT6TL2kpOziyDjTr16PLTBUHmq4Tz8JWRfdMuxQDezUjqqskqEL052NYYo
 zee+i4tItATqEv1UELbr8KqJaSRlEyusY3QxNEo9nVgwB9/ovuM8Pq70spm6XcAT7Na8
 gooS9fQOGLTfgfVEeTu3W6cIwCrRRXdCvWjS4fF/x9ALMWmuPPIt737Q3dsaGozCge6i
 79EGo4aevf9bT6SiL1tRxdkjXJN9QP/KGe7fPQe4uD8lXwVLumi3YDdfWCz6dHaZusMO
 HImw==
X-Gm-Message-State: AOAM530npflUv7h4ZZISLEr7a7+egHTTNiGu+XqMyBmOx5lD38Q+ZWIl
 u679uDPfORjWH7tzpN8jcxP7xpyl6N8=
X-Google-Smtp-Source: ABdhPJwEVALxBtalfX+lzs6Ys4ku5Ew0uOfPvDmTKdXtIh6vbOCIe297jc1D6S9KP5BrytZJZ+uZrA==
X-Received: by 2002:a05:600c:3588:: with SMTP id
 p8mr6810530wmq.137.1625406709729; 
 Sun, 04 Jul 2021 06:51:49 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l41sm6186344wmp.36.2021.07.04.06.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 06:51:48 -0700 (PDT)
Subject: Re: [PATCH 2/2] Fix for Haiku
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Richard Zak <richard.j.zak@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAOakUfOz=89WuCyAQhrebNj_K_3_2ZYAJ_=aRR2bAuKT5=9uow@mail.gmail.com>
 <5d7c7f63-381a-836e-be8f-68e3fb938d4b@amsat.org>
Message-ID: <4567246f-062b-9d6e-38b6-33dc0ab0099e@amsat.org>
Date: Sun, 4 Jul 2021 15:51:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5d7c7f63-381a-836e-be8f-68e3fb938d4b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 12:00 PM, Philippe Mathieu-Daudé wrote:
> On 7/3/21 11:12 PM, Richard Zak wrote:
>> Fix for path to env
>>
>> Signed-off-by: Richard Zak <richard.j.zak@gmail.com
>> <mailto:richard.j.zak@gmail.com>>
>> ---
>>  Makefile | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Makefile b/Makefile
>> index 30f19d33bb..ced9b97372 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -14,7 +14,11 @@ SRC_PATH=.
>>  # we have explicit rules for everything
>>  MAKEFLAGS += -rR
>>  
>> +ifneq ($(BE_HOST_CPU),)
> 
> Where is this variable defined and what is it for?

IIUC it is defined by BeOS, and Haiku is based on it,
so also defines it. Is that correct?

