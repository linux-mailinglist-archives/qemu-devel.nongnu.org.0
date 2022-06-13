Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E845485A2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 16:05:18 +0200 (CEST)
Received: from localhost ([::1]:51924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0kgu-00041t-RC
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 10:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0kV2-0007BR-NT
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 09:53:00 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0kV1-0000rQ-4o
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 09:53:00 -0400
Received: by mail-ej1-x630.google.com with SMTP id fu3so11315640ejc.7
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 06:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p+BWVNGeYBlWBFuhYNNXstsfd7aos3rgXbDWBr2K48k=;
 b=G/oE276HVLZYoV5q8Wwb0PsoKoSHZqNgiBHOs1H1Vu8KLhbmNcZI+WisgzbKnIM/gQ
 8tzPIXE32pOLnyfMhPxTDbLOIPlXk0Jx9ZdrGmVG1Ug/y/iE8gnque+OqNa0wZfg+Ris
 fd4amrScNd/ZS9621foZvFT7ieJW9lOtBf/ZbBPgKfOWwV06BUB4hRixvjSxSC0YS48F
 ileoem+YEDLR3UOW5CzSr/eNXmCmkA0Q5AiHRxaQkFls0bbCvBH2Jx6/YYC97KATgRWo
 ZhIsIed1aeBom031BUIN/vaG5Dxpyo9MVeKCjS/ujYnoPjJ0jDQPGb4kOu8dGNfQNe/X
 rfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p+BWVNGeYBlWBFuhYNNXstsfd7aos3rgXbDWBr2K48k=;
 b=6VTobg7yqSYWgYXbkevQOyUEjf2svhSmPIssctWuxTJIsUSsuv4MmtztqJCs7BLosf
 uL5dUuNeUrFmkxT0K8OmBvJHJiY9BTVr1ZMXIKXhDx1L4jZ95sR/t6PF6oy8OXRZLFJs
 U38pT6FhSkJqXV53iVU7w80j1bZlq1d0DRjvPPDG5oVSCeSunfaGFnWCrOUFy05aZZIv
 OR4G9xyJXWPVVajDzBF0GuXKJfOw8LGFND5LwZfZM4azgsFExFj8hEmN2nC10y0nwUJT
 sSYdC3eHQV58laRhiYOmS2SfMq+5hCyIbYgvdvNO3gvXGBmCmWL4p9m1kaZUcgTP4qVD
 oqIg==
X-Gm-Message-State: AOAM530XnWn9j6+2ryGfagOGZ3XGs+xES35V1nMRUg9XcYFiz9+sbBVn
 joY2o1wlbGuAdvNH+6FCkTk=
X-Google-Smtp-Source: ABdhPJzz6RQHKpicbPl0jvzBxguMhqcQZdS0JlVKUBqsDSYUkU4zkBlRZVAmAMjm54hPGH7lJPHLTQ==
X-Received: by 2002:a17:906:2293:b0:704:1730:b1b5 with SMTP id
 p19-20020a170906229300b007041730b1b5mr11102eja.330.1655128373323; 
 Mon, 13 Jun 2022 06:52:53 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a50e696000000b0042e032164a4sm4979786edm.61.2022.06.13.06.52.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 06:52:52 -0700 (PDT)
Message-ID: <725cd66b-13f9-aa3a-021e-2d8f3baeb081@amsat.org>
Date: Mon, 13 Jun 2022 15:52:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] hw/openrisc: pass random seed to fdt
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>
Cc: qemu-devel@nongnu.org
References: <20220612215949.134807-1-Jason@zx2c4.com> <YqaRn6GiHstCbbMm@antec>
 <CAHmME9o_Oq7TKFXx-rxRxpVR-akE+gVCutK879Tp_ubVwEu=TA@mail.gmail.com>
In-Reply-To: <CAHmME9o_Oq7TKFXx-rxRxpVR-akE+gVCutK879Tp_ubVwEu=TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
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

On 13/6/22 12:58, Jason A. Donenfeld wrote:
> On 6/13/22, Stafford Horne <shorne@gmail.com> wrote:
>> On Sun, Jun 12, 2022 at 11:59:49PM +0200, Jason A. Donenfeld wrote:
>>> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
>>> initialize early. Set this using the usual guest random number
>>> generation function. This is confirmed to successfully initialize the
>>> RNG on Linux 5.19-rc2.
>>>
>>> Cc: Stafford Horne <shorne@gmail.com>
>>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>>> ---
>>>   hw/openrisc/openrisc_sim.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)

>> This all looks fine to me.  I will queue it with my current changes.  Since
>> this
>> is only applying to openrisc_sim I would like to also apply it to virt.  To
>> do
>> that I need to have a common core openrisc system creation api.  That way I
>> don't end up copying and pasting this to every platform.

Looking at commit cb57df6f7f ("hw/arm/raspi: Make machines children of
abstract RaspiMachineClass") and around could help.

> 
> Sure. Or just do it on the virt board only if that's easier.
> 
> Jason
> 


