Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF15515FA5
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:44:37 +0200 (CEST)
Received: from localhost ([::1]:58774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkr91-0001aj-Ly
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkr6M-0008Ff-CY
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:41:50 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkr6K-0006cR-LJ
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:41:50 -0400
Received: by mail-pg1-x529.google.com with SMTP id z21so8808094pgj.1
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LyM0Hep1JcB07PBTx578z117hATRJWWbRd+ANNC2TeE=;
 b=QsPA8gcc0edQ/RfAeE1Ow3STK2rzuPXly0KeU+XCMSugjnR2hWY6SpgzpmO0C1CJs0
 /VXwGGYZD9xHuaYAvLt0vmPXU+fTRMg0nYONoJf4NIVWIStQZ5ldMuLzGvlaovXBa+AW
 bQ91K4O0wGJBhKRQ3sSxYPCKvRx1BrAli5f92lrQnFXy6Kgpv77qEZ4E61amcW2O4IB1
 6ozEwF1baaELSRK4MpiN67IY6z+SsUgkhZNQinua2Ba/rJK5OLbh3BHO4DxLFfvyNsRT
 /omsmDgl8hOfrfaj84fs+HvqmjxWrLONRKVD/pyv7ro3aUZr+BkuZQnbBiFln1aHxuBv
 kqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LyM0Hep1JcB07PBTx578z117hATRJWWbRd+ANNC2TeE=;
 b=2TfMk+ZyfjoqxBob3pK2GQpQ6y1nI3r4tfKPOFdnZWesMw8f5lGzDY/HX9lblMjxbk
 GKYpWZSRrKjLHaDMUXeG6/xhp4t/k0k7kVc2V8Dma0y5q305yQnmbabMSNvrxBCtsdLF
 OD2gGqWObd5XMVTSX26iPs6blOqk6hRe0BTlxvOdvDzpCZNkEwIhJNrgiiPcu38vifLw
 IaQ1fL8APRj9dLtC5UYyWBZQ+uqRrwP+27GaA9bBl9Y/ey5B9KPT1c2P6fAb4lc3E+o8
 gY6fkiVx06PLr6f4QsdnbgUP8VcB9BhsZTXFhGjBbfxZKK+WWVd3YAVT062ZrhQT/ZR5
 VTeA==
X-Gm-Message-State: AOAM530jhDk1sfbfZ8uiNMvYdSRHrR68agTNKrcXPGcoMuTqNfr7+zKP
 ARdnqPYTTdvWnFfGFz+oXfVeAg==
X-Google-Smtp-Source: ABdhPJzvkpsrrFc4bCqSco8RPfuzM2wmiPyAQA4k3eqeQZlLgAikjVYxqKcSIpgIFU/uM+a8FoDRMA==
X-Received: by 2002:a62:170b:0:b0:50a:6901:b633 with SMTP id
 11-20020a62170b000000b0050a6901b633mr4517489pfx.34.1651340507020; 
 Sat, 30 Apr 2022 10:41:47 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a62e113000000b0050dc76281e0sm1789755pfh.186.2022.04.30.10.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 10:41:46 -0700 (PDT)
Message-ID: <f27e5349-45b2-d183-17ae-3e88dfa87d31@linaro.org>
Date: Sat, 30 Apr 2022 10:41:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 32/43] hw/intc: Add LoongArch ls7a interrupt controller
 support(PCH-PIC)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-33-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429100729.1572481-33-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 03:07, Xiaojuan Yang wrote:
> This patch realize the PCH-PIC interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   MAINTAINERS                         |   1 +
>   hw/intc/Kconfig                     |   4 +
>   hw/intc/loongarch_pch_pic.c         | 431 ++++++++++++++++++++++++++++
>   hw/intc/meson.build                 |   1 +
>   hw/intc/trace-events                |   9 +
>   hw/loongarch/Kconfig                |   1 +
>   include/hw/intc/loongarch_pch_pic.h |  69 +++++
>   include/hw/pci-host/ls7a.h          |  30 ++
>   8 files changed, 546 insertions(+)
>   create mode 100644 hw/intc/loongarch_pch_pic.c
>   create mode 100644 include/hw/intc/loongarch_pch_pic.h
>   create mode 100644 include/hw/pci-host/ls7a.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

