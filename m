Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BC46A176C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:41:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSho-0008I2-FT; Fri, 24 Feb 2023 02:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSgt-000829-69
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:40:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSgq-000799-6U
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:40:25 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so1220930wms.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K/ulTJCxtq/PWOrNxnhSgdN8+YOKEAezHFlu6Y0uXXM=;
 b=q+W0MU8399r+SUXPU/rUS6DQmHbJb4bvkVdcM0lbJFgNcBVxnTs01Nh5XIZK8V4Ncw
 V1HW7jtXjVmQrnsE8s4ULC2EOwN6HodGPJP+KT9UFL7qzQSrPDsoerwAXK3taGUPM+0E
 3RMhW9E+NGR6FYx3rZPOGc0jgAb7aD7BY6oDnUSBvp60XRt6ZAlb5gbqYvCFWXAE7y+k
 I6ZbtoD/FA7nFxiuzXhtt3XwF2stLtwlB3CeTXbDRGrn3p8Rf2P7F9ldAcPyuCMqqF13
 jlRHaeILiRXQLRrZDad4AkT7OpjWNZPPnycf1+629dAcUFiyDfLgWLcohVKWzJ0qvZt8
 Xj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K/ulTJCxtq/PWOrNxnhSgdN8+YOKEAezHFlu6Y0uXXM=;
 b=k+aF8jwgw6e4tWFNeXXCAZCuqDYdIDBQZdz4mDbUH4QjI6QggJD2kIAQijcvZ6FwzS
 uYceNVNgkUBXa8HyV1IjyHjxik5me8SNAhURUmbMrhB3z90fSfxhktrlUFCTc/RnzhZA
 kPOkBMnvOkCmj0R4jiB8Ta7F3pQPDpXgeGLko8VMBHimrrSHFCB3kJMX8JRwusFNoeGm
 3VcdorvXaPS2chvHEpt7rxKVUmzofOsl7KYhjS3GfXV8RvJlqA6jy6LjP0wPLvKSLDzC
 mK9dJtoMAXv8O/KSC69BOgn1ZJlpbye53TtNa3yZg6bEzwPfb7aiunFL3m5PcfOddq3d
 bj1A==
X-Gm-Message-State: AO0yUKVYayVhjutj8ec6l4Z31+0ArJOArcdDv2mcv3x5EB/DYa6E6dxf
 1iOhGhTxTEOPyKEFI5unlktksA==
X-Google-Smtp-Source: AK7set8khBiYRdaXL2YSrsG2XhutTkDObU+4m9vDGS0Jb2BJHYGFp7yVWqPR5VArRgwYpB+QphG82Q==
X-Received: by 2002:a05:600c:4929:b0:3e2:1f63:4beb with SMTP id
 f41-20020a05600c492900b003e21f634bebmr11496596wmp.19.1677224422599; 
 Thu, 23 Feb 2023 23:40:22 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v15-20020adfedcf000000b002c70ce264bfsm6043410wro.76.2023.02.23.23.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 23:40:22 -0800 (PST)
Message-ID: <54cdb990-50e8-cfb5-b74d-43cd7bf4f565@linaro.org>
Date: Fri, 24 Feb 2023 08:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] Deprecate the "-no-acpi" command line switch
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: libvir-list@redhat.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Sunil V L <sunilvl@ventanamicro.com>
References: <20230224073441.1105921-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224073441.1105921-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 24/2/23 08:34, Thomas Huth wrote:
> Similar to "-no-hpet", the "-no-acpi" switch is a legacy command
> line option that should be replaced with the "acpi" machine parameter
> nowadays.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst | 6 ++++++
>   softmmu/vl.c              | 1 +
>   2 files changed, 7 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


