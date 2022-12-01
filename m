Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A35463F0EB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:53:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0j38-0006f5-SQ; Thu, 01 Dec 2022 07:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0j35-0006e9-5p
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:52:21 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0j33-000484-GV
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:52:18 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso1457938wmo.1
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 04:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1OqQrByk5fw4/4erhJNjgDetFW4ia3XpnZ5dULtBhzc=;
 b=wwtmpasdkwmvL98d4d4XEF91AkSUVMDJ9xlNDNiC5V7jaNFFs/K3CAIhvxhNAuuvfx
 oDBjErWp9M/6gHgahDc4NojBEHfR9KywMFzf+5sYTQjdLGK7NUXhPkAzopi3lLBTzuXQ
 iy7rDu6yWlCHyDI32Jue5KlvenETe0GDCEIJprlHAmhEdT25rIwXLSqjQhcXjPYptttv
 EisswAuGv0lVoY2zQjy8InB4YNiwndWPNwLvuI/XjAoV7dzn9jEAf6TD92b02JlklmyF
 bLcf1Ims8ZVSfW0s65qZc/LTVg1SEt34A8eGJeWWfsPeezWWgMqTThvqQEcgUs3rhKdK
 mPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1OqQrByk5fw4/4erhJNjgDetFW4ia3XpnZ5dULtBhzc=;
 b=vNugjmrA4U/3XtvCL/rxY5NGG6WBw8sNvldXlj6ZjtvjFL1HD3PEoKcVEtdR3Gt4/y
 tR2XhqrHQtLA6c5YS2FI2Qdk+8wdA/HgR3oz3bz9NNnW1PoGFMnDcV+G7xWI5yZIKv54
 W046R/qOrY27hilJ95Hc5dLbSP1uyAZHI8kqMq+e7xxIQ/81BzxG9ocDTCwbkAcRYkF4
 sD9LeSDy/UkA4X+Ilb6ZEudaFkj7ud6Plp3mdgZnhK7uJwub89oueEh8M/YxcB9wpfvf
 ZFs763sijPef3Yu1Na7NTg7TvaE8bpTXoyhURySa2owYEUex8FMEq12uMALh3PeSjQUz
 py2A==
X-Gm-Message-State: ANoB5pnVmI0XgtZy9CSuXeKcA6q6MtT39v4fzRM6Kitr6qoMsUjjqqQa
 XCC+988XPyI8G3K3oD1eFVLwgA==
X-Google-Smtp-Source: AA0mqf45y+3pdRJL10GOS8vUuVgjvSwgD9hF7d8hqIJDy3Hpx7DzVzz5c+nNECJO6AAR3R91HsHHIQ==
X-Received: by 2002:a05:600c:1d9c:b0:3c6:bf1e:ebb9 with SMTP id
 p28-20020a05600c1d9c00b003c6bf1eebb9mr50906403wms.173.1669899135513; 
 Thu, 01 Dec 2022 04:52:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c35cb00b003a84375d0d1sm9836223wmq.44.2022.12.01.04.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 04:52:15 -0800 (PST)
Message-ID: <1f4285b6-0712-9c7a-e0a6-3903ba60e78a@linaro.org>
Date: Thu, 1 Dec 2022 13:52:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] MAINTAINERS: Inherit from nanoMIPS
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Milica Lazarevic <Milica.Lazarevic@Syrmia.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
References: <20221030225006.43203-1-philmd@linaro.org>
 <PAVPR03MB96784D39EC71F71C86ABAE81F8069@PAVPR03MB9678.eurprd03.prod.outlook.com>
 <PAVPR03MB967895ED1573A16CE6E5A34FF8149@PAVPR03MB9678.eurprd03.prod.outlook.com>
 <87ilivzajc.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87ilivzajc.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 1/12/22 11:24, Markus Armbruster wrote:
> Milica Lazarevic <Milica.Lazarevic@Syrmia.com> writes:
> 
>> Hi,
>>
>> Stefan is no longer working with us, but I will be more than happy to take maintaining the nanoMIPS ISA on me!
>>
>> Regards,
>> Milica
>> Any comments on this?
> 
> Suggest you post a patch to update MAINTAINERS, with a suitable cc:.

nanoMIPS depends on the generic MIPS infra, reviewing overall MIPS 
patches also helps.


