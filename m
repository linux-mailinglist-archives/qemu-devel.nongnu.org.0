Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834BA6A8026
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:45:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXgQe-0007OQ-3g; Thu, 02 Mar 2023 05:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXgQb-0007Nb-P6
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:44:49 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXgQa-0004Ds-3F
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:44:49 -0500
Received: by mail-wr1-x429.google.com with SMTP id h14so16056904wru.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 02:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677753886;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DKF8IJRHuVW+zV3aE66Tw5W3x1p5+p1lR4VDyNKRZSk=;
 b=lMjJaZ5L9HfmBZLZ9s3qDp17TdZ1mX0cM3xxTWPCTgDOVwDTKI+dncBe8iTZq6K/pS
 c/0XCsK8DkYTuRIzmX+9EleFiAufBvIzq1iqbiJ2f459WTtnqHsB4sqjVKErNJ+x8ZUA
 A3ing73JMPzm60/bgfgVfZwh2U49UZDrbXuGK/hPFV4e+cnvDHi/eJvrFjl5j9/ZD37u
 k0sezuI4FMogG2mo5MSFaFeIZ+n39z+MW05D/KPYYW2ap3d0mhvcvcOM+lvqQ03VnCgx
 Z0/h7kHOte4c2pAI2XTTpKH7vwZMx1o4g4obeS5N8fUp3RXOnvhqhf63I9AycmRAHjH3
 cf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677753886;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DKF8IJRHuVW+zV3aE66Tw5W3x1p5+p1lR4VDyNKRZSk=;
 b=B+jG7myjrG8XT9/No5lj6Eqg6Oq4uuytnCboMS1+kEAWdxXv+DgUF176Xn+Ama0NFH
 lz6jlnqtUfxb7knwUh224tRvVKunWCYnHGqyEyxV6sDFVCLfvdJFqL4YfSX2dWAjLyYM
 f+PhgR0NqQypFkTb2lKcMyO+uc6xdGfvgJ/loewcLL0rtw3QfyqMnIf4EYLyo7DOHseq
 L+aEv7qgHLMZcemRSQqqSNsXEPrSzxtgG8lNI4sAiCN2vuqsa+mG2LSa0xJh4HhpA5l3
 uwTxT8ce994OfQ9PL1AiluR2n8B7hBgpgknKhchAYWAZvr174d0sig6sCRfKVP6G4v1o
 KN/Q==
X-Gm-Message-State: AO0yUKUISzkEiHzC3iXbdCy88ks+Ev300/yYDaGHLMArKTNNpThMq+fK
 yqZwrtHKgCvttK8tikWL20nFVq2869StI44n
X-Google-Smtp-Source: AK7set8bFVg5azoBjgTnCZ6dsrt2Okr6Q8YwDZl4jhMr9JlsgQ9qHitGK/UGeqen0AQeqZ0vj/NYUg==
X-Received: by 2002:a5d:4586:0:b0:2c7:1d71:e672 with SMTP id
 p6-20020a5d4586000000b002c71d71e672mr6911173wrq.7.1677753886695; 
 Thu, 02 Mar 2023 02:44:46 -0800 (PST)
Received: from [192.168.74.175] (89.red-88-28-21.dynamicip.rima-tde.net.
 [88.28.21.89]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c458900b003e1f6e18c95sm2769047wmo.21.2023.03.02.02.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 02:44:46 -0800 (PST)
Message-ID: <45385c5d-ffc9-38db-6a5b-4b477b0b1316@linaro.org>
Date: Thu, 2 Mar 2023 11:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/7] Revert "hw/isa/vt82c686: Remove intermediate IRQ
 forwarder"
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, ReneEngel80@emailn.de
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cdfb3c5a42e505450f6803124f27856434c5b298.1677628524.git.balaton@eik.bme.hu>
 <709f5780-97e5-0cee-d776-4558cf39e000@eik.bme.hu>
 <7ae0ae69-817e-7100-beed-ed610b3135cb@linaro.org>
In-Reply-To: <7ae0ae69-817e-7100-beed-ed610b3135cb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/3/23 11:41, Philippe Mathieu-Daudé wrote:
> On 1/3/23 01:33, BALATON Zoltan wrote:
>> On Wed, 1 Mar 2023, BALATON Zoltan wrote:
>>> This partially reverts commit bb98e0f59cde846666d9fddc60ae74ef7ddfca17
>>> keeping the rename of a state field but reverting other cahanges which
>>> break interrupts on pegasos2.
>>
>> I've found this with just booting the MorphOS iso which now hangs 
>> without this revert when trying to read from the ide device.
> 
> Can you add an Avocado test booting the MorphOS iso?

Arf I search on the list and someone already did that ;)
https://lore.kernel.org/qemu-devel/20210515134555.307404-3-f4bug@amsat.org/

