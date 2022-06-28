Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB8055BF96
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:48:47 +0200 (CEST)
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66tq-0006O8-EB
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o66TG-0005SB-3T
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:21:18 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o66TD-0003RE-W6
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:21:17 -0400
Received: by mail-pf1-x435.google.com with SMTP id x4so11359857pfq.2
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 01:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eQuj7/44hN+UfqvPlR5ZsIKTw2ILc/juzQOTV17+KCs=;
 b=KO5Loiu8fMGI/eiIeDbGcXRZ+aBRTJvWzfcggM8BFuxtdp7NxnBAlS4o04Q4mSe6HD
 OrZgIQKsWvP/kwJMqDU5Hs3pJMzdYxN2OfJ5KhX1to57Xk1FFCeVN7OYtbLkYq7NbXVu
 h/uMqqKdsSegS9UUf3dTDTFybUYJSEuC+BSj3PMQWlGAjN2MBvv68xrUP621pU/2P2QH
 dXC7CgTJLWieHwuH+uSXRrfYz62sglVaXAV/ldQ3NDSpSisF7moAcrMQBjmQS4e3mvTy
 dLiRfGJcTysju+2Oon3bCejkvBFVTQ3WW97myhumZQMlBmeyM/kd0hwBnlGSbc7PKp9f
 nksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eQuj7/44hN+UfqvPlR5ZsIKTw2ILc/juzQOTV17+KCs=;
 b=GYwVograCzFIo59X4FF926deRYnW53APVV/hb/Zsb8AwSNItE9PQvd1vfXVRn0/vtS
 IE/aiJRMpmeiF3BpzVZs0isdwDN8s+9QbrePcylDR5XWsfDbk3ksfVzQzPbuqVBOE/f5
 H7/JigOz9cJCAzOW14tfyjXXk5LGnepONKLM9h+zyap2N12nQOEYiTKbWL71Us4O6bpk
 UGlX4o4HegtqFRMk6sbHjyoX3GAgBI+lUMaUeXgdqOo7TU5Ku3+g3JRBucHOLx/FZuTV
 pL31VbgY8UZB4dLhfBsfgkszseimLZXfsXbNBfCM+BtjsrVrMMnobhHXUR6ubQUVCbAV
 A/EQ==
X-Gm-Message-State: AJIora9T+UiVSSHu/nfddx8yfYhDKmmDl17fUfvYywDkyilgqp4Is04E
 AAu4NlQhKklXBi5NZflHwQFChRCBlbzwZA==
X-Google-Smtp-Source: AGRyM1vwsArqKXXCQCRRt8tUv5pVMR9QPJRWGsTEPOM9HjbudxL24KeXgmI+fdUH21DBbuWsr6AhGw==
X-Received: by 2002:a63:4d65:0:b0:408:9e5c:f7b7 with SMTP id
 n37-20020a634d65000000b004089e5cf7b7mr16438275pgl.553.1656404474464; 
 Tue, 28 Jun 2022 01:21:14 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a1709027ed600b0016a111c83cdsm8618824plb.119.2022.06.28.01.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 01:21:14 -0700 (PDT)
Message-ID: <5c307343-49cc-a506-b960-315822ebf11b@linaro.org>
Date: Tue, 28 Jun 2022 13:51:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Can legacy vga memory base address be defined different with
 architectures
Content-Language: en-US
To: maobibo <maobibo@loongson.cn>, f4bug@amsat.org
Cc: qemu-devel@nongnu.org
References: <dcca81c1-4675-edb9-a6f8-f97dc9860192@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <dcca81c1-4675-edb9-a6f8-f97dc9860192@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/22 12:12, maobibo wrote:
> Hi Philippe,
> 
>      In file include/hw/pci/pci.h, the macro QEMU_PCI_VGA_MEM_BASE is defined as 0xa0000, which represents legacy VGA memory base address. I want to know whether it should be the same for all architectures, or does this vga mmio space exist on arm64/riscv physical machines with pci host bridges?

This is x86 only.


r~

