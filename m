Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E5239CBEE
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 02:33:31 +0200 (CEST)
Received: from localhost ([::1]:42832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpgjK-0000Sb-JZ
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 20:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpgiZ-00087H-Uj
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 20:32:43 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpgiY-000390-Cn
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 20:32:43 -0400
Received: by mail-pl1-x62a.google.com with SMTP id e1so6616486pld.13
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 17:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/eGLohZarLgkRkEyAt3lkNg3P9LmCQKZdbpFSJiqwx0=;
 b=YXEoBQHD+GY7qa4f+4aX6xncE3bUfNdJL9Y36gJ3jNy8b15pLj8Lpg1EAescBK4ckQ
 AU9Ei0LhQdskt8Umir6S+d9294+WwJwKfQYXGx/27ZS2VJC39GR8M2mXpLEJpXmRlAyg
 JlnQv1CnB9zTDl+fF5xwrZX9PTrCPnkXxD2ohm+bMBCXoE8JZNLMTaaaYX1AvxTrbl1Z
 S5WuVFUZO7clIyydeD+EZUrm3yz+fj/exJTT57VfO8OsBP97ID0a80gaGp7X59EZFVeG
 ZIBQRDzG9y++zgX7oI/i1DRLAtvpOEnAG30Sn6DEsyDYF6jLiQ8jqeCeSvsh9zdXuk6R
 cUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/eGLohZarLgkRkEyAt3lkNg3P9LmCQKZdbpFSJiqwx0=;
 b=EFhgztXWgrjaX/FnJnnRq/HCiajl1rg0yEE2Fl+yKRUdREIes6LQ5m2Ln9Hz3eW5Sp
 h6VMoOibm6bUlmjh/vgn6BNuW87u4tTIK1dNhPm0eQM4aciJmKb+YHWtxe7rEyeNbsBT
 UNct4L1gbPXOLW40Ch4Fh0eXY840irZ4xX/QojUHnt767tYD7sC13Tel3ra0KXzy3a/m
 3JM2HguVDPPLNxZ7lRFDrZJ/3cs55XzSO6fLA/sJSTzYSAek4FhQR3KXZuikrbVifAIb
 fYgaFiz/h7oJv8jlsdmi8xUk8N7hvH5Xn1J6a6KHl3AK1SRp0jCSB5pkXgkQgg8lbVUG
 W4Ow==
X-Gm-Message-State: AOAM531OrLpfp/NQJB/9F8iGOwkT9wDkQZSfBITqQC6Mf1wVe5HSrF2X
 ondrRGuteyz8ydjxdgToCpL/FGIvn/B56A==
X-Google-Smtp-Source: ABdhPJwTe3el8WjgJ9hFOtDJKgolql5SkOjwSqp2TRLb+pheuSyfCOSMxFjAxaHztQ0m4BHqHhbBmQ==
X-Received: by 2002:a17:903:4106:b029:10d:22fa:13d4 with SMTP id
 r6-20020a1709034106b029010d22fa13d4mr11218817pld.78.1622939560703; 
 Sat, 05 Jun 2021 17:32:40 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 x13sm9228186pja.3.2021.06.05.17.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 17:32:40 -0700 (PDT)
Subject: Re: [PATCH 4/8] Make some PCI macros available to other files. NFC.
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210603035317.6814-1-thorpej@me.com>
 <20210603035317.6814-5-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <828ec620-9565-4bcb-9e7a-944f854682d9@linaro.org>
Date: Sat, 5 Jun 2021 17:32:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603035317.6814-5-thorpej@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 8:53 PM, Jason Thorpe wrote:
> Move PCI_DEVFN(), PCI_BUS(), PCI_SLOT(), and PCI_FUNC() to pci.h.
> 
> Signed-off-by: Jason Thorpe<thorpej@me.com>
> ---
>   pci.c | 4 ----
>   pci.h | 5 +++++
>   2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

