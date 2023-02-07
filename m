Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764E768D2D1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 10:30:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKIf-0003dr-BA; Tue, 07 Feb 2023 04:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPKId-0003cu-Ju
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:30:03 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPKIb-00040c-Ve
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:30:03 -0500
Received: by mail-wr1-x435.google.com with SMTP id d14so12866599wrr.9
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 01:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Li7CX6psPPPZvcWliKSjDe7eAKUR6K9zHWJyX7RHk4=;
 b=quaaJKe2CyVtPvaGQ2R0yD56jXUUR/pTb0a2C9swJC7/NgGhiGp1mjyFiviseSAu8l
 tXFnuoYbMmpdgxXT8yR8B+srgtqFKrNYaqWgIlTsVulTwSKEzB+cgQSWE7LJ85wwfbPs
 GoPOhtKmbnGxYN/z7YjTAU2CMhj+w8xG2B3i0QL8fuYmg9T8MWO2tf7aR5iNVsK9Ooe5
 faYg8d7H9toePwYhQFe2uaP9zR+6twO8zaeh4eLK3irswTZNy6SzRyMktr8myoKLygIS
 WzS2dE7VCC5r32hUCpcB8oevXRSK1yDjgGnEr2gLwPCKs1mNrgnvgEuxGiDZ+7xjZffb
 iiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Li7CX6psPPPZvcWliKSjDe7eAKUR6K9zHWJyX7RHk4=;
 b=5RGZcesn3PqNy0qeM750wlmE+sVcNMfv2uE8fwu5CyTR1rLF3Nq6arIa09ddDDyhhO
 Sr8ZT7d7cqEEDdo6KQpBXZKU9IxW5KoaIWQk14K1aWHOiMnDtTKia8IUQz9tQoe0Q4v1
 Gnl9BOCbq36IDPzhI/He+9Xq9/HVK8gRa5uC2MPwFU+oMgpREKFxI5VVMwdwl8ZcQozl
 /PAT0PkS7gqnTC2HrzDLvc18FucPOqvkW4/ngReDGPfhJPH6NZgNEAm5TWlW+dmG+weq
 SdRVbq5G+Jgg20myMYEEhR3sZV5eQ7KgoYL8reGWK8YI1plD3IEGuSQZ8fFUBxbBB479
 rvjw==
X-Gm-Message-State: AO0yUKX+IwGSspUnDSPVfoe0MhdFE9H8/2a4xcsuBUpqtD/rGSaQX46j
 Lxh9uLXcL572SIOUKdeXO6DbZTk1e7jhI0om
X-Google-Smtp-Source: AK7set/TNHGlBA6fceKxGHuZEFGdPYo54C7hbhCOBaYa7GoGlIB+0m3a4+R8FhredekZTwIG+ugaBA==
X-Received: by 2002:adf:ef43:0:b0:2bf:ea34:dfe4 with SMTP id
 c3-20020adfef43000000b002bfea34dfe4mr1941170wrp.42.1675762199688; 
 Tue, 07 Feb 2023 01:29:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n9-20020a5d5989000000b002bc7fcf08ddsm11147895wri.103.2023.02.07.01.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 01:29:59 -0800 (PST)
Message-ID: <e54fc1c8-c54b-8b96-9b4f-5c0e9945e209@linaro.org>
Date: Tue, 7 Feb 2023 10:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] MAINTAINERS: add myself maintainer for the clock framework
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Peter Maydell <peter.maydell@linaro.org>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Mark Burton <mburton@qti.qualcomm.com>,
 Damien Hedde <damien.hedde@sifive.com>
References: <20210211085318.2507-1-luc@lmichel.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20210211085318.2507-1-luc@lmichel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 11/2/21 09:53, Luc Michel wrote:
> Also add Damien as a reviewer.
> 
> Signed-off-by: Luc Michel <luc@lmichel.fr>
> ---
>   MAINTAINERS | 11 +++++++++++
>   1 file changed, 11 insertions(+)

> +Clock framework
> +M: Luc Michel <luc@lmichel.fr>
> +R: Damien Hedde <damien.hedde@greensocs.com>

FTR Damien address is bouncing.

> +S: Maintained
> +F: include/hw/clock.h
> +F: include/hw/qdev-clock.h
> +F: hw/core/clock.c
> +F: hw/core/clock-vmstate.c
> +F: hw/core/qdev-clock.c
> +F: docs/devel/clocks.rst


