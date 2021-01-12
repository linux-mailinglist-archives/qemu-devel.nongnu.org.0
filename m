Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4C12F3B9D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 21:47:55 +0100 (CET)
Received: from localhost ([::1]:46550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQa2-000888-Rw
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 15:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzQXF-00075s-J0
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 15:45:01 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzQXA-0001fM-BB
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 15:44:59 -0500
Received: by mail-pj1-x1034.google.com with SMTP id b5so2470543pjl.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 12:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J6LvmtW1iOzC74rt3P4f0XxGw7JtxCxx5N2PJlevo+c=;
 b=FOg3mQtoLH4fGuHyx2SATgDHQgDC4t3cjlj+I1eP56qfG3bWMoJIr/Pad/J7+d5ITn
 OXbq5dNUVWolWIm6c8+OBGWrwixau8D5z7XcvMZDW0IbJ6+RrGDDYOnFghssZez065rF
 A/jFxqCKetBhIfq3VOw068icW80R8GGWI5KID4AgKBsnVIVXW464XD5msnTPgEmylkDs
 3hP5Olsyq0Azeig/EXIK6pqeHHcVheZcLcRP3zMsyoHfiQwXqwkcVnTSyjhI7NZNfYtP
 /pdpwkrWbDttaF+J5gzmTpFZShHU3M7p3IVJA7CvoQYUkrVLK6D7Jl3UslQbsw30Tgw0
 +etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J6LvmtW1iOzC74rt3P4f0XxGw7JtxCxx5N2PJlevo+c=;
 b=rEPcxmqcSgu2GYfuEtCCVBXOtdJ3c9UdGZ3/D4y61hO2zG6bSFLLZ+UCL9iEeVkLjF
 Cer67E0BXwuT5u3u6tOIu71UHIPhwvN5IMCubWm8XjP01/TAWdYjh+1o7IWyQTosI1R+
 fmb5FEuVdwCZ9DtJzfPazB3/+vRznPbmirV6EgvdOcqC1w3qrpfghJxvxm6pmd1s2lho
 cSFglwlyi7DxU3eDAf3pnAz3rZUY1lgpm5l/jSAv/iZDM5SAnXF4mAHL1WnzXYpxhzim
 +s0a01uTasF98RiCxPnQ2M14iCHcgDdeQkGQPw5LOzrDnBUbPbMEFDHs1ML6Uf/8uAri
 AKxw==
X-Gm-Message-State: AOAM5334LZxtPs955k7aUJcz/lubg1WdXghCvM8ELR7tqK9djkg0SEhQ
 ffGkCcXUnM5UJ27o8y02Kxvfvg==
X-Google-Smtp-Source: ABdhPJxZVd+Kh9JB6vEoYFp6UfaMVcnaCWJjMsZb2vaWEYAqX1OtKH+E/JJiQxrInmhQ+QSi6aBe9w==
X-Received: by 2002:a17:90a:cb8b:: with SMTP id a11mr968611pju.3.1610484294429; 
 Tue, 12 Jan 2021 12:44:54 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id l12sm566594pjq.7.2021.01.12.12.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 12:44:53 -0800 (PST)
Subject: Re: [PATCH] decodetree: Allow 'dot' in opcode names
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210112184156.2014305-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7fd434f1-aa6d-f4db-b741-564a33a8540a@linaro.org>
Date: Tue, 12 Jan 2021 10:44:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112184156.2014305-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 8:41 AM, Philippe Mathieu-Daudé wrote:
> Some ISA use a dot in their opcodes. Allow the decodetree
> script to process them. The dot is replaced by an underscore
> in the generated code.

Given that you then have to remember to use '_' on the C side, what advantage
does this give?


r~

