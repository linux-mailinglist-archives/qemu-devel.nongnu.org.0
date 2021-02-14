Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62D831B185
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 18:22:39 +0100 (CET)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBL6U-0004MK-8j
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 12:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBL50-0003s5-7U
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:21:06 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBL4y-0007lm-IG
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:21:05 -0500
Received: by mail-pg1-x52a.google.com with SMTP id o21so2898107pgn.12
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 09:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aMRE0X6owWycrKmM5vAVLsUz47V4fd3qYVzk9yogPyY=;
 b=NQo6BWdH4ySLhitD84p5ZFA6hdj5ug9I/oRcH5jLPiZBVfPeUZzCjJ1uwy1ISNGEy/
 rpJsHlj688LQxb4s9+G0/Jn1H14MxEm7MzpTffWwO7AVQk62EZqNlYTrRPwViGop+zZm
 wVVFr7NnxmF33fubgaRrshNTdHaHY4Lix7kKdNVsdKCUfNXaQSzzkLdE6/5AThCwNiBN
 DFRuvBtnXOy9MTBsu3GGR+3hyxLq4dTimZ7y3LpCJGn1PtsF6r1ZCvh/gvQZi/JY08Pz
 msGLBrzEuuW4rdxyk0Zt1wA9QxQNKo9uG+39A9ln+Vo4qdN88ehk6+MOgb9aeoAK3Xuv
 dNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aMRE0X6owWycrKmM5vAVLsUz47V4fd3qYVzk9yogPyY=;
 b=Nk+rQlPxQnzNFTNOhTTRdNt7jDiKbPSE7VnChu7tuenVrwt3xITdJWbfMD76R2c8Yp
 USTPpVAh4d/JJDFHQOcrVx2ukm7Pd9oh90bUL0ilowhy4zUQmYsprA1VqthRk4p5OyWs
 KrU87PNPM7VdJqsxMxJDYmmWPYh7WMu6eB+xCwidUsoiP5dzqzOW6I2OAnUDn5/4KrUH
 +pbnSO3TakpfYmOloPAZ0R6sAqGh7TD9CJLmnXBVShkQ70VDcbU3XqZrspHUPh2hhm2y
 LZh1+aR61ccy9h5KIss+DnunMmBD1gpISEHjbyep6TVvZ3zS0rEvUfOgnADfw4iiBvY/
 8ZEQ==
X-Gm-Message-State: AOAM5331DAkex/5XzNxLxvG5fHwVhUiQPLShNa357iBFObB+HUS5k98K
 OSc3xlw1zyDF8KO70GMOKg+StQ==
X-Google-Smtp-Source: ABdhPJyjj3FAjb5gxUSMh+s4WSVYr0KMS5ODgiSoBK9gzHpRfo2foZ4jG9puvmajM/Y59c/k8GNM4Q==
X-Received: by 2002:a63:fa07:: with SMTP id y7mr5839030pgh.213.1613323263123; 
 Sun, 14 Feb 2021 09:21:03 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 z11sm14900980pjn.5.2021.02.14.09.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 09:21:02 -0800 (PST)
Subject: Re: [PATCH v8 10/35] Hexagon (target/hexagon) instruction and packet
 types
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-11-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d6c8e70-ff5e-4ac5-1d5e-f34b70db0402@linaro.org>
Date: Sun, 14 Feb 2021 09:21:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-11-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> +    uint32_t extension_valid:1;   /* Has a constant extender attached */
> +    uint32_t which_extended:1;    /* If has an extender, which immediate */
> +    uint32_t is_endloop:1;   /* This is an end of loop */
...

> +    uint32_t pkt_has_cof:1;          /* Has any change-of-flow */
> +    uint32_t pkt_has_endloop:1;
> +
> +    uint32_t pkt_has_dczeroa:1;
> +
> +    uint32_t pkt_has_store_s0:1;
> +    uint32_t pkt_has_store_s1:1;

Any reason not to use bool?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

