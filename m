Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86251689024
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 08:08:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNqAU-0007yL-V3; Fri, 03 Feb 2023 02:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNqAT-0007y5-Fp
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:07:29 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNqAR-00074z-Sb
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:07:29 -0500
Received: by mail-wm1-x32e.google.com with SMTP id k16so3144919wms.2
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 23:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UkwoTA5crTfD+nLksGxp7i1c+xcG75GH3whjkQPM5+4=;
 b=cY+MUI6DZRt0R3a3FrXksGwRWxwcWIaCa1u9vpJ2pT4Q40wQ9OcxAtAMWkyRDDsa9O
 AnBNeee+Dk1Cnlrxd9nHJgq03nVN5RNd4X6fkU4Tm67ZncM47n+wX4EX8xb5IEWyxIGk
 pey1y87m/LcZMCKjmL7aQ4+VUXMvFwdYNtBweGZX5QreezKobJoD26ivDB+Vmn9CNAyq
 FlJsbKnSTLDGmiwsSd2C4/mMJ0X9KtUhwZPModlysiCb5x9/8F+6Cibvi9V1cVXquYcz
 p38CR2lEvgE5AkpJFg17XNT18GRvPx+mtz0fdXvRgrFXCAxTdObzxO/cKDUSs09lWZ4p
 Rxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UkwoTA5crTfD+nLksGxp7i1c+xcG75GH3whjkQPM5+4=;
 b=pKQkGFCViFMPm6uQawRMf1aD3cLMOersht7OUs35nTQNmkoCGo5STexIdeUrDOpeJH
 8Z8iAtcPPdOBodL2ghV9z+Kg7df1d/jBh1eccHR0OIXx/DN0v7rthzZ954f/MvFdrN9h
 ZkLxN078htSJzqHE4eRupOuZlqaVXgBPJfjPbvOzR85ZrVJ0WPEgw5RRl1/EKHQ3dRBv
 TyPRRLOvmRVwrK5k7T7uuG8KAN1fe7ALLZZlECaLAUivAnjy31XnEi+D6FV49vPkCC7f
 2JOVsGX0Td2RufTS36kMvgtlIi5YPt8k5amLuw+qXfQ2aQvDoxQ88/cJMCZ5civNov6s
 zMMw==
X-Gm-Message-State: AO0yUKXefJ6uA5jp2UpXT2mTU/FXyhlwL1aVCQon2hk93RYmHEb9M5ur
 3mcOqpP4Z2tw7efI3JSTQLotaA==
X-Google-Smtp-Source: AK7set8bfZiyP2gShjzWzUuRVL6KzjGwtXGAEnrx0r+iRBNv/WAxREy8MerbPVtNju3lSea+rsfN5g==
X-Received: by 2002:a05:600c:3544:b0:3dd:1c46:b92 with SMTP id
 i4-20020a05600c354400b003dd1c460b92mr9213005wmq.16.1675408046205; 
 Thu, 02 Feb 2023 23:07:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c14-20020adffb4e000000b002be0b1e556esm1205973wrs.59.2023.02.02.23.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 23:07:25 -0800 (PST)
Message-ID: <d4ce9573-6f8c-1970-a2c5-f798fa8403dd@linaro.org>
Date: Fri, 3 Feb 2023 08:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20221223090107.98888-1-agraf@csgraf.de>
 <CAFEAcA8Aim73+og4dr5hD93mTZ8xSWZ-oxMSEY0x6Zs+vTC2pg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8Aim73+og4dr5hD93mTZ8xSWZ-oxMSEY0x6Zs+vTC2pg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Peter,

On 2/2/23 18:57, Peter Maydell wrote:
> On Fri, 23 Dec 2022 at 09:01, Alexander Graf <agraf@csgraf.de> wrote:
>>
>> The finalize_gic_version() function tries to determine which GIC version
>> the current accelerator / host combination supports. During the initial
>> HVF porting efforts, I didn't realize that I also had to touch this
>> function. Then Zenghui brought up this function as reply to my HVF GICv3
>> enablement patch - and boy it is a mess.
>>
>> This patch set cleans up all of the GIC finalization so that we can
>> easily plug HVF in and also hopefully will have a better time extending
>> it in the future. As second step, it explicitly adds HVF support and
>> fails loudly for any unsupported accelerators.
>>
>> Alex
> 
> 
> 
> Applied to target-arm.next, thanks.

Did you squash the changes mentioned here?
https://lore.kernel.org/qemu-devel/3278ab81-ccdc-9ccc-e504-dca757db5658@linaro.org/


