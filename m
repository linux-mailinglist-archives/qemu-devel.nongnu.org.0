Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE74AEE06
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 10:31:21 +0100 (CET)
Received: from localhost ([::1]:56774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHjJo-0008Uz-0i
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 04:31:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHjAL-0003Lo-OF
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:21:36 -0500
Received: from [2a00:1450:4864:20::334] (port=34500
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHjA6-0003Tp-Nq
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:21:31 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so1990693wmb.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 01:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lzQUol+V74Rl3mqK+MUVolQFlrOagJE+pXp785dFq8k=;
 b=mktvKX9s5oqamyorCTySgPatL0LcYd6ukJfksT0xwULUUJWduwagP4gE9THdooUgxD
 vWKv6hezQE7ZghZjWAchl3nyD6gxqjHUsfJPlsabt+dUwqlIKzLjv3IPsW6yCGEY+m/e
 FNgFYhgaTRXR++TGj06nHApTHgwqfGR1Xoy8BU6UHjWdUQg5PnsgyXkCDD3sqI1HR0K6
 8ZoDg4zj6OJ7dGcjqdv6JPNnWOaVQdsFNFh7JpNWmNsm3HlOiVOOtcbQqeQtNBkYBtww
 NACuTPaIC7Y2MPq6LYh22ohfJT01dN0+9MKkOYq2hKg6fbsPO+3afPAR3c8nzRqhZCUC
 P4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lzQUol+V74Rl3mqK+MUVolQFlrOagJE+pXp785dFq8k=;
 b=M/+OptegdcpNe9eoyxpfNjqghhnjxg5NXTT9DkHSV3tkLLQesfSb2XalBO1Bs5e4d0
 fNOkC7moVZKJ78nOKVqPJDqJ4YImi+Pu6sLReOIyVlV2lG/+LHBe1plgQAqvRGout4FC
 6G1YPkI2fD++uqL7r/HfcBdZ1g5pzHO81D3syoYrFXM2q3Gc0xJ+2ewM/zOf/bVoycRp
 Y/Jbot8ooSE4titMnf5KWT0XiS6hatrr/LMIWSDPqmrrfcso1a08jgjzh3Sfji3S4fuC
 PvOuLHo3K9C01mj7qEmLXtNf4ebXGTfnNK0s36Hn/3/rj7thXTOR3k9MolsGimaq3BM0
 +Q4w==
X-Gm-Message-State: AOAM532L3rNI+CmsAw/CCpJjVkUs6hFZE+xfmUw1RQ7GAC25/RSSWo6L
 3qzQA3mrxJj4197Dk82hNIc=
X-Google-Smtp-Source: ABdhPJz3Ngdxq0ujNGMLdKV56b0NfXmPAOH3mr4YtzBRCUbsQ4eoae62OKvb6zKoG2cDnthJx8R/Xw==
X-Received: by 2002:a05:600c:1e09:: with SMTP id
 ay9mr1196628wmb.162.1644398411510; 
 Wed, 09 Feb 2022 01:20:11 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id k28sm3863869wms.23.2022.02.09.01.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 01:20:11 -0800 (PST)
Message-ID: <4a8c6105-b1b2-99a2-27b0-ebb48463a50d@amsat.org>
Date: Wed, 9 Feb 2022 10:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 5/5] include: Move hardware version declarations to new
 qemu/hw-version.h
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
 <20220208200856.3558249-6-peter.maydell@linaro.org>
In-Reply-To: <20220208200856.3558249-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/2/22 21:08, Peter Maydell wrote:
> The "hardware version" machinery (qemu_set_hw_version(),
> qemu_hw_version(), and the QEMU_HW_VERSION define) is used by fewer
> than 10 files.  Move it out from osdep.h into a new
> qemu/hw-version.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/qemu/hw-version.h | 27 +++++++++++++++++++++++++++
>   include/qemu/osdep.h      | 16 ----------------
>   hw/arm/nseries.c          |  1 +
>   hw/ide/core.c             |  1 +
>   hw/scsi/megasas.c         |  1 +
>   hw/scsi/scsi-bus.c        |  1 +
>   hw/scsi/scsi-disk.c       |  1 +
>   softmmu/vl.c              |  1 +
>   target/i386/cpu.c         |  1 +
>   target/s390x/cpu_models.c |  1 +
>   util/osdep.c              |  1 +
>   11 files changed, 36 insertions(+), 16 deletions(-)
>   create mode 100644 include/qemu/hw-version.h
> 
> diff --git a/include/qemu/hw-version.h b/include/qemu/hw-version.h
> new file mode 100644
> index 00000000000..730a8c904d9
> --- /dev/null
> +++ b/include/qemu/hw-version.h
> @@ -0,0 +1,27 @@
> +/*
> + * QEMU "hardware version" machinery
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +#ifndef QEMU_HW_VERSION_H
> +#define QEMU_HW_VERSION_H
> +
> +/*
> + * Starting on QEMU 2.5, qemu_hw_version() returns "2.5+" by default
> + * instead of QEMU_VERSION, so setting hw_version on MachineClass
> + * is no longer mandatory.
> + *
> + * Do NOT change this string, or it will break compatibility on all
> + * machine classes that don't set hw_version.
> + */
> +#define QEMU_HW_VERSION "2.5+"
> +
> +/* QEMU "hardware version" setting. Used to replace code that exposed
> + * QEMU_VERSION to guests in the past and need to keep compatibility.
> + * Do not use qemu_hw_version() in new code.

Can you include the "legacy" word somewhere in the include path?

I'm hesitating between having a single include/qemu/legacy/, using
a prefix or suffix.

Thanks,

Phil.

