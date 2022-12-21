Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF11652EC4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:44:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7vdg-0006pA-6j; Wed, 21 Dec 2022 04:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7vdY-0006lg-8C
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:43:45 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7vdW-0000Xx-Kp
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:43:44 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so1002917wmb.5
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 01:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l5O7H77fbEf5a3v3V32B4qSp90L7UIUagCASyC3Wou0=;
 b=l3VlODuXRLqPZJnxhCIiLdVs4UhRgO7qe1sf6+LNPHcUn8rLqggUUWM2+MpS7qSMM1
 2Bk7iMtQ3g8/TQ10GsFLd/hR3sroUNrK7kYbT5PXos8O7D9XzRLqTmBHR2ldcFgyZJR0
 kDGeWyWahZ80U5vGD/h+m1RxUexxZ1jSbxou4ArA13J11akibEYP6lAmYSfdrjImOg6D
 txHAqBSiHSa/oEawpfvKvCwesw4GAU9eHHxQxdz4s5dH2LRyw5pDr+sCWBfALnMPq97s
 C/PjJNL3lWLSA9kNe2yCnoyc21tAXsP6Sf+60i6BP1iVFhlMKYjgmh8UfikBZ7h9kSd9
 8TcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l5O7H77fbEf5a3v3V32B4qSp90L7UIUagCASyC3Wou0=;
 b=sCXIWwWHLsHaovuoXK/7689vhiPPk40qthqdcuLS9BUbVoXeW3IfKkw4K3ftUy246P
 D/LDvxr9C4kFjrw1oJE37yRn7WE83I8imRaxUG+do6HTkX8GiVuCyp/F4QmEuRf5IrFx
 uPBVafFHl5WNR5+oddv917ExwumvspUy8eMeU8YD7N+ffIJ9UtMOreSDx/yb8Au8eME3
 J6nMChcD70Zj60glYXj2dpSSsIfZaWchtmJ5N3PGemQtoZ+WFKkuW7JRedqkdHAVoI/F
 yWf9pNkoua1EcT7GOz2SpCDuUemW+JP2VbbuWlOwe1luj4hIagrR2lR8pSKaxRODa3cH
 dbQw==
X-Gm-Message-State: AFqh2kqX/HkY7tJepsXHUbLOYpu0P9d9dc3SB2o7iDVOv7K5lT92vEu4
 Svsdf7f3ycXpyWYqiyrbaNA51A==
X-Google-Smtp-Source: AMrXdXszo1RDRqUrHr6FZrfVBafDOOi6UM9geBRjunH9w0QVSGIRBA20oJGL+qe6WnTCdNSk3awR4g==
X-Received: by 2002:a05:600c:48a8:b0:3cf:7197:e68a with SMTP id
 j40-20020a05600c48a800b003cf7197e68amr825021wmp.18.1671615821025; 
 Wed, 21 Dec 2022 01:43:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k31-20020a05600c1c9f00b003d22528decesm1743716wms.43.2022.12.21.01.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 01:43:40 -0800 (PST)
Message-ID: <886e896f-a111-d820-defa-198f05b8fba5@linaro.org>
Date: Wed, 21 Dec 2022 10:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] hw/arm/virt: Make accels in GIC finalize logic
 explicit
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>
References: <20221221092850.61332-1-agraf@csgraf.de>
 <20221221092850.61332-3-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221092850.61332-3-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 21/12/22 10:28, Alexander Graf wrote:
> Let's explicitly list out all accelerators that we support when trying to
> determine the supported set of GIC versions. KVM was already separate, so
> the only missing one is HVF which simply reuses all of TCG's emulation
> code and thus has the same compatibility matrix.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> 
> ---
> 
> v1 -> v2:
> 
>    - Include TCG header for tcg_enabled()
> ---
>   hw/arm/virt.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


