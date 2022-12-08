Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEE7646D2F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 11:39:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3EJ5-00064L-Nk; Thu, 08 Dec 2022 05:39:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3EIw-00062k-MA
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:39:03 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3EIu-0007E5-Bv
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:39:01 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so3054281wma.1
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 02:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9KNChatK01C/k+8biw8V4IvvIRZ8D064/j41PvJ5YZs=;
 b=NNAeLbCZ+20AAd7zImknYXIYrrpL516QfkSNyqjsqucadKdpHxAmD799/QazCe8/mo
 xlvhfzpQvDA+KuYeGaBWZh2Kq+SKzRO3n27EZsxPH+f5vtlF17Fw6fbQZgPbpajlSvmB
 xFSABhpDtokiqjexLb5O2ZjeFN0YYemXdIN5sPY3w2xqCiIgfRgwyNzRsduB+GwofoFg
 uB6hrAu5bYkuZcMJUBFfFv4FZ9EMQ8bEIljlDlySvKe61UPOvXXCpKAqWtuvtSrYW6Nu
 QujQjFjwcaSTegpiC8rQmgCQ3cuRaidz4vIhsshp+Q3msGzuEiOFFgTt/vdAFDsn4VQv
 egrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9KNChatK01C/k+8biw8V4IvvIRZ8D064/j41PvJ5YZs=;
 b=5ipswBacynz98VXG0BZA1Bw6yawUME6Tu5veQW6nW8jNLsje/7h4cLftgijjQ7vnYJ
 Eti1GCaRzmR6eaLVNYfekMch9yX5ZNSTUh0NKbLftUWU9ytCH1JVh8cUl2etZ14kntKP
 SKbwhnn7XHHBm5Iib8hyG2N4CNyHB6pRXDL6G9SsfK04j8lLKB1cebD/C5SawlhThQ+A
 m9aiwiANai/G9LQX3hSZqrwN+NJ+ImCgDIuLg4MyPtgngPxUwfj0n/KnzCTE3umhffJD
 FzLaJhP9DCXP4p/gnKH8AXoQOiJD3x4TB9ucFXZvZF0sbSqchcUogGc2XbZEBn23/YEW
 CjEg==
X-Gm-Message-State: ANoB5pml1XeaufFmTT7HuZIsTrK+/sDLjwqgGeMxfl4MjWBLnhx9E7+2
 GRAauICP3/m0UaYB1XPYI3WIxmrMKmBh3sxRR74=
X-Google-Smtp-Source: AA0mqf5ghrXrj9DPHZNEQooal51+HMIdilU9k0hDhfL6vPK0OKSWzOSoxOvvxPpfh0IvsSFrkSKNCw==
X-Received: by 2002:a05:600c:35c4:b0:3cf:9668:e8f8 with SMTP id
 r4-20020a05600c35c400b003cf9668e8f8mr58978402wmq.195.1670495938893; 
 Thu, 08 Dec 2022 02:38:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 iv7-20020a05600c548700b003d1f3e9df3csm5271137wmb.7.2022.12.08.02.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 02:38:58 -0800 (PST)
Message-ID: <e817f6bc-1a64-f891-f996-dbb588cd92cc@linaro.org>
Date: Thu, 8 Dec 2022 11:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 02/16] hw/intc: Select MSI_NONBROKEN in RISC-V AIA
 interrupt controllers
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20221207100335.290481-1-bmeng@tinylab.org>
 <20221207100335.290481-2-bmeng@tinylab.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221207100335.290481-2-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
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

On 7/12/22 11:03, Bin Meng wrote:
> hw/pci/Kconfig says MSI_NONBROKEN should be selected by interrupt
> controllers regardless of how MSI is implemented. msi_nonbroken is
> initialized to true in both riscv_aplic_realize() and
> riscv_imsic_realize().
> 
> Select MSI_NONBROKEN in RISCV_APLIC and RISCV_IMSIC.
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> 
> (no changes since v1)
> 
>   hw/intc/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


