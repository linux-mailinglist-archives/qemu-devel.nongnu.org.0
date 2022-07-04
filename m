Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23351564CEE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:27:20 +0200 (CEST)
Received: from localhost ([::1]:45184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8EcB-0007UT-7S
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EYK-00057g-CT
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:23:22 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EYI-0002EU-OX
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:23:19 -0400
Received: by mail-pj1-x1036.google.com with SMTP id fz10so2145924pjb.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 22:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5RfFaUK5hoEx2ZJOB0pW0yjvkCt1ayZoyz1LPLBueDI=;
 b=sPrLh2tpUr0u7/tSg+ZmfT/RD+iRNgPzlvI/TA5YaTUI60dApaQOJglBlMD932JM7x
 s1nAmBvoKi9aB1KP4aFEZ41d4bPqd/wFCGMrjIulX9/lqTBR+YpwxiIlvhmAjMgqSy7D
 PubNltc1iJxzwNOWqLwaFEeddZSYy2BFtSmM1pJBmY1QmJ6u5FfIiVf6TRM4pLl3I1pF
 Y2w/pKAt/+202VcSR82dMHuySYQz0xb6U2X8cs2zaJrBnt36xU4MNqUDuPSECZgNl/PU
 OIPdPNVkyEHhiHZ2X/TFTX6TNpcVcipudhOi2EuVgyrexlLEAYYqCbVF34Ql9RL3jyU/
 TQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5RfFaUK5hoEx2ZJOB0pW0yjvkCt1ayZoyz1LPLBueDI=;
 b=Qczx793EfwAPQsdIlfg2so7WA/oK3rDOrlMHGE2On7RpSL5KKU5NmVZPZIxn7YbZ0P
 pV6OBsqmhd2/jwXm+YlKMC7Uv47PTvl5R2UtXeOZNFsM3k8S6GlWIQzSeH0b9wvEvpz3
 SdRP7kFMQe6KKCJXrLVHaY8C2gSPt+WGAEbL5FCKKv8kzI49tsuQuWrPIQC+qUG6YeY+
 ceRCnKfwAFBtblc6UwKkKE6Q+KziBjl2gsFr1jG5zDsHIH7u+TMjnGSPFC3r4FA1PEMx
 BJRGacV6+K641eQ/7t7FpaRR9l31FnED4B5RpEFWqX51y77QE+kncY3CbX4dw88ERvAu
 AbxA==
X-Gm-Message-State: AJIora9vtH/GmYbRS2xUkIjZ32Bhm7EINdYWGLexEcxLNULCt3wjj5Y1
 X7C9oe5PpCWtmRXa/WDMOjLJAA==
X-Google-Smtp-Source: AGRyM1uJhqONQcLfDHHgx9o1lRYUTCimUcWACnSH2RBZzZus4VPowDGEwnsq/gGW4lW0rwG6ESCPKg==
X-Received: by 2002:a17:902:8501:b0:16b:8ec5:1bbd with SMTP id
 bj1-20020a170902850100b0016b8ec51bbdmr32493189plb.151.1656912197406; 
 Sun, 03 Jul 2022 22:23:17 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 p12-20020aa79e8c000000b0050dc7628162sm20151013pfq.60.2022.07.03.22.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 22:23:16 -0700 (PDT)
Message-ID: <98426b8c-19a6-34b8-7006-bd1ef3db8f00@linaro.org>
Date: Mon, 4 Jul 2022 10:53:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] hw/intc: loongarch_pch_msi: Fix msi vector convertion
Content-Language: en-US
To: Mao Bibo <maobibo@loongson.cn>
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>, 
 qemu-devel@nongnu.org
References: <20220701030740.2469162-1-maobibo@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220701030740.2469162-1-maobibo@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 7/1/22 08:37, Mao Bibo wrote:
> Loongarch pch msi intc connects to extioi controller, the range of irq number
> is 64-255. Here adds irqbase property for loongarch pch msi controller, we can
> get irq offset from view of pch_msi controller with the method:
>    msi vector (from view of upper extioi intc) - irqbase
> 
> Signed-off-by: Mao Bibo <maobibo@loongson.cn>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

