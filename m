Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9455A9FFE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 21:31:51 +0200 (CEST)
Received: from localhost ([::1]:41154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpuo-0003dG-8B
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 15:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTpYB-0006B6-Hh
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 15:08:27 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTpY9-0002cS-Vz
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 15:08:27 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 j9-20020a17090a3e0900b001fd9568b117so3670535pjc.3
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 12:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=k1rkeb9OAWFVCzO4ik5vHSU9KbNz3+kHPmvioK7EmNk=;
 b=jnmBR13ZNVWKGf3As1Ct+V4unVF7ksPlAFjqc/1OjmyiRFQP8FUUii6aWOnYEbp3wO
 Nu1dQxWJnE7PfnNPnBbyemfg1t+GhXOMaB9EoYmzc++4jbzk7bZPt8y19rVmiXdx74rb
 6YGYCfdWIPQYlur2W+mIr0zeE3MSkEu0QM5FT2MOzvY41Fhc15fesDcfFa9FfX9Cjgdw
 LW+r2zM+2WDbHzgg30aK4ReZYj8073hRs6YCTUGDNECHdFrLdzMP5JdNLzaVSJVXnwA7
 7RtqLxRaodNesEgI1rGQo0CRbxBh6RmMh3hhzdZriMuvhqz8QvieKRB3nUATGHsnhf+l
 isKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=k1rkeb9OAWFVCzO4ik5vHSU9KbNz3+kHPmvioK7EmNk=;
 b=i89+7/OCCKkOAZXsTcLoSCZnMj0Rn5X4oaVk63eJZvLoUC7bBiw5pINSn6+m43wzoD
 A7fZQ9dENebT53yLvulCS92KS/W5IsetsaXu4HeKG0Uy+Ca3GaJotb8MEHdm4vqS6Iyz
 r7nzfwpvs7/jHJZZJYfqLliPxZgSBj/BDye2QJo1PQQnGqMr4hKgk+V11j8xMuMKgIKX
 x3/TaCmkTNgOV/rlPncRPWdjlhMPG5QgBSCk9xt3ngTIaSuYcws/OsJNU9ttN1hkPKxp
 n1kzcrmypKhZ+Y+eAV/VpzcwnslMwH/V8a4adYFmtZK+h5a+FHUI5gOjhrRchrcBlyjQ
 vOLg==
X-Gm-Message-State: ACgBeo39jdMswYJqzDnhE4RXoqQyqo26lyGFvfoGCchfhs5WsiiMBol7
 N7JZ3QwMBIsNFgwOO9GhGWo=
X-Google-Smtp-Source: AA6agR4nbQPNBT4V3sZGixc8iJjs8XGKsYNV2ZxfQ/ATNnxO1vcx6SpgPzV/ScS2BnPv1q9H1lH7FA==
X-Received: by 2002:a17:902:d091:b0:174:f7aa:9201 with SMTP id
 v17-20020a170902d09100b00174f7aa9201mr16956139plv.59.1662059303903; 
 Thu, 01 Sep 2022 12:08:23 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 iw10-20020a170903044a00b00172bd4c12b2sm14141613plb.224.2022.09.01.12.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 12:08:23 -0700 (PDT)
Message-ID: <0087d387-c504-2584-6ea4-afd9e4ff0fb4@amsat.org>
Date: Thu, 1 Sep 2022 21:08:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 01/42] hw/i386/pc: Create DMA controllers in south bridges
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-2-shentey@gmail.com>
In-Reply-To: <20220901162613.6939-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 1/9/22 18:25, Bernhard Beschow wrote:
> Just like in the real hardware (and in PIIX4), create the DMA
> controllers in the south bridges.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc.c      | 3 ---
>   hw/i386/pc_piix.c | 2 ++
>   hw/isa/Kconfig    | 2 ++
>   hw/isa/lpc_ich9.c | 3 +++
>   hw/isa/piix3.c    | 9 +++++++--
>   5 files changed, 14 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

