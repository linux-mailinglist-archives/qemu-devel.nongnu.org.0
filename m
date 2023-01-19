Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80326735A1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:35:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISFy-0003AM-CJ; Thu, 19 Jan 2023 05:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISFw-00039G-Uv
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:34:52 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISFv-0002lb-H3
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:34:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id r2so1391618wrv.7
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AEmsREcAFT81eV3NjMeFW98XhnSQZEK0F4zsNMDi1Ps=;
 b=yfxQb6gSS2EA183BSpZd9n6qqwP4FPHxBRAM37QypBhZpGwbMF03Tj/YifDGVxOfWi
 ixq3qTQVYXx75tIvWrJyOTCR2PPh0yJzHP0b/YbDgtGsNRNk2qrBB0rar5Ww4Jx0SUcV
 g09dPNsY32W9uZT3kOrZ6Q3qqgaE1DlOFFpbbx8LreNYCb55FwBTZll1tXvTcrV9fekG
 8CTaljl6cMNa+otP194K8rwD4x1qhm8lBYeNtKNz+B3l7d0RW/MyS1FZ/bTQ3bVBzOoy
 IGfBhgfU0vYIiBIug4KMVXep352OCAehlx0fpx8RYuyAaL2NC2AHCNwfPWB48rdMG7OG
 6LFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AEmsREcAFT81eV3NjMeFW98XhnSQZEK0F4zsNMDi1Ps=;
 b=5rRwut/BOuLkQ8yQ83y582fKZlumGPCKSg3cMol+quoADE2v+AgXEC3T9ryfbABBDA
 ZTH7oDWScfqGIuTLmU0fTsDBeQh1jsYNxhhmoo8ILVG9jMD+cyj2iX3Kiztn4V5sha+v
 GhQLY3kLe29h0o7qqTGZtEwlIcQ4AyQo87AcQ1n/9DvkvJuuccECKGvHkDHtSUl3qwiQ
 P64P9x85nIsfsIJWMx5GMvDbWY5eSUP9zfie+36owlM1dyCMUUodsUV6NgcawwkXMvI4
 7S4RPc2gv/B9rLEib+91P6sH3jv/smASaB8AiG0XLH6cyucLnOrmuPniVqQLFRSbO+Ow
 aZNw==
X-Gm-Message-State: AFqh2krWmaInrwZSyM4OFCWasQP5G1hXxfdcuGbTKctgTwA5gW+gv1jN
 8uIf5p0Q+Fy7r6q+iBBV+QhgzQ==
X-Google-Smtp-Source: AMrXdXsjAFK8P00t+u/bsFDl+vkhWx8vGZ08Y7Aaa7uS42EjHDsMzmt+D0N0+RIKLePbgkfRcXPYFA==
X-Received: by 2002:a5d:522d:0:b0:2bd:ff91:7e1e with SMTP id
 i13-20020a5d522d000000b002bdff917e1emr8356574wra.57.1674124490801; 
 Thu, 19 Jan 2023 02:34:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m10-20020adff38a000000b002bc83b85180sm24776905wro.114.2023.01.19.02.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:34:50 -0800 (PST)
Message-ID: <d27cab4a-b62b-4551-cf6b-8f23bf253e98@linaro.org>
Date: Thu, 19 Jan 2023 11:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 05/19] crypto: Clean up includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-6-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119065959.3104012-6-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 19/1/23 07:59, Markus Armbruster wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   crypto/block-luks-priv.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



