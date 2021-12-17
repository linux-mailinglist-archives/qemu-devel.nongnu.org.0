Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6355947968D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 22:51:40 +0100 (CET)
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myL8d-0000wz-Hk
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 16:51:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myL6v-0000C3-7d
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:49:53 -0500
Received: from [2607:f8b0:4864:20::62a] (port=36457
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myL6t-0005GT-Gd
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:49:52 -0500
Received: by mail-pl1-x62a.google.com with SMTP id c6so2967607plg.3
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 13:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=CymFIEmqC3fq8arUWFfvTBPDyVcBoNJdGJVeIuWyeNw=;
 b=CvswbRenf7Y81vPM9f9SwAN99oOBUHqyf0YvXCzkQNBPpDA/2titW1NG/H3EECJu1b
 5Q6FbxT359Xh+YgCnkr9PX2EXY3bKYL1GIazs2Sh5U5M9acTbJA4h0Ky5ve/l7NLGqqg
 iVIXa7B1yWYUAUt1HOu1Lnw8T78PsDXMVWP+fVaYlJuxvVbHTtfd3E5gIm6IQBRHNAUu
 pKt6zQVDKk73CYldf9EybE6LxHkWnI9mSo1IAvr1owqrzPcZxq5d6In7VCZ0/1BBfjV4
 AoDoyvJsNbuDT8HybWHdGz2Kp9sXiMit7IcRMRce5QTxpAj2SpizvGDK2XHkoPCveUTM
 HXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CymFIEmqC3fq8arUWFfvTBPDyVcBoNJdGJVeIuWyeNw=;
 b=f0CglKBRW8tnBjEhZOWz+ofwwl4jWXT36kQ4jKPEMtWDq+tQt4qzorJrwvtzg3Rato
 n6judFThFwP2Jcr0T007MtLDYCEM86MgDzQBToXDIyaj9D5GTK2QFy16vil87f+jAXSK
 rD4nPxV2MKRTTpmMvBMz8BWVMtIzBe13brTlyJchbmlEq5bsdG5N9me2O5iM+0OjLYdy
 O4I7tv6/qVTxioXYVSdqo42phitpxzBdO6fTeKmZS0Xw/2uKOOkGaQcckaD+07t2U21B
 8anGFJQva0XFibnHJlA9+PmDOH1ZzqFV5KmJGkxaCOWzrAvUPh4dNO97I+ljUBJZo/EG
 mjBA==
X-Gm-Message-State: AOAM533OTYnWznwcTPi7LeUN4XwCG2vyUPetcLrWEJm6XijZ0avuTAQh
 KpY/hmPo+kUKHCP2yBmcWa0GyycBnmpvwA==
X-Google-Smtp-Source: ABdhPJz51zzklZtTf8tIFyfdiP7eqxo0bHHEGsi7zGuKnYRgePDePG3D8xI9y4Ak3fBQxO0I4/IevA==
X-Received: by 2002:a17:902:e812:b0:148:a2e7:fb48 with SMTP id
 u18-20020a170902e81200b00148a2e7fb48mr4942501plg.137.1639777789916; 
 Fri, 17 Dec 2021 13:49:49 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pc10sm10423492pjb.9.2021.12.17.13.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 13:49:49 -0800 (PST)
Subject: Re: [PATCH 08/10] meson: rename "arch" variable
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-9-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08c3de8e-d9b7-06f9-f14a-9a6ebbebc59b@linaro.org>
Date: Fri, 17 Dec 2021 13:49:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216085139.99682-9-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 12:51 AM, Paolo Bonzini wrote:
> Avoid confusion between the ARCH variable of configure/config-host.mak
> and the same-named variable of meson.build.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   meson.build | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

