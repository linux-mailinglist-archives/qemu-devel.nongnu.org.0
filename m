Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E6923D72B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 09:08:52 +0200 (CEST)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3a1E-0006Wo-1K
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 03:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3Zzy-0005gP-Ak; Thu, 06 Aug 2020 03:07:34 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3Zzw-0007EW-41; Thu, 06 Aug 2020 03:07:33 -0400
Received: by mail-wr1-x441.google.com with SMTP id a15so42900859wrh.10;
 Thu, 06 Aug 2020 00:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CG3w1saG3LVVA2WbhzwEkxLsedVvfyppNxXQAq8ygwI=;
 b=tpo1QsYcYMrfd4bKF1uMOoVvol9aYJShbIK4g5gsKGy/yIRNWyMF2vMbP0FbmKTGNC
 3TyeV69B62hysJnPYI+fqOKIzkTlcUY3BlvUTspnPCBBNkMut0URiuVIb5cVMTxSMa8H
 BslKjTqwbbPMyeZuyl81iQuqKA5vwqJxDY3VThJtmYTagBbmsc+GiaoY/Xw7Ym4SQ4ls
 wGjTMocp1oF7Cki9ru1m03i4Jhi31p9jrJ3RzbQyQWiRJNxmrR6DaBZzP3k4qocTUttj
 vdXSzn4/OMH8/kpsHkvpitZrMUr1JZwdXloNK/2CdSgxyR8yaysdNg/cBFF9oCYyz3fx
 fC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CG3w1saG3LVVA2WbhzwEkxLsedVvfyppNxXQAq8ygwI=;
 b=GVAoHTHWqLBMpfwbK/bX+J0SbVtFCLaFRoK4eNjLGJfk7imtK/6wsAzK8IM3yZXa75
 D2Wj2bKyy+LQZjZlaBMRvb1IzViitoXP7LkYLZAMKfnkSS8/fFUgpBu6PI8bmbxFcj8T
 z4do5inDK0+Qlw+DfcuMsJjM8aJLTXQ2zu8pIkoqb+8YFhqeRIgSG8AcmQF7L04A8qEw
 82tpyIctR0yUB0hFCAeWlv4reqIw+AghCXu90Fhd4dwX1N7fKdtm/jDrxSqh6zobTOzN
 ce9wG6+iG2fjFisr6h2BjuSvwI/Dm/XFEo8Y+G3q96PIzudpLuM8NPTx2cWn6z16EMy4
 N08w==
X-Gm-Message-State: AOAM531gKL3kjwqN3OONY7oJRY/ppAGrOuLcCLDO4KG+bONbimZaNhr+
 iiz+Y7JqIweKXwmMj6H0h2oi9qyW
X-Google-Smtp-Source: ABdhPJzt8buuR/JaJW7NMul3lUmWIsu9ZkBqZSSrSoutoMTOGGywXGic6/msnzRlRrPbK/ka/S3eJQ==
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr5852889wrp.169.1596697648972; 
 Thu, 06 Aug 2020 00:07:28 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id z66sm5257815wme.16.2020.08.06.00.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 00:07:28 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Delete unused ARM_FEATURE_CRC
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200805210848.6688-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a69739ab-ce9d-bc66-1783-799f3bdc3ee9@amsat.org>
Date: Thu, 6 Aug 2020 09:07:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200805210848.6688-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 8/5/20 11:08 PM, Peter Maydell wrote:
> In commit 962fcbf2efe57231a9f5df we converted the uses of the
> ARM_FEATURE_CRC bit to use the aa32_crc32 isar_feature test
> instead. However we forgot to remove the now-unused definition
> of the feature name in the enum. Delete it now.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9e8ed423ea1..9d2845c1797 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1950,7 +1950,6 @@ enum arm_features {
>      ARM_FEATURE_V8,
>      ARM_FEATURE_AARCH64, /* supports 64 bit mode */
>      ARM_FEATURE_CBAR, /* has cp15 CBAR */
> -    ARM_FEATURE_CRC, /* ARMv8 CRC instructions */
>      ARM_FEATURE_CBAR_RO, /* has cp15 CBAR and it is read-only */
>      ARM_FEATURE_EL2, /* has EL2 Virtualization support */
>      ARM_FEATURE_EL3, /* has EL3 Secure monitor support */
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


