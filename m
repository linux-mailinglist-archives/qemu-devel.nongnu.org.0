Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D751B6AE359
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:51:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYeS-0004MT-VH; Tue, 07 Mar 2023 09:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZYeQ-0004KH-MH; Tue, 07 Mar 2023 09:50:50 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZYeO-0002Hk-PC; Tue, 07 Mar 2023 09:50:50 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-176e43eb199so5167178fac.7; 
 Tue, 07 Mar 2023 06:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678200354;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KbqjfikkWLNcO2J7aU3q2f0tEWq+EM6cr0gmD+7P8oA=;
 b=WkGYWFxaw7gTcrh2LwSIzhb4DUDOVS1UdSSRC5cM2GDKcr3x/Jsd4mbtyG5nnm6cpE
 FMU/T4bHth9PYCIS0Z8d72qS3rRm0wZmQOsAjyhnPMVq3R9GRt03elkWXY0ZRvGrX4FF
 jnpbG/4g8NmHViy8o0/KoN6KWlDOkTAcTHWH5E0Dzpa52V9ZjjsFGr4lCIxugP10O55Y
 /XkQUjL3xUC1GT5KYwteKCoelLbZt2cw2pfl8N0ES7Xt2dINRfJuRisVhJP87TDAqG5r
 4eUtJH13l50XuaNU+TxtlbcpqUJqWNWOouNuMRM58gNG8fp7yLe1MOmFjYLnKDbyA+Dj
 oGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678200354;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KbqjfikkWLNcO2J7aU3q2f0tEWq+EM6cr0gmD+7P8oA=;
 b=RNXBWceHkFhPMfZhIlk09veSqu/A8ehD5/TCI4spqgdRj5OYVp9C1Lp08UCdTPn4aO
 haCUxjdbR2kPY+t7fOvoTnpKkWB/MCkqQr3FK2gG9GyEzDKGDlMLWioH9+RMBh5RcJ5b
 n3pgPxu4G3344swUjkC1onKqCCp1iLk30mhHlP7bWWRyHTxDhX4t0r34XvDqSAXXMbeK
 arUcdIGSIxTKEzS1odYR+tiO9QAC1DtaszKeAuKeYgQeqQYaJh1h5lPWEppFpWsdRu7N
 JnrnXTe4iwZRQg7BgJW3AAjwnzRkSMfeC1dZUXHwjGIPs0iffIpdQQFxPbuJymjTVHrs
 S/eQ==
X-Gm-Message-State: AO0yUKWIiTNRNwS+TiM7QbND41e8l4ODAl8aT5nmrrz7mhi1fIa+fn0r
 bgMBkRcTDEUJf1EmZcSPhwY=
X-Google-Smtp-Source: AK7set+1pEKwZ0x9u4XifuFv3BUms2W+uBBT11PPJ7WyC1AAPzjFzYFiO23tKQunMtH/00OVPmAIHA==
X-Received: by 2002:a05:6870:219d:b0:163:b0c5:8730 with SMTP id
 l29-20020a056870219d00b00163b0c58730mr8835723oae.12.1678200353956; 
 Tue, 07 Mar 2023 06:45:53 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 v51-20020a056870957300b0017289a068c0sm5139150oal.46.2023.03.07.06.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:45:53 -0800 (PST)
Message-ID: <5bd37e9e-8008-6ce4-bb85-71e6461d99df@gmail.com>
Date: Tue, 7 Mar 2023 11:45:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 2/7] hw/intc/i8259: Implement legacy LTIM Edge/Level
 Bank Select
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, BALATON Zoltan
 <balaton@eik.bme.hu>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <cover.1678188711.git.balaton@eik.bme.hu>
 <3f09b2dd109d19851d786047ad5c2ff459c90cd7.1678188711.git.balaton@eik.bme.hu>
 <10178ae9-e306-0885-a14a-20fc651a8494@gmail.com>
 <d24b46ee8fba84f9c7a7d8b8f66d07cc60516989.camel@infradead.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <d24b46ee8fba84f9c7a7d8b8f66d07cc60516989.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 3/7/23 10:39, David Woodhouse wrote:
> On Tue, 2023-03-07 at 10:36 -0300, Daniel Henrique Barboza wrote:
>>
>> Checkpatch will nag about it claiming that we need spaces between
>> '*'. The maintainer can fix it in-tree though.
> 
> I saw that and explicitly didn't care. 3/5 of the existing examples
> within the tree look like that one — which is how the docs tell us to
> do it — so I figured checkpatch could just be sad.

Regardless of how much we care about checkpatch happiness my r-b stands.

Peter said we can ignore it in this case, so yeah, checkpatch will probably
take a L.


Thanks,


Daniel

> 
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> Thanks.
	

