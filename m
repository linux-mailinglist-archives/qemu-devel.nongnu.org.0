Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733714399B8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 17:10:05 +0200 (CEST)
Received: from localhost ([::1]:49246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf1bw-0003wR-51
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 11:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf1ai-00032v-H0
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 11:08:48 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf1ag-0002Gv-CO
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 11:08:47 -0400
Received: by mail-pg1-x52b.google.com with SMTP id g184so11222459pgc.6
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 08:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=J8EmXkuJx/pijEfZFoBiwPfficqd9+TWtp87Zllha9Q=;
 b=B4s8vU+uqeHYl5uXWNqC1SndPIuV9EebSMOo81v4wz2xoSdlQPr3jMUwkm9m7Ruyvl
 1KN4G2PXnbwzQzLO6nDERgfWNN4nz7UVcqNWh1KYIlNG1OWEW5LBut+XWPcaK7uaf4d5
 DmG4AZ8VOZUajX6guYSVjUlGG3bYnXxZ6ecsm6tA13b/ilG/dyAjrkccm3IqX626Ykey
 fw5/6rw1ObIl30Hid1spUdXRP5eT1zuxXp9BaZC3GW/bJe1d2RRqMfSYB9hc47/3Nzg0
 iVeT5/e2yQbOFLFBOa5ZAbvnTBJrZo+YSz7dL0J+uY50wVQtZWJDeyONYaZa8XZMLm8G
 +7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J8EmXkuJx/pijEfZFoBiwPfficqd9+TWtp87Zllha9Q=;
 b=Cp628IIY9z8NYR1nq7ol03boLXsdF4Tpsv3uugSTJk7BrvXoAvslGw1urqQx/uMia/
 0nWPPERXNUSZqP0KTmULn8x3Ywb86sgf3Qb/FrZ65DKyro+YKFXlgusWEY89E7hfyg4l
 KYj7DPUXGsveP9JUmBTckbf0R/Qra6Fz+h4mv4w8+sPyqdHg++dKaFC/bCqPpPC4ZZJt
 alwy1if+8TWsDS7rHckJ7pBRX3hIUr4FmZLs92Qp1tqCya4zPEF25+sVxgGVkTa4mgj/
 SYojiiJmTJHJWYCoNzD7be4iGBI0GY6zhW6YGe3dh0g6r4Woj2TSQE2JArrJsnrf4Lfl
 Gr5g==
X-Gm-Message-State: AOAM533n1QfYaIuLUpAY+RFZQx/K27ognFBDPx93RwpJKl7JSSuEMKjV
 BSRKJxZWoz186837nRCkPQY74BRH0PwT9A==
X-Google-Smtp-Source: ABdhPJwwRzf03OPUrJyiwq5C1vBKUV7wkSOFP1QPRQOClLuqwJ+VDU9SZKsXrymTJ+9AnOsWAVw4Kg==
X-Received: by 2002:a63:e516:: with SMTP id r22mr14405471pgh.197.1635174524739; 
 Mon, 25 Oct 2021 08:08:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id rm6sm19085392pjb.18.2021.10.25.08.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 08:08:44 -0700 (PDT)
Subject: Re: [PATCH] configure: remove useless NPTL probe
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211025081911.628955-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7a872c3-82fa-5f26-c194-8757436fd3bd@linaro.org>
Date: Mon, 25 Oct 2021 08:08:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025081911.628955-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
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

On 10/25/21 1:19 AM, Paolo Bonzini wrote:
> Using a linuxthreads system with a recent QEMU will have bigger problems
> than just not having NPTL.  Remove the unnecessary check.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure | 19 -------------------
>   1 file changed, 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

