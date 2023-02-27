Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F746A4132
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:51:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWc2X-0007wA-9m; Mon, 27 Feb 2023 06:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc2O-0007pa-2P
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:51:24 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc2M-0008OP-4e
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:51:23 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bt28so5894397wrb.8
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4XORySYyKY3BiK4MBqHB7AqUrxMxBiEYKWl1bvzrNYM=;
 b=tDWOGKYumRUvo/Tacd83pjVXKPTKlKdrcDhapm6yu8PgJvBe6eLGvAmBZEGyuYp8E5
 qee5V3y9SRddiA6k8NVRye0tHE83FE16EGr4Dw1lCIOZ3o7vNH6gj5wzWhWzflGWdjU1
 Z6+LAmO2WFiCofH9HWXg1hvasfrlAz9eWyF0V8Ag3X/XgWBgtUT73GO0PSpSCS4oJuCq
 HT2wLwZn93UKTSHqEPQJA3w9vdL/FS89Fty3nci1VhiDZhaeC5EKpPsBiz2Nx8CLGnvx
 v5aAesoFXYrMyqaVVNqREpH2aWMucZeZ7jC3JBmNG8aObhg0FKxRwNkw2EAJt5Zf7M9+
 7dQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4XORySYyKY3BiK4MBqHB7AqUrxMxBiEYKWl1bvzrNYM=;
 b=7NvxOTANEXQFAjG2MFtKn2PsOFxzDHpyC0xO/6pKfFilmEHBA/RmcmDq5jXQKZhooF
 LBdWvgd+HpGZ2b84no42IBJJe8nFtRo1PJ0Se/+NzANcCmoRFP+vnAanIRINNZ327Q/D
 khG/KHyn0K3Sgwy/t43oKx37aG7uCwUdshxnzAJF9y8vYB7T1LYHmefD2TilWtQi7HJy
 YJY8xzFc+z3keNRXwNv8BUoMg+HCsO+6k/9j18M6quKYkuWs2UBAwhEkPXgdrZ979Lss
 QQgQK4Y713Pi6TZuVvXq9u54pdh5gm2so3helzO9PP6llbQjPiwjDmSMjpLKdoqsprtI
 2L9g==
X-Gm-Message-State: AO0yUKUKMlProeBIYHU500DFaW2cIhnsB1yiMWReNByvesaxbCR/4nE/
 8FgjW0hgllE0NymjCOarbTjttA==
X-Google-Smtp-Source: AK7set9hMRc1uqlmF2MATrM8WFJoGEw0FUsItT9VSsoCmntNTCA+uFFmH+PHZOmc4ERrjUMCGc9A5w==
X-Received: by 2002:a5d:410b:0:b0:2c5:58f5:3c40 with SMTP id
 l11-20020a5d410b000000b002c558f53c40mr17568648wrp.47.1677498680756; 
 Mon, 27 Feb 2023 03:51:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u3-20020adfed43000000b002c55ec7f661sm7209120wro.5.2023.02.27.03.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:51:20 -0800 (PST)
Message-ID: <74289dc6-2db4-36a4-0e77-1c22f4878542@linaro.org>
Date: Mon, 27 Feb 2023 12:51:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 02/12] hw/isa/lpc_ich9: Unexport PIRQ functions
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-3-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213173033.98762-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 13/2/23 18:30, Bernhard Beschow wrote:
> No need to rely on the board to wire up the ICH9 PCI IRQs. All functions
> access private state of the LPC device which suggests that it should
> wire up the IRQs.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/i386/ich9.h |  3 ---
>   hw/i386/pc_q35.c       |  3 ---
>   hw/isa/lpc_ich9.c      | 11 ++++++++---
>   3 files changed, 8 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


