Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACF66F80F8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 12:42:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pussd-0001Vi-7p; Fri, 05 May 2023 06:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pussb-0001Uo-Bv; Fri, 05 May 2023 06:41:37 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pussZ-0006du-Ok; Fri, 05 May 2023 06:41:37 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-192d5ab4962so830201fac.3; 
 Fri, 05 May 2023 03:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683283293; x=1685875293;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vODdYT/G/Q1MF08EO6e6b1vbwdh55LnVM49FB1PVMXQ=;
 b=b7LOLNSG++27+TaTf0Yd3DruBWQvu4tlJVfYrXYp+IXe/8Kp7ydXz0JEFD9gwM0g/h
 SGRLIzVqycf8TEu6o30HQo716yNehmHJvz75UaxymgQ+c4uE++MHMk6nmm3iEiwa4PPX
 7EfMsoR+VgQO12M80FJerNfBeE+o5H3ioYOxOUSIWDb+dT0dAIuPi3aieXinQ65jEMoj
 Z8crpK0Jo8itKuth/1MPDUKQNRnkNy6Zp0nEdbufNgAp5Ixd44myxAI19copukK2+uWl
 MC9WYNTtRpH4xSltgVGX5VM5AGJs3efS5J61+zTO51FNxnwSxfHJOo9RxYhJl5HtaGFE
 zlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683283293; x=1685875293;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vODdYT/G/Q1MF08EO6e6b1vbwdh55LnVM49FB1PVMXQ=;
 b=e/OW+GjutvRRunHKOgXxC1f8J7VGVzwCe4E2PlrYxid+jzi/kuoorONmv+RXB4oova
 SKqaYt3+sU7xoaP/fqP63tlW7+LGqmtD8fHVNPyuyAZErAsbuBJxeRMptm7jUg0kWY2N
 7lX3WTTf0tTEqkGrtWBqdGiVTXwzmJoU5QfESVZ9UAVVw27qU/k8fwl0/3HThst9TG+g
 fLHYVxDdprB0hjxGbsVolMo4vtPsYb68zTp4ba9xDtDFhsYc4k3TElKNmrBCO6LX9Dq7
 ZdBNHhzzJtbtJOTgM64B12Z4MwJzGo0tC3/pV6mow/TYggtEBLfQrzOzn6y9LtgMCHEH
 7Kpw==
X-Gm-Message-State: AC+VfDzpkxLumbX663N4+W3hgys43M2DiTaz02n0+7838fw+vQIrPmvZ
 i+aq14IWQbLQe+jd3C2aYAA=
X-Google-Smtp-Source: ACHHUZ5DPn2KShvlz9x4oDnSaxWec2s11mOJnptkpIbdfutD4s1AIlGGbQWy9xudExI9PaB8M6ix7A==
X-Received: by 2002:a05:6870:87c6:b0:194:83cb:29c2 with SMTP id
 s6-20020a05687087c600b0019483cb29c2mr429761oam.2.1683283292837; 
 Fri, 05 May 2023 03:41:32 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 s22-20020a4adb96000000b0053e8336f5dcsm774808oou.7.2023.05.05.03.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 03:41:32 -0700 (PDT)
Message-ID: <32418990-82eb-a6d7-1695-db64e191f30b@gmail.com>
Date: Fri, 5 May 2023 07:41:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/ppc/Kconfig: NVDIMM is a hard requirement for the
 pseries machine
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230504180521.220404-1-thuth@redhat.com>
 <9b5e3d31-3e1a-eba1-e935-fb6f0dd75283@gmail.com>
 <1cf86174-b3eb-0674-7669-1bc7b4bc3eac@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <1cf86174-b3eb-0674-7669-1bc7b4bc3eac@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 5/5/23 05:03, Thomas Huth wrote:
> On 04/05/2023 23.19, Daniel Henrique Barboza wrote:
>>
>>
>> On 5/4/23 15:05, Thomas Huth wrote:
>>> When building QEMU with "--without-default-devices", the pseries
>>> machine fails to start even when running with the --nodefaults option:
>>>
>>>   $ ./qemu-system-ppc64 --nodefaults -M pseries
>>>   Type 'spapr-nvdimm' is missing its parent 'nvdimm'
>>>   Aborted (core dumped)
>>>
>>> Looks like NVDIMM is a hard requirement for this machine nowadays.
>>
>> Ouch.
>>
>> I believe this has to do with this comment in hw/ppc/spapr.c, in
>> spapr_instance_init():
>>
>>      /*
>>       * NVDIMM support went live in 5.1 without considering that, in
>>       * other archs, the user needs to enable NVDIMM support with the
>>       * 'nvdimm' machine option and the default behavior is NVDIMM
>>       * support disabled. It is too late to roll back to the standard
>>       * behavior without breaking 5.1 guests.
>>       */
>>      if (mc->nvdimm_supported) {
>>          ms->nvdimms_state->is_enabled = true;
>>      }
>>
>> It seems like you found out another side effect of this nvdimm situation that Igor
>> documented 2 years ago in 55810e90 ("ppc/spapr: cleanup -machine pseries,nvdimm=X
>> handling").
>>
>>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>
>>
>> I'll send a PPC PR in the next few days. Let me know if you want me to queue it.
> 
> Yes, please add it to your queue!

Queued. Thanks,


Daniel

> 
>   Thanks,
>    Thomas
> 

