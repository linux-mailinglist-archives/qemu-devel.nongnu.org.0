Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC618640109
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 08:32:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p10Vp-0003iu-KC; Fri, 02 Dec 2022 02:31:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p10VV-0003eM-HC
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 02:31:04 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p10VS-00071U-8f
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 02:30:48 -0500
Received: by mail-wr1-x433.google.com with SMTP id u12so5542372wrr.11
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 23:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J8ql54sZJDunHedzTHnvosP2GFNhHBt/jwxcWVqkKrw=;
 b=TVm1NIYh1Q7iAyTsM7qc7hev15vNkoSE8EUSnwGoHabUGC7UBmF1fkdCO/1U1u9xvo
 KlSdHsLwxaur76EYgZ0zvMRl4P1QQiaY/9VWmVIvozawQHZ6uPeV1DuOyrTs+I80n8LX
 XVNCBStJBxUoIjtj9rxXkW4qSgR1dP7w4xaZtMQGwQqUfRhhF/tswrPe8GJrhrQQ3Qiy
 rPKxcZONGThvC4K9MK7QdaLY39ddR18fAIWzSwK2l+VLUowb05BdG4jphZtRNbWTasSf
 gUm21rixoV27yY4W2G24evxcn5WR5MUUS2rjHYj5mBOZhhfOI32cFVp7kohXXzjZhZQv
 jsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J8ql54sZJDunHedzTHnvosP2GFNhHBt/jwxcWVqkKrw=;
 b=JQ4Njwi5F+1li6Q7xB6eVTojmdaCuLtoH54iosW6zxbK7/JIQZl3fATIwxhyXDEuAF
 3KiGwYq4VlALNXdkl2S+teE89Vwf0J/lOLZBuDMojNidrZHTM6Bv1gCWwY+AIH/rBvWM
 HZ+7u7lz2D5PKqS+fKrdbLXewcRQ2ZzmwpWV1LPAhgUFjezFtoA7iTSdI5rt7ZAzWgeW
 6nFdT/yk2abk4WyXGxQ/kJ6xNPe+azci17E+wpn/P/mvUegAtRfbPHaRJsjxpgcZrNyB
 R3DGjznsZcN4mYUWpdK69rE0YPhtZTig8Cl4AkDBQE+LgCbhXY+SMJI0ISGidVyulwc6
 fRkQ==
X-Gm-Message-State: ANoB5pl75r6gLvonwvVUPsmRkf0OofsrYXAyNDvabhj2g4m+P5VK+jS+
 93WdICURN3ZKtat0u+MDdDT2XQ==
X-Google-Smtp-Source: AA0mqf4hLyZpN4MxmrOcTbwU9h/hfXuZXL0BMzihoq1RZI2AynblVXMjBtNnrDSTRdGVTGfqWnAZbA==
X-Received: by 2002:adf:f8cf:0:b0:242:3fac:df9f with SMTP id
 f15-20020adff8cf000000b002423facdf9fmr2641768wrq.117.1669966243940; 
 Thu, 01 Dec 2022 23:30:43 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ay2-20020a05600c1e0200b003cfd0bd8c0asm7871437wmb.30.2022.12.01.23.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 23:30:43 -0800 (PST)
Message-ID: <429495ae-9d8e-9921-9e8a-f913cb5b2779@linaro.org>
Date: Fri, 2 Dec 2022 08:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com
Cc: stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202030003.11441-11-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/12/22 04:00, Vikram Garhwal wrote:
> Add a new machine xenpv which creates a IOREQ server to register/connect with
> Xen Hypervisor.
> 
> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, adds a
> TPM emulator and connects to swtpm running on host machine via chardev socket
> and support TPM functionalities for a guest domain.
> 
> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
>      -chardev socket,id=chrtpm,path=/tmp/myvtpm2/swtpm-sock \
>      -tpmdev emulator,id=tpm0,chardev=chrtpm \
> 
> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpms and
> provides access to TPM functionality over socket, chardev and CUSE interface.
> Github repo: https://github.com/stefanberger/swtpm
> Example for starting swtpm on host machine:
>      mkdir /tmp/vtpm2
>      swtpm socket --tpmstate dir=/tmp/vtpm2 \
>      --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &
> 
> /* Comment about machine name. Will be removed in next version*/
> Please reply with the machine name you agree. Below are two possible names:
> 1. xenpv
> 2. xenpvh
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   hw/arm/meson.build            |   2 +
>   hw/arm/xen_arm.c              | 175 ++++++++++++++++++++++++++++++++++
>   include/hw/arm/xen_arch_hvm.h |   9 ++
>   include/hw/xen/arch_hvm.h     |   2 +
>   4 files changed, 188 insertions(+)
>   create mode 100644 hw/arm/xen_arm.c
>   create mode 100644 include/hw/arm/xen_arch_hvm.h


> diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
> index 26674648d8..c7c515220d 100644
> --- a/include/hw/xen/arch_hvm.h
> +++ b/include/hw/xen/arch_hvm.h
> @@ -1,3 +1,5 @@
>   #if defined(TARGET_I386) || defined(TARGET_X86_64)
>   #include "hw/i386/xen_arch_hvm.h"
> +#elif defined(TARGET_ARM) || defined(TARGET_ARM_64)
> +#include "hw/arm/xen_arch_hvm.h"
>   #endif

Do we really want to maintain a 32-bit PV machine?

