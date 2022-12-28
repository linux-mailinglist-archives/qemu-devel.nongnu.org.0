Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43269657F56
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 17:04:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAYtE-0000xR-BA; Wed, 28 Dec 2022 11:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAYsu-0000sJ-Ui
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 11:02:31 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAYst-0002XU-6h
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 11:02:28 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h16so15266764wrz.12
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 08:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jj57U2uI9msDNKTzmjpPKS0AnQ76SAjTHpihoUn6P3Y=;
 b=KDZp30dSv+s3qN4vPW6zvrh6DM4NtJiH35WJO/kWBKb++abBFrqGeuySYQdYBH3Vp6
 AnnPNW3GoUzAJg8aWWTBjYGxx/uHKBXsVuc8ZkgLAvRnLvWY47hmJq5pXeTOKZ3APoP1
 5l9yXZIjp2RFd+hamwWiwrRzIhC32FNr54SylOPdra1iOpOdE2P4YZZXwUPYnLOcCoIp
 5jEYOyhMiekv9oh3J3HUKi2KP6ZkbHruNOU17rIM3VXx9LN1AUkKdFqy6tQ+MkpwU5Tz
 nnrNPMfeQZEefpJvGB7bom02oxPaub9WHP4tNkFr/XPeNMajJnOf5Y3DBZImqged1Jcr
 ak7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jj57U2uI9msDNKTzmjpPKS0AnQ76SAjTHpihoUn6P3Y=;
 b=aKt/WYd2r+NawWhhkTJAmYvb2VqjoySJbv08xFLLiPRMeCja3Bhyd7Pxs9OPz/gqKd
 QOBftRa7pxSCkqjn9ot3erGe50jzlAxbjoDurIP92yQp2NxOusxMJkJSeexoAtFBfONE
 EbgY+TFkdfZNqa841t77ZuTHtTfCXxEAdpi5+U+k2x+IU5NPudcywRHI6XYhB+MVz+Fc
 3w9M3d4mXEP7gAzIiI/hrEh6l039T06UQ6nZHYCd2pRrS0NR2zJc4kyfdFM9RL7F3Em5
 k9EJLk9ks/Kq7gcXQiynjvbp1dr4LVFfhr81JxPifd7O0N2I1oN2rJ7WHp6dTgMoGmpi
 Rtng==
X-Gm-Message-State: AFqh2kq84CHzQfOXMpEivV5zYRlmJHvUsm6pQaCzI8LeurPEG3V5iPLD
 84GYYray6SWFev1y/ZXNjRj7Wg==
X-Google-Smtp-Source: AMrXdXtf3ayrmWdF60L/lWpzJOj9QHgs8JOUuL+LYBksy1ySN1/nW5SQWt9by/aROEYptjng4I4vWg==
X-Received: by 2002:adf:f781:0:b0:242:1ba0:208b with SMTP id
 q1-20020adff781000000b002421ba0208bmr20609543wrp.64.1672243344740; 
 Wed, 28 Dec 2022 08:02:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h6-20020adffa86000000b0024246991121sm16166006wrr.116.2022.12.28.08.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 08:02:24 -0800 (PST)
Message-ID: <6cab26b5-06ae-468d-ac79-ecdecb86ef07@linaro.org>
Date: Wed, 28 Dec 2022 17:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com, hpa@zytor.com,
 bp@alien8.de
References: <20221228143831.396245-1-Jason@zx2c4.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221228143831.396245-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

Hi Jason,

On 28/12/22 15:38, Jason A. Donenfeld wrote:
> The setup_data links are appended to the compressed kernel image. Since
> the kernel image is typically loaded at 0x100000, setup_data lives at
> `0x100000 + compressed_size`, which does not get relocated during the
> kernel's boot process.
> 
> The kernel typically decompresses the image starting at address
> 0x1000000 (note: there's one more zero there than the decompressed image
> above). This usually is fine for most kernels.
> 
> However, if the compressed image is actually quite large, then
> setup_data will live at a `0x100000 + compressed_size` that extends into
> the decompressed zone at 0x1000000. In other words, if compressed_size
> is larger than `0x1000000 - 0x100000`, then the decompression step will
> clobber setup_data, resulting in crashes.
> 
> Fix this by detecting that possibility, and if it occurs, put setup_data
> *after* the end of the decompressed kernel, so that it doesn't get
> clobbered.
> 
> One caveat is that this only works for images less than around 64
> megabytes, so just bail out in that case. This is unfortunate, but I
> don't currently have a way of fixing it.
> 
> Cc: x86@kernel.org
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   hw/i386/x86.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 78cc131926..628fd2b2e9 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1077,6 +1077,36 @@ void x86_load_linux(X86MachineState *x86ms,
>       }
>       fclose(f);
>   
> +    /* If a setup_data is going to be used, make sure that the bootloader won't
> +     * decompress into it and clobber those bytes. */
> +    if (dtb_filename || !legacy_no_rng_seed) {
> +        uint32_t payload_offset = ldl_p(setup + 0x248);
> +        uint32_t payload_length = ldl_p(setup + 0x24c);
> +        uint32_t target_address = ldl_p(setup + 0x258);

Nitpicking, can the Linux kernel add these magic values in
arch/x86/include/uapi/asm/bootparam.h? Or can we use
offsetof(setup_header) to get them?

> +        uint32_t decompressed_length = ldl_p(kernel + payload_offset + payload_length - 4);
> +
> +        uint32_t estimated_setup_data_length = 4096 * 16;
> +        uint32_t start_setup_data = prot_addr + kernel_size;
> +        uint32_t end_setup_data = start_setup_data + estimated_setup_data_length;
> +        uint32_t start_target = target_address;
> +        uint32_t end_target = target_address + decompressed_length;

Maybe we can simply use 'unsigned' type.

> +        if ((start_setup_data >= start_target && start_setup_data < end_target) ||
> +            (end_setup_data >= start_target && end_setup_data < end_target)) {
> +            uint32_t padded_size = target_address + decompressed_length - prot_addr;
> +
> +            /* The early stage can't address past around 64 MB from the original
> +             * mapping, so just give up in that case. */
> +            if (padded_size < 62 * 1024 * 1024)

You mention 64 but check for 62, is that expected? You can use the MiB
definitions to ease code review: 64 * MiB.

> +                kernel_size = padded_size;
> +            else {
> +                fprintf(stderr, "qemu: Kernel image too large to hold setup_data\n");
> +                dtb_filename = NULL;
> +                legacy_no_rng_seed = true;
> +            }
> +        }
> +    }
Fix looks good, glad you figured out the problem.

Regards,

Phil.

