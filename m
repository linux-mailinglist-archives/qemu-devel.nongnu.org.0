Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FD1643DB6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:39:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2SY9-0004wg-Iu; Tue, 06 Dec 2022 02:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SXu-0004sA-Dp
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:39:22 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SXs-0006ZD-8y
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:39:17 -0500
Received: by mail-wr1-x433.google.com with SMTP id o5so22240561wrm.1
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cMagal4qX/kS+14nNcBUpnl8KJPHVKkdTQ48PgpczFM=;
 b=KXhYSn776+/M8M1C+rQfeDU9vAmQY2S8s1CspCbmJo4kYxVa6Yzl22UTYUhgJtpY+v
 NEBwleXoKFGUu6vzt8duKc4KBrPPlrjGPHKEUHrQiKW9BK6evln46ENqwkTQ/vwChX5N
 aRDcPj2C8NKeVQB6EdT0FvT8+E3+sEL0r7GoFUd42qlpoFRkB/qTJD8IQkfv7P1mSya9
 K0DNeXe5S2xW3V76xmtx2PKDwuNzi8KzUhAEYPlQqHKj8OLpPLB5XQnj7nNdGDI+CP9S
 AeNsKOHYtBmJS6g4iQsNObbjYCczx6zOgQFhpr3WZDzh227tzRLpFBw88lthwzjjcCG9
 xnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cMagal4qX/kS+14nNcBUpnl8KJPHVKkdTQ48PgpczFM=;
 b=YpJVXVEIPirJc5VvkM2tT6jb8YhaTn9XNfpD5idu0hV8Jl+Sjpau2GZZWbsD9pqeW7
 J9FBNbbz06wgBY0nODDneERKt1etz7F4R5+oz/dv9apal8Ovxjq26q320cy8SRKpaHF/
 JHpog6Sqkq6jLIsgDQ0KQUyIAiQS3+HraWS2hfzH1B0bFFbTrsEtYXQvBw/DL3cUVVxi
 6izPlWvpr0/YPtmVDxhvHRl5qkByjs+oaqCDT1VuAHi6/DH6NHy8OYF/CVktzh9YiBPf
 ilYz3Le1EWh8poNgRl7WEem+5n0rO3oQ57Ypfq2zYoU/xTR5TCYxiY1nPzqPhs/xPu+D
 8jjw==
X-Gm-Message-State: ANoB5plbPOZEK0NBAX6LeBV8/7XNCOelHBvsF6Co15TtTb69tD0OGKWm
 pVVlK4iq6rL+1rHWHlh5eVEr7Wl3fxg/rjRDUpc=
X-Google-Smtp-Source: AA0mqf6pRb/glehmnIXBboARZ9OJo9uY9r0OD9UvM1MBkVyVw+SZzImyrs03go531xS64pcxZOgeuA==
X-Received: by 2002:a05:6000:81a:b0:242:6a15:e257 with SMTP id
 bt26-20020a056000081a00b002426a15e257mr3383470wrb.624.1670312351363; 
 Mon, 05 Dec 2022 23:39:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c4f5500b003b4fe03c881sm26242090wmq.48.2022.12.05.23.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 23:39:11 -0800 (PST)
Message-ID: <37e42fe4-5103-af2c-bb5a-f583f72c25dc@linaro.org>
Date: Tue, 6 Dec 2022 08:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 14/22] tcg: Always define tb_target_set_jmp_target
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: r@hev.cc
References: <20221206041715.314209-1-richard.henderson@linaro.org>
 <20221206041715.314209-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206041715.314209-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/12/22 05:17, Richard Henderson wrote:
> Install empty versions for !TCG_TARGET_HAS_direct_jump hosts.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/arm/tcg-target.c.inc   | 6 ++++++
>   tcg/mips/tcg-target.c.inc  | 6 ++++++
>   tcg/riscv/tcg-target.c.inc | 6 ++++++
>   tcg/tci/tcg-target.c.inc   | 6 ++++++
>   4 files changed, 24 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


