Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1BB4164D5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:10:21 +0200 (CEST)
Received: from localhost ([::1]:41568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTAq-0007BM-0R
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTT7L-0004nd-IV
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:06:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTT7I-0002oA-VH
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:06:42 -0400
Received: by mail-wr1-x430.google.com with SMTP id g16so19690506wrb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 11:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AX0K6yRnq30Krmm4tDaX/TYd4zy6x/ALBll8ix/3/TA=;
 b=AcoRns2byHpnefRzVcc4m9o+QIKBiS8zb0PkDrvEYBUJJTsf1q/sNkWVl15GSZHis3
 c1R+qD9gYTuV59z8hEr4b19ptU+y1tu1ABhVOE3D9OTTQK09JADu0GGXR9l63lEUozIa
 aCqhPABr/tumuCetozHIDeHtAbA5lLOPXNEYoh5B+EaRSGCYgzZGO+LZou49EiGM9oI5
 7GP2Ewx6TwTcMxXWMyp5GfK5k1/JKK3UqWlSQwoiTpRLIlpVqyWi7uQdjCBiHD8Molet
 TZBZsvaJhv0xMIJbFkQUtSMhyRd5dkRnD+dG4tXSQvtrKE66iknmqNtKjAYZGExaaQCo
 3ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AX0K6yRnq30Krmm4tDaX/TYd4zy6x/ALBll8ix/3/TA=;
 b=X0M9r6rEZym8unam2QQ3RHQbWwNIgLvrJZlJkTQix43OIRHMyV1IyGENzj5KmF8eNi
 HrzY59ripHHJVLUrD+LtY3OJC7YYfzRf8watfVuQDoW/44UEofIKeH8DydWtk9Zp/ESa
 fRpiWCvIRRwQOqUY6vMUTcSP9kQfRbrnUpt+7dKk/XepsuavRuaRAqLhA5PbbR+wL0Id
 NDbGZyFV9/DzdKTsGE/CNBrvQ9QyJabUygbr26SVf1lXB12ufVpgYkTmSAUR/CRkfA8q
 pKQZBJq5u2KjO9PTz3jsJ5rBVAjBIIASzSpptzGCwRi3sgeom7qPTdC7VxDrPQpxqtQV
 ui5Q==
X-Gm-Message-State: AOAM530cOaqc3x0XfJRcTOPs2fFsovZppNQ9/Nve2068co7HUyknVVao
 7EVPuGKN2YF+4eznXP0jbVUvwsRqmM8=
X-Google-Smtp-Source: ABdhPJxh1UzjERj3vOGqfBURkYreVdbTg+J0OR79spYzW5NvIritJ2nusXp0+2L7OugWtpUbtdGyXg==
X-Received: by 2002:a05:6000:1809:: with SMTP id
 m9mr7025484wrh.396.1632420399799; 
 Thu, 23 Sep 2021 11:06:39 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id b204sm9650939wmb.3.2021.09.23.11.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 11:06:39 -0700 (PDT)
Message-ID: <d029046c-2d16-b1c3-9957-e4fd676417f1@amsat.org>
Date: Thu, 23 Sep 2021 20:06:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 01/31] target/arm: Implement arm_v7m_cpu_has_work()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
 <20210920214447.2998623-2-f4bug@amsat.org>
 <CAFEAcA_UfuKjXamxH-Y-4rs2mu+JM=7p8tGc2QixzPzDqZxcWg@mail.gmail.com>
 <90d882ac-968e-26f0-e5a4-8a2a401119cc@amsat.org>
 <45484122-fbea-434d-2edf-70a587b39cc3@amsat.org>
 <CAFEAcA-6ctOA4ZzUh8Y==bpN47Wco1QMoroV6_7t52nyj8BwVA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA-6ctOA4ZzUh8Y==bpN47Wco1QMoroV6_7t52nyj8BwVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Michael Davidsaver <mdavidsaver@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 20:01, Peter Maydell wrote:
> On Thu, 23 Sept 2021 at 18:17, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Since we provide info->class_init as arm_v7m_class_init(), only
>> tcg_ops and gdb_core_xml_file from CPUClass are set:
>>
>> static void arm_v7m_class_init(ObjectClass *oc, void *data)
>> {
>>       ARMCPUClass *acc = ARM_CPU_CLASS(oc);
>>       CPUClass *cc = CPU_CLASS(oc);
>>
>>       acc->info = data;
>> #ifdef CONFIG_TCG
>>       cc->tcg_ops = &arm_v7m_tcg_ops;
>> #endif /* CONFIG_TCG */
>>
>>       cc->gdb_core_xml_file = "arm-m-profile.xml";
>> }
> 
> This class's parent type is TYPE_ARM_CPU; so TYPE_ARM_CPU's class_init
> runs first and sets up most of the class fields. This function only
> needs to set the ones which must be different on a M-profile core.

Of course... Thanks!

