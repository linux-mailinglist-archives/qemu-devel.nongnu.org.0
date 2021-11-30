Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A4462EA7
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 09:42:46 +0100 (CET)
Received: from localhost ([::1]:35032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mryir-0006CO-NW
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 03:42:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mryh5-0004nC-C5
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:40:55 -0500
Received: from [2a00:1450:4864:20::429] (port=43992
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mryh3-0002qp-8r
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:40:55 -0500
Received: by mail-wr1-x429.google.com with SMTP id v11so42634239wrw.10
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 00:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9GFiIooLomsqH3FdQigA+tj72oQYNMXH6ykSzVZ6Tqg=;
 b=SbnvMp501qdVhnxCYhMVL2+6OupoW+ZyZtcf+mhOhhVPHNgAhPnBWWKKVmoCx9F8Gi
 Zxb/TEN/TRY9R+fxfIv5QrAtG+S0/JnBGGZ8cw6RQatm4eZntYWSWf976GXfwWoanIWS
 YNWSuGUYymtkqQxMa/a39sPwHfNF0ypSvyCk8zSqiQhK0WtF5s7xaJZsr854SQYPXAbu
 xgWVgIBe35fI9ITbJB4WUANiMAwtT7xwwPlSnI9tjDFg9q8hhV8Lo3D+IKKESKtYcFlX
 hTwUkClpG+a6WtBZ+CdiHO1lne3p9atYTs8AxR+tQkIlZSgM4dOlJLB+wVnuok49o4x5
 bzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9GFiIooLomsqH3FdQigA+tj72oQYNMXH6ykSzVZ6Tqg=;
 b=FoaOhDRfvC924Xjyq1Epm0maOyTCeP/Q/ze2iC/W40kDUmXM/1ZWWfYrl/2NpteSbF
 gFJmg0wlNekc9pdU7bj8AAQisnEkKYIJbQ/41ZYMt5K06lgK6ycakfxsUkZ0X4vDtp2R
 C5oXO3qKCuhTnxboX6MKmZZm6VKTTpMpa39yxrDyyqQBJ2cIxKn8oTgj3LORTT7+MEXW
 IgSj5xFJnK7QIDAWJIPWNR9AJixr8gvPhScJAKo5s8d9tzjRqIRaHXEqG9HgI+9KkEB6
 dQLlzWOxrxVAglYZS9C30/ZIRxi+0nOs72Gy1li4qlN3k6ZVzMcF050obqLa4GaBNSj3
 8WZA==
X-Gm-Message-State: AOAM530oyhqLVvjMhcSoMav1iaMhBV5BLK6/FRcEWF3O0Fku/m5/xeTK
 91JwNoDgc4PZDmITlc4gbfOHXA==
X-Google-Smtp-Source: ABdhPJzREGjPtUJ1kgOXfZ4KGsUwOEmzuGV+t9vVcug/8FMtxjye4AtV3xRqC3L06sW7hoDPbPdyog==
X-Received: by 2002:a05:6000:252:: with SMTP id
 m18mr39197818wrz.117.1638261651676; 
 Tue, 30 Nov 2021 00:40:51 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id h204sm1744811wmh.33.2021.11.30.00.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 00:40:51 -0800 (PST)
Subject: Re: [PATCH for-7.0 0/4] qemu-common.h include cleanup
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9620df1-f67e-a5d2-579c-5f9010c6b531@linaro.org>
Date: Tue, 30 Nov 2021 09:40:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129200510.1233037-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.211,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Sergio Lopez <slp@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 9:05 PM, Peter Maydell wrote:
> qemu-common.h has a comment at the top:
> 
>   * This file is supposed to be included only by .c files. No header file should
>   * depend on qemu-common.h, as this would easily lead to circular header
>   * dependencies.
> 
> We still have a few .h files which include it, though.  The first 3
> patches in this series fix that: in 3 out of 4 cases we didn't need
> the #include at all, and in the 4th case we can instead #include
> qemu-common.h from just one .c file.
> 
> Patch 4 is just removing the #include from 8 files in hw/arm which
> don't need it at all.  (Probably there are other files like this, but
> I just did the Arm related ones.)
> 
> Tested by pushing to gitlab for the CI build.
> 
> -- PMM
> 
> Peter Maydell (4):
>    include/hw/i386: Don't include qemu-common.h in .h files
>    target/hexagon/cpu.h: don't include qemu-common.h
>    target/rx/cpu.h: Don't include qemu-common.h
>    hw/arm: Don't include qemu-common.h unnecessarily

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

