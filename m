Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C54A3E22
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 08:20:57 +0100 (CET)
Received: from localhost ([::1]:52258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEQzf-00066N-Ut
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 02:20:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQYf-00088o-78
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:53:15 -0500
Received: from [2607:f8b0:4864:20::52d] (port=42798
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQYW-0002FB-U3
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:52:55 -0500
Received: by mail-pg1-x52d.google.com with SMTP id g2so11379863pgo.9
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 22:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nwro02bIn0SUXTmcmMiR7X5A1AHyjOlaOi2qufzf65A=;
 b=w/ZRhDim2JqNHIHrrE7s9SvxrTdPQyK2oXf7/LS4SrseQbVoyjoQ61zQp//r07bFy3
 0tACZ2hsdlnCllMFi2tYLQw+jX4yq8KAHXnupEfW/ZRBIsk5Xo45sB5l0icHOQu4PYfg
 ZaJ9izJbcx2IzfHm53jl3R+vSKwBKuRVieC4qF74XldV/I82MB6C7thPy1TWfiAhtv8s
 gnZRSUtq3gMPsHNHZ48dGVURkqhUD9IBzD6t8Hhrb5cifll5huCJ1a9ZvSK8RTaTasM4
 IQTIc2LPlhTZUl8ybPB1Nfelsc3obQuYCK0FwvcnJzP1K8MR9q1c0ZT3P/SAwyBw1FCj
 M1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nwro02bIn0SUXTmcmMiR7X5A1AHyjOlaOi2qufzf65A=;
 b=anB0sT6jdeUSfC2Bt+AJ4AwpYvZVuWi62qusDRXtulDMoUqQo2qk8kadOiOkbS3oXi
 XKooQcwih2jgcrDLSopF3dML01NphD4PoMQbgV51Oo4f1Fa13Fe3N5i/6xOpg+pqbp7J
 WU0aE7FIVnzfuKvJuIKmOULQKFcG/W3YHUE7SI1O0wgp31FjrNHTS5VeY0cc+vGPJZiv
 L8ii37qK21EBiPMGT4Ayf0Fpz7QAu4wQ9EO7dkrYzXo81jh+daN8FiY0pYwKW3OhaFY+
 n6r81jeED/xH3re0EBfgHWqrQIqne18ysxaQF0Db9sEObQxGNhn5w3eSu3+KJlG6Erg/
 33lg==
X-Gm-Message-State: AOAM530kEUXCGrhKDxuRhT0aiyVS3+gbDBSzZVdYcZxZOj/T/iIZfwvX
 K/JORMZComOURMxl62xuAKI8wQ==
X-Google-Smtp-Source: ABdhPJydCdg8krxHUwWiJgmJj399dwCCVUPaNH1Zx2/qFMzuCPvpzkmXOPZQD3YsYtwpGrgagI6TRw==
X-Received: by 2002:a05:6a00:1c4b:: with SMTP id
 s11mr19266947pfw.51.1643611965204; 
 Sun, 30 Jan 2022 22:52:45 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id e15sm9707309pjd.52.2022.01.30.22.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 22:52:44 -0800 (PST)
Message-ID: <b5b2e7b9-cf3f-25f8-885e-23c44fe4dc65@linaro.org>
Date: Mon, 31 Jan 2022 17:52:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/16] hw/arm/virt: Let boot.c handle PSCI enablement
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 02:46, Peter Maydell wrote:
> Instead of setting the CPU psci-conduit and start-powered-off
> properties in the virt board code, set the arm_boot_info psci_conduit
> field so that the boot.c code can do it.
> 
> This will fix a corner case where we were incorrectly enabling PSCI
> emulation when booting guest code into EL3 because it was an ELF file
> passed to -kernel or to the generic loader.  (EL3 guest code started
> via -bios or -pflash was already being run with PSCI emulation
> disabled.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

